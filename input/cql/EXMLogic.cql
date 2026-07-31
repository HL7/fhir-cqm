/*
This example is purely for illustration purposes to show how all the elements of a
FHIR-based quality measure are represented. It is intentionally simplified to show
specific aspects of a measure, and is not intended as an example of a clinically
meaningful measure.
*/
library EXMLogic version '2.0.0'

using FHIR version '4.0.1'

include hl7.fhir.uv.cql.FHIRHelpers version '4.0.1' called FHIRHelpers
include hl7.fhir.uv.cql.FHIRCommon version '2.0.0' called FHIRCommon

include EXMCommon version '2.0.0'

valueset "Emergency Department Visit" : 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.292'
valueset "Psychiatric/Mental Health Patient" : 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.299'
valueset "Hospital Settings" : 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1111.126'

parameter "Measurement Period" Interval<DateTime>

context Patient

define "Initial Population" :
  "Inpatient Encounter" Encounter
    with ["Encounter" : "Emergency Department Visit"] ED
     such that ED.status = 'finished'
       and ED.period ends 1 hour or less before start of Encounter.period

define "Measure Population" :
  "Initial Population"

define "Inpatient Encounter" :
  ["Encounter"] Encounter
    where Encounter.period.lengthInDays() <= 120
      and Encounter.period ends during "Measurement Period"

define "Measure Population Exclusion" :
  "Inpatient Encounter" Encounter
    with ["Encounter" : "Emergency Department Visit"] ED
      such that ED.period ends 1 hour or less before start of Encounter.period
        and ED.status = 'finished'
        and ED.hospitalization.admitSource in "Hospital Settings"

define "Stratification 1" :
  "Inpatient Encounter" Encounter
    where not (Encounter.principalDiagnosis().diagnosis in "Psychiatric/Mental Health Patient")

define "Stratification 2" :
  "Inpatient Encounter" Encounter
    where Encounter.principalDiagnosis().diagnosis in "Psychiatric/Mental Health Patient"

define "Stratification 3" :
  "Inpatient Encounter" Encounter
    where Encounter.principalDiagnosis().diagnosis is null

//Measure Observation
define function "Related ED Visit"(Encounter "Encounter") :
  Last(["Encounter" : "Emergency Department Visit"] ED
    where ED.status = 'finished'
      and ED.period ends 1 hour or less before start of Encounter.period
    sort by start of period )

define function "Measure Observation"(Encounter "Encounter") :
  duration in minutes of "Related ED Visit"(Encounter).period


