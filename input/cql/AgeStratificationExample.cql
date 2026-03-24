library AgeStratificationExample version '1.0.0'

using FHIR version '4.0.1'

include hl7.fhir.uv.cql.FHIRHelpers version '4.0.1' called FHIRHelpers

codesystem "Time Period Ranges": 'http://terminology.hl7.org/CodeSystem/time-period-ranges' // { 'P0Y--P1Y', 'P1Y--P5Y', ... }

// Age Groups
code "P10Y--P15Y": 'P10Y--P15Y' from "Time Period Ranges" display '10-14 years'
code "P15Y--P20Y": 'P15Y--P20Y' from "Time Period Ranges" display '15-19 years'
code "P20Y--P9999Y": 'P20Y--P9999Y' from "Time Period Ranges" display '20+ years'

parameter "Measurement Period" Interval<Date> default Interval[@2020-01-01, @2020-12-31]

context Patient

define "Initial Population":
  exists (
    [Encounter] E
      where E.period during "Measurement Period"
  )
  
/*
By Patient Age as of the start of the Measurement Period
Age (10-14, 15-19, 20+)
*/
define "By Age":
  case
    when AgeInYearsAt(start of "Measurement Period") in Interval[10, 14] then "P10Y--P15Y"
    when AgeInYearsAt(start of "Measurement Period") in Interval[15, 19] then "P15Y--P20Y"
    when AgeInYearsAt(start of "Measurement Period") >= 20 then "P20Y--P9999Y"
    else null
  end

