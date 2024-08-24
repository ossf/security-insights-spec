# Security Assessments

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

This section is an array of objects.

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
