# READEME

**OpenSSF Working Group:** [Identifying Security Threats in Open Source Projects](https://github.com/ossf/wg-identifying-security-threats)

**Official document:** [Project Security Information Specification (SECURITY-INSIGHTS.yml))](https://docs.google.com/document/d/1Hqks2J0wVqS_YFUQeIyjkLneLfo3_9A-pbU-7DZpGwM/edit) - early draft work to capture some security-related machine-processable information within a project.

## Introduction

Security is important, for this reason, many potential users (final users, engineers, developers, or companies) might want to evaluate the security of a particular open-source project. There are many ways to evaluate the security of a project, including evaluating the code itself (statically or dynamically), the processes used, and/or the people involved (e.g., whether or not they know how to develop secure software).

Some information can be determined automatically by tools, but determining information via tools is often imperfect. For example, many would want to know if a project uses an automated test suite, yet because there are so many different kinds of test suites & ways to invoke them, automated tools often fail to correctly identify whether or not automated tests are performed. It can be provided manually, but that must be done for each approach.

This specification provides a mechanism for projects to report information about their security in a machine-processable way. It is formatted as a YAML file to make it easy to read and edit directly by people. It is expected that a first draft of the file would be created by automated tools, “wizards” that guide users through the answers, and linter tools that help users to check the YAML file schema. The file is then put under version control, provided to potential users, and updated as needed. The file’s contents may then be extracted for a variety of different reasons (e.g., extracted into security evaluations, SBOMs, etc.).

This is an early version created by the OpenSSF Identifying Security Threats Working Group. See the [OpenSSF Community Calendar](https://calendar.google.com/calendar?cid=czYzdm9lZmhwNWk5cGZsdGI1cTY3bmdwZXNAZ3JvdXAuY2FsZW5kYXIuZ29vZ2xlLmNvbQ).

## SECURITY-INSIGHTS.yml

> *"How much can tools trust this file?"*

That is an issue in the end decided by the tools that read this data.

The minimum viable product (MVP) should provide the following information: 

- Procedure to report a vulnerability (security contact, Vulnerability Disclosure Policy (VDP));
- Owners contacts.

This format records assertions made by a project itself. These assertions may be obsolete or even maliciously false. Still, it provides additional information that otherwise would not be automatically accessible. Humans and tools that evaluate projects may want to report results both including and not including self-assertions, or assertions unverified by a trusted third party. We recommend that each answer includes a “justification” text in Markdown format that provides rationales for why this is met, preferably ones that include URLs that point to the pieces of evidence (the evidence could be from the first project or third-party results).


