package cmd

import (
	"fmt"
)

// Security Insights Schema

// header:
//   schema-version: 1.0.0
//   parent-security-yaml: https://blah.com/ossf-security.yaml
//   expiration-date: 2023-08-31T10:10:09.000Z
//   last-updated: 2021-09-01
//   last-reviewed: 2022-09-01
//   commit-hash: 4dbf78ebc006ee5f668c0a74876ef8d6db9485be
//   project-url: https://github.com/foo/bar
//   project-release: 1.2.0
//   changelog: https://github.com/foo/changelog.md
//   license: https://git.foo/license
// project-lifecycle:
//   stage: active
//   roadmap: https://foo.bar/roadmap.html
//   bug-fixes-only: false
//   core-maintainers:
//   - https://github.com/scovetta
//   - joe.bob@email.com
// contribution-policy:
//   accepts-pull-requests: true
//   accepts-automated-pull-requests: true
//   automated-tools-list:
//   - automated-tool: example/security-research
//     action: denied
//     path:
//     - main/foo/bar
//     - main/examples
//     comment: |
//       Lorem ipsum dolor sit amet, consectetur adipisci elit,
//       sed do eiusmod tempor incidunt ut labore et dolore magna aliqua.
//       Ut enim ad minim veniam, quis nostrum exercitationem ullamco laboriosam,
//       nisi ut aliquid ex ea commodi consequatur. Duis aute irure reprehenderit
//       in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur
//       sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt
//       mollit anim id est laborum
//   contributing-policy: https://example.com/development-policy.html
//   code-of-conduct: https://example.com/code-of-conduct.html
// documentation:
// - http://foo.bar/wiki
// distribution-points:
// - https://example.com/foo
// - pkg:npm/foobar
// security-artifacts:
//   threat-model:
//     threat-model-created: true
//     evidence-url:
//     - https://foo.com/model.html
//     comment: |
//       Lorem ipsum dolor sit amet, consectetur adipisci elit,
//       sed do eiusmod tempor incidunt ut labore et dolore magna aliqua.
//       Ut enim ad minim veniam, quis nostrum exercitationem ullamco laboriosam,
//       nisi ut aliquid ex ea commodi consequatur. Duis aute irure reprehenderit
//       in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur
//       sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt
//       mollit anim id est laborum
// security-testing:
// - tool-type: sast
//   tool-name: CodeQL
//   tool-version: 1.2.3
//   tool-url: https://codeql.com
//   tool-rulesets:
//   - built-in
//   integration:
//     ad-hoc: false
//     ci: true
//     before-release: true
//   comment: |
//     Lorem ipsum dolor sit amet, consectetur adipisci elit,
//     sed do eiusmod tempor incidunt ut labore et dolore magna aliqua.
//     Ut enim ad minim veniam, quis nostrum exercitationem ullamco laboriosam,
//     nisi ut aliquid ex ea commodi consequatur. Duis aute irure reprehenderit
//     in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur
//     sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt
//     mollit anim id est laborum
// security-assessments:
// - auditor-name: third-party auditor
//   auditor-url: https://auditor.foo.bar.com
//   auditor-report: https://foo.bar/report.pdf
//   report-year: 2021
//   comment: |
//     Lorem ipsum dolor sit amet, consectetur adipisci elit,
//     sed do eiusmod tempor incidunt ut labore et dolore magna aliqua.
//     Ut enim ad minim veniam, quis nostrum exercitationem ullamco laboriosam,
//     nisi ut aliquid ex ea commodi consequatur. Duis aute irure reprehenderit
//     in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur
//     sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt
//     mollit anim id est laborum
// security-contacts:
// - type: email
//   value: joe.bob@email.com
//   primary: true
// - type: email
//   value: alice.bob@email.com
//   primary: false
// vulnerability-reporting:
//   accepts-vulnerability-reports: true
//   email-contact: security@something.com
//   security-policy: https://foo.bar/reporting.html
//   bug-bounty-available: true
//   bug-bounty-url: https://foo.bar/bugs.html
//   in-scope:
//   - broken access control
//   - other
//   in-scope-comment: |
//     Read the security policy.
//   out-scope:
//   - other
//   out-scope-comment: |
//     Read the security policy.
// dependencies:
//   third-party-packages: true
//   dependencies-lists:
//   - https://github.com/foo/packages.json
//   sbom:
//   - sbom-file: https://foo.bar/sbom
//     sbom-name: CycloneDX
//     sbom-url: https://foo.bar

var NewFileName string

// ReformatError prefixes the error string ready for logging and/or output
func reformatError(prefix string, err error) error {
	return fmt.Errorf(fmt.Sprintf("--- %s ---\n%s", prefix, err.Error()))
}

// Struct for the Security Insights Schema
type SecurityInsightsSchema struct {
	Header                 Header                 `yaml:"header"`
	ProjectLifecycle       ProjectLifecycle       `yaml:"project-lifecycle"`
	ContributionPolicy     ContributionPolicy     `yaml:"contribution-policy"`
	Documentation          []string               `yaml:"documentation"`
	DistributionPoints     []string               `yaml:"distribution-points"`
	SecurityArtifacts      SecurityArtifacts      `yaml:"security-artifacts"`
	SecurityTesting        []SecurityTesting      `yaml:"security-testing"`
	SecurityAssessments    []SecurityAssessments  `yaml:"security-assessments"`
	SecurityContacts       []SecurityContacts     `yaml:"security-contacts"`
	VulnerabilityReporting VulnerabilityReporting `yaml:"vulnerability-reporting"`
	Dependencies           Dependencies           `yaml:"dependencies"`
}

// Header is a top level entry in the Security Insights Schema
type Header struct {
	SchemaVersion      string `yaml:"schema-version"`
	ParentSecurityYaml string `yaml:"parent-security-yaml"`
	ExpirationDate     string `yaml:"expiration-date"`
	LastUpdated        string `yaml:"last-updated"`
	LastReviewed       string `yaml:"last-reviewed"`
	CommitHash         string `yaml:"commit-hash"`
	ProjectUrl         string `yaml:"project-url"`
	ProjectRelease     string `yaml:"project-release"`
	Changelog          string `yaml:"changelog"`
	License            string `yaml:"license"`
}

// ProjectLifecycle is a top level entry in the Security Insights Schema
type ProjectLifecycle struct {
	Stage           string   `yaml:"stage"`
	Roadmap         string   `yaml:"roadmap"`
	BugFixesOnly    bool     `yaml:"bug-fixes-only"`
	CoreMaintainers []string `yaml:"core-maintainers"`
}

// ContributionPolicy is a top level entry in the Security Insights Schema
type ContributionPolicy struct {
	AcceptsPullRequests          bool                 `yaml:"accepts-pull-requests"`
	AcceptsAutomatedPullRequests bool                 `yaml:"accepts-automated-pull-requests"`
	AutomatedToolsList           []AutomatedToolsList `yaml:"automated-tools-list"`
	ContributingPolicy           string               `yaml:"contributing-policy"`
	CodeOfConduct                string               `yaml:"code-of-conduct"`
}

// AutomatedToolsList is a sub-entry in the ContributionPolicy section of the Security Insights Schema
type AutomatedToolsList struct {
	AutomatedTool string   `yaml:"automated-tool"`
	Action        string   `yaml:"action"`
	Path          []string `yaml:"path"`
	Comment       string   `yaml:"comment"`
}

// SecurityArtifacts is a top level entry in the Security Insights Schema
type SecurityArtifacts struct {
	ThreatModel ThreatModel `yaml:"threat-model"`
}

// ThreatModel is a sub-entry in the SecurityArtifacts section of the Security Insights Schema
type ThreatModel struct {
	ThreatModelCreated bool     `yaml:"threat-model-created"`
	EvidenceUrl        []string `yaml:"evidence-url"`
	Comment            string   `yaml:"comment"`
}

// SecurityTesting is a top level entry in the Security Insights Schema
type SecurityTesting struct {
	ToolType     string      `yaml:"tool-type"`
	ToolName     string      `yaml:"tool-name"`
	ToolVersion  string      `yaml:"tool-version"`
	ToolUrl      string      `yaml:"tool-url"`
	ToolRulesets []string    `yaml:"tool-rulesets"`
	Integration  Integration `yaml:"integration"`
	Comment      string      `yaml:"comment"`
}

// Integration is a sub-entry in the SecurityTesting section of the Security Insights Schema
type Integration struct {
	AdHoc         bool `yaml:"ad-hoc"`
	Ci            bool `yaml:"ci"`
	BeforeRelease bool `yaml:"before-release"`
}

// SecurityAssessments is a top level entry in the Security Insights Schema
type SecurityAssessments struct {
	AuditorName   string `yaml:"auditor-name"`
	AuditorUrl    string `yaml:"auditor-url"`
	AuditorReport string `yaml:"auditor-report"`
	ReportYear    int    `yaml:"report-year"`
	Comment       string `yaml:"comment"`
}

// SecurityContacts is a top level entry in the Security Insights Schema
type SecurityContacts struct {
	Type    string `yaml:"type"`
	Value   string `yaml:"value"`
	Primary bool   `yaml:"primary"`
}

// VulnerabilityReporting is a top level entry in the Security Insights Schema
type VulnerabilityReporting struct {
	AcceptsVulnerabilityReports bool     `yaml:"accepts-vulnerability-reports"`
	EmailContact                string   `yaml:"email-contact"`
	SecurityPolicy              string   `yaml:"security-policy"`
	BugBountyAvailable          bool     `yaml:"bug-bounty-available"`
	BugBountyUrl                string   `yaml:"bug-bounty-url"`
	InScope                     []string `yaml:"in-scope"`
	InScopeComment              string   `yaml:"in-scope-comment"`
	OutScope                    []string `yaml:"out-scope"`
	OutScopeComment             string   `yaml:"out-scope-comment"`
}

// Dependencies is a top level entry in the Security Insights Schema
type Dependencies struct {
	ThirdPartyPackages bool     `yaml:"third-party-packages"`
	DependenciesLists  []string `yaml:"dependencies-lists"`
	Sbom               []Sbom   `yaml:"sbom"`
}

// Sbom is a sub-entry in the Dependencies section of the Security Insights Schema
type Sbom struct {
	SbomFile string `yaml:"sbom-file"`
	SbomName string `yaml:"sbom-name"`
	SbomUrl  string `yaml:"sbom-url"`
}
