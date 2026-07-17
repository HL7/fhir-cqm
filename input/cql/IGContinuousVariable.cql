library IGContinuousVariable

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1' called FHIRHelpers

context Patient

define "Initial Population":
  exists ([Encounter])

define "Measure Population":
  exists ([Procedure])

define "Measure Population Exclusion":
  Patient.deceased is true

define function "Measure Observation"(Patient Patient):
  Count([Observation])