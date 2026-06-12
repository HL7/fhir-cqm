{:toc}

{: #introduction}

### Purpose
{: #purpose}

[The National Academy of Medicine, formerly called the Institute of Medicine (IOM),](https://www.nationalacademies.org/) defines quality as: "The degree to which health services for individuals and populations increase the likelihood of desired health outcomes and are consistent with current professional knowledge." For care quality to be evaluated, standard quality metrics need to be developed and communicated to the appropriate organizations. To that end, the FHIR Quality Measure Implementation Guide (this IG) has been written to provide guidance for authoring electronic clinical quality measures ([eCQMs]( https://ecqi.healthit.gov/ecqms/about-ecqms)) which are clinical quality measures specified in a standard electronic format and designed to use structured, encoded data present in the electronic health record. This implementation guide references the following standards for creating QMs:

* [Fast Healthcare Interoperability Resources (FHIR) R4](http://hl7.org/fhir/R4)
* [Clinical Quality Language (CQL) R1+](http://cql.hl7.org)
* [QI-Core Implementation Guide (QI-Core)](http://hl7.org/fhir/us/qicore)

To avoid variation in the use of FHIR Resources and metadata across QMs and clinical decision support (CDS), a quality-related implementation guide based on a logical data model is essential. Quality measures should use a standard data model that is compatible with FHIR to maintain consistency. Other FHIR-based data models are also acceptable for use.

Although the specification is based on the R1 version of CQL, backwards-compatible future versions of CQL can be used as well. In addition, if necessary, prior versions of CQL can be used without loss of functionality for this Implementation Guide.

Except where noted, material from the base FHIR specification, and in particular the [Clinical Reasoning](http://hl7.org/fhir/clinicalreasoning-module.html) module, is not repeated here.

As features and functionality are identified by this implementation guide that apply more broadly, those features may be promoted to the base FHIR specification.

There is a new term of digital Quality Measure or [dQM](glossary.html#digital-quality-measure-dqm) that is currently being defined across many interested parties. For the purposes of this IG, eCQM, Quality Measure (QM), and dQM are all supported as FHIR-based measure specifications. The focus of this IG is on computable representation of quality measures using HL7 FHIR and CQL.

### Audience
{: #audience}

The audience for this IG includes software developers of measure authoring tools such as the US Centers for Medicare & Medicaid Services (CMS) [Measure Authoring Development Integrated Environment (MADiE)](https://www.emeasuretool.cms.gov/madie-mvp/); measure developers who will specify clinical quality measures using FHIR and CQL; software developers and implementers who will implement the quality measures specified in FHIR and CQL in their institutions or in their vendor products; institutions and organizations who wish to use FHIR and CQL to express and implement quality measures within their health systems; and local, regional, and national quality reporting agencies who wish to receive and process quality reporting documents that are based on measures specified in FHIR and CQL.

### Approach
{: #approach}

The approach taken here is consistent with balloted IGs for FHIR. These publications view the ultimate implementation specification as a set of formal artifacts, including profiles, extensions, and terminologies. The base FHIR specification provides for the representation of quality measures using the Measure resource, as well as guidance on quality reporting within the Clinical Reasoning module. IGs such as this add constraints to the base resources and guidance through profiles and conformance requirements that further define and restrict the sequence and cardinality of elements in the FHIR resources and the vocabulary sets for coded elements.

### Scope
{: #scope}

This IG is a conformance profile, as described in the [Conformance](http://hl7.org/fhir/R4/conformance-module.html) section of the HL7 FHIR specification. The base resources for this IG are the HL7 FHIR Measure and Library resources and associated guidance within the Clinical Reasoning module. This IG does not describe every aspect of quality reporting in FHIR. Rather, it defines profiles and constraints on the base Measure and Library resources used in a FHIR Quality Measure. Additional optional Measure and Library elements, not included here, can be included and the result will be compliant with the specifications in this guide. The FHIR Clinical Reasoning module provides resources and universally applicable guidance for reporting quality measurement results, and the [Data Exchange for Quality Measures (DEQM)](http://hl7.org/fhir/uv/deqm) implementation guide provides additional guidance and use cases related to quality reporting.

Member attribution is a significant component of measuring performance of healthcare providers, reporting data and reimbursing for patient care using alternative payment models (APMs) that focus on value based management. Mechanisms for determining member attribution vary significantly across use cases, stakeholders, and contexts of use. Measure specifications conformant with this implementation guide are intended to be used in many different settings, so member attribution models are intentionally out of scope for this implementation guide. The DEQM implementation guide describes how member attribution models can be used with measure specifications to support reporting in various contexts. One method in particular, referenced in the [capabilities](capabilities.html) section of this implementation guide, is the [Member Attribution List (ATR)](http://hl7.org/fhir/us/davinci-atr) implementation guide, focused on supporting exchange of Member Attribution (ATR) Lists between providers and payers.

### Conventions
{: #conventions}

The keywords SHALL, SHALL NOT, SHOULD, SHOULD NOT, MAY, and NEED NOT in this document are to be interpreted as defined in [RFC 2119](https://www.ietf.org/rfc/rfc2119.txt). Unlike RFC 2119, this specification acknowledges that varying use of optional features may prevent interoperability between applications. In particular

* SHALL: an absolute requirement for all implementations
* SHALL NOT: an absolute prohibition against inclusion for all implementations
* SHOULD/SHOULD NOT: a best practice or recommendation to be considered by implementers within the context of their particular implementation; there may be valid reasons to ignore an item, but the full implications must be understood and carefully weighed before choosing a different course
* MAY/NEED NOT: truly optional; can be included or omitted as the implementer decides with no implications

### Previous Non-FHIR quality measurement standards [Example: HL7 v3 Based Standards]
{: #background}
This Implementation Guide (IG) defines an approach to using CQL with the FHIR Measure and Library resources for specifying quality measures. The guidance here is drawn from the [FHIR Clinical Reasoning Module](http://www.hl7.org/fhir/R4/clinicalreasoning-module.html), as well as the [CQL-Based HQMF IG R1 STU4.1](http://www.hl7.org/implement/standards/product_brief.cfm?product_id=405).
This Implementation Guide (Figure 2-1(b)) is the successor of the CQL-based HQMF IG R1 STU4.1 (Figure 2-1(a)).

<details open>

<summary>

<b>Figure 2-1: Relationship between CQL based HQMF and FHIR Quality Measure IG's Diagram.</b>

</summary>

{% include img.html img="RelationshipToCQLBasedHQMFIG.png" %}

</details>

#### Clinical Quality Language R1
{: #clinical-quality-language-r1}

[Clinical Quality Language R1 (CQL)](http://cql.hl7.org) is an HL7/ANSI Normative standard. It is part of the effort to harmonize standards between quality measures (QMs) and clinical decision support (CDS). CQL provides the ability to express logic that is human readable yet structured enough for processing a query electronically.

#### CQL-based HQMF IG R1 STU4.1
{: #cql-based-hqmf-ig-r1-stu4.1}

The first version of the CQL-based HQMF IG was released in September 2015 and was intended to be used in conjunction with the pre-existing QDM based HQMF R1 IG. Since 2015, the community and the standards have evolved; beginning from version 5.4, QDM no longer contains expression logic representation, ceding this functionality to CQL. The CQL-based HQMF IG is the sole guide describing how to use QDM, CQL, and HQMF in combination (Figure 2-1a).

A result of replacing QDM-based logic with CQL is that all QDM logic elements previously encoded in HQMF were replaced with CQL. This means that QDM data criteria specify only the data of interest (e.g. value sets, effective time, properties) for the QM, and the previous use of QDM expressions that captured interrelationships between data criteria (such as “starts after end of”) or identified subsets of data (such as min, max, last, and first) are now represented with CQL expressions. The Quality Measures Implementation Guide (this IG) documents the full approach in detail starting in [QMs](measure-conformance.html), covering the use of FHIR, CQL, and QI-Core to represent quality measures.

#### HQMF
{: #hqmf}

HQMF is a structured document markup standard “…for representing a health quality measure as an electronic document. A quality measure is a quantitative tool to assess the performance of an individual or organization’s performance in relation to a specified process or outcome via the measurement of an action, process, or outcome of clinical care. Quality measures are often derived from clinical guidelines and are designed to determine whether the appropriate care has been provided given a set of clinical criteria and an evidence base.” See [HL7, Representation of the Health Quality Measures Format (HQMF)](http://www.hl7.org/implement/standards/product_brief.cfm?product_id=97) for more information.

Note that HQMF is not an HL7 V3 Clinical Document Architecture (CDA) standard, but is similar to CDA in being a structured document markup standard.

HQMF is a normative HL7 V3 based standard designed to represent electronic quality measures. It functions by separating the administrative and descriptive metadata of a measure from the technical data criteria and population logic. It standardizes a measure’s structure, metadata, definitions, and logic, the HQMF ensures measure consistency and unambiguous interpretation.

The FHIR Clinical Reasoning module replaces HQMF by defining the Measure resource.

#### Quality Reporting Document Architecture (QRDA)
{: #quality-reporting-document-architecture-(qrda)}

[Quality Reporting Document Architecture (QRDA) Category I](http://www.hl7.org/implement/standards/product_brief.cfm?product_id=35) is an HL7 standard that supports quality reporting at the individual patient level (referred to as QRDA Category I) and [Quality Reporting Document Architecture (QRDA) Category III](https://www.hl7.org/implement/standards/product_brief.cfm?product_id=286) is an HL7 standard that supports quality reporting at the summary level (referred to as QRDA Category III). The aspects of QRDA related to reporting results are captured in the MeasureReport resource, while the aspects of QRDA representing patient data are captured by QI-Core. The FHIR Clinical Reasoning module replaces QRDA by defining the MeasureReport structure, and the [Data Exchange for Quality Measures Implementation Guide](http://hl7.org/fhir/uv/deqm) provides implementation guidance for measure reporting.
