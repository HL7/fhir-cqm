{:toc}


<div style="width: 100%;" >
<h3 id="plain-language-summary-about-hl7-and-this-guide">Plain Language Summary about HL7 and this Guide<a class="anchorjs-link " href="#plain-language-summary-about-hl7-and-this-guide" aria-label="Anchor" data-anchorjs-icon="" style="font: 1em / 1 anchorjs-icons; padding-left: 0.375em;"></a>
  <button class="btn btn-info btn-lg collapsed" type="button" title="Click to Open or Close the Plain Language Summary" data-toggle="collapse" data-target="#plain-lang-summary" aria-expanded="false" aria-controls="collapseExample">
    Welcome! Thank-you for wanting to learn about this guide.  Click Here to see the Plain Language Summary
  </button>
</h3>
</div>
<div class="collapse" id="plain-lang-summary" aria-expanded="false" style="height: 0px;">
  <div class="card card-body" style="border:1px solid;border-color:#cccccc;padding:10px">
  
<h4 id="about-hl7">About HL7<a class="anchorjs-link " href="#about-hl7" aria-label="Anchor" data-anchorjs-icon="" style="font: 1em / 1 anchorjs-icons; padding-left: 0.375em;"></a></h4>
<p><a href="http://hl7.org/">HL7</a>, which stands for Health Level Seven, creates standards to help different healthcare computer systems talk to each other. These HL7 standards are a special language or set of rules that lets information be shared between hospitals, doctors’ offices (e.g. Electronic Health Record Systems), labs, patients (e.g. via patient portals), pharmacies, and insurers, among others.</p>

<p>One of the HL7 standards is HL7 FHIR (Fast Healthcare Interoperability Resources). It helps connect healthcare systems, making it easier for doctors, nurses, and other healthcare professionals to share important information about patients. For example, if you have a lab test at a hospital, HL7 FHIR helps send the results to your doctor’s office so they can provide the right care.</p>

<p>A goal of HL7 is to make sure everyone involved in your healthcare has the right information at the right time. Our standards help machines and people, including you, work together to make better decisions for your health. HL7 sets rules that computer systems follow, so they can understand and share information in a consistent and reliable way.</p>

<p>To learn more about HL7, you can visit the website <a href="http://hl7.org/">hl7.org</a></p>

<p>The people at HL7 make guides that explain how to use the rules (standards) for different things. These guides bring the rules together and show how to use them for specific purposes.</p>

<h4 id="about-this-guide">About this Guide<a class="anchorjs-link " href="#about-this-guide" aria-label="Anchor" data-anchorjs-icon="" style="font: 1em / 1 anchorjs-icons; padding-left: 0.375em;"></a></h4>

<p>Quality measures are numeric quantification of healthcare quality. The QM IG explains how to create and use quality measures using the FHIR and CQL standards. It's designed to help software developers, measure developers, and healthcare organizations create, share, and implement quality measures consistently.  The QM IG provides structure and conformance guidance to facilitate the development of quality measures.</p>

  </div>
</div>

{:.stu-note}
>  This STU 1.0.0 ballot updates the Quality Measure IG, moving it from the US Realm to the Universal Realm. The US realm is still available [here.](https://hl7.org/fhir/us/cqfmeasures/index.html) 

Where possible, new and updated content are highlighted with green text and background
{: .new-content}

<div markdown="1" class="bg-info">

{{ site.data.package-list.list[0].desc }}

</div>


## Quality Measure Implementation Guide
{: #quality-measure-implementation-guide}

### Summary
{: #summary}

The Fast Healthcare Interoperability Resource (FHIR) Quality Measure Implementation Guide (QM IG) describes an approach to representing Quality Measures (QMs) using the FHIR Clinical Reasoning Module and Clinical Quality Language (CQL) in the Universal Realm.

This IG is built on [FHIR Version R4](http://hl7.org/fhir/R4/index.html) and accounts for content in previous generations of QM standards, the HL7 V3-based Health Quality Measure Format (HQMF) and accompanying implementation guides using FHIR. As an HL7 FHIR Implementation Guide, changes to this specification are managed by the sponsoring Clinical Quality Information Work Group and are incorporated as part of the standard balloting process.

#### Examples
{: #examples}

Refer to the [QI-Core implementation guide](http://hl7.org/fhir/us/qicore) for examples of how to represent data involved in calculation of quality measures.

### How to read this Guide
{: #how-to-read-this-guide}

This Guide is divided into several pages which are listed at the top of each
page in the menu bar:

-  **[Home](index.html)**: The home page provides the summary and background information for the FHIR Quality Measure Implementation Guide.
-  **[Introduction](introduction.html)**: The introduction provides a more detailed overview of quality measurement and the background for this guide.
-  **[QMs](measure-conformance.html)**: This page describes measure representation and conformance requirements for QMs.
-  **[Using CQL](using-cql.html)**: This page covers using Clinical Quality Language to author QMs.
-  **[Composites](composite-measures.html)**: This page covers composite measure representation and conformance requirements.
-  **[Packaging](packaging.html)**: This page describes measure packaging and distribution requirements for QMs.
- **FHIR Artifacts**
  - **[Profiles](profiles.html)**: This page lists the set of profiles defined for use by QMs.
  - **[Extensions](extensions.html)**: This page lists the set of extensions defined for use by QMs.
  - **[Terminology](terminology.html)**: This page lists value sets and code systems defined in this IG.
  - **[Capabilities](capabilities.html)**: This page defines the workflows and roles for QMs and contains the capability statements.
  - **[Operations](operations.html)**: This page defines services and operations in support of authoring, publishing, and distributing QMs.
  - **[Artifacts Summary](artifacts.html)**: This page defines the workflows and roles for QMs and contains the capability statements.
-  **[Examples](examples.html)**: This page provides examples used in the other pages, as well as by the Data Exchange for Quality.
-  **[Glossary](glossary.html)** This page defines terms related to quality measurement.
-  **[Downloads](downloads.html)**: This page provides links to downloadable artifacts for implementations.
-  **[Changes](changes.html)**: This page details changes made in each version of the Quality Measure IG.

### Background
{: #background}

<!-- Quality Improvement Ecosystem -->
{% include quality-improvement-ecosystem.md %}

<!-- Quality Measurement Standards Landscape -->
{% include quality-measurement-standards-landscape.md %}

<!-- Data Model Standards Landscape -->
{% include data-model-standards-landscape.md %}

### References
{: #references}

Centers for Medicare &amp; Medicaid. Clinical Quality Measures Basics. [Online]. Available from: [https://www.cms.gov/Regulations-and-Guidance/Legislation/EHRIncentivePrograms/ClinicalQualityMeasures.html](https://www.cms.gov/Regulations-and-Guidance/Legislation/EHRIncentivePrograms/ClinicalQualityMeasures.html) [Accessed 11 October 2019].

Michaels, M. (2023). Adapting Clinical Guidelines for the Digital Age: Summary of a Holistic and Multidisciplinary approach. American Journal of Medical Quality, 38(5S), S3–S11. https://doi.org/10.1097/jmq.0000000000000138

Health level seven. Clinical Quality Framework - HL7 Clinical Quality Information Work Group Confluence Page. [Online]. Available from: [https://confluence.hl7.org/display/CQIWC/Clinical Quality Framework](https://confluence.hl7.org/display/CQIWC/Clinical%20Quality%20Framework) [Accessed 11 October 2019].

### Dependencies
The dependency on QI-Core is included for the purposes of example validation only.  In addition, the dependency on VSAC packages is indirect via the QI Core and US Core.  The conformance profiles in this IG do not make use of the value sets in VSAC.

{% include dependency-table.xhtml %}

### Cross Version Analysis

{% include cross-version-analysis.xhtml %}

### Global Profiles

{% include globals-table.xhtml %}

### IP Statements

{% include ip-statements.xhtml %}
