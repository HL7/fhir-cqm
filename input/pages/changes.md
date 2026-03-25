
{: toc}

{: #changes}

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
* [FHIR-49978](https://jira.hl7.org/browse/FHIR-49978): Measures With Multiple Populations (Applied ([here](measure-conformance.html#measures-with-multiple-populations)))
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