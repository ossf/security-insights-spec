## Introduction

This specification provides a mechanism for projects to report information about their security in a machine-processable way. It is formatted as a YAML file to make it easy to read and edit by humans.

Values that are included within the specification may be required or optional. Optional values are reccommendations from the Open Source Security Foundation's _Identifying Security Threats Working Group_, but may not be prudent for all use cases.

Example implementations can be found on the specification's [GitHub repository](https://github.com/ossf/security-insights-spec).

A collection of unofficial supplemental tooling can be found in the ["SI Tooling" GitHub Repository](https://github.com/ossf/si-tooling).

Maintenance for the specification is led by the OpenSSF [Metrics & Metadata working group](https://github.com/ossf/wg-metrics-and-metadata), and improvements are handled exclusively within the project's GitHub repository. Additional information about contribution can be found within the project's [Contribution Policy](/CONTRIBUTING.md).

Improvement suggestions and clarification requests can be logged as [GitHub Issues](https://github.com/ossf/security-insights-spec/issues/new), raised as discussion on [Slack](https://openssf.slack.com/messages/security_insights/), or discussed with the community in the appropriate Working Group meeting from the [OpenSSF Community Calendar](https://calendar.google.com/calendar?cid=czYzdm9lZmhwNWk5cGZsdGI1cTY3bmdwZXNAZ3JvdXAuY2FsZW5kYXIuZ29vZ2xlLmNvbQ).

This specification follows semantic versioning. Changes made to the schema on GitHub are considered to be _draft changes_ until a formal release has been made in accordance with the project's [versioning policy](./docs/versioning-policy.md).

Any security-related issues related to the specification or maintenance thereof should follow the recommendations outlined in the project's [security policy](./SECURITY.md).

This specification subject to the Community Specification License 1.0 available at <https://github.com/CommunitySpecification/1.0>.

## Table of Contents

| Section | Required or Optional |
| ------- | -------- |
| [Header](specification/header.md) | Required |
| [Contribution Policy](specification/contribution-policy.md) | Required |
| [Dependencies](specification/dependencies.md) | Optional |
| [Distribution Points](specification/distribution-points.md) | Required |
| [Documentation](specification/documentation.md) | Optional |
| [OpenSSF Best Practices Badge](specification/openssf-bp-badge.md) | Optional |
| [Project Lifecycle](specification/project-lifecycle.md) | Required |
| [Security Artifacts](specification/security-artifacts.md) | Optional |
| [Security Assessments](specification/security-assessments.md) | Optional |
| [Security Contacts](specification/security-contacts.md) | Required |
| [Security Testing](specification/security-testing.md) | Optional |
| [Vulnerability Reporting](specification/vulnerability-reporting.md) | Required |
