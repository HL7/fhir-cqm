{:toc}

{: #operations}

This implementation guide defines operations related to packaging.

### Operations

#### Packaging

These operations are defined to support artifact packaging and dependency tracing, including data requirements determination. When invoking the $data-requirements operation for a Measure, periodStart and periodEnd are provided in the parameters parameter.
See the [Packaging](packaging.html) discussion for more information.
For more information on packaging, dependency management, terminology and artifact authoring, see [Canonical Resource Management Infrastructure (CRMI) Implementation Guide](https://build.fhir.org/ig/HL7/crmi-ig/operations.html).

| **Operation** | **Description** |
|----|----|
| [CQM Package](OperationDefinition-cqm-package.html) | Packages a specified canonical resource for use in a target environment, optionally including related content such as dependencies, components, and testing cases and data. |
{: .grid }