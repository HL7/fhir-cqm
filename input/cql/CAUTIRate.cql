/*
@description: Demonstrates Catheter-Associated Urinary Tract Infection Rate as a location-based ratio of continuous variables measure 
@comment: (Number of CAUTIs per location / Number of Urinary Catheter Days per location) * 1000
@seealso: https://github.com/cqframework/CQL-Formatting-and-Usage-Wiki/blob/master/Source/Cooking%20With%20CQL/93/CAUTI.md
*/
library CAUTIRate

using FHIR version '4.0.1'

include hl7.fhir.uv.cql.FHIRHelpers version '4.0.1' called FHIRHelpers
include hl7.fhir.uv.cql.FHIRCommon version '2.0.0' called FHIRCommon

include CAUTIElements called Elements

parameter "Measurement Period" Interval<DateTime> 
  default Interval[@2026-01-01T00:00:00, @2026-12-31T23:59:59]

context Patient

define "Denominator Initial Population":
  [Location] L
    with Elements."Encounter During Measurement Period" E
     such that E.location.location.references(L)

define "Denominator":
  "Denominator Initial Population"

define function "Denominator Observation"():
  Sum(
    Elements."Catheter Usage During Measurement Period" Usage
      return all duration in days of Usage
  )

define "Numerator Initial Population":
  exists (Elements."Encounter During Measurement Period")

define "Numerator":
  "Numerator Initial Population"

define function "Numerator Observation"():
  Count(Elements."Catheter-Associated UTI")

