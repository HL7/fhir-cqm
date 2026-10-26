/*
This example is a work in progress and should not be considered a final specification
or recommendation for guidance. This example will help guide and direct the process
of finding conventions and usage patterns that meet the needs of the various stakeholders
in the measure development community.
*/
library DHCComponent

using FHIR version '4.0.1'

include hl7.fhir.uv.cql.FHIRHelpers version '4.0.1' called FHIRHelpers

include SupplementalDataElements called SDE
include MATGlobalCommonFunctions called Global
include AdultOutpatientEncounters called AdultOutpatientEncounters
include Hospice called Hospice

valueset "Diabetes": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.103.12.1001'
valueset "HbA1c Laboratory Test": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.198.12.1013'

parameter "Measurement Period" Interval<DateTime>

context Patient

define "SDE Ethnicity":
  SDE."SDE Ethnicity"

define "SDE Payer":
  SDE."SDE Payer"

define "SDE Race":
  SDE."SDE Race"

define "SDE Sex":
  SDE."SDE Sex"

define "Initial Population":
  Global."CalendarAgeInYearsAt" ( FHIRHelpers.ToDate ( Patient.birthDate ), end of "Measurement Period" ) in Interval[18, 75]
      and exists AdultOutpatientEncounters."Qualifying Encounters"
      and exists "Diabetes Diagnosis"

define "Denominator":
  "Initial Population"

define "Denominator Exclusion":
  Hospice."Has Hospice"

define "Diabetes Diagnosis":
  [Condition: "Diabetes"] DiabetesCondition
      where Global."Prevalence Period" ( DiabetesCondition ) overlaps "Measurement Period"

define "Most Recent HbA1c":
  Last ( [Observation: "HbA1c Laboratory Test"] RecentHbA1c
      where Global."Normalize Interval" ( RecentHbA1c.effective ) ends during "Measurement Period"
        and RecentHbA1c.status in { 'final', 'amended', 'corrected' }
      sort by end of Global."Normalize Interval" ( effective )
  )

define "Has Most Recent HbA1c Without Result":
  "Most Recent HbA1c" is not null
      and "Most Recent HbA1c".value is null

define "Has Most Recent Elevated HbA1c":
  ( "Most Recent HbA1c".value as Quantity ) > 9 '%'

define "Has No Record Of HbA1c":
  "Most Recent HbA1c" is null

// Inverse measure: a lower score indicates better quality (poor control or no test during the period)
define "Numerator":
  "Has Most Recent HbA1c Without Result"
      or "Has Most Recent Elevated HbA1c"
      or "Has No Record Of HbA1c"
