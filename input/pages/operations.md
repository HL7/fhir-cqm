{:toc}

{: #operations}

This IG aligns with or makes use of operations from the [Canonical Resource Management Infrastructure (CRMI) Implementation Guide](https://hl7.org/fhir/uv/crmi/STU2/en/operations.html).

When invoking the [$data-requirements](https://hl7.org/fhir/uv/crmi/STU2/en/OperationDefinition-crmi-data-requirements.html) operation for a Measure, periodStart and periodEnd are provided in the parameters parameter.

For more information on packaging, dependency management, terminology and artifact authoring, see [Canonical Resource Management Infrastructure (CRMI) Implementation Guide](https://hl7.org/fhir/uv/crmi/STU2/en/index.html).

### Operations

#### Data Requirements

The CRMI [$data-requirements](https://hl7.org/fhir/uv/crmi/STU2/en/OperationDefinition-crmi-data-requirements.html) operation can be invoked for a set of measures, either by requesting the data requirements of a manifest that has the measures as components, or by specifying each measure using repeating `url` parameters. The result is the aggregate data requirements for all the measures, which can be used to determine the data needed to calculate the measures in a measure program. See the [Data Requirements for a Measure Program](measure-conformance.html#program-data-requirements) discussion for more information.

#### Packaging

QM IG defines the CQM Package operation to provide specific parameters for packaging a quality measure with its related artifacts. See the [Packaging](packaging.html) discussion for more information.

| **Operation** | **Description** |
|----|----|
| [CQM Package](OperationDefinition-cqm-package.html) | Packages a specified canonical resource for use in a target environment, optionally including related content such as dependencies, components, and testing cases and data. |
{: .grid }