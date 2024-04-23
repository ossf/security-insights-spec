# Project Lifecycle

The section "`project-lifecycle`" describes the life status of the project by providing information about the project's status - whether it is active or not, the roadmap, release cycle, and contact information. The purpose of this section is to help project adopters evaluate adoption risk and the maintenance status (e.g., whether maintainers are continuing to ship security fixes). This section is **required**.


```yaml
project-lifecycle:
  status: active
  roadmap: https://foo.bar/roadmap.html
  bug-fixes-only: false
  core-maintainers:
  - https://github.com/github
  - joe.bob@email.com
  core-team:
  - name: Alice White
    contact: github:example
  - name: Joe Dohn
    contact: joe.bob@email.com
  release-cycle: https://foo/release
  release-process: |
      foo bar
```

- `bug-fixes-only` (Required)
  - **Description:** Provide the maintenance status of the project by specifying if the maintainers fix only bugs without providing new features.
  - **Type:** Boolean.
- `core-maintainers`
  - **Description:** Provide the contacts of the project maintainers (emails, social profiles, websites, etc). This information can help consumers to contact the right people.
    - [Deprecation notice] _`core-maintainers` will be removed in v1.2.0_
  - **Type:** Array. Elements of the array are strings.
- `core-team` (Conditionally required)
  - **Description:** Provide the contacts of the project maintainers (emails, social profiles, websites, etc) or team (web-pages, group e-mails, mailing list, etc). This information can help consumers to contact the right people.
  - **Type:** Array.
  - `name`
    - **Description:** The name of the maintainer or the team.
    - **Type:** String.
  - `role`
    - **Description:** Role of the maintainer in the project.
    - **Type:** String.
  - `contact` (Conditional required)
    - **Description:** Contact of the maintaner or team (e.g. e-mail, Discord, mailing list, etc).
    - **Type:** String.
  - `uri` (Conditional required)
    - **Description:** URI to the team page or team contact information (e.g. mail form page).
    - **Type:** String. 
  - **Condition:** This value `core-team` is required if `bug-fixes-only` is `true` or if `status` is `active`. At least one between `contact` and `uri` is required. 
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
