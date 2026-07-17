library IGProportion

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1' called FHIRHelpers

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

