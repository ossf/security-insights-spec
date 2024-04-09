---
title: "Threat Model"
description: "Threat model and risks related to SECURITY-INSIGHTS usage."
summary: ""
draft: false
menu:
  docs:
    parent: "introduction"
weight: 15000
toc: true
seo:
  title: "" # custom title (optional)
  description: "" # custom description (recommended)
  canonical: "" # custom canonical URL (optional)
  noindex: false # false (default) or true
---

A [STRIDE](https://docs.microsoft.com/it-it/azure/security/develop/threat-modeling-tool-threats) Threat Model 
for SECURITY-INSIGHTS specification is available both in [PDF format](https://raw.githubusercontent.com/ossf/security-insights-spec/main/docs/threat-model/SECURITY-INSIGHTS-STRIDE-threat-model.pdf) and 
[JSON format](https://raw.githubusercontent.com/ossf/security-insights-spec/main/docs/threat-model/SECURITY-INSIGHTS-STRIDE-threat-model.json), generated using the [OWASP Threat Dragon](https://github.com/OWASP/threat-dragon) tool.

<img src="https://raw.githubusercontent.com/ossf/security-insights-spec/main/docs/threat-model/SECURITY-INSIGHTS-STRIDE-threat-model.png"></img>

## Supply-chain

**Description:** Attackers can obtain the control of a third-party sources (e.g. website domain, server, etc) linked in the `SECURITY-INSIGHTS.yml`.

**Mitigation:** Maintainers could self-host the evidence to reduce risks.

## False information in the SECURITY-INSIGHTS.yml

**Description:** Maintainers could upload false information in the `SECURITY-INSIGHTS.yml` just to obtain a high score from the scanners or other services which use SECURITY-INSIGHTS to evaluate the project.

**Mitigation:** Scanners could introduce some additional checks (e.g. check if URLs return 200 OK status) and a weighted score to reduce the risks. In addition, the open-source community can read the YAML file and report false information (or just information without clear evidence).

## Private information sharing

**Description:** A maintainer shares mistakenly private critical information (e.g. security audit containing unpatched vulnerabilities).

**Mitigation:** No mitigation provided yet.

## Malicious pull-request

**Description:** A malicious contributor could introduce false or malicious information (e.g. malicious URLs) to obtain a particular advantage.

**Mitigation:** The contributors' PRs to `SECURITY-INSIGHTS.yml` should be carefully reviewed and approved by the maintainers. In addition, the maintainers could decide to not accept direct contributions to the `SECURITY-INSIGHTS.yml`.

## Missing pull-request review or lacks in the review process

**Description:** Missing PR review or lack in the review process can lead to the tampering of `SECURITY-INSIGHTS.yml` by adding false information.

**Mitigation:** The PR should be formally reviewed and approved by another maintainer.