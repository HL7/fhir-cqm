
{: toc}

{: #changes}

### Changes for STU 3 Ballot

#### Non-Compatible Changes

* [FHIR-59400](https://jira.hl7.org/browse/FHIR-59400): Clarify the use of continuous variable components in composite measures. Subject-level linear composites are restricted to Proportion and Ratio components, and weighted composites with Ratio or Continuous Variable components must specify a score range to normalize each component score, using the new [scoreRange](StructureDefinition-cqm-scoreRange.html) extension (Applied: [Weighted Scoring](composite-measures.html#conformance-requirement-5-5), [Score Normalization](composite-measures.html#score-normalization), [Improvement Notation](composite-measures.html#improvement-notation), [Measure Types](composite-measures.html#measure-types), [CQM Score Range](StructureDefinition-cqm-scoreRange.html), [CQM Composite Measure](StructureDefinition-cqm-compositemeasure.html), [Diabetes Care example](examples.html#mixed-component-scoring))
* [FHIR-58885](https://jira.hl7.org/browse/FHIR-58885): Require linkId on test case MeasureReport groups, populations, stratifiers, and stratum components, using the R5 cross-version extensions, and add linkIds to the example test cases (Applied: [CQM Test Case](StructureDefinition-cqm-testcase.html), [Test Case examples](examples.html#preventive-care-and-wellness-test-cases))

#### Compatible, Substantive Changes

* [FHIR-59504](https://jira.hl7.org/browse/FHIR-59504): Provide worked examples of composite measure calculation, with individual and summary test cases for each component and composite. Building the test cases identified corrections to the formal criteria for composite exclusions and exceptions: a component in which an individual is excluded (or is an exception without meeting the numerator) no longer counts against the composite, and an individual is excluded from the composite only if excluded from every component in whose denominator they appear (Applied: [All-or-nothing Scoring](composite-measures.html#all-or-nothing-scoring), [Opportunity Scoring](composite-measures.html#opportunity-scoring), [Subject-level Linear Combination Scoring](composite-measures.html#subject-level-linear-combination-scoring), [Preventive Care and Wellness test cases](examples.html#preventive-care-and-wellness-test-cases), [Diabetes Care test cases](examples.html#mixed-component-scoring))

* Allow composites that determine population membership for each individual (all-or-nothing, opportunity, and subject-level linear) to define population criteria on the composite group, and express the composite elements of the composite examples at the group level. Also corrects the classification of subject-level linear scoring as an individual-based (not component-based) scoring method (Applied: [Composite Measures](composite-measures.html#composite-measures), [CQM Composite Measure](StructureDefinition-cqm-compositemeasure.html), [All-or-nothing example](Measure-PreventiveCareandWellnessAllOrNothingComposite.html), [Opportunity example](Measure-PreventiveCareandWellnessOpportunityComposite.html), [Patient-level linear example](Measure-PreventiveCareandWellnessPatientLevelLinearComposite.html))

#### Non-substantive Changes

* [FHIR-59665](https://jira.hl7.org/browse/FHIR-59665): Update the description of the CQM Reporting Timing extension to indicate that it specifies reporting frequency (Applied: [CQM Reporting Timing](StructureDefinition-cqm-reportingTiming.html), [CQM DataType Timing](StructureDefinition-cqm-datatype-timing.html))
* [FHIR-59647](https://jira.hl7.org/browse/FHIR-59647): Document using data requirements to determine the aggregate data requirements for a measure program (Applied: [Data Requirements for a Measure Program](measure-conformance.html#program-data-requirements), [Operations](operations.html#data-requirements), [Capabilities](capabilities.html))
* [FHIR-58747](https://jira.hl7.org/browse/FHIR-58747): Expand the description of cohort definitions with example use cases, and add an antenatal care cohort example (Applied: [Cohort Definitions](measure-conformance.html#cohort-definitions), [Antenatal Care Cohort](Measure-ANCCohort.html), [Examples](examples.html))

#### Technical Corrections

* Corrected references to the `$data-requirements` operation to use the CRMI [$data-requirements]({{site.data.fhir.ver.crmi}}/OperationDefinition-crmi-data-requirements.html) operation, and removed the unused CQM Data Requirements OperationDefinition (Applied: [Measure Repository Service](measure-repository-service.html), [Publishable Measure Repository](CapabilityStatement-publishable-measure-repository.html))
* Updated dependencies to the CRMI and Using CQL with FHIR ballot versions, and updated the CQL libraries to include FHIRHelpers 4.0.2-ballot and FHIRCommon 3.0.0-ballot
* Corrected the `"Prevalence Period"` function of the [MATGlobalCommonFunctions](Library-MATGlobalCommonFunctions.html) example library to use a closed interval, so that conditions without an abatement are treated as ongoing

### Changes for STU 2

#### Non-Compatible Changes

* [FHIR-56819](https://jira.hl7.org/browse/FHIR-56819): Aligned operation parameters with CRMI operation profiles
* [FHIR-53286](https://jira.hl7.org/browse/FHIR-53286): Composite measure elements should be at the group level
* [FHIR-53140](https://jira.hl7.org/browse/FHIR-53140): Value-based stratifiers always and only use stratifier component elements

#### Compatible Substantive Changes

* [FHIR-58060](https://jira.hl7.org/browse/FHIR-58060): Add a CQMLibrary profile
* [FHIR-57727](https://jira.hl7.org/browse/FHIR-57727): Allow data requirements to be invoked on multiple measures
* [FHIR-56009](https://jira.hl7.org/browse/FHIR-56009): Expand context of "limitations" and "trendingIssues" extensions
* [FHIR-55982](https://jira.hl7.org/browse/FHIR-55982): Add MeasureReport.group to context of use for compositeScoring
* [FHIR-53432](https://jira.hl7.org/browse/FHIR-53432): Consider the ability to return supporting evidence throughout a measure
* [FHIR-51395](https://jira.hl7.org/browse/FHIR-51395): Subscription Approach


#### Non-substantive Changes

* [FHIR-58297](https://jira.hl7.org/browse/FHIR-58297): Clarify the term "population group"
* [FHIR-57879](https://jira.hl7.org/browse/FHIR-57879): Clarify the Group naming convention in Measures with Multiple Rates (3.4.8)
* [FHIR-57861](https://jira.hl7.org/browse/FHIR-57861): Ensure topic search parameter is supported in publishable repository
* [FHIR-57509](https://jira.hl7.org/browse/FHIR-57509): Additional clarity for calculation semantics
* [FHIR-57499](https://jira.hl7.org/browse/FHIR-57499): Continuous variable semantics should use return all
* [FHIR-57197](https://jira.hl7.org/browse/FHIR-57197): Measure Calculation Service Capability Statement Example has an very old published date
* [FHIR-57196](https://jira.hl7.org/browse/FHIR-57196): Global profiles
* [FHIR-57195](https://jira.hl7.org/browse/FHIR-57195): Quality Measurement and Data Model Standards Landscapes
* [FHIR-57190](https://jira.hl7.org/browse/FHIR-57190): The reference to QI-Core in universal realm
* [FHIR-57189](https://jira.hl7.org/browse/FHIR-57189): Package Procedure-Based Test Cases
* [FHIR-57188](https://jira.hl7.org/browse/FHIR-57188): Explain Composite and Risk Scores
* [FHIR-57187](https://jira.hl7.org/browse/FHIR-57187): Attribution Metadata Guardrails
* [FHIR-57185](https://jira.hl7.org/browse/FHIR-57185): Terminology Inventory for Measures
* [FHIR-57155](https://jira.hl7.org/browse/FHIR-57155): Diagram is a cycle, not a system
* [FHIR-57090](https://jira.hl7.org/browse/FHIR-57090): Should we add US Quality Core in the Quality Measurement Landscape
* [FHIR-57037](https://jira.hl7.org/browse/FHIR-57037): Expansion Parameters table is confusing 
* [FHIR-57012](https://jira.hl7.org/browse/FHIR-57012): Fix link to CRMI CI Build
* [FHIR-57009](https://jira.hl7.org/browse/FHIR-57009): Using CQL: Consider Summarizing Differences w/ Using CQL IG
* [FHIR-56929](https://jira.hl7.org/browse/FHIR-56929): Duplicate entries in QA "Filename" List
* [FHIR-56928](https://jira.hl7.org/browse/FHIR-56928): QA report shows 568 validation errors
* [FHIR-56889](https://jira.hl7.org/browse/FHIR-56889): Risk Adjustment example CQL definitions
* [FHIR-56887](https://jira.hl7.org/browse/FHIR-56887): Update links to uv DEQM
* [FHIR-56884](https://jira.hl7.org/browse/FHIR-56884): eCQI Link (Section 2.1)
* [FHIR-56868](https://jira.hl7.org/browse/FHIR-56868): Alignment of terms
* [FHIR-56867](https://jira.hl7.org/browse/FHIR-56867): Consider these revisions to correct the fragments, align tense and simplify wordiness- 
* [FHIR-56866](https://jira.hl7.org/browse/FHIR-56866): Change in how referenced 
* [FHIR-56864](https://jira.hl7.org/browse/FHIR-56864): Readability & Clarity
* [FHIR-56863](https://jira.hl7.org/browse/FHIR-56863): Abbreviations and Acronyms
* [FHIR-56862](https://jira.hl7.org/browse/FHIR-56862): Clarification of Alias
* [FHIR-56818](https://jira.hl7.org/browse/FHIR-56818): Elaborate on Subscriptions use case for jurisdictional reporting
* [FHIR-56817](https://jira.hl7.org/browse/FHIR-56817): Fix misc. typos, grammar
* [FHIR-56816](https://jira.hl7.org/browse/FHIR-56816): Support Conformance verb tagging
* [FHIR-56810](https://jira.hl7.org/browse/FHIR-56810): continuous variable measure example using outdated principal diagnosis modeling
* [FHIR-56809](https://jira.hl7.org/browse/FHIR-56809): VTE example principal diagnosis modeling needs to be updated
* [FHIR-56808](https://jira.hl7.org/browse/FHIR-56808): example using old modeling of principal diagnosis
* [FHIR-56278](https://jira.hl7.org/browse/FHIR-56278): Clarify population counting semantics for non-subject-based measures
* [FHIR-55969](https://jira.hl7.org/browse/FHIR-55969): Update quality improvement ecosystem diagram
* [FHIR-55952](https://jira.hl7.org/browse/FHIR-55952): Add examples of risk-adjusted measures
* [FHIR-52882](https://jira.hl7.org/browse/FHIR-52882): Mention CRMI operations on operations page
* [FHIR-52881](https://jira.hl7.org/browse/FHIR-52881): Add note about CRMI on introduction page
* [FHIR-52821](https://jira.hl7.org/browse/FHIR-52821): Restore the note about data requirements parameters
* [FHIR-51841](https://jira.hl7.org/browse/FHIR-51841): Clarify cqf-criteriaReference with linkId


### Changes for STU 2 Ballot

#### Non-Compatible Changes

* [FHIR-53286](https://jira.hl7.org/browse/FHIR-53286): Composite measure elements should be at the group level
* [FHIR-53140](https://jira.hl7.org/browse/FHIR-53140): Clarify expectations for value-based stratification expressions

#### Compatible, Substantive Changes

* [FHIR-56009](https://jira.hl7.org/browse/FHIR-56009): Expand context of "limitations" and "trendingIssues" extensions
* [FHIR-55982](https://jira.hl7.org/browse/FHIR-55982): Add MeasureReport.group to context of use for compositeScoring
* [FHIR-53432](https://jira.hl7.org/browse/FHIR-53432): Consider the ability to return supporting evidence throughout a measure
* [FHIR-51395](https://jira.hl7.org/browse/FHIR-51395): Subscription Approach

#### Non-Substantive Changes

* [FHIR-55969](https://jira.hl7.org/browse/FHIR-55969): Update quality improvement ecosystem diagram
* [FHIR-55952](https://jira.hl7.org/browse/FHIR-55952): Added risk-adjusted measure example
* [FHIR-52882](https://jira.hl7.org/browse/FHIR-52882): Mention CRMI operations on operations page
* [FHIR-52881](https://jira.hl7.org/browse/FHIR-52881): Add note about CRMI on introduction page
* [FHIR-52821](https://jira.hl7.org/browse/FHIR-52821): Restore the note about data requirements parameters
* [FHIR-51841](https://jira.hl7.org/browse/FHIR-51841): Clarify cqf-criteriaReference with linkId

### Changes and Updates for STU 1 Publication (v1.0.0)

#### Non-Compatible Changes

* [FHIR-51101](https://jira.hl7.org/browse/FHIR-51101): require Reference.display on publisher and endorser identifiers in publishable measure (Applied ([here](StructureDefinition-cqm-publishablemeasure.html)))
* [FHIR-50265](https://jira.hl7.org/browse/FHIR-50265): Correct definitionTerm extension usage (Applied ([here](StructureDefinition-cqm-publishablemeasure.html)) and ([here](Measure-measure-publishable-exm.html)))
* [FHIR-49245](https://jira.hl7.org/browse/FHIR-49245): Extension Issues Applied ([here](StructureDefinition-cqm-cvmeasure.html)), ([here](StructureDefinition-cqm-improvementNotation.html)), ([here](StructureDefinition-cqm-ratiomeasure.html)), ([here](Measure-EXMRatio-FHIR.html)), and ([here](Measure-EXM55-FHIR.html))

#### Compatible, Substantive Changes

* [FHIR-51242](https://jira.hl7.org/browse/FHIR-51242): Not all types of measures are represented in the current Measure Type ValueSet. (Applied ([here](StructureDefinition-cqm-type.html))))
* [FHIR-50925](https://jira.hl7.org/browse/FHIR-50925): Provide guidance regarding description elements (Applied ([here](measure-conformance.html)), ([here](StructureDefinition-cqm-publishablemeasure.html)), and ([here](StructureDefinition-cqm-computablemeasure.html)))
* [FHIR-49978](https://jira.hl7.org/browse/FHIR-49978): Measures With Multiple Populations (Applied ([here](measure-conformance.html#measures-with-multiple-rates)))
* [FHIR-49859](https://jira.hl7.org/browse/FHIR-49859): align deqm-2/4 and cmp-4/9 (Applied ([here](StructureDefinition-cqm-computablemeasure.html)))
* [FHIR-49756](https://jira.hl7.org/browse/FHIR-49756): Allow specification of a ValueSet for stratifiers and supplemental data (Applied ([here](StructureDefinition-cqm-computablemeasure.html)), ([here](StructureDefinition-cqm-valueSet.html)), ([here](ValueSet-measure-stratifier-type.html)), ([here](CodeSystem-measure-stratifier-type.html)), ([here](Library-AgeStratificationExample.html)), and ([here](Measure-age-stratified-example.html)))
* [FHIR-49669](https://jira.hl7.org/browse/FHIR-49669): Clarify guidance on linking support to MeasureReport (Applied ([here](StructureDefinition-cqm-computablemeasure.html)))
* [FHIR-48491](https://jira.hl7.org/browse/FHIR-48491): Surface population basis in human readable to ease implementer confusion (Applied ([here](StructureDefinition-cqm-populationBasis.html)), and ([here](measure-conformance.html)))
* [FHIR-43090](https://jira.hl7.org/browse/FHIR-43090): Allow for count as a quantity (Applied ([here](StructureDefinition-cqm-testcase.html)))
* [FHIR-20699](https://jira.hl7.org/browse/FHIR-20699): Additional metadata for mesaure report | quality statement (Applied ([here](StructureDefinition-cqm-publishablemeasure.html)), ([here](StructureDefinition-cqm-limitations.html)), ([here](StructureDefinition-cqm-trendingIssues.html)), and ([here](Measure-measure-cqm-publishable-example.html)))

#### Non-Substantive Changes

* [FHIR-49938](https://jira.hl7.org/browse/FHIR-49938): Correct reference to data requirements in primary library (Applied ([here](measure-conformance.html#terminology)))
* [FHIR-49601](https://jira.hl7.org/browse/FHIR-49601): add grid to table display 
* [FHIR-49597](https://jira.hl7.org/browse/FHIR-49597): change cqm to uppercase CQM in measure profile descriptions (Applied ([here](StructureDefinition-cqm-cvmeasure.html)), ([here](StructureDefinition-cqm-publishablemeasure.html)), ([here](StructureDefinition-cqm-executablemeasure.html)), ([here](StructureDefinition-cqm-proportionmeasure.html)), and ([here](StructureDefinition-cqm-ratiomeasure.html)))
* [FHIR-49593](https://jira.hl7.org/browse/FHIR-49593): Update introduction (Applied [here](introduction.html#scope))
* [FHIR-49347](https://jira.hl7.org/browse/FHIR-49347): 1.3.1 Quality Improvement Ecosystem
* [FHIR-49296](https://jira.hl7.org/browse/FHIR-49296): Please address spelling and grammar issues
* [FHIR-49081](https://jira.hl7.org/browse/FHIR-49081): Example measures have populations out of order
* [FHIR-51698](https://jira.hl7.org/browse/FHIR-51698): Conformance Requirement 3.9 and 3.16 have contradictory instructions
* [FHIR-51572](https://jira.hl7.org/browse/FHIR-51572): Change patient-based to subject-based (Applied ([here](composite-measures.html)), ([here](examples.html)), and ([here](measure-conformance.html)) )
* [FHIR-51380](https://jira.hl7.org/browse/FHIR-51380): Support different bases for ratio measures (Applied ([here](measure-conformance.html)))
* [FHIR-50666](https://jira.hl7.org/browse/FHIR-50666): Software system device profile was removed (Applied ([here](Device-software-system-example.html)))
* [FHIR-49921](https://jira.hl7.org/browse/FHIR-49921): Clarify calculation semantics (Applied ([here](measure-conformance.html)))
* [FHIR-49788](https://jira.hl7.org/browse/FHIR-49788): EXM 146 Library Example - Not Valid per UCWF
* [FHIR-49598](https://jira.hl7.org/browse/FHIR-49598): ConceptMap Measure Type mapping needs an update (Applied [here](ConceptMap-measure-types.html))
* [FHIR-49595](https://jira.hl7.org/browse/FHIR-49595): Using CQL With FHIR IG version (Applied ([here](using-cql.html)))
* [FHIR-49580](https://jira.hl7.org/browse/FHIR-49580): Please add a "Plain Language Summary about this Guide" to the home page
* [FHIR-49579](https://jira.hl7.org/browse/FHIR-49579): Update Change Log (Applied [here](index.html))
* [FHIR-49485](https://jira.hl7.org/browse/FHIR-49485): remove modelinfo FHIR Model Definition (STU2) (Applied ([here](using-cql.html)))
* [FHIR-49416](https://jira.hl7.org/browse/FHIR-49416): attestation measure population expression shouldn't indicate CQL (Applied [here](Measure-measure-pi-exm.html))
* [FHIR-49346](https://jira.hl7.org/browse/FHIR-49346): 1.1 Summary Remove extra word
* [FHIR-49228](https://jira.hl7.org/browse/FHIR-49228): Incorrect SNOMED Version Used in Example
* [FHIR-49082](https://jira.hl7.org/browse/FHIR-49082): Typo: 2025-Jan-FHIR IG QM E1 STU  17.98.1 states 'Measure: Cervical Cancer EXM146 - Appropriate Testing for Children with Pharyngitis (Experimental)' but 'Cervical Cancer' should be removed.

### STU 1 Ballot for FHIR R4 (v1.0.0-ballot)

* [FHIR-45883](https://jira.hl7.org/browse/FHIR-45883): Consider universal realm (Applied ([here](index.html)))
* [FHIR-48834](https://jira.hl7.org/browse/FHIR-48834): Fix improvementNotationGuidance extension (Applied ([here](StructureDefinition-cqm-publishablemeasure.html)))
* [FHIR-49417](https://jira.hl7.org/browse/FHIR-49417): Added attestation to Table 3-1 (Applied ([here](measure-conformance.html#conformance-requirement-3-9)))
* [FHIR-49602](https://jira.hl7.org/browse/FHIR-49602): Glossary and Acronyms (Applied ([here](glossary.html)))
* [FHIR-49763](https://jira.hl7.org/browse/FHIR-49763): Clarified Ratio Measure initial populations (Applied ([here](measure-conformance.html#ratio-measure-scoring)))

> NOTE: This implementation guide is the Universal Realm successor of the US-based [Quality Measure IG STU 5](http://hl7.org/fhir/us/cqfmeasures), and incorporates all the stakeholder feedback and implementation experience from that specification.