library IGCohort

using FHIR version '4.0.1'

include hl7.fhir.uv.cql.FHIRHelpers version '4.0.2-ballot' called FHIRHelpers

context Patient

define "Initial Population":
  exists ([Encounter])
