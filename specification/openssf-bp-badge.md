# OpenSSF Best Practices Badge

The "`openssf-bp-badge`" section provides information about how well the project satisfies the criteria defined by the [OpenSSF Best Practices Badge](https://www.bestpractices.dev/). This enables projects to assert, in a simple text file, claims about the status and justification for any of its criteria. This enables easy reporting into the OpenSSF Best Practices Badge system, and reporting back from that system, all using SECURITY-INSIGHTS.

Inside this section are a set of 0+ criterion keys the provide data about the project. Criterion keys match the criterion ID in the OpenSSF best practices badge. For example, the key `crypto_published` would match the criterion `crypto_published`, which says at the passing level that "The software produced by the project MUST use, by default, only cryptographic protocols and algorithms that are publicly published and reviewed by experts (if cryptographic protocols and algorithms are used)." Note that in the OpenSSF best practices badge, some criteria are "SHOULD" at lower tiers (like "passing") and become "MUST" at higher tiers (like "silver" or "gold"). However, since the goal of SECURITY-INSIGHTS is to capture the project's current status, it simply captures its status regardless of where is it a MUST as compared to a SHOULD. For consistency with the OpenSSF Best Practices badge, the key names are identical, which means they tend to use underscores (`_`) instead of dashes (`-`) as the word separator in the names.

Inside each of the criterion keys is two keys with values, 'status' and 'justification', which are both strings. The 'status' is a string, required when its parent is present, with one of the following values: "Met", "Unmet", "?", or "N/A". The optional 'justification' string, if present, is a textual justification in markdown format.

Note that some information important to the OpenSSF Best Practices badge is not present in his section, but in other places, primarily `header`. These specifically include these OpenSSF Best Practices fields:

* `name`: See `header.project-name`
* `description`: See `header.project-description`
* `homepage_url`: See `header.homepage-url`
* `repo_url`: See `header.project-url`
* `license`: See `header.license-expression` (the SPDX license expression; this is not a URL)
* `cpe`: See `header.cpe` (Common Platform Enumeration identifier)
* `implementation_languages`: See `header.implementation-langauges` (sorted list of implementation languages used)

Unusually, this header is marked with `additionalProperties: true`.
This enables projects to make additional claims that have not (yet) been
incorporated into SECURITY-INSIGHTS. That said, many properties *are* defined,
so many checks are still enabled.

See the [OpenSSF Best Practices Badge](https://www.bestpractices.dev/) site for more information about it, including its [full set of criteria (in your preferred natural language](https://www.bestpractices.dev/criteria). Its GitHub repository provides additional information.

Here is a simple example:

```yaml
openssf-bp-badge:
  crypto-published:
    status: Met
    justification: |
      Uses AES with a 256-bit key, a widely published algorithm, when
      encrypting private data for later recovery.
```
