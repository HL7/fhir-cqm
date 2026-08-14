library IGCohort

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1' called FHIRHelpers

context Patient

define "Initial Population":
  exists ([Encounter])
