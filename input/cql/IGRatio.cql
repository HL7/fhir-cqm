library IGRatio

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1' called FHIRHelpers

context Patient

define "Initial Population 1":   // denominator's basis
  exists ([Encounter])

define "Initial Population 2":   // numerator's basis
  exists ([Immunization])

define "Denominator":
  exists ([Procedure])

define "Denominator Exclusion":
  Patient.deceased is true

define "Numerator":
  exists ([Observation])

define "Numerator Exclusion":
  exists ([ResearchStudy])