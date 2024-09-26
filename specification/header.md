# Header

The section "`header`" holds high-level information about the project (e.g. license, changelog) and `SECURITY-INSIGHTS.yml`. This section is **required**.

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
```

- `schema-version` (Required)
  - **Description:** Provide the version of the specification that you are adhering to. This information is useful to validate the YAML according to the correct schema version.
  - **Type:** String. The version must match one of the values defined in the field `enum` of the schema.
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
- project-name:
  - **Description:** Short name of the project
  - **Type:** String.
- project-**Description:**
  - **Description:** Description of the project in Markdown format.
  - **Type:** String.
- `project-url` (Required)
  - **Description:** URI for the main project repository that this document refers to.
  - **Type:** String. The provided URL must meet the IRI standard (RFC 3987) and begin with `https://`.
- homepage-url:
  - **Description:** URL of home page of project. This is where new users would typically start. This may be the same as the `project-url`.
  - **Type:** String.
- `project-release`
  - **Description:** The release version or artifact version to which the `SECURITY-INSIGHTS.yml` refers.
  - **Type:** String.
- `changelog`
  - **Description:** URL to the project changelog.
  - **Type:** String. The provided URL must meet the IRI standard (RFC 3987) and begin with `https://`.
- `license`
  - **Description:** URL to the project license. The provided URL must meet the IRI standard (RFC 3987) and begin with `https://`.
  - **Type:** String.
- license-expression:
  - **Description:** SPDX license expression for the license of the project.  Note that this is *NOT* a URL.
  - **Type:** String.
- cpe:
  - **Description:** Common Platform Enumeration (CPE) identifier.
  - **Type:** String.
- implementation-languages:
  - **Description:** Array of implementation (programming) languages used, as strings.  If there is more than one, sort them by use (e.g., lines of code), with most used first.
