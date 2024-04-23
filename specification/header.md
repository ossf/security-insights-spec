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
