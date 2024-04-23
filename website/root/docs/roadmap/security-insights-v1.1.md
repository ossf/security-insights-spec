# SECURITY INSIGHTS v1.1 Roadmap

This document would like to define the minimum required improvements and changes to release version **1.1** of the Security Insights specification.

1. Create an independent website, with its custom top-level domain, to document the specification Security Insights.
    1. We can use the domain `securityinsights.dev.` 
2. Improve the Security Insights specification:
    1. Support more tool families in `security-testing`(risk score checkers (e.g. Scorecard), linters, other generic scanners) ([Slack](https://openssf.slack.com/archives/C04BB493NET/p1696468506093119));
    2. Improve support for maintainers and owners by allowing URLs to other trusted sources (issue #67);
    3. Improve `dependencies` section, in particular the SBOM sub-section according to real-world scenarios;
    4. Add more examples, and use-cases (issue #68).
3. Create and implement a GitHub Action into `ossf/security-insights-spec` to validate changes and pull requests.
4. Work on si-tooling to offer more validator and wizard tools to the community to accelerate the SECURITY INSIGHTS adoption:
    1. A Golang script;
    2. A static webpage.

**Estimated Time of Arrival:** 2024.Q1
 

