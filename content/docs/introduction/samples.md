---
title: "Samples"
description: "Samples for the SECURITY-INSIGHTS YAML."
summary: ""
draft: false
menu:
  docs:
    parent: "introduction"
weight: 14000
toc: true
seo:
  title: "" # custom title (optional)
  description: "" # custom description (recommended)
  canonical: "" # custom canonical URL (optional)
  noindex: false # false (default) or true
---

SECURITY INSIGHTS is a YAML file that open-source maintainers can include in their projects to show the security posture of the project easily. Some fields are strictly required by the specification, both for helping the maintainers keep some minimum security standards and for helping the community find helpful information quickly about the security of a project. On this page, the reader can find a minimum sample, where only required fields are filled, and a fuller one. 

## Minimum Sample

```yaml
header:
  schema-version: '1.0.0'
  expiration-date: '2023-08-31T10:10:09.000Z'
  project-url: https://github.com/foo/bar
project-lifecycle:
  status: active
  bug-fixes-only: false
  core-team:
  - contact: github:example
contribution-policy:
  accepts-pull-requests: true
  accepts-automated-pull-requests: true
distribution-points:
- https://foo.bar/package
- pkg:npm/foobar
security-contacts:
- type: email
  value: joe.bob@email.com
vulnerability-reporting:
  accepts-vulnerability-reports: false 
```

## Fuller Sample

```yaml
header:
  schema-version: 1.0.0
  expiration-date: '2023-08-31T10:10:09.000Z'
  last-updated: '2021-09-01'
  last-reviewed: '2022-09-01'
  commit-hash: 4dbf78ebc006ee5f668c0a74876ef8d6db9485be
  project-url: https://github.com/foo/bar
  project-release: '1.2.0'
  changelog: https://github.com/foo/changelog.md
  license: https://git.foo/license
project-lifecycle:
  status: active
  roadmap: https://foo.bar/roadmap.html
  bug-fixes-only: false
  core-maintainers:
  - github:example
  - joe.bob@email.com
  core-team:
  - name: Alice White
    contact: github:example
  - name: Joe Dohn
    contact: joe.bob@email.com
  release-cycle: https://foo/release
  release-process: |
      Lorem ipsum dolor sit amet
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
      Lorem ipsum dolor sit amet
  contributing-policy: https://example.com/development-policy.html
  code-of-conduct: https://example.com/code-of-conduct.html
documentation:
- http://foo.bar/wiki
distribution-points:
- https://example.com/foo
- pkg:npm/foobar
security-artifacts:
  threat-model:
    threat-model-created: true
    evidence-url:
    - https://foo.com/model.html
    comment: |
      Lorem ipsum dolor sit amet
  self-assessment:
    self-assessment-created: true
    evidence-url:
    - https://foo.com/assessment.html
    comment: |
      Lorem ipsum dolor sit amet
  other-artifacts:
    - artifact-name: example-artifact
      artifact-created: true
      evidence-url:
        - https://foo.com/artifact.html
      comment: |
        Lorem ipsum dolor sit amet
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
    Lorem ipsum dolor sit amet
security-assessments:
- auditor-name: third-party auditor
  auditor-url: https://auditor.foo.bar.com
  auditor-report: https://foo.bar/report.pdf
  report-year: 2021
  comment: |
    Lorem ipsum dolor sit amet
security-contacts:
- type: email
  value: joe.bob@email.com
  primary: true
- type: email
  value: alice.bob@email.com
  primary: false
vulnerability-reporting:
  accepts-vulnerability-reports: true
  email-contact: security@something.com
  security-policy: https://foo.bar/reporting.html
  bug-bounty-available: true
  bug-bounty-url: https://foo.bar/bugs.html
  in-scope:
  - broken access control
  - other
  out-scope:
  - other
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
      Lorem ipsum dolor sit amet
  env-dependencies-policy:
    policy-url: https://example.org
    comment: |
      Lorem ipsum dolor sit amet
```