/*
This example is a work in progress and should not be considered a final specification
or recommendation for guidance. This example will help guide and direct the process
of finding conventions and usage patterns that meet the needs of the various stakeholders
in the measure development community.
*/
library DEVComponent

using FHIR version '4.0.1'

include hl7.fhir.uv.cql.FHIRHelpers version '4.0.1' called FHIRHelpers

include SupplementalDataElements called SDE
include MATGlobalCommonFunctions called Global
include AdultOutpatientEncounters called AdultOutpatientEncounters
include Hospice called Hospice

valueset "Diabetes": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.103.12.1001'
valueset "Emergency Department Visit": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.292'

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

define "Numerator":
  exists "Emergency Department Visits"

define "Diabetes Diagnosis":
  [Condition: "Diabetes"] DiabetesCondition
      where Global."Prevalence Period" ( DiabetesCondition ) overlaps "Measurement Period"

define "Emergency Department Visits":
  [Encounter: "Emergency Department Visit"] EDVisit
      where EDVisit.period during "Measurement Period"
        and EDVisit.status = 'finished'

// Patient-months of eligibility contributed by each patient in the denominator
define function "Denominator Observation"():
  months between start of "Measurement Period" and successor of end of "Measurement Period"

// Number of emergency department visits contributed by each patient in the numerator
define function "Numerator Observation"():
  Count ( "Emergency Department Visits" )
