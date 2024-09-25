# OpenSSF Best Practices Badge

The "`openssf-bp-badge`" section provides information about how well the project satisfies the criteria defined by the [OpenSSF Best Practices Badge](https://www.bestpractices.dev/). This enables projects to assert, in a simple text file, claims about the status and justification for any of its criteria. This enables easy reporting into the OpenSSF Best Practices Badge system, and reporting back from that system, all using SECURITY-INSIGHTS.

Inside this section are a set of keys the provide data about the project. These are either "special keys" or "criterion keys". The "special keys" are data that are important data for the best practices badge, but are not criteria. The special keys are described in more detail below; they are:

* `name` (this is not present in the SECURITY-INSIGHTS header)
* `description` (description of the project in Markdown format)
* `homepage_url` (it's not clear if header.project.url is this or `repo_url`)
* `repo_url` (it's not clear if header.project.url is this or `homepage_url`)
* `license` (this is the SPDX license expression, not a URL)
* `cpe` (Common Platform Enumeration identifier)
* `implementation_languages` (list of implementation languages used)

Criterion keys which match the criterion ID in the OpenSSF best practices badge. For example, the key `crypto_published` would match the criterion `crypto_published`, which says at the passing level that "The software produced by the project MUST use, by default, only cryptographic protocols and algorithms that are publicly published and reviewed by experts (if cryptographic protocols and algorithms are used)." Note that in the OpenSSF best practices badge, some criteria are "SHOULD" at lower tiers (like "passing") and become "MUST" at higher tiers (like "silver" or "gold"). However, since the goal of SECURITY-INSIGHTS is to capture the project's current status, it simply captures its status regardless of where is it a MUST as compared to a SHOULD.

Inside each of the criterion keys is two keys with values, 'status' and 'justification', which are both strings. The 'status' is a string, required when its parent is present, with one of the following values: "Met", "Unmet", "?", or "N/A". The optional 'justification' string, if present, is a textual justification in markdown format.

See the [OpenSSF Best Practices Badge](https://www.bestpractices.dev/) site for more information about it. You can determine the current set of criterion keys on Unix-like systems by running this shell command:

~~~~sh
curl -i 'https://raw.githubusercontent.com/coreinfrastructure/best-practices-badge/refs/heads/main/criteria/criteria.yml' | \
  grep '^      - ' | sed -e 's/^ *- //' -e 's/ *#.*//' -e 's/:$//' | \
  sort | uniq
~~~~

Here is a simple example:

```yaml
openssf-bp-badge:
  name: Secret-stasher
  crypto-published:
    status: Met
    justification: |
      Uses AES with a 256-bit key, a widely published algorithm, when
      encrypting private data for later recovery.
```

The special keys are as follows:

- `name` (Required)
  - **Description:** Short name of the project for purposes of the
    OpenSSF Best Practices Badge.
  - **Type:** String.
- `description` (Optional)
  - **Description:** Description of the project in Markdown format.
  - **Type:** String.
- `homepage_url` (Optional)
  - **Description:** URL of home page of project. This is where new
    users would typically start. For some projects this
    is the same as the `repo_url`.
  - **Type:** String.
* `repo_url` (Required)
  - **Description:** URL of public repository of project.
  - **Type:** String.
* `license` (Optional)
  - **Description:** SPDX license expression for the license of the project.
    Note that this is *NOT* a URL.
  - **Type:** String.
* `cpe` (Optional)
  - **Description:** Common Platform Enumeration (CPE) identifier.
  - **Type:** String.
* `implementation_languages`
  - **Description:** List of implementation (programming) languages used.
    If there is more than one, their names are separated by a comma.
  - **Type:** String.
