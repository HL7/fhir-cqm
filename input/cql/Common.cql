/*
This example is a work in progress and should not be considered a final specification
or recommendation for guidance. This example will help guide and direct the process
of finding conventions and usage patterns that meet the needs of the various stakeholders
in the measure development community.
*/
library Common

using FHIR version '4.0.1'

include hl7.fhir.uv.cql.FHIRHelpers version '4.0.1' called FHIRHelpers

context Patient

define function
   "Includes Or Starts During"(Condition Condition, Encounter Encounter):
      Interval[Condition.onset, Condition.abatement] includes Encounter.period
         or Condition.onset during Encounter.period
