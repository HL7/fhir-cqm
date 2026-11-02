/*
This example is a work in progress and should not be considered a final specification
or recommendation for guidance. This example will help guide and direct the process
of finding conventions and usage patterns that meet the needs of the various stakeholders
in the measure development community.
*/
library DFUComponent

using FHIR version '4.0.1'

include hl7.fhir.uv.cql.FHIRHelpers version '4.0.1' called FHIRHelpers

include SupplementalDataElements called SDE
include MATGlobalCommonFunctions called Global
include AdultOutpatientEncounters called AdultOutpatientEncounters
include Hospice called Hospice

valueset "Diabetes": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.103.12.1001'
valueset "Encounter Inpatient": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.666.5.307'
valueset "Office Visit": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1001'

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

define "Diabetes Diagnosis":
  [Condition: "Diabetes"] DiabetesCondition
      where Global."Prevalence Period" ( DiabetesCondition ) overlaps "Measurement Period"

define "Inpatient Discharges":
  [Encounter: "Encounter Inpatient"] InpatientEncounter
      where InpatientEncounter.status = 'finished'
        and end of InpatientEncounter.period during "Measurement Period"

define "Initial Population":
  "Inpatient Discharges" InpatientDischarge
      where Global."CalendarAgeInYearsAt" ( FHIRHelpers.ToDate ( Patient.birthDate ), end of "Measurement Period" ) in Interval[18, 75]
        and exists "Diabetes Diagnosis"

define "Measure Population":
  "Initial Population" EligibleDischarge
      where exists "Follow Up Visits" ( EligibleDischarge )

define "Measure Population Exclusion":
  "Measure Population" FollowedUpDischarge
      where Hospice."Has Hospice"

define function "Follow Up Visits"(TheDischarge Encounter):
  [Encounter: "Office Visit"] FollowUp
      where FollowUp.status = 'finished'
        and start of FollowUp.period after end of TheDischarge.period
        and start of FollowUp.period 30 days or less after end of TheDischarge.period

// Days from hospital discharge to the first follow-up office visit
define function "Measure Observation"(TheDischarge Encounter):
  days between end of TheDischarge.period
      and start of First ( ( "Follow Up Visits" ( TheDischarge ) ) FollowUp
          sort by start of period
      ).period
