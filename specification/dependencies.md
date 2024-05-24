# Dependencies

The "`dependencies`" section offers an overview of the project's supply chain. It provides information on the sources and policies governing the usage of third-party artifacts, along with insights into their adoption and maintenance. Here, Security Insights consumers can easily access the SBOM file, details about its creation process, and the lifecycle policy for the dependencies.

```yaml
dependencies:
  third-party-packages: true
  dependencies-lists:
  - https://github.com/foo/packages.json
  sbom:
  - sbom-file: https://foo.bar/sbom
    sbom-format: CycloneDX
    sbom-url: https://foo.bar
  dependencies-lifecycle:
    policy-url: https://example.org
    comment: |
      foo bar
  env-dependencies-policy:
    policy-url: https://example.org
    comment: |
      foo bar
```

- `third-party-packages`
  - **Description:** Define if the project uses third-party packages.
  - **Type:** Boolean.
- `dependencies-lists`
  - **Description:** List of URI to the dependencies file (`package.json`, `requirements.txt`, etc) used in the project.
  - **Type:** Array. Every provided item must be a string that meets the IRI standard (RFC 3987) and begin with `https://`.
- `sbom`
  - **Type:** Array.
  - `sbom-file`
    - **Description:** URI to the SBOM file.
    - **Type:** String. The provided URL must meet the IRI standard (RFC 3987) and begin with `https://`.
  - `sbom-format`
    - **Description:** Name of the SBOM standard used (e.g. CycloneDX, SPDX, etc.).
    - **Type:** String.
  - `sbom-url`
    - **Description:** URI to the SBOM standard website or documentation. This can help Security Insights consumers scan or read the SBOM file using the proper tools.
    - **Type:** String. The provided URL must meet the IRI standard (RFC 3987) and begin with `https://`.
  - `sbom-creation`
    - **Description:** Short description of how the SBOM is created.
    - **Type:** String. At most 560 characters.
- `dependencies-lifecycle`
  - `policy-url`
    - **Description:** URI to the dependencies lifecycle policy. This information can help the Security Insights consumers to better evaluate the maintenance period and the scheduled end of life for the project.
    - **Type:** String. The provided URL must meet the IRI standard (RFC 3987) and begin with `https://`.
  - `comment`
    - **Description:** Short comment about the dependencies lifecycle policy, third-party packages updating process, and deprecation process.
    - **Type:** String. At most 560 characters.
- `env-dependencies-policy`
  - `policy-url`
    - **Description:** URI to environment dependencies policy. This information can help Security Insights consumers know how the project maintainers consume third-party packages.
    - **Type:** String. The provided URL must meet the IRI standard (RFC 3987) and begin with `https://`.
  - `comment`
    - **Description:** Short comment about how third-party dependencies are adopted and consumed in the different environments (dev, test, prod).
    - **Type:** String. At most 560 characters.
