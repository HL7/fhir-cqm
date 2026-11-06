library EXMIA

using FHIR version '4.0.1'

include hl7.fhir.uv.cql.FHIRHelpers version '4.0.2-ballot' called FHIRHelpers

valueset "Attestation Question": 'http://example.org/fhir/ValueSet/attestation-question'

context Practitioner

define "Measure Population":
  Practitioner

define function "Measure Observation"(Practitioner Practitioner):
  [Observation: "Attestation Question"] O
    return FHIRHelpers.ToBoolean(O.value)
