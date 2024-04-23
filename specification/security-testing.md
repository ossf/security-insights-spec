# Security Testing

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

This section is an array of objects.

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
