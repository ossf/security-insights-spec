---
title: "Introduction"
description: "Short introduction to SECURITY-INSIGHTS specification."
summary: ""
draft: false
menu:
  docs:
    parent: "introduction"
weight: 11000
toc: true
seo:
  title: "" # custom title (optional)
  description: "" # custom description (recommended)
  canonical: "" # custom canonical URL (optional)
  noindex: false # false (default) or true
---

The [SECURITY INSIGHTS specification](https://github.com/ossf/security-insights-spec) provides a mechanism for projects to report information about their security in a machine-processable way. It is formatted as a YAML file to make it easy to read and edit by humans.

Values that are included within the specification may be required or optional. Optional values are reccommendations from the Open Source Security Foundation's _[Metrics and Metadata Working Group](https://github.com/ossf/wg-metrics-and-metadata)_ (former _Identifying Security Threats_), but may not be prudent for all use cases.

Maintenance for the specification is led by the OpenSSF [Metrics and Metadata Working Group](https://github.com/ossf/wg-metrics-and-metadata), and improvements are handled exclusively within the project's GitHub repository. Additional information about contribution can be found within the project's [Contribution Policy](/docs/community/contribution-policy/).

Improvement suggestions and clarification requests can be logged as [GitHub Issues](https://github.com/ossf/security-insights-spec/issues/new), raised as discussion on [Slack](https://openssf.slack.com/messages/security_insights/), or discussed with the community in the appropriate Working Group meeting from the [OpenSSF Community Calendar](https://calendar.google.com/calendar?cid=czYzdm9lZmhwNWk5cGZsdGI1cTY3bmdwZXNAZ3JvdXAuY2FsZW5kYXIuZ29vZ2xlLmNvbQ).

This specification follows semantic versioning. Changes made to the schema on GitHub are considered to be _draft changes_ until a formal release has been made in accordance with the project's [Versioning Policy](docs/community/versioning-policy/).

Any security-related issues related to the specification or maintenance thereof should follow the recommendations outlined in the project's [Security Policy](docs/community/security-policy/).

This specification subject to the Community Specification License 1.0 available at [https://github.com/CommunitySpecification/1.0](https://github.com/CommunitySpecification/1.0).