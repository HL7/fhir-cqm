library IGProportion

using FHIR version '4.0.1'

include hl7.fhir.uv.cql.FHIRHelpers version '4.0.2-ballot' called FHIRHelpers

context Patient

define "Initial Population":
  exists ([Encounter])

define "Denominator":
  exists ([Procedure])

define "Denominator Exclusion":
  Patient.deceased is true

define "Numerator":
  exists ([Observation])

define "Numerator Exclusion":
  exists ([ResearchStudy])

define "Denominator Exception":
  exists ([Condition])

