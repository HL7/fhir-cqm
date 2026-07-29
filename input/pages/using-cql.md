{:toc}

This topic discusses the use of Clinical Quality Language (CQL) to provide computable and/or executable representation of the various criteria of a measure through the expression-valued elements of the Measure resource. The [CQLMeasure](StructureDefinition-cqm-cqlmeasure.html) and [ELMMeasure](StructureDefinition-cqm-elmmeasure.html) profiles define the expectations for measures that make use of CQL and/or ELM. Support for the use of other expression languages is possible, but is out of scope for this implementation guide.

Measures that use CQL do so with libraries to contain the logic used to define the various criteria of the measure. CQL libraries are used in accordance with the [Using CQL With FHIR]({{site.data.fhir.ver.cql}}) (UCWF) implementation guide, as well as additional conformance requirements specific to the use of measures, as detailed in the following sections.

{: .stu-note}
For the convenience of IG readers, the conformance requirements from the Using CQL with FHIR Implementation Guide are restated below; however, the Using CQL with FHIR IG remains the authoritative source.

The Conformance Summary Table lists the conformance sections in this implementation guide and indicates which of them further constrains the requirements defined by the UCWF IG. The table also provides direct links to the corresponding conformance statements.

**Table 4-1: Conformance Summary Table**

| Topic                           | Additional QM IG Constraints | Conformance Section                                  |
|:---------------------------------|:----------------------------:|:----------------------------------------------------|
| Library Usage                   | Yes                          | [QM IG 4.1 (Library Usage)](https://hl7.org/fhir/uv/cqm/using-cql.html#conformance-requirement-4-1)                            |
| Library Versioning              | Yes                          | [QM IG 4.2 (Library Versioning)](https://hl7.org/fhir/uv/cqm/using-cql.html#conformance-requirement-4-2)                       |
| Nested Libraries                | Yes                          | [QM IG 4.3 (Nested Libraries)](https://hl7.org/fhir/uv/cqm/using-cql.html#conformance-requirement-4-3)                         |
| Library Namespaces              | No                           | [UCWF:2.4 (Library Namespaces)](http://hl7.org/fhir/uv/cql/STU2/using-cql.html#conformance-requirement-2-4)                        |
| Data Model                      | Yes                           | [UCWF:2.5 (Data Models)](http://hl7.org/fhir/uv/cql/STU2/using-cql.html#conformance-requirement-2-5)                               |
| Code Systems                    | No                           | [UCWF:2.6 (Code System Specification)](http://hl7.org/fhir/uv/cql/STU2/using-cql.html#conformance-requirement-2-6)                 |
| Value Sets                      | No                           | [UCWF:2.7 (Value Set Specification)](http://hl7.org/fhir/uv/cql/STU2/using-cql.html#conformance-requirement-2-7)                   |
| Value Set Version               | No                           | [UCWF:2.8 (Value Set Specification Including Version)](http://hl7.org/fhir/uv/cql/STU2/using-cql.html#conformance-requirement-2-8) |
| Value Set Expansion             | No                           | [UCWF:2.9 (Value Set Expansion)](http://hl7.org/fhir/uv/cql/STU2/using-cql.html#conformance-requirement-2-9)                       |
| String-based Membership Testing | No                           | [UCWF:2.10 (String-based Membership Testing)](http://hl7.org/fhir/uv/cql/STU2/using-cql.html#conformance-requirement-2-10)          |
| Codes                           | No                           | [UCWF:2.11 (Direct-reference Codes)](http://hl7.org/fhir/uv/cql/STU2/using-cql.html#conformance-requirement-2-11)                   |
| Concepts                        | No                           | [UCWF:2.12 (Concepts)](http://hl7.org/fhir/uv/cql/STU2/using-cql.html#conformance-requirement-2-12)                                 |
| Library-level Identifiers       | No                           | [UCWF:2.13 (Library-level Identifiers)](http://hl7.org/fhir/uv/cql/STU2/using-cql.html#conformance-requirement-2-13)                |
| Data Type Names                 | No                           | [UCWF:2.14 (Data Type Names)](http://hl7.org/fhir/uv/cql/STU2/using-cql.html#conformance-requirement-2-14)                          |
| Element Names                   | No                           | [UCWF:2.15 (Element Names)](http://hl7.org/fhir/uv/cql/STU2/using-cql.html#conformance-requirement-2-15)                            |
| Aliases and Argument Names      | No                           | [UCWF:2.16 (Aliases and Argument Names)](http://hl7.org/fhir/uv/cql/STU2/using-cql.html#conformance-requirement-2-16)               |
{: .grid}


### Libraries
{: #libraries}

Consistent with the UCWF IG, Measures that make use of CQL use [Libraries]({{site.data.fhir.ver.cql}}/using-cql.html#libraries).

**Conformance Requirement 4.1 (Library Usage):** [<img src="conformance.png" width="20" class="self-link" height="20"/>](#conformance-requirement-4-1)
{: #conformance-requirement-4-1}

| Conformance from UCWF           | QM IG Differential           |
|:--------------------------------|:----------------------------|
| [UCWF:2.1 (Library Declaration)](http://hl7.org/fhir/uv/cql/STU2/using-cql.html#conformance-requirement-2-1)<br>1. Any CQL library used by a FHIR artifact **SHALL** contain a [library declaration](https://cql.hl7.org/02-authorsguide.html#library).<br>2. The library identifier **SHALL** be a valid un-quoted identifier and **SHALL NOT** contain underscores. The library identifier **SHALL** only contain alphanumeric characters. | 1. CQL used by a Measure **SHALL** be contained in a CQL library. |
{: .grid}


For example:

```cql
library EXM146 version '4.0.0'
```

Snippet 4-1: Library line from [EXM146.cql](Library-EXM146.html#cql-content)

#### Library Versioning
{: #library-versioning}

Consistent with the UCWF IG, this IG recommends an approach to [Library Versioning]({{site.data.fhir.ver.cql}}/using-cql.html#library-versioning) used within Measures to help track and manage dependencies.
The approach recommended here is based on the [Semantic Versioning Scheme](https://semver.org/).

**Conformance Requirement 4.2 (Library Versioning):** [<img src="conformance.png" width="20" class="self-link" height="20"/>](#conformance-requirement-4-2)
{: #conformance-requirement-4-2}

| Conformance from UCWF           | QM IG Differential           |
|:--------------------------------|:----------------------------|
| [UCWF:2.2 (Library Versioning)](http://hl7.org/fhir/uv/cql/STU2/using-cql.html#conformance-requirement-2-2)<br>1. The library declaration in the CQL source <b>NEED NOT</b> specify a version, since version can be provided as part of the translation and publishing process.<br>2.The library version <b>SHOULD</b> follow the convention: < major >.< minor >.< patch > <br>3. For artifacts in draft status, a version is not required, the versioning scheme <b>NEED NOT</b> apply, and there is no expectation that artifact contents are stable. <br>4. When an artifact moves to active status, a version is required in either the CQL source, the translated ELM (if included), or the containing FHIR Library resources.| 1. CQL libraries used by Measures <b>SHALL</b> include a version as part of the library declaration.<br>2. In addition, CQL libraries used by Measures <b>SHALL</b> follow the convention : < major >.< minor >.< patch ><br>3. For measures in _draft_ status, a version label **MAY** be included.<br>4. If a version label is included, it <b>SHALL</b> follow the convention: < major >.< minor >.< patch >-< label >|
{: .grid}

For example:

```cql
library EXM146 version '3.0.0'
```

This would indicate the first major version of the EXM146 library. A minor change could be released by incrementing the
minor version:

```cql
library EXM146 version '3.1.0'
```

And a major change could be released by incrementing the major version, and resetting the minor version: Minor changes
are expected to retain backwards-compatibility, but may introduce new features and functionality, while patch changes
are expected to retain forward and backwards-compatibility, and may only be used to fix issues.

```cql
library EXM146 version '4.0.0'
```

Snippet 4-2: Library line from [EXM146.cql](Library-EXM146.html#cql-content), the fourth major version.

#### Nested Libraries
{: #nested-libraries}

Consistent with the UCWF IG, this IG allows measures to use [Nested Libraries]({{site.data.fhir.ver.cql}}/using-cql.html#nested-libraries). However, this IG requires that all expressions referenced from a Measure be included in a single library to ensure that expression identifiers used in the Measure need not be qualified identifiers.

**Conformance Requirement 4.3 (Nested Libraries):** [<img src="conformance.png" width="20" class="self-link" height="20"/>](#conformance-requirement-4-3)
{: #conformance-requirement-4-3}

| Conformance from UCWF           | QM IG Differential           |
|:--------------------------------|:----------------------------|
| [UCWF:2.3 (Nested Libraries)](http://hl7.org/fhir/uv/cql/STU2/using-cql.html#conformance-requirement-2-3)<br>1. CQL libraries <b>SHOULD</b> be structured such that all CQL expressions referenced from a single FHIR resource are contained within a single library.<br> - If an artifact makes use of multiple libraries, expression references in that artifact <b>SHALL</b> be qualified with the name of the library (i.e., library-name.expression-identifier), or with the alias of the library as specified using the cqf-libraryAlias extension.<br>2. CQL libraries <b>SHALL</b> use a called clause for all included libraries.<br>3. The called-alias for an included library <b>SHOULD</b> be consistent for usages across libraries. | 1. In addition, CQL libraries used by measures <b>SHALL</b> be structured such that all CQL expressions referenced by the Measure are contained within a single library. |
{: .grid}

For example:

```cql
include Common version '2.0.0' called Common
```

Snippet 4-3: Nested library within [EXM146.cql](Library-EXM146.html#cql-content)

#### Library Namespaces
{: #library-namespaces}

Consistent with the UCWF IG, this IG recommends the use of [Library Namespaces]({{site.data.fhir.ver.cql}}/using-cql.html#library-namespaces).

**Conformance Requirement 4.4 (Library Namespaces):** [<img src="conformance.png" width="20" class="self-link" height="20"/>](#conformance-requirement-4-4)
{: #conformance-requirement-4-4}

| Conformance from UCWF           | QM IG Differential           |
|:--------------------------------|:----------------------------|
| [UCWF:2.4 (Library Namespaces)](http://hl7.org/fhir/uv/cql/STU2/using-cql.html#conformance-requirement-2-4)<br>1.CQL libraries <b>SHOULD</b> use namespaces.<br>2. When a namespace is not used, the library <b>SHALL</b> be considered part of a "public" global namespace for the purposes of resolution within a given environment.<br>3. The root of the CQL namespace <b>SHALL</b> match the root of the url of the Library resource housing the CQL library. | No additional conformances. |
{: .grid}

For example, the following library declaration illustrates the use of a namespace:

```cql
library CMS.Common version '2.0.0'
```

Snippet 4-4: Library namespace

### Data Model
{: #data-model}

CQL can be used with any [Data Model]({{site.data.fhir.ver.cql}}/using-cql.html#data-model).

**Conformance Requirement 4.5 (CQL Data Model):** [<img src="conformance.png" width="20" class="self-link" height="20"/>](#conformance-requirement-4-5)
{: #conformance-requirement-4-5}


| Conformance from UCWF           | QM IG Differential           |
|:--------------------------------|:----------------------------|
| [UCWF:2.5 (Data Models)](http://hl7.org/fhir/uv/cql/STU2/using-cql.html#conformance-requirement-2-5)<br>1. All libraries and CQL expressions used directly or indirectly within a knowledge artifact <b>SHOULD</b> use FHIR-based data models.<br>2. Data Model declarations <b>SHALL</b> include a version declaration. | 1. All libraries and CQL expressions used directly or indirectly within a measure <b>SHALL</b> use FHIR based data models. For example, one could use QI Core and SDOH IGs. |
{: .grid}

For example:

```cql
using FHIR version '4.0.1'
```

Snippet 4-5: Data Model line from [EXM146.cql](Library-EXM146.html#cql-content)

For additional information on conformance requirements for the use of Model Information as part of FHIR Knowledge Artifacts that make use of CQL, reference the Using CQL with FHIR IG's section on [Using ModelInfo]({{site.data.fhir.ver.cql}}/using-modelinfo.html)

### Code Systems
{: #code-systems}

Consistent with the UCWF IG, [Code Systems]({{site.data.fhir.ver.cql}}/using-cql.html#code-systems) referenced within CQL expressions make use of the `codesystem` declaration in CQL.

**Conformance Requirement 4.6 (Code System Specification):** [<img src="conformance.png" width="20" class="self-link" height="20"/>](#conformance-requirement-4-6)
{: #conformance-requirement-4-6}

| Conformance from UCWF           | QM IG Differential           |
|:--------------------------------|:----------------------------|
| [UCWF:2.6 (Code System Specification)](http://hl7.org/fhir/uv/cql/STU2/using-cql.html#conformance-requirement-2-6)<br>1. Within CQL, the identifier of any code system reference <b>SHALL</b> be specified using a URI for the code system.<br>2. The URI <b>SHALL</b> be the canonical URL for the code system.<br>3. The Code System declaration <b>MAY</b> include a version, consistent with the URI specification for FHIR and the code system. | No additional conformances. |
{: .grid}

For example:

```cql
codesystem "SNOMED CT:20240901": 'http://snomed.info/sct'
  version 'http://snomed.info/sct/731000124108/version/20240901'
```

Snippet 4-6: codesystem definition line from [Terminology.cql](Library-Terminology.html#cql-content).

#### Representation in a Library
{: #representation-in-a-library}

The representation of codesystem declarations in a Library is discussed in the [Terminology](measure-conformance.html#terminology) topic of this IG.

### Value Sets
{: #value-sets}

Consistent with the UCWF IG, [Value Sets]({{site.data.fhir.ver.cql}}/using-cql.html#value-sets) referenced within CQL expressions make use of the `valueset` declaration in CQL.

**Conformance Requirement 4.7 (Value Set Specification):** [<img src="conformance.png" width="20" class="self-link" height="20"/>](#conformance-requirement-4-7)
{: #conformance-requirement-4-7}

| Conformance from UCWF           | QM IG Differential           |
|:--------------------------------|:----------------------------|
| [UCWF:2.7 (Value Set Specification)](http://hl7.org/fhir/uv/cql/STU2/using-cql.html#conformance-requirement-2-7)<br>1. Within CQL, the identifier of any value set reference <b>SHALL</b> be specified using a URI for the value set.<br>2. The URI <b>SHALL</b> be the canonical URL for the value set.<br>3. The URI <b>MAY</b> include a version, consistent with versioned canonical URL references in FHIR | No additional conformances. |
{: .grid}

For example:

```cql
valueset "Acute Pharyngitis": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.102.12.1011'
```

Snippet 4-7: ValueSet reference from [EXM146.cql](Library-EXM146.html#cql-content)

The canonical URL for a value set is typically defined by the value set author, though it may be provided by the
publisher as well. For example, value sets defined in the Value Set Authority Center and exposed via the VSAC FHIR
interface have a base URL of `http://cts.nlm.nih.gov/fhir/`. This base is then used to construct the canonical URL for
the value set (in the same way as any FHIR URL) using the resource type (`ValueSet` in this case) and the id (the value
set OID in this case). Note that the _canonical URL_ is a globally unique, stable, version-independent identifier for the
value set. See [Canonical URLs](http://hl7.org/fhir/R4/references.html#canonical) in the base FHIR specification for more information.

The local identifier for the value set within CQL should be the same as the name of the value set in the
[Value Set Authority Center (VSAC)](https://vsac.nlm.nih.gov/). However, because the name of the value set is not
guaranteed to be unique, it is possible to reference multiple value sets with the same name, but different identifiers.
When this happens in a CQL library, the local identifier should be the name of the value set with a qualifying suffix to
preserve the value set name as a human-readable artifact, but still allow unique reference within the CQL library.

For example:

```cql
valueset "Acute Pharyngitis (1)": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.102.12.1011.1'
valueset "Acute Pharyngitis (2)": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.102.12.1011.2'
```

Snippet 4-8: ValueSet declarations for different value sets with the same name

Note carefully that although this URL may be resolvable for some terminology implementations, this is not necessarily the
case. This use of a canonical URL can be resolved as a search by the `url` element:

```
GET fhir/ValueSet?url=http%3A%2F%2Fcts.nlm.nih.gov%2Ffhir%2FValueSet%2F2.16.840.1.113883.3.464.1003.102.12.1011.1
```

Snippet 4-9: FHIR API query to retrieve a value set by its canonical identifier using the url search parameter

#### Value Set Version
{: #value-set-version}

Consistent with the UCWF IG, [Value Set Version]({{site.data.fhir.ver.cql}}/using-cql.html#value-set-version) information is not required to be included. As a best-practice, terminology versioning information is specified externally using a version manifest. However, if versioning information is included, it must be done in  accordance with terminology usage specified by FHIR.

**Conformance Requirement 4.8 (Value Set Specification By Version):** [<img src="conformance.png" width="20" class="self-link" height="20"/>](#conformance-requirement-4-8)
{: #conformance-requirement-4-8}

| Conformance from UCWF           | QM IG Differential           |
|:--------------------------------|:----------------------------|
| [UCWF:2.8 (Value Set Specification Including Version)](http://hl7.org/fhir/uv/cql/STU2/using-cql.html#conformance-requirement-2-8)<br>1. When specifying the definition version of a value set to be used in a CQL library, use the version clause of the value set declaration. | No additional conformances. |
{: .grid}


For example:

```cql
valueset "Encounter Inpatient SNOMEDCT Value Set":
   'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.666.5.307|20260210'
```

Snippet 4-10: ValueSet definition from [Terminology.cql](Library-Terminology.html#cql-content).

This is a _version-specific value set reference_, and can be resolved as a search by the `url` and `version` elements:

```
GET fhir/ValueSet?url=http%3A%2F%2Fcts.nlm.nih.gov%2Ffhir%2FValueSet%2F2.16.840.1.113883.3.666.7.307&version=20160929
```

Snippet 4-11: FHIR API query to retrieve a value set by its url and version

#### Value Set Expansion

Measures that make use of CQL must do so in accordance with [Value Set Expansion]({{site.data.fhir.ver.cql}}/using-cql.html#value-set-expansion) as described in the UCWF IG.

**Conformance Requirement 4.9 (Value Set Expansion):** [<img src="conformance.png" width="20" class="self-link" height="20"/>](#conformance-requirement-4-9)
{: #conformance-requirement-4-9}

| Conformance from UCWF           | QM IG Differential           |
|:--------------------------------|:----------------------------|
| [UCWF:2.9 (Value Set Expansion)](http://hl7.org/fhir/uv/cql/STU2/using-cql.html#conformance-requirement-2-9)<br>1. Value set membership testing <b>SHOULD</b> use the terminology membership operation in CQL (in(ValueSet)), as opposed to requiring computation on the lists of codes in a value set. See the <a href="http://cql.hl7.org/02-authorsguide.html#terminology-operators">Terminology Operators</a> section of the CQL specification for more information. | No additional conformances. |
{: .grid}

#### Representation in a Library
{: #representation-in-a-library}

The representation of `valueset` declarations in a Library is discussed in the [Terminology](measure-conformance.html#terminology) topic of this IG, consistent with the [Representation in Narrative]({{site.data.fhir.ver.cql}}/using-cql.html#valueset-representation-in-narrative) topic in the UCWF IG.

#### String-based Membership Testing
{: #string-based-membership-testing}

Consistent with the UCWF IG, this implementation guide recommends against the use of [_string-based membership testing_]({{site.data.fhir.ver.cql}}/using-cql.html#string-based-membership-testing).

**Conformance Requirement 4.10 (String-based Membership Testing):** [<img src="conformance.png" width="20" class="self-link" height="20"/>](#conformance-requirement-4-10)
{: #conformance-requirement-4-10}

| Conformance from UCWF           | QM IG Differential           |
|:--------------------------------|:----------------------------|
| [UCWF:2.10 (String-based Membership Testing)](http://hl7.org/fhir/uv/cql/STU2/using-cql.html#conformance-requirement-2-10)<br>1. String-based membership testing <b>SHOULD NOT</b> be used in CQL libraries. | No additional conformances. |
{: .grid}

### Codes
{: #codes}

Consistent with the UCWF IG, CQL used with Measures can make use of [_direct-reference codes_]({{site.data.fhir.ver.cql}}/using-cql.html#codes).

**Conformance Requirement 4.11 (Direct-reference Codes):** [<img src="conformance.png" width="20" class="self-link" height="20"/>](#conformance-requirement-4-11)
{: #conformance-requirement-4-11}

| Conformance from UCWF           | QM IG Differential           |
|:--------------------------------|:----------------------------|
| [UCWF:2.11 (Direct-reference Codes)](http://hl7.org/fhir/uv/cql/STU2/using-cql.html#conformance-requirement-2-11)<br>When direct-reference codes are represented within CQL, the logical identifier:<br>1. <b>SHALL</b> NOT be a URI.<br>2. <b>SHOULD</b> be a code from the code system. | No additional conformances. |
{: .grid}

For example:

```cql
code "Venous foot pump, device (physical object)": '442023007' from "SNOMED CT"
```

Snippet 4-12: code definition from [Terminology.cql](Library-Terminology.html#cql-content).

#### Representation in a Library
{: #representation-in-a-library}

The representation of code declarations in a Library is discussed in [Terminology](measure-conformance.html#terminology) of this IG, consistent with the [Representation in Narrative]({{site.data.fhir.ver.cql}}/using-cql.html#code-representation-in-narrative) topic in the UCWF IG.

### UCUM Best Practices
{: #ucum-best-practices}

This implementation guide recommends the [UCUM Best Practices]({{site.data.fhir.ver.cql}}/using-cql.html#ucum-best-practices) found in the UCWF IG.

### Concepts
{: #concepts}

Consistent with the UCWF IG, CQL used with Measures may make use of the CQL [_concept_]({{site.data.fhir.ver.cql}}/using-cql.html#concepts) declaration, but care must be taken to ensure that it is not used as a surrogate for proper value set definition.

**Conformance Requirement 4.12 (Concepts):** [<img src="conformance.png" width="20" class="self-link" height="20"/>](#conformance-requirement-4-12)
{: #conformance-requirement-4-12}

| Conformance from UCWF           | QM IG Differential           |
|:--------------------------------|:----------------------------|
| [UCWF:2.12 (Concepts)](http://hl7.org/fhir/uv/cql/STU2/using-cql.html#conformance-requirement-2-12)<br>1. The CQL concept construct <b>MAY</b> be used.<br>2. The CQL concept construct <b>SHALL NOT</b> be used as a surrogate for value set definition. | No additional conformances. |
{: .grid}

### Library-level Identifiers
{: #library-level-identifiers}

Consistent with the UCWF IG, CQL used by Measures should use descriptive and meaningful library-level identifiers, as discussed in the [Library-level Identifiers](using-cql.html#library-level-identifiers) topic

**Conformance Requirement 4.13 (Library-level Identifiers):** [<img src="conformance.png" width="20" class="self-link" height="20"/>](#conformance-requirement-4-13)
{: #conformance-requirement-4-13}

| Conformance from UCWF           | QM IG Differential           |
|:--------------------------------|:----------------------------|
| [UCWF:2.13 (Library-level Identifiers)](http://hl7.org/fhir/uv/cql/STU2/using-cql.html#conformance-requirement-2-13)<br>Library-level identifiers in CQL:<br>1. <b>SHOULD</b> have descriptive, meaningful names.<br>2. <b>SHOULD</b> avoid abbreviations.<br>3. <b>SHOULD</b> use quoted identifiers if necessary.<br>4. <b>SHOULD</b> use initial case<br>5. <b>MAY</b> include spaces. | No additional conformances. |
{: .grid}

### Data Type Names
{: #data-type-names}

Consistent with the UCWF IG, CQL used by Measures must refer to [Data Type Names]({{site.data.fhir.ver.cql}}/using-cql.html#data-type-names) as dictated by the CQL specification, as well as the Data Models in use. For FHIR-based quality measures using QI-Core profiles, these will be the author-friendly identifiers for the QI-Core profiles.

**Conformance Requirement 4.14 (Data Type Names):** [<img src="conformance.png" width="20" class="self-link" height="20"/>](#conformance-requirement-4-14)
{: #conformance-requirement-4-14}

| Conformance from UCWF           | QM IG Differential           |
|:--------------------------------|:----------------------------|
| [UCWF:2.14 (Data Type Names)](http://hl7.org/fhir/uv/cql/STU2/using-cql.html#conformance-requirement-2-14)<br>Data type names referenced in CQL:<br>1. <b>SHALL</b> use PascalCase (unless dictated by the name of the type in the model).<br>2. <b>SHALL NOT</b> use quoted identifiers (unless required because the name of the type in the model contains spaces or is otherwise not a valid identifier without quoting). | No additional conformances. |
{: .grid}

For example:

```cql
define "Flexible Sigmoidoscopy Performed":
  [Procedure: "Flexible Sigmoidoscopy"] FlexibleSigmoidoscopy
    where FlexibleSigmoidoscopy.status = 'completed'
      and FlexibleSigmoidoscopy.performed ends 5 years or less on or before end of "Measurement Period"
```

Snippet 4-13: Expression definition from [EXM130.cql](Library-EXM130.html#cql-content)

`Procedure` is the name of the model data type (FHIR resource type) in this example.

### Element Names
{: #element-names}

Consistent with the UCWF IG, CQL used by Measures must refer to [Element Names]({{site.data.fhir.ver.cql}}/using-cql.html#element-names) as dictated by the CQL specification, as well as the Data Models in use.

Note that when FHIR and FHIR IGs are used as the data model, the term "element" is synonymous with "attribute". Some data models, such as QDM, use the "attribute".

**Conformance Requirement 4.15 (Element Names):** [<img src="conformance.png" width="20" class="self-link" height="20"/>](#conformance-requirement-4-15)
{: #conformance-requirement-4-15}


| Conformance from UCWF           | QM IG Differential           |
|:--------------------------------|:----------------------------|
| [UCWF:2.15 (Element Names)](http://hl7.org/fhir/uv/cql/STU2/using-cql.html#conformance-requirement-2-15)<br>Data model elements referenced in the CQL:<br>1. <b>SHALL NOT</b> use quoted identifiers (unless required due to the element name in the model not being a valid identifier in CQL).<br>2. <b>SHOULD</b> use camelCase (unless dictated by the element naming in the model being used). | No additional conformances. |
{: .grid}

Examples of elements (i.e. attributes) conforming to Conformance Requirement 4.15 are given below. For a full list of valid names of attributes for a data model, refer to an appropriate data model specification such as QI-Core.

```cql
period
authoredOn
result
```

Snippet 4-14: Example element names

### Aliases and Argument Names
{: #aliases-and-argument-names}

Consistent with the UCWF IG, CQL used by Measures must follow conventions for naming of [Aliases and Arguments]({{site.data.fhir.ver.cql}}/using-cql.html#aliases-and-argument-names). In addition, note that aliases should not be the same as any other identifiers in scope to avoid potential confusion.

**Conformance Requirement 4.16 (Aliases and Argument Names):** [<img src="conformance.png" width="20" class="self-link" height="20"/>](#conformance-requirement-4-16)
{: #conformance-requirement-4-16}

| Conformance from UCWF           | QM IG Differential           |
|:--------------------------------|:----------------------------|
| [UCWF:2.16 (Aliases and Argument Names)](http://hl7.org/fhir/uv/cql/STU2/using-cql.html#conformance-requirement-2-16)<br>Aliases and argument names referenced in the CQL:<br>1. <b>SHALL NOT</b> use quoted identifiers.<br>2. <b>SHOULD</b> use PascalCase for alias names.<br>3. <b>SHOULD</b> use camelCase for argument names.<br>4. <b>SHOULD</b> use descriptive names (rather than abbreviations). | No additional conformances. |
{: .grid}

For example:

```cql
define "Encounters During Measurement Period":
    "Valid Encounters" QualifyingEncounter
        where QualifyingEncounter.period during "Measurement Period"

define function "ED Stay Time"(Encounter "Encounter"):
    duration in minutes of Encounter.period
```

Snippet 4-15: Example alias and argument names

`QualifyingEncounter` is the _alias_ in this example, while `Encounter` is the _argument name_.

### Library Resources
{: #library-resources}

Inclusion of CQL content used within quality measures is accomplished through the use of [Library Resources]({{site.data.fhir.ver.cql}}/conformance.html) as described by the Using CQL With FHIR implementation guide. These libraries are then referenced from Measure resources using the `library` element. The content of the CQL library is included using the `content` element of the Library. Conformance requirements for Library resources included with Measure content are discussed in the [Related Documents](measure-conformance.html#related-documents) topic of this IG.

### Patterns
{: #patterns}

Additional guidance and best-practices for the use of CQL in measures can be found in the [Patterns]({{site.data.fhir.ver.cql}}/patterns.html) topic of the Using CQL With FHIR implementation guide, including guidance on:

* [Profile-informed authoring]({{site.data.fhir.ver.cql}}/patterns.html#profile-informed-authoring)
* [Use of terminologies]({{site.data.fhir.ver.cql}}/patterns.html#use-of-terminologies)
* [Time-valued quantities]({{site.data.fhir.ver.cql}}/patterns.html#time-valued-quantities)
* [Missing information]({{site.data.fhir.ver.cql}}/patterns.html#missing-information)
* [Negation in FHIR]({{site.data.fhir.ver.cql}}/patterns.html#negation-in-fhir)

### Translation to ELM
{: #translation-to-elm}

The use of Expression Logical Model (ELM) as a basis for sharing logic is discussed in the [Using ELM]({{site.data.fhir.ver.cql}}/using-elm.html) topic of the Using CQL With FHIR implementation guide, including guidance on:

* [Inclusion of ELM content in measure packages]({{site.data.fhir.ver.cql}}/using-elm.html#conformance-requirement-5-1)
* [Recommended translator options]({{site.data.fhir.ver.cql}}/using-elm.html#conformance-requirement-5-2)
* [Specifying and exchanging translator options]({{site.data.fhir.ver.cql}}/using-elm.html#specifying-translator-options)
* [Determining ELM suitability based on context]({{site.data.fhir.ver.cql}}/using-elm.html#elm-suitability)

