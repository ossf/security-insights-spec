header: {
	"schema-version": string
	"last-updated":   string
	"last-reviewed":  string
	"repo-url":       =~"^https?://[^\\s]+$"
	"repo-status":    string
}
project: {
	name:            string
	roadmap?:        =~"^https?://[^\\s]+$"
	"homepage-url":  =~"^https?://[^\\s]+$"
	administrators:
	[...{
		name:     string
		employer: string
		contact:  =~"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
	}]
	documentation?: {
		"user-guide"?:              =~"^https?://[^\\s]+$"
		"code-of-conduct"?:         =~"^https?://[^\\s]+$"
		"release-process"?:         =~"^https?://[^\\s]+$"
		"provenance-verification"?: =~"^https?://[^\\s]+$"
		governance?:                =~"^https?://[^\\s]+$"
	}
	release?: {
		"automated-pipeline": bool
		"distribution-points": [ ...string ]
		latest: {
			CPE:       string // example: cpe:2.3:a:foo:bar:1.2.0
			url:       =~"^https?://[^\\s]+$"
			name:      string
			date:      string
			changelog?: =~"^https?://[^\\s]+$"
			license?: {
				url:        =~"^https?://[^\\s]+$"
				expression: string
			}
			sbom?: [...{
				url:    =~"^https?://[^\\s]+$"
				format: string
			}]
			provenance?: {
				cryptography?: {
					attestation: =~"^https?://[^\\s]+$"
					algorithm:   string
				}
				"vex-data"?:      =~"^https?://[^\\s]+$"
				"hash-manifest"?: =~"^https?://[^\\s]+$"
			}
		}
	}
	subprojects?: [...{
		name:    string
		url:     =~"^https?://[^\\s]+$"
		comment: string
	}]
	"vulnerability-reporting":
	{
		accepted:               bool
		"bug-bounty-available"?: bool
		"bug-bounty-url"?:       =~"^https?://[^\\s]+$"
		"email-contact"?:        =~"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
		"security-policy"?:      =~"^https?://[^\\s]+$"
		"in-scope"?:             [ ...string ]
		"out-scope"?:            [ ...string ]
		"pgp-key"?:              string
		comment?:                string
	}
	security:
	{
		artifacts:
		{
			"self-assessment":
			{
				"evidence-url"?: =~"^https?://[^\\s]+$"
				comment: string
			}
			"third-party-assessments"?: [...{
				name:           string
				"evidence-url": =~"^https?://[^\\s]+$"
				date:           string
				comment?: string
			}]
		}
		contacts?: [...{
			type:    string
			value:   string
			primary: bool
		}]
		testing?: [...{
			"tool-type":    string
			"tool-name":    string
			"tool-version": string
			"tool-url":     =~"^https?://[^\\s]+$"
			"tool-rulesets": [ ...string ]
			integration: {
				"ad-hoc":         bool
				ci:               bool
				"before-release": bool
			}
			comment?: string
		}]
	}
}
repository: {
	"bug-fixes-only":                   bool
	"accepts-change-request":           bool 
	"accepts-automated-change-request": bool 
	"automated-tools"?: [...{
		"automated-tool": string
		action:           string
		path: [ ...string ]
		comment?: string
	}]
	"core-team": [...{
		name:    string
		contact: string
	}]
	documentation?: {
		"contributing-guide"?: =~"^https?://[^\\s]+$"
		"review-policy"?:      =~"^https?://[^\\s]+$"
		"security-policy"?:    =~"^https?://[^\\s]+$"
	}
	license:
	{
		url:       =~"^https?://[^\\s]+$"
		expresion: string                
	}
	security?:
	{
		artifacts:
		{
			"self-assessment":
			{
				"evidence-url"?: =~"^https?://[^\\s]+$"
				comment: string
			}
			"third-party-assessments": [...{
				name:           string
				"evidence-url"?: =~"^https?://[^\\s]+$"
				date:           string
				comment: string
			}]
		}
		champions?: [...{
			name:    string
			contact?: string
		}]
		testing: [...{
			"tool-type":    string
			"tool-name":    string
			"tool-version": string
			"tool-url":     string
			"tool-rulesets": [ ...string ]
			integration: {
				"ad-hoc":         bool
				ci:               bool
				"before-release": bool
			}
			comment: string
		}]
	}
	"supply-chain"?: {
		"third-party-packages": bool
		lists: [ ...string ]
		"management-policy": {
			url: string
			comment: string
		}
	}
}
