[<img src="https://img.shields.io/badge/slack-@openssf/security%20insights-green.svg?logo=slack">](https://openssf.slack.com/messages/security_insights/)

# Security Insights Specification

This specification provides a mechanism for projects to report information about their security in a machine-processable way. It is formatted as a YAML file to make it easy to read and edit by humans.

The data tracked within this specification is intended to fill the gaps between simplified solutions such as `SECURITY.md` and comprehensive automatable solutions such as SBOMs. In that gap lay elements that must be self-reported by projects to allow end-users to make informed security decisions.

## Usage

Projects should include a `security-insights.yml` file in the root of their repository, or in the appropriate source forge directory such as `.github/` or `.gitlab/`. Users should assume the contents of that file will be updated any time the relevant information changes.

To ensure you are adhering to an official version of the specification, please refer to the [latest release](https://github.com/ossf/security-insights/releases/latest).

This repository often remains unchanged from the latest release, but may diverge as incremental development takes place in preparation for an upcoming release. Any differences between the latest release and the main branch should only be considered previews of the next release.

As the adoption of Security Insights grows, so does the opportunity to automatically ingest it. For example, the Linux Foundation's [CLOMonitor](https://clomonitor.io/) parses a project's Security Insights file to determine whether projects have reported on select security factors prioritized by the foundation.

## Maintenance

Discussion and feedback should take place in [GitHub Issues](https://github.com/ossf/security-insights/issues). 

Because this specification recieves light maintenance and infrequent updates, beginning in 2025 we ask that you follow the [Security Insights Enhancement Proposal](./docs/GOVERNANCE.md#security-insights-enhancement-proposals) process to explore potential changes to the specification.
