library EXMCommon version '2.0.0'

using FHIR version '4.0.1'

include hl7.fhir.uv.cql.FHIRHelpers version '4.0.1' called FHIRHelpers
include hl7.fhir.uv.cql.FHIRCommon version '2.0.0' called FHIRCommon

codesystem "Diagnosis Role": 'http://terminology.hl7.org/CodeSystem/diagnosis-role'
codesystem "Diagnosis Type": 'http://terminology.hl7.org/CodeSystem/ex-diagnosistype'
codesystem "Procedure Type": 'http://terminology.hl7.org/CodeSystem/ex-procedure-type'

valueset "Emergency Department Visit" : 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.292'
valueset "Psychiatric/Mental Health Patient" : 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.299'
valueset "Hospital Settings" : 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1111.126'

code "Billing": 'billing' from "Diagnosis Role" display 'Billing'
code "Principal Diagnosis": 'principal' from "Diagnosis Type" display 'Principal Diagnosis'
code "Primary procedure": 'primary' from "Procedure Type" display 'Primary procedure'

parameter "Measurement Period" Interval<DateTime>

context Patient

define fluent function statusReason(serviceRequest ServiceRequest):
  serviceRequest.ext('http://hl7.org/fhir/StructureDefinition/request-statusReason').value as FHIR.CodeableConcept

define fluent function recorded(procedure Procedure):
  procedure.ext('http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-recorded').value as FHIR.dateTime

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

define fluent function lengthInDays(Value Interval<DateTime> ):
  difference in days between start of Value and end of Value

define fluent function principalProcedure(encounter Encounter):  	  
  encounter E
    let 
      claim: [Claim] C where C.status = 'active' and C.use = 'claim' and exists (C.item I where I.encounter.references(E)),
      claimItem: claim.item I where I.encounter.references(E),
      princProcedure: singleton from (claim.procedure P where P.sequence in claimItem.procedureSequence and P.type.includesCode("Primary procedure"))
  return princProcedure

