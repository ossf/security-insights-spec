# Project

The `project` object captures key details about the project, including its name, homepage, potential funding, administrators, documentation, release information, subprojects, vulnerability reporting, and security posture.

---

## `project.name`
- **Type**: `string`
- **Description**: The official name of the project. This may be the same as the organization, the repository name, or another static value.

---

## `project.funding` (optional)
- **Type**: `string`
- **Matches Pattern**: `^https?://[^\\s]+$`
- **Description**: A URL where information about the project's funding or sponsorship details can be found.

---

## `project.homepage`
- **Type**: `string`
- **Matches Pattern**: `^https?://[^\\s]+$`
- **Description**: The primary URL associated with the project, serving as its main landing page, organization page, or README.

---

## `project.roadmap` (optional)
- **Type**: `string`
- **Matches Pattern**: `^https?://[^\\s]+$`
- **Description**: A URL that outlines the project’s future plans, milestones, and objectives.

---

## `project.administrators`

A list of key individuals or organizations responsible for overseeing the project. Each object in the list has the following fields:

### `administrators[].name`

- **Type**: `string`
- **Description**: First and last name of anyone with adminstrative access to the project's version control or related systems.

### `administrators[].affiliation`

- **Type**: `string`
- **Description**: The organization with which the administrator is affiliated, such as a place of work or study.

### `administrators[].contact` (optional)

- **Type**: `string`
- **Matches Pattern**: `^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$`
- **Description**: An email address where the administrator can be reached.

---

## `project.documentation` (optional)

An object that may contain any of the following fields, each one a string matching `^https?://[^\\s]+$` if the field is present:

- **`project.documentation.quickstart`**
  - **Description**: A guide to help users get started with the project.
- **`project.documentation.detailed-guide`** 
  - **Description**: Thorough documentation about the project's features, architecture, and usage. It is recommended that this contains a list of all possible inputs and outputs.
- **`project.documentation.code-of-conduct`**
  - **Description**: A code of conduct that outlines the expected behavior of contributors and maintainers.
- **`project.documentation.release-process`**
  - **Description**: Information about the project's release process, including how to create a new release.
- **`project.documentation.provenance-verification`**
  - **Description**: Instructions on how to verify the provenance of the project's released assets.
- **`project.documentation.governance`**
  - **Description**: Details about the project's governance model, including how decisions are made and who has the ability to approve or directly modify various aspects of the project and its tools.

---

## `project.release` (optional)

Specifies details about the release process, distribution channels, and the latest release. Not to be included if the project is not yet released.

### `release.automated-pipeline`

- **Type**: `bool`
- **Description**: Indicates whether the project has an automated pipeline for building, testing, and releasing new versions.

### `release.distribution-points`

- **Type**: `string list`
- **Description**: A list of locations where the project can be downloaded or accessed, such as URLs or package repository locations.

### `release.latest`

This object outlines the latest release details with the following fields:

#### `latest.CPE`

- **Type**: `string`
- **Description**: Identifies the Common Platform Enumeration string for the release, indicating product, vendor, and version details.

#### `latest.url`

- **Type**: `string`
- **Matches Pattern**: `^https?://[^\\s]+$`
- **Description**: A URL where the latest release can be downloaded or accessed.

#### `latest.name`

- **Type**: `string`
- **Description**: The title or version number of the latest release.

#### `latest.date`

- **Type**: `string`
- **Description**: The date when the latest release was made available.

#### `latest.changelog` (optional)

- **Type**: `string`
- **Matches Pattern**: `^https?://[^\\s]+$`
- **Description**: A URL pointing to the changelog for the latest release.

#### `latest.license` (optional)

An object describing the license details:

- **`license.url`**
  - **Type**: `string`
  - **Matches Pattern**: `^https?://[^\\s]+$`
  - **Description**: A URL where the license text can be found.

- **`license.expression`**
  - **Type**: `string`
  - **Description**: The SPDX license expression for the license.

#### `latest.sbom` (optional)

A list of objects. Each object has:

- **`sbom[].url`**
  - **Type**: `string`
  - **Matches Pattern**: `^https?://[^\\s]+$`
  - **Description**: A URL where the SBOM can be found.
- **`sbom[].format`**
  - **Type**: `string`
  - **Description**: The format of the SBOM, such as CycloneDX, SPDX, or SWID.

#### `latest.provenance` (optional)

An object describing provenance details:

- **`provenance.cryptography`** (optional)
  - **`cryptography.attestation`**  
    - **Type**: `string`
    - **Matches Pattern**: `^https?://[^\\s]+$`
    - **Description**: A URL to the cryptographic attestation for the release.
  - **`cryptography.algorithm`**  
    - **Type**: `string`
    - **Description**: The cryptographic algorithm used to sign the release.
- **`provenance.vex-data`** (optional)  
  - **Type**: `string`
  - **Matches Pattern**: `^https?://[^\\s]+$`
  - **Description**: A URL to the VEX data for the release.
- **`provenance.hash-manifest`** (optional)  
  - **Type**: `string`
  - **Matches Pattern**: `^https?://[^\\s]+$`
  - **Description**: A URL to the hash manifest for the release.

---

## `project.subprojects` (optional)

A collection of related subprojects, each with its own data. Only to be included if the project does has subproject repos that are built into the final project release.

### `subprojects[].name`

- **Type**: `string`
- **Description**: The name of the subproject repo.

### `subprojects[].url`

- **Type**: `string`
- **Matches Pattern**: `^https?://[^\\s]+$`
- **Description**: A URL pointing to the subproject repository.

### `subprojects[].comment`

- **Type**: `string`
- **Description**: Explanation of the subproject purpose, relationship to the main project, or other helpful details.

---

## `project.vulnerability-reporting`

Outlines how vulnerabilities can be reported, including whether a bug bounty exists, who to contact, what’s in and out of scope when reporting, and any relevant security policy information.

### `vulnerability-reporting.accepted`
- **Type**: `bool`
- **Description**: Indicates whether the project accepts vulnerability reports.

### `vulnerability-reporting.bug-bounty-available` (optional)
- **Type**: `bool`
- **Description**: Indicates whether the project has a bug bounty program to reward security researchers who report vulnerabilities.

### `vulnerability-reporting.bug-bounty-program` (optional)

- **Type**: `string`
- **Matches Pattern**: `^https?://[^\\s]+$`
- **Description**: A URL where information about the bug bounty program can be found.

### `vulnerability-reporting.email-contact` (optional)

- **Type**: `string`
- **Matches Pattern**: `^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$`
- **Description**: An email address where vulnerability reports can be sent.

### `vulnerability-reporting.security-policy` (optional)

- **Type**: `string`
- **Matches Pattern**: `^https?://[^\\s]+$`
- **Description**: A URL to a security policy that includes information about how to report vulnerabilities.

### `vulnerability-reporting.in-scope` (optional)

- **Type**: `string list`
- **Description**: A summary list of items that are in scope for vulnerability reporting.

### `vulnerability-reporting.out-of-scope` (optional)

- **Type**: `string list`
- **Description**: A summary list of items that are out of scope for vulnerability reporting.

### `vulnerability-reporting.pgp-key` (optional)

- **Type**: `string`
- **Description**: A PGP key that can be used to encrypt vulnerability reports.

### `vulnerability-reporting.comment` (optional)

- **Type**: `string`
- **Description**: Additional information about the vulnerability reporting process.

---

## `project.security`

Details the security measures, assessments, contacts, and testing processes in place for the project.

### `security.artifacts`

Contains information about security-related artifacts such as self-assessments and third-party assessments.

#### `artifacts.self-assessment`

A self-assessment is a security evaluation performed by the project maintainers or contributors. It is recommended that the self-assessment follows the recommendations provided by CNCF's Security Technical Advisory Group.

- **`self-assessment.evidence`** (optional)

  - **Type**: `string`
  - **Matches Pattern**: `^https?://[^\\s]+$`
  - **Description**: A URL to the evidence gathered in the self-assessment.

- **`self-assessment.date`**

  - **Type**: `string`
  - **Description**: The date when the self-assessment was published.

- **`self-assessment.comment`**

  - **Type**: `string`
  - **Description**: Additional information about the self-assessment. If the assessment has not been performed, this field should indicate the reasoning.

#### `artifacts.third-party-assessments` (optional)

A list of objects describing third-party assessments such as threat models, penetration tests, code reviews, or security audits.

- **`third-party-assessments[].name`**

  - **Type**: `string`
  - **Description**: Name of the document or authors of the assessment.

- **`third-party-assessments[].evidence`**

  - **Type**: `string`
  - **Matches Pattern**: `^https?://[^\\s]+$`
  - **Description**: A URL to the evidence gathered in the third-party assessment.

- **`third-party-assessments[].date`**

  - **Type**: `string`
  - **Description**: The date when the assessment was published.

- **`third-party-assessments[].comment`** (optional)

  - **Type**: `string`
  - **Description**: Any additional helpful information about the assessment.

---

### `security.contacts` (optional)

Contact information that may be used for security-related inquiries, such as questions about reporting vulnerabilities or requesting security reviews.

- **`contacts[].value`**

  - **Type**: `string`
  - **Description**: The contact information, such as an email address or contact form URL.

- **`contacts[].primary`**
  - **Type**: `bool`
  - **Description**: Indicates whether this is the primary contact for security-related inquiries. Only one contact should be marked as primary.

---

### `security.testing` (optional)

Describes the tools, integrations, and processes used for security testing.

- **`testing[].tool`**:
  - **`tool.name`**
    - **Type**: `string`
    - **Description**: The name of the security testing tool or process.
  - **`tool.type`**: 
    - **Type**: `string`
    - **Description**: The type of security testing tool or process, such as Fuzzing, SCA, SAST, DAST, IAST, or RASP.
  - **`tool.version`**: (optional) 
    - **Type**: `string`
    - **Description**: The version of the security testing tool or process.
  - **`tool.url`**: 
    - **Type**: `string`
    - **Matches Pattern**: `^https?://[^\\s]+$`
    - **Description**: A URL where more information about the tool can be found.
  - **`tool.rulesets`** (optional)
    - **Type**: `string list`
    - **Description**: A list of rulesets or configurations used by the tool.
- **`testing[].integration`**:
  - **`integration.ad-hoc`**:
    - **Type**: `bool`
    - **Description**: Indicates whether the tool is manually run on an ad-hoc basis.
  - **`integration.ci`**: `bool`
    - **Description**: Indicates whether the tool is integrated into a continuous integration pipeline separate from the release process.
  - **`integration.before-release`**: `bool`
    - **Description**: Indicates whether the tool is integrated into the build and release pipelines to run before each release.
  - **Description**:
    - **Type**: `string`
    - **Description**: Explanation of how the tool is integrated into the project's development lifecycle.
- **`testing[].comment`** (optional)
  - **Type**: `string`
  - **Description**: Any additional helpful information about the security testing tool or process.

---

> **Note**: Each field above should be assigned a value consistent with its specified data type and/or regular expression pattern. Fields not marked as optional are required.
