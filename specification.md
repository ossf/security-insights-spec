# Specification

This specification provides a mechanism for projects to report information about their security in a machine-processable way. It is formatted as a YAML file to make it easy to read and edit by humans.

Values that are included within the specification may be required or optional. Optional values are reccommendations from the Open Source Security Foundation's _Identifying Security Threats Working Group_, but may not be prudent for all use cases.

Example implementations can be found on the specification's [GitHub repo](https://github.com/ossf/security-insights-spec/pull/37).

The following values are part of Security Insights Specification `v1.0.0`

## Header

The section "`header`" holds high-level information about the project (e.g. license, changelog) and `SECURITY-INSIGHTS.yml`. This section is **required**.

```yaml
header:
  schema-version: 1.0.0
  parent-security-yaml: https://blah.com/ossf-security.yaml
  expiration-date: '2023-08-31T10:10:09.000Z'
  last-updated: '2021-09-01'
  last-reviewed: '2022-09-01'
  commit-hash: 4dbf78ebc006ee5f668c0a74876ef8d6db9485be
  project-url: https://github.com/foo/bar
  project-release: '1.2.0'
  changelog: https://github.com/foo/changelog.md
  license: https://git.foo/license
```

### Fields

- `schema-version` (Required)
  - **Description:** Provide the version of the specification that you are adhering to. This information is useful to validate the YAML according to the correct schema version.
  - **Type:** String. The version must match one of the values defined in the field `enum` of the schema.
- `parent-security-yaml`
  - **Description:** Provide the link to the last version of the `SECUIRTY-INSIGHT.yml`. This information can be helpful if the repository or project is mirrored.
  - **Type:** String. The provided URL must meet the IRI standard ([RFC 3987](https://www.ietf.org/rfc/rfc3987.txt)) and begin with `https://`.
- `expiration-date` (Required) 
  - **Description:** The date this file should no longer be considered valid, and it can be at most one year from the date it was last reviewed.
  - **Type:** String. The provided value must be a datetime.
- `last-updated`
  - **Description:** The date of the last update to `SECURITY-INSIGHTS.yml`, excluding the properties `commit-hash` and `last-reviewed`.
  - **Type:** String. The provided value must be a date.
- `last-reviewed`
  - **Description:** Date this file was last reviewed by a project maintainer to confirm holistic accuracy.
  - **Type:** String. The provided value must be a date.
- `commit-hash`
  - **Description:** The last commit to which the `SECURITY-INSIGHTS.yml` refers.
  - **Type:** String. The provided hash must match a SHA hash (`^\b[0-9a-f]{5,40}\b$`).
- `project-url` (Required)
  - **Description:** URI for the main project repository that this document refers to.
  - **Type:** String. The provided URL must meet the IRI standard (RFC 3987) and begin with `https://`.
- `project-release`
  - **Description:** The release version or artifact version to which the `SECURITY-INSIGHTS.yml` refers.
  - **Type:** String.
- `changelog`
  - **Description:** URL to the project changelog.
  - **Type:** String. The provided URL must meet the IRI standard (RFC 3987) and begin with `https://`.
- `license`
  - **Description:** URL to the project license.
  - **Type:** String. The provided URL must meet the IRI standard (RFC 3987) and begin with `https://`.

## Project Lifecycle

The section "`project-lifecycle`" describes the life status of the project by providing information about the project's status - whether it is active or not, the roadmap, release cycle, and contact information. The purpose of this section is to help project adopters evaluate adoption risk and the maintenance status (e.g., whether maintainers are continuing to ship security fixes). This section is **required**.


```yaml
project-lifecycle:
  status: active
  roadmap: https://foo.bar/roadmap.html
  bug-fixes-only: false
  core-maintainers:
  - https://github.com/github
  - joe.bob@email.com
  release-cycle: https://foo/release
  release-process: |
      foo bar
```

### Fields

- `bug-fixes-only` (Required)
  - **Description:** Provide the maintenance status of the project by specifying if the maintainers fix only bugs without providing new features.
  - **Type:** Boolean.
- `core-maintainers` (Conditionally required)
  - **Description:** Provide the contacts of the project maintainers (emails, social profiles, websites, etc). This information can help consumers to contact the right people.
  - **Type:** Array. Elements of the array are strings.
  - **Condition:** This value is required if `bug-fixes-only` is `true` or if `status` is `active`.
- `roadmap`
  - **Description:** URI to the project roadmap.
  - **Type:** String. The provided URL must meet the IRI standard (RFC 3987) and begin with `https://`.
- `release-cycle`
  - **Description:** URI to the project release cycle.
  - **Type:** String. The provided URL must meet the IRI standard (RFC 3987) and begin with `https://`.
- `release-process`
  - **Description:** Provide a short description for the release process of the process.
  - **Type:** String. At most 560 characters.
- `status` (Required)
  - **Description:** Provide the status of the project. This information can help Security Insights consumers to know if a project is still actively maintained or not. The possible values are inspired by [repostatus.org](https://repostatus.org), and the description of each value below is quoted from the repostatus.org documentation.
  - **Type:** String. The value must match one of the following values.
  - **Possible Values:**
    - Concept – _Minimal or no implementation has been done yet, or the repository is only intended to be a limited example, demo, or proof-of-concept._
    - WIP – _Initial development is in progress, but there has not yet been a stable, usable release suitable for the public._
    - Suspended – _Initial development has started, but there has not yet been a stable, usable release; work has been stopped for the time being but the author(s) intend on resuming work._
    - Abandoned – _Initial development has started, but there has not yet been a stable, usable release; the project has been abandoned and the author(s) do not intend on continuing development._
    - Active – _The project has reached a stable, usable state and is being actively developed._
    - Inactive – _The project has reached a stable, usable state but is no longer being actively developed; support/maintenance will be provided as time allows._
    - Unsupported – _The project has reached a stable, usable state but the author(s) have ceased all work on it. A new maintainer may be desired._
    - Moved - _The project has been moved to a new location, and the version at that location should be considered authoritative. This status should be accompanied by a new URL._

## Contribution Policy

The "`contribution-policy`" section offers documentation outlining the project's contribution rules, requirements, and policies. It serves as a resource for the community, helping them understand how to contribute to the project. Specifically, this section clarifies whether pull requests and automated pull requests are permitted. This section is **required**.

```yaml
contribution-policy:
  accepts-pull-requests: true
  accepts-automated-pull-requests: true
  automated-tools-list:
  - automated-tool: example/security-research
    action: denied
    path:
    - main/foo/bar
    - main/examples
    comment: |
      foo bar
  contributing-policy: https://example.com/development-policy.html
  code-of-conduct: https://example.com/code-of-conduct.html
```

### Fields

- `accepts-pull-requests` (Required)
  - **Description:** Define if the maintainers accept pull-requests or not from external contributors.
  - **Type:** Boolean.
- `accepts-automated-pull-requests` (Required)
  - **Description:** Define if the maintainers accept pull-requests generated by bots or automated tools.
  - **Type:** Boolean.
- `automated-tools-list`
  - **Description:** List of allowed and denied automated tools and bots. This property can integrate the value `accepts-automated-pull-requests`, according to an automated tool is allowed or denied.
  - **Type:** Array.
  - `automated-tool` (Required)
    - **Description:** The name of the automated tool or bot.
    - **Type:** String.
  - `action` (Required)
    - **Description:** Define if automated actions from a specific tool are allowed or denied.
    - **Type:** String. The version must match one of the values defined in the field `enum` of the schema.
  - `path`
    - **Description:** Provide paths or sub-paths where the automated actions are allowed or denied.
    - **Type:** Array. Elements of the array are strings.
  - `comment`
    - **Description:** Provide additional context or comments.
    - **Type:** String. At most 560 characters.
- `contributing-policy`
  - **Description:** URI to the project contributing policy.
  - **Type:** String. The provided URL must meet the IRI standard (RFC 3987) and begin with `https://`.
- `code-of-conduct`
  - **Description:** URI to the project code of conduct.
  - **Type:** String. The provided URL must meet the IRI standard (RFC 3987) and begin with `https://`.

## Documentation

The "`documentation`" section is simply a list of URIs for any kind of documentation that maintainers want to provide to the community (project adopters, contributors, security researchers, etc.).

```yaml
documentation:
  - http://foo.bar/wiki
```

### Fields

This section is not required. It is an array containing links to the project documentation (docs, wiki, etc.). Every item must be a string that meets the IRI standard (RFC 3987) and begin with `https://`.

## Distribution Points

The "`distribution-points`" section contains a list of PURLs (Package URLs) for official project releases and distributions, managed directly by the project's maintainers. This section assists Security Insights consumers in verifying the source of installed artifacts. This section is **required**.


```yaml
distribution-points:
  - https://example.com/foo
  - pkg:npm/foobar
```

### Fields

It is an array containing pURLs to the official releases, official released artifacts, or official packages of the project. Every item must be a string.

## Security Artifacts

The "`security-artifacts`" section provides additional security-focused documentation (e.g., threat model, self-assessment) that project maintainers can share. These documents can help the community to better evaluate the security maturity of the project.

```yaml
security-artifacts:
  threat-model:
    threat-model-created: true
    evidence-url:
    - https://foo.com/model.html
    comment: |
      foo bar
  self-assessment:
    self-assessment-created: true
    evidence-url:
    - https://foo.com/assessment.html
    comment: |
      foo bar
  other-artifacts:
    - artifact-name: example-artifact
      artifact-created: true
      evidence-url:
        - https://foo.com/artifact.html
      comment: |
        foo bar
```

### Fields

- `threat-model`
  - `threat-model-created` (Required)
    - **Description:** Define if a threat model has been created for the project. A false value may be used to add comments regarding the status of the assessment.
    - **Type:** Boolean.
  - `evidence-url` (Conditionally required)
    - **Description:** Evidence of the project threat model.
    - **Type:** Array. Every provided item must be a string that meets the IRI standard (RFC 3987) and begin with `https://`.
    - **Condition:** This value is required if `threat-model-created` is `true`.
  - `comment`
    - **Description:** Provide shortly additional context to the linked threat model.
    - **Type:** String. At most 560 characters.
- `self-assessment`
  - `self-assessment-created` (Required)
    - **Description:** Define whether a security self-assessment for the project has been created. A false value may be used to add comments regarding the status of the assessment.
    - **Type:** Boolean.
  - `evidence-url` (Conditionally required)
    - **Description:** Evidence of the self-assessments of the project.
    - **Type:** Array. Every provided item must be a string that meets the IRI standard (RFC 3987) and begin with `https://`.
    - **Condition:** This value is required if `self-assessment-created` is `true`.
  - `comment`
    - **Description:** Provide shortly additional context to the linked self-assessments.
    - **Type:** String. At most 560 characters.
- `other-artifacts`
  - **Description:** List of other artifacts created for the project.
  - **Type:** Array.
    - `artifact-name`
      - **Description:** Name of the provided artifact.
      - **Type:** String.
    - `artifact-created`
      - **Description:** Define whether an additional artifact for the project has been created. A false value may be used to add comments regarding the status of the assessment.
      - **Type:** Boolean.
    - `evidence-url` (Conditionally required)
      - **Description:** URI to the artifact.
      - **Type:** Array. Every provided item must be a string that meets the IRI standard (RFC 3987) and begin with `https://`.
      - **Condition:** This value is required if `artifact-created` is `true`.
    - `comment`
      - **Description:** Provide shortly additional context to the linked artifact.
      - **Type:** String. At most 560 characters.

## Security Testing

The "`security-testing`" section comprises a list of tools and services integrated into the project for automating security tests, such as SAST tests, fuzzing, and SCA tools. While not mandatory, including this section is strongly recommended. It can offer valuable information to project adopters for assessing the existing security testing practices and to contributors for enhancing open-source testing and CI/CD.

```yaml
security-testing:
- tool-type: sca
  tool-name: Dependabot
  tool-version: 1.2.3
  tool-url: https://example.org
  tool-rulesets:
  - built-in
  integration:
    ad-hoc: false
    ci: true
    before-release: true
  comment: |
    foo bar
```

### Fields

This section is an array.

- `integration` (Required)
  - **Description:** Additional context about the security test. This information can help to understand how the test works and how it is integrated into the CI/CD of the project.
  - `ad-hoc` (Required)
    - **Description:** Define if the test is an ad-hoc security test.
    - **Type:** Boolean.
  - `ci` (Required)
    - **Description:** Define if the security test is part of the CI.
    - **Type:** Boolean.
  - `before-release` (Required)
    - **Description:** Define if the security test runs before the release.
    - **Type:** Boolean.
- `tool-name` (Required)
  - **Description:** Name of the tool or service used to scan or analyze the project.
  - **Type:** String.
- `tool-rulesets`
  - **Description:** Tool rules used to scan or analyze the project.
  - **Type:** Array. Every item must be a string.
- `tool-type` (Required)
  - **Description:** Type of security test: SAST, DAST, IAST, fuzzing or software composition analysis (SCA).
  - **Type:** String. The value must match one of the values defined in the field `enum` of the schema.
- `tool-url`
  - **Description:** Whenever possible, a URL to the security test (e.g. GitHub Action, CircleCI YAML, etc). This is strong evidence of standards and tests in place.
  - **Type:** String. The provided URL must meet the IRI standard (RFC 3987) and begin with `https://`.
- `tool-version` (Required)
  - **Description:** Version of the used tool or service. This information - together with previously provided values - can help Security Insights consumers reproduce tests for the project.
  - **Type:** String.
- `comment`
  - **Description:** Provide additional context on the used tool or service.
  - **Type:** String. At most 560 characters.

## Security Assessments

The "`security-assessments`" section assists project consumers and the community in locating information about audits conducted by third-party authorities. It consolidates sources and provides links to documentation or audits furnished by third-party companies, which can certify the project's standards. This may include penetration test reports, security certifications, and more.

```yaml
security-assessments:
- auditor-name: third-party auditor
  auditor-url: https://auditor.foo.bar.com
  auditor-report: https://foo.bar/report.pdf
  report-year: 2021
  comment: |
    foo bar
```

### Fields

This section is an array.

- `auditor-name` (Required)
  - **Description:** Name of the third-party security auditor.
  - **Type:** String.
- `auditor-report`
  - **Description:** URI to the security report provided by the auditor. Whenever possible, it is recommended to share the original audit report (e.g. pentest report).
  - **Type:** String. The provided URL must meet the IRI standard (RFC 3987) and begin with `https://`.
- `auditor-url` (Required)
  - **Description:** URI to the auditor website.
  - **Type:** String. The provided URL must meet the IRI standard (RFC 3987) and begin with `https://`.
- `report-year` (Required)
  - **Description:** Year of the report.
  - **Type:** Integer.
- `comment`
  - **Description:** Provide additional context on the report, in particular, if the report document is not publicly shared.
  - **Type:** String. At most 560 characters.

## Security Contacts

The "`security-contacts`" section is a list of contacts (email, phone, URLs) of the responsible persons or team for the security of the project. This section is **required**.

```yaml
security-contacts:
- type: email
  value: joe.bob@email.com
  primary: true
- type: email
  value: alice.bob@email.com
  primary: false
```

### Fields

This section is an array.

- `primary`
  - **Description:** Define if the provided contact is a primary contact or not. 
  - **Type:** Boolean.
- `type` (Required)
  - **Description:** Provide the type of contact: email, phone, or website.
  - **Type:** String. The contact type must match one of the values defined in the field `enum` of the schema.
- `value` (Required)
  - **Description:** Provide a valid security contact.
  - **Type:** String. The value must be an e-mail contact, a URI, or a mobile phone.

## Vulnerability Reporting

The "`vulnerability-reporting`" section provides policies and procedures about how to report properly a security issue. In this section, security researchers can easily find information about the security policy, contacts, bug bounty program, and in-scope and out-of-scope areas. This section is **required**. It is strongly recommended - if the project is maintained and active - to accept vulnerability reports and have a security policy (e.g., `SECURITY.md`).

```yaml
vulnerability-reporting:
  accepts-vulnerability-reports: true
  email-contact: security@something.com
  security-policy: https://foo.bar/reporting.html
  bug-bounty-available: true
  bug-bounty-url: https://foo.bar/bugs.html
  in-scope:
  - broken access control
  - other
  in-scope-comment: |
    Read the security policy.
  out-scope:
  - other
  out-scope-comment: |
    Read the security policy.
  pgp-key: |
    your-key-here
```

### Fields

- `accepts-vulnerability-reports` (Required)
  - **Description:** Define whether the project maintainers or security team accept security reports or not. If the project is active or maintained, it is highly recommended to set `true`.
  - **Type:** Boolean.
- `bug-bounty-available`
  - **Description:** Define if a bug bounty program is in-place or not.
  - **Type:** Boolean.
- `bug-bounty-url`
  - **Description:** URI to the bug bounty program, if it is public.
  - **Type:** String. The provided URL must meet the IRI standard (RFC 3987) and begin with `https://`.
- `email-contact` (Conditionally required)
  - **Description:** E-mail contact to report vulnerabilities or other related information.
  - **Type:** String. The provided email must meet the format `idn-email`.
  - **Condition:** This value is required if `accepts-vulnerability-reports` is `true`.
- `security-policy` (Conditionally required)
  - **Description:** URI to the project security policy or similar document (`SECURITY.md`, `security.txt`, etc.).
  - **Type:** String. The provided URL must meet the IRI standard (RFC 3987) and begin with `https://`.
  - **Condition:** This value is required if `accepts-vulnerability-reports` is `true`.
- `pgp-key`
  - **Description:** 
  - **Type:** String. The provided PGP key must start with `----BEGIN PGP PUBLIC KEY BLOCK-----`, and must end with `-----END PGP PUBLIC KEY BLOCK-----`.
- `in-scope`
  - **Description:** In-scope vulnerability categories, according to OWASP Top 10 2021. It is recommended to specify better a in-scope list in the security policy or in bug bounty program.
  - **Type:** Array. Every element must match one of the values defined in the field `enum` of the schema.
- `in-scope-comment`
  - **Description:** Additional comment to describe the in-scope list to report valid vulnerabilities and security issues.
  - **Type:** String. At most 560 characters.
- `out-scope`
  - **Description:** Out-of-scope vulnerability categories, according to OWASP Top 10 2021. It is recommended to specify better a out-of-scope list in the security policy or in bug bounty program.
  - **Type:** Array. Every element must match one of the values defined in the field `enum` of the schema.
- `out-scope-comment`
  - **Description:** Additional comment to provide more context about the out-of-scope list.
  - **Type:** String. At most 560 characters.

## Dependencies

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

### Fields

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