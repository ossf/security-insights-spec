# README

**OpenSSF Working Group:** [Identifying Security Threats in Open Source Projects](https://github.com/ossf/wg-identifying-security-threats)

**Official document:** [Project Security Information Specification (SECURITY-INSIGHTS.yml))](https://docs.google.com/document/d/1Hqks2J0wVqS_YFUQeIyjkLneLfo3_9A-pbU-7DZpGwM/edit) - 
early draft work to capture some security-related machine-processable information within a project.

## Introduction

Security is important, for this reason, many potential users (final users, engineers, 
developers, or companies) might want to evaluate the security of a particular 
open-source project. There are many ways to evaluate the security of a project, 
including evaluating the code itself (statically or dynamically), the processes used, 
and/or the people involved (e.g., whether or not they know how to develop secure 
software).

Some information can be determined automatically by tools, but determining 
information via tools is often imperfect. For example, many would want to know if a 
project uses an automated test suite, yet because there are so many different kinds 
of test suites & ways to invoke them, automated tools often fail to correctly 
identify whether or not automated tests are performed. It can be provided manually, 
but that must be done for each approach.

This specification provides a mechanism for projects to report information about 
their security in a machine-processable way. It is formatted as a YAML file to make 
it easy to read and edit directly by people. It is expected that a first draft of the 
file would be created by automated tools, "wizards" that guide users through the 
answers, and linter tools that help users to check the YAML file schema. The file is 
then put under version control, provided to potential users, and updated as needed. 
The file's contents may then be extracted for a variety of different reasons (e.g., 
extracted into security evaluations, etc.).

This is an early version created by the OpenSSF Identifying Security Threats Working 
Group. See the [OpenSSF Community Calendar](https://calendar.google.com/calendar?cid=czYzdm9lZmhwNWk5cGZsdGI1cTY3bmdwZXNAZ3JvdXAuY2FsZW5kYXIuZ29vZ2xlLmNvbQ).

## SECURITY-INSIGHTS.yml

> *"How much can tools trust this file?"*

That is an issue in the end decided by the tools that read this data.

The minimum viable product (MVP) should provide the following information: 

- Procedure to report a vulnerability (security contact, Vulnerability Disclosure Policy (VDP));
- Owners contacts.

This format records assertions made by a project itself. These assertions may be 
obsolete or even maliciously false. Still, it provides additional information that 
otherwise would not be automatically accessible. Humans and tools that evaluate 
projects may want to report results both including and not including self-assertions, 
or assertions unverified by a trusted third party.
 
## User stories

**SECURITY-INSIGHTS.yml** would like to solve the following user stories by helping 
the maintainers to improve the security of their projects and the final users (e.g. 
developers, companies, automated scanners, etc) to better evaluate the security of 
third-party software.

| AS A/AN | I WANT TO | SO THAT |
|---|---|---|
| developer of an automated tool | have a standard machine-readable file containing security information about the project | I can scan it to reduce false-positive results |
| security researcher | report a potential vulnerability | the project's maintainers may be aware of it |
| user | know which tools are used to lint or scan the code, and which are the security processes in place | I can evaluate the security best practices followed by the project |
| maintainer | know which free tools (better open-source) I can use to lint or scan the code and the dependencies | I can reduce risks related to supply-chain attacks or human errors |
| user | know what are the trusted sources for this project | I can read, download or install only trusted code |
| user | know project status, release cycle time, security maintenance, and project end of life | I can schedule ordinary and extraordinary maintenance |
| maintainer | receive reports related only to certain types of vulnerabilities | I can work on more urgent features and fixes instead of reading out-of-scope reports |
| user | contact the project maintainers for general questions | I can solve my issues |
| user | read a security policy | I can easily know security practices in place |

## Threat Model

A [STRIDE](https://docs.microsoft.com/it-it/azure/security/develop/threat-modeling-tool-threats) Threat Model 
for SECURITY-INSIGHTS project is available both in [PDF format](docs/SECURITY-INSIGHTS-STRIDE-threat-model.pdf) and 
[JSON format](docs/SECURITY-INSIGHTS-STRIDE-threat-model.json), generated using the [OWASP Threat Dragon](https://github.com/OWASP/threat-dragon) tool.

![Threat Model](docs/SECURITY-INSIGHTS-STRIDE-threat-model.png)

### Supply-chain

**Description:** Attackers can obtain the control of a third-party sources (e.g. website 
domain, server, etc) linked in the `SECURITY-INSIGHTS.yml`.

**Mitigation:** Maintainers could self-host the evidence to reduce risks.

### False information in the SECURITY-INSIGHTS.yml

**Description:** Maintainers could upload false information in the `SECURITY-INSIGHTS.yml` 
just to obtain a high score from the scanners or other services which use SECURITY-
INSIGHTS to evaluate the project.

**Mitigation:** Scanners could introduce some additional checks (e.g. check if URLs 
return 200 OK status) and a weighted score to reduce the risks. In addition, the open-source
community can read the le and report false information (or just information without clear evidence).

### Private information sharing

**Description:** A maintainer shares mistakenly private critical information (e.g. security audit
containing unpatched vulnerabilities).

**Mitigation:** 

### Malicious pull-request

**Description:** A malicious contributor could introduce false or malicious information (e.g.
malicious URLs) to obtain a particular advantage.

**Mitigation:** The contributors' PRs to `SECURITY-INSIGHTS.yml` should be carefully reviewed and
approved by the maintainers. In addition, the maintainers could decide to not
accept direct contributions to the `SECURITY-INSIGHTS.yml`.

### Missing pull-request review or lacks in the review process

**Description:** Missing PR review or lack in the review process can lead to the tampering of
`SECURITY-INSIGHTS.yml` by adding false information.

**Mitigation:** The PR should be formally reviewed and approved by another maintainer.

