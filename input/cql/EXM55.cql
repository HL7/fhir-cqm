/*
This example is a work in progress and should not be considered a final specification
or recommendation for guidance. This example will help guide and direct the process
of finding conventions and usage patterns that meet the needs of the various stakeholders
in the measure development community.
*/

library EXM55 version '5.0.0'

using FHIR version '4.0.1'

include hl7.fhir.uv.cql.FHIRHelpers version '4.0.1' called FHIRHelpers

codesystem "Diagnosis Role": 'http://terminology.hl7.org/CodeSystem/diagnosis-role'
codesystem "Diagnosis Type": 'http://terminology.hl7.org/CodeSystem/ex-diagnosistype'

valueset "Emergency Department Visit" : 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.292'
valueset "Psychiatric/Mental Health Patient" : 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.299'
valueset "Hospital Settings" : 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1111.126'

code "Billing": 'billing' from "Diagnosis Role" display 'Billing'
code "Principal Diagnosis": 'principal' from "Diagnosis Type" display 'Principal Diagnosis'

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
    where LengthInDays(Encounter.period) <= 120
      and Encounter.period ends during "Measurement Period"

define "Measure Population Exclusion" :
  "Inpatient Encounter" Encounter
    with ["Encounter" : "Emergency Department Visit"] ED
      such that ED.period ends 1 hour or less before start of Encounter.period
        and ED.status = 'finished'
        and ED.hospitalization.admitSource in "Hospital Settings"

define function "LengthInDays"(Value Interval<DateTime>):
	difference in days between start of Value and end of Value

define function "GetId"(uri String):
	Last(Split(uri, '/'))

define "Stratification 1" :
  "Inpatient Encounter" Encounter
    where not (
      Encounter.principalDiagnosis().diagnosis as FHIR.CodeableConcept in "Psychiatric/Mental Health Patient"
      or exists(
        [Condition: id in "GetId"((Encounter.principalDiagnosis().diagnosis as FHIR.Reference).reference)] C
        where C.code in "Psychiatric/Mental Health Patient"
      )
    )

define "Stratification 2" :
  "Inpatient Encounter" Encounter
    where (
      Encounter.principalDiagnosis().diagnosis as FHIR.CodeableConcept in "Psychiatric/Mental Health Patient"
      or exists(
        [Condition: id in "GetId"((Encounter.principalDiagnosis().diagnosis as FHIR.Reference).reference)] C
        where C.code in "Psychiatric/Mental Health Patient"
      )
    )

define "Stratification 3" :
  "Inpatient Encounter" Encounter
    where Encounter.principalDiagnosis() is null

define fluent function principalDiagnosis(encounter Encounter):
singleton from (
     (encounter.claimDiagnosis()) CD
       where CD.type.includesCode("Principal Diagnosis")
   )

define fluent function claimDiagnosis(encounter Encounter):
  encounter E
    let 
      claim: ([Claim] C where C.status = 'active' and C.use = 'claim' and exists (C.item I where I.encounter.references(E))),
      claimItem: (claim.item I where I.encounter.references(E))
    return claim.diagnosis D where D.sequence in claimItem.diagnosisSequence

define fluent function references(reference FHIR.Reference, resource FHIR.Resource):
  resource.id = Last(Split(reference.reference, '/'))  

define fluent function references(references List<FHIR.Reference>, resource FHIR.Resource):
  exists (references R where R.references(resource))

define fluent function includesCode(codeList List<CodeableConcept>, code Concept):
  exists (codeList C where C ~ code)

//Measure Observation
define function "Related ED Visit" (Encounter "Encounter" ) :
  Last(["Encounter" : "Emergency Department Visit"] ED
    where ED.status = 'finished'
      and ED.period ends 1 hour or less before start of Encounter.period
    sort by start of period )

define function "Measure Observation" (Encounter "Encounter" ) :
  duration in minutes of "Related ED Visit"(Encounter).period
