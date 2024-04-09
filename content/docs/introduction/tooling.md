---
title: "Tooling"
description: "Tools and solutions to manage the SECURITY-INSIGHTS YAML."
summary: ""
draft: false
menu:
  docs:
    parent: "introduction"
weight: 13000
toc: true
seo:
  title: "" # custom title (optional)
  description: "" # custom description (recommended)
  canonical: "" # custom canonical URL (optional)
  noindex: false # false (default) or true
---

The Metrics and Metadata Working Group actively develop and maintain some open-sourse tools and solutions to generate and verify the SECURITY-INSIGHTS YAML (`SECURITY-INSIGHTS.yml`).

## SECURITY-INSIGHTS Validator Docker image

Maintainers and contributors can easily verify a SECURITY-INSIGHTS YAML file using the Docker image [security-insights-validator](https://hub.docker.com/r/luigigubello/security-insights-validator), downloadable directly from DockerHub. Alternatively, they can launch the Dockerfile from the folder `python` in the repository [ossf/si-tooling](https://github.com/ossf/si-tooling).

## SECURITY-INSIGHTS GitHub Action

Maintainers can easily integrate the verification of the SECURITY-INSIGHTS files into their GitHub workflows by using the GitHub Action [SECURITY-INSIGHTS Validator](https://github.com/luigigubello/security-insights-validator-ga). This GitHub Action is based on the Docker image released in the OpenSSF repository [ossf/si-tooling/python](https://github.com/ossf/si-tooling/tree/main/python).