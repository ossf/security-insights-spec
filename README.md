[<img src="https://img.shields.io/badge/slack-@openssf/security%20insights-green.svg?logo=slack">](https://openssf.slack.com/messages/security_insights/)

# Security Insights Specification

This specification provides a mechanism for projects to report information about their security in a machine-processable way. It is formatted as a YAML file to make it easy to read and edit by humans.

The data tracked within this specification is intended to fill the gaps between simplified solutions such as `SECURITY.md` and comprehensive automated solutions such as `CycloneDX`. In that gap lay elements that must be self-reported by projects to allow end-users to make informed security decisions.

As the adoption of Security Insights grows, so does the opportunity to automatically ingest it. For example, the Linux Foundation's [CLOMonitor](https://clomonitor.io/) parses a project's Security Insights file to determine whether projects have reported on select security factors prioritized by the foundation.

All information regarding the maintenance, security, and consumption of the Security Insights Specification can be found in this repo within the latest version of the [official specification file](/specification.md).

Please use GitHub issues to discuss the maintenance of this specification, and review the [Contributor Guidelines](./CONTRIBUTING.md) for more information.
