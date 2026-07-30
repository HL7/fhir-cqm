{:toc}

{: #operations}

This IG aligns with or makes use of operations from the [Canonical Resource Management Infrastructure (CRMI) Implementation Guide](https://hl7.org/fhir/uv/crmi/STU2/en/operations.html).

When invoking the [$data-requirements](https://hl7.org/fhir/uv/crmi/STU2/en/OperationDefinition-crmi-data-requirements.html) operation for a Measure, periodStart and periodEnd are provided in the parameters parameter.

For more information on packaging, dependency management, terminology and artifact authoring, see [Canonical Resource Management Infrastructure (CRMI) Implementation Guide](https://hl7.org/fhir/uv/crmi/STU2/en/index.html).

### Operations

#### Packaging

QM IG defines the CQM Package operation to provide specific parameters for packaging a quality measure with its related artifacts. See the [Packaging](packaging.html) discussion for more information.

| **Operation** | **Description** |
|----|----|
| [CQM Package](OperationDefinition-cqm-package.html) | Packages a specified canonical resource for use in a target environment, optionally including related content such as dependencies, components, and testing cases and data. |
{: .grid }