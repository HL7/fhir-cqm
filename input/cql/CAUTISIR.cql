/*
@description: Demonstrates Catheter-Associated Urinary Tract Infection Standardized Infection Ratio as a ratio of continuous variables measure
@comment: Observed (O) HAIs / Predicted (P) HAIs. This measure is calculated with a predicted denominator, rather than event data in the source
@seealso: https://github.com/cqframework/CQL-Formatting-and-Usage-Wiki/blob/master/Source/Cooking%20With%20CQL/93/CAUTI.md
*/
library CAUTISIR

using FHIR version '4.0.1'

include hl7.fhir.uv.cql.FHIRHelpers version '4.0.1' called FHIRHelpers
include hl7.fhir.uv.cql.FHIRCommon version '2.0.0' called FHIRCommon

include CAUTIElements called Elements
include CAUTIParameters called Parameters

parameter "Measurement Period" Interval<DateTime> 
  default Interval[@2026-01-01T00:00:00, @2026-12-31T23:59:59]

context Patient

define "Denominator Initial Population":
  [Location] L
    with Elements."Encounter During Measurement Period" E
     such that E.location.location.references(L)

define "Denominator":
  "Denominator Initial Population"

define function "Denominator Observation"(location Location):
  Sum(
    from (Parameters."Location Parameters"(location)) P, Parameters."Critical Access Hospital Parameters" H
      where P ~ H.parameter
      return all H.parameterEstimate
  ) * Elements."Patient Days"(location)

define "Numerator Initial Population":
  exists (Elements."Encounter During Measurement Period")

define "Numerator":
  "Numerator Initial Population"

define function "Numerator Observation"():
  Count(Elements."Catheter-Associated UTI")

