// Security Insights Version 1.0.0 YAML Schema
//
// YAML schema for security-insights.yml
package security_insights_spec

import (
	"time"
	"net"
	"list"
)

#v1: {
	@jsonschema(schema="http://json-schema.org/draft-07/schema#")

	close({
		header!: close({
			// Version of the SECURITY-INSIGHTS YAML Schema.
			"schema-version"!: "1.0.0"

			// Expiration date for the SECURITY-INSIGHTS.yml. At most a year
			// later the `last-reviewed` date.
			"expiration-date"!: time.Time

			// Last time the SECURITY-INSIGHTS.yml was updated, excluding the
			// properties `commit-hash` and `last-reviewed`.
			"last-updated"?: time.Format("2006-01-02")

			// Last time the SECURITY-INSIGHTS.yml was reviewed. Updating this
			// property requires updating the property `commit-hash`.
			"last-reviewed"?: time.Format("2006-01-02")

			// The last commit to which the SECURITY-INSIGHTS.yml refers.
			"commit-hash"?: =~"^\\b[0-9a-f]{5,40}\\b$"

			// Link to the open-source project.
			"project-url"!: net.AbsURL & =~"^https?:\\/\\/"

			// Release version to which the SECURITY-INSIGHTS.yml refers.
			"project-release"?: string

			// Link to the project changelog.
			changelog?: net.AbsURL & =~"^https?:\\/\\/"

			// Link to the project license.
			license?: net.AbsURL & =~"^https?:\\/\\/"
		})
		"project-lifecycle"!: matchIf({
			status?: "active"
			...
		}, {
			"core-maintainers"!: _
			...
		}, matchIf({
			"bug-fixes-only"?: true
			...
		}, {
			"core-maintainers"!: _
			...
		}, _) & {
			...
		}) & close({
			// Maintainers fix bugs without implementing new features. The
			// project is in Maintenance Mode.
			"bug-fixes-only"!: bool

			// Maintainers contacts (e-mail, Twitter, etc).
			"core-maintainers"?: list.UniqueItems() & [...string]

			// Link to the project roadmap.
			roadmap?: net.AbsURL & =~"^https?:\\/\\/"

			// Link to the project release cycle.
			"release-cycle"?: net.AbsURL & =~"^https?:\\/\\/"

			// Shortly describe the release process. Maximum length 560 chars.
			"release-process"?: =~"^(.|\\n){1,560}$"

			// Define if the project is still active or not.
			status!: "active" | "inactive" | "concept" | "wip" | "suspended" | "abandoned" | "unsupported" | "moved"
		})
		"contribution-policy"!: close({
			// Define if the maintainers accept pull-requests or not from
			// external contributors.
			"accepts-pull-requests"!: bool

			// Define if the maintainers accept pull-requests generated by
			// bots or automated tools.
			"accepts-automated-pull-requests"!: bool

			// List of allowed and denied bots. This property can overwrite
			// `accepts-automated-pull-requests`.
			"automated-tools-list"?: list.UniqueItems() & [...close({
				// Automated tool or bot name.
				"automated-tool"!: string

				// Define if automated actions are allowed or denied.
				action!: "allowed" | "denied"

				// Define sub-paths where the automated actions are allowed or
				// denied.
				path?: list.UniqueItems() & [...string]

				// Short comment.
				comment?: =~"^(.|\\n){1,560}$"
			})]

			// Link to the contributing policy.
			"contributing-policy"?: net.AbsURL & =~"^https?:\\/\\/"

			// Link to the project code of conduct.
			"code-of-conduct"?: net.AbsURL & =~"^https?:\\/\\/"
		})
		documentation?: list.UniqueItems() & [...net.AbsURL & =~"^https?:\\/\\/"]
		"distribution-points"!: list.UniqueItems() & [...string]
		"security-artifacts"?: close({
			"threat-model"?: matchIf({
				"threat-model-created"?: true
				...
			}, {
				"evidence-url"!: _
				...
			}, _) & close({
				// Define if the threat model for the project has been created.
				"threat-model-created"!: bool
				"evidence-url"?: list.UniqueItems() & [...net.AbsURL & =~"^https?:\\/\\/"]

				// Additional comment to describe the threat models, giving more
				// context. Maximum length 560 chars.
				comment?: =~"^(.|\\n){1,560}$"
			})
			"self-assessment"?: matchIf({
				"self-assessment-created"?: true
				...
			}, {
				"evidence-url"!: _
				...
			}, _) & close({
				// Define whether a security self assessment for the project has
				// been created. A false value may be used to add comments
				// regarding the status of the assessment.
				"self-assessment-created"!: bool
				"evidence-url"?: list.UniqueItems() & [...net.AbsURL & =~"^https?:\\/\\/"]

				// Additional context regarding the security self assessment or
				// its status. Maximum length 560 chars.
				comment?: =~"^(.|\\n){1,560}$"
			})
			"other-artifacts"?: matchIf([...], [...], _) & [...]
		})
		"security-testing"?: [...close({
			integration!: close({
				// Define if the test is an ad-hoc security test.
				"ad-hoc"!: bool

				// Define if the security test runs before the release.
				"before-release"!: bool

				// Define if the security test is part of the CI.
				ci!: bool
			})

			// Name of the tool used to scan or analyze the project.
			"tool-name"!: string
			"tool-rulesets"?: list.UniqueItems() & [...string]

			// Type of security test: `sast`, `dast`, `iast`, `fuzzer` or
			// `sca`.
			"tool-type"!: "sast" | "dast" | "iast" | "fuzzer" | "sca"

			// Link to the security test.
			"tool-url"?: net.AbsURL & =~"^https?:\\/\\/"

			// Version of the used tool.
			"tool-version"!: string

			// Additional comment to describe the used tool, giving more
			// context. Maximum length 560 chars.
			comment?: =~"^(.|\\n){1,560}$"
		})]
		"security-assessments"?: list.UniqueItems() & [...close({
			// Name of the third-party security auditor.
			"auditor-name"!: string

			// Link to the security report provided by the auditor.
			"auditor-report"?: net.AbsURL & =~"^https?:\\/\\/"

			// Link to the auditor website.
			"auditor-url"!: net.AbsURL & =~"^https?:\\/\\/"

			// Year of the report.
			"report-year"!: int

			// Additional comment to describe the report giving more context.
			// Maximum length 560 chars.
			comment?: =~"^(.|\\n){1,560}$"
		})]
		"security-contacts"!: list.UniqueItems() & [...close({
			// Define if the provided contact is the primary one or not.
			primary?: bool

			// Type of contact: `email`, `phone`, or `url`.
			type!: "email" | "phone" | "url"

			// Security contact.
			value!: =~"^[\\w+_.-]+@[\\w.-]+$|https?:\\/\\/|[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\\s\\./0-9]*$"
		})]
		"vulnerability-reporting"!: matchIf({
			"accepts-vulnerability-reports"?: true
			...
		}, {
			"email-contact"!:   _
			"security-policy"!: _
			...
		}, _) & close({
			// Define if the maintainers or security team accept security
			// reports or not.
			"accepts-vulnerability-reports"!: bool

			// Define if a bug bounty program is in-place or not.
			"bug-bounty-available"?: bool

			// Link to the bug bounty program.
			"bug-bounty-url"?: net.AbsURL & =~"^https?:\\/\\/"

			// E-mail contact to report vulnerabilities or other related
			// information.
			"email-contact"?: string

			// Link to the security policy.
			"security-policy"?: net.AbsURL & =~"^https?:\\/\\/"

			// PGP Public Key.
			"pgp-key"?: =~"^(-----BEGIN PGP PUBLIC KEY BLOCK-----).*([a-zA-Z0-9//\\n\\/\\.\\:\\+\\ \\=]+).*(-----END PGP PUBLIC KEY BLOCK-----)$"

			// In-scope vulnerability categories, according to OWASP Top 10
			// 2021. It is recommended to specify a better in-scope list in
			// the security policy.
			"in-scope"?: list.UniqueItems() & [..."broken access control" | "cryptographic failures" | "injection" | "insecure design" | "security misconfiguration" | "vulnerable and outdated components" | "identification and authentication failures" | "software and data integrity failures" | "security logging and monitoring failures" | "ssrf" | "other"]

			// Out-of-scope vulnerability categories, according to OWASP Top
			// 10 2021. It is recommended to specify a better out-of-scope
			// list in the security policy.
			"out-scope"?: list.UniqueItems() & [..."broken access control" | "cryptographic failures" | "injection" | "insecure design" | "security misconfiguration" | "vulnerable and outdated components" | "identification and authentication failures" | "software and data integrity failures" | "security logging and monitoring failures" | "ssrf" | "other"]

			// Additional comment to describe the in-scope list, out-scope
			// list, preferred contact method, or other context. Maximum
			// length 560 chars.
			comment?: =~"^(.|\\n){1,560}$"
		})
		dependencies?: close({
			// Define if the project uses third-party packages.
			"third-party-packages"?: bool
			"dependencies-lists"?: null | bool | number | string | [...net.AbsURL & =~"^https?:\\/\\/"] | {
				...
			}
			sbom?: list.UniqueItems() & [...null | bool | number | string | [...] | close({
				// Link to the SBOM file.
				"sbom-file"?: net.AbsURL & =~"^https?:\\/\\/"

				// Name of the SBOM standard used.
				"sbom-format"?: string

				// Link to the SBOM standard website or documentation.
				"sbom-url"?: net.AbsURL & =~"^https?:\\/\\/"

				// Description of how the SBOM is created. Maximum length 560
				// characters.
				"sbom-creation"?: =~"^(.|\\n){1,560}$"
			})]
			"dependencies-lifecycle"?: close({
				// Link to the dependencies lifecycle policy.
				"policy-url"?: net.AbsURL & =~"^https?:\\/\\/"

				// Summary about the dependencies lifecycle policy, third-party
				// packages updating process, and deprecation process. Maximum
				// length 560 chars.
				comment?: =~"^(.|\\n){1,560}$"
			})
			"env-dependencies-policy"?: close({
				// Link to the enviroment dependencies policy.
				"policy-url"?: net.AbsURL & =~"^https?:\\/\\/"

				// Summary about how third-party dependencies are adopted and
				// consumed in the different environments (dev, test, prod).
				// Maximum length 560 chars.
				comment?: =~"^(.|\\n){1,560}$"
			})
		})
	})
}
