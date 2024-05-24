# Security Artifacts

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
