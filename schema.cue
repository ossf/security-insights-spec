package security_insights_spec

import (
  "time"
)
@go("si")

#URL: =~"^https?://[^\\s]+$"
#Email: =~"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
#Date: time.Format("2006-01-02")
#SchemaVersion: =~"^[1-9]+\\.[0-9]+\\.[0-9]+$"

// Assessment represents the results of a security assessment, including comments, evidence, and date.
#Assessment: {

  // Notes or commentary about the findings or purpose of the assessment.
  comment:   string

  // The name or identifier of the assessment artifact.
  name?:     string

  // The URL where the assessment report or artifact is located.
  evidence?: #URL

  // The date the assessment was published.
  date?:     #Date
}

#Attestation: {

  // The name or identifier of the attestation.
  name:             string

  // A web location where the attestation can be found.
  location:         #URL

  // A URI to a resource describing the attestation’s predicate or specification.
  "predicate-uri":  string @go(PredicateURI)

  // Additional context or instructions for using the attestation.
  comment?:         string
}

#Contact: {

  // The contact person's name.
  name:         string

  // Indicates whether this admin is the first point of contact for inquiries. Only one entry should be marked as primary.
  primary:      bool

  // The entity with which the contact is affiliated, such as a school or employer.
  affiliation?: string

  // A preferred email address to reach the contact.
  email?:       #Email

  // A social media handle or profile for the contact.
  social?:      string
}

#License: {
  
  // A web address where the license can be found.
  url:        #URL
  
  // The SPDX license expression for the license.
  expression: string
}

#Link: {
  
  // A link to a resource, not restricted to http/s.
  uri:     string

  // Instructions or information about the link.
  comment: string
}

// The ProjectRepository object describes a repository that is part of a project, including its name, comment, and URL.
#ProjectRepository: {
  // The name or short label of the repository.
  name:     string

  // Explanation of the repository purpose or contents and its relation to the rest of the project.
  comment:  string

  // The URL where the repository is hosted.
  url:      #URL
}

#SecurityInsights: {
  header:  #Header
  project?: #Project
  repository?: #Repository
}

// The Header object captures high-level metadata about the schema.
#Header: {

  // The date when the document or data was last reviewed.
  "last-reviewed":      #Date @go(LastReviewed)
  
  // The date when the document or data was last updated.
  "last-updated":       #Date @go(LastUpdated)
  
  // The version of the Security Insights schema being used.
  "schema-version":     #SchemaVersion @go(SchemaVersion)
  
  // The primary reference URL for this schema’s origin or repository.
  url:                  #URL @go(URL)
  
  // Additional information about the schema.
  comment?:             string
  
  // A URL to the security insights file that contains project information for this file to inherit. The URL provided here should respond to an unauthenticated GET request and return a valid security insights file using a content-type of "text/plain" or "application/yaml". This is useful for projects that are part of a larger organization or ecosystem, where much of the security insights data is shared across multiple projects.
  "project-si-source"?: #URL @go(ProjectSISource)
}

// The Project object describes the overall project, including basic info, documentation links, repositories, vulnerability reporting, and security details.
#Project: {

  // The name of the project.
  name:      string
  
  // A path to the project’s landing page. This may be a project website, a version control system repository, or a project/organization page in the VCS.
  homepage?: #URL
  
  // A URL pointing to a roadmap or schedule for planned features and releases.
  roadmap?:  #URL
  
  // A URL to information about sponsorships, donations, or other funding topics.
  funding?:  #URL
  
  // This field is to communicate the relationship between the project and "a legal person, other than a manufacturer, that has the purpose or objective of systematically providing support on a sustained basis for the development of specific products with digital elements, qualifying as free and open-source software and intended for commercial activities, and that ensures the viability of those products" This definition is drawn from the [European Union Cyber Resilience Act, Article 3](https://eur-lex.europa.eu/eli/reg/2024/2847/oj/eng#art_3).
  steward?:  #Link
  
  // A list of 1 or more individuals who have administrative access to the project's resources.
  administrators: [#Contact, ...] @go(,type=[]Contact)

  // A list of 1 or more repositories that are part of this project, including the repository this file is published in.
  repositories: [#ProjectRepository, ...] @go(,type=[]ProjectRepository)

  // An object describing how security vulnerabilities can be reported and how they are handled by the project.
  "vulnerability-reporting": {

    // Indicates whether this project currently accepts vulnerability reports.
    "reports-accepted":        bool @go(ReportsAccepted)

    // Specifies whether a bug bounty program is offered.
    "bug-bounty-available":    bool @go(BugBountyAvailable)

    // Path to a page providing details about any bug bounty program.
    "bug-bounty-program"?:     #URL @go(BugBountyProgram)

    // Point of contact for reporting vulnerabilities. This may be a single person or a mailgroup.
    contact?:                  #Contact
    
    // Additional comments or instructions about vulnerability reporting.
    comment?:                  string

    // Path to a page containing guidelines for security-related disclosures.
    "security-policy"?:        #URL @go(SecurityPolicy)
    
    // The PGP public key for secure communication.
    "pgp-key"?:                string @go(PGPKey)

    // A list of issues or components that are covered by the vulnerability reporting process.
    "in-scope"?:               [...string] @go(InScope)

    // A list of issues or components not covered by the vulnerability reporting process.
    "out-of-scope"?:           [...string] @go(OutOfScope)
  } @go(VulnerabilityReporting)

  // An object containing references to key documentation URLs.
  documentation?: {
    // URL to more extensive or advanced documentation.
    "detailed-guide"?:         #URL @go(DetailedGuide)

    // URL to the document outlining contributor and user conduct guidelines.
    "code-of-conduct"?:        #URL @go(CodeOfConduct)

    // URL to a concise guide to basic functionality for new users.
    "quickstart-guide"?:       #URL @go(QuickstartGuide)

    // URL describing how releases are planned, prepared, and published.
    "release-process"?:        #URL @go(ReleaseProcess)

    // URL to documentation describing how releases are supported. See [Recommendations for publishing End-of-life dates and support timelines](https://endoflife.date/recommendations) for best practices.
    "support-policy"?:         #URL @go(SupportPolicy)

    // URL to documentation explaining how to verify digital signatures on assets.
    "signature-verification"?: #URL @go(SignatureVerification)
  }
}

// The Repository object specifies repository-related configurations, including status, policies, team members, documentation, license, releases, and security posture.
#Repository: {

  // Indicates the repository’s current [Repo Status](https://repostatus.org).
  status: "active" | "abandoned" | "concept" | "inactive" | "moved" | "suspended" | "unsupported" | "WIP"
  
  // The main URL for this repository.
  url:                                 #URL

  // Indicates whether the repository currently accepts any change requests.
  "accepts-change-request":            bool @go(AcceptsChangeRequest)

  // Indicates whether the repository accepts automated or machine-generated change requests.
  "accepts-automated-change-request":  bool @go(AcceptsAutomatedChangeRequest)

  // Specifies whether the repository only accepts bug-fixes and not feature work.
  "bug-fixes-only"?:                   bool @go(BugFixesOnly)

  // Indicates whether the repository universally avoids package dependencies from outside of the project.
  "no-third-party-packages"?:          bool @go(NoThirdPartyPackages)

  // A list of 1 or more core team members for this repository, such as maintainers or approvers.
  "core-team": [#Contact, ...] @go(CoreTeam,type=[]Contact)

  // The license information for this repository.
  license: #License

  // An object describing security-related artifacts, champions, and tooling for the repository.
  security: {

    // An object describing security assessments for the repository.
    assessments: {
      // Results of the contributor team's assessment of software produced by this repository.
      self: #Assessment

      // Results of third-party assessments of software produced by this repository.
      "third-party"?: [...#Assessment] @go(ThirdPartyAssessment)
    }

    // A list of core team members who advocate for continuous improvement of security practices. These individuals may take responsibility for security reviews, training, interfacing with stakeholders on security topics, or other similar activities.
    champions?: [...#Contact]

    // A list of objects describing security-related tools used in the repository.
    tools?: [...{

      // The name of the tool.
      name:     string

      // The general category or type of the tool.
      type: "fuzzing" | "container" | "secret" | "SCA" | "SAST" | "other"

      // The version of the tool that is used.
      version?: string

      // Additional notes about the tool’s usage or configuration.
      comment?: string

      // The set of rules or configurations applied by the tool. If customization is not enabled, the only value here should be "default".
      rulesets: ["default"] | [...string] @go(,type=[]string)

      // An object describing how the tool is integrated with the project.
      integration: {

        // Indicates whether the tool is used in a scheduled process or supports an on-demand.
        adhoc:   bool

        // Indicates whether the tool is used in the continuous integration process.
        ci:      bool

        // Indicates whether the tool is run before or during the release process.
        release: bool
      }

      results: {
        
        // Results of scheduled or on-demand security scans.
        adhoc?: #Attestation
        
        // Results of security scans run in the continuous integration process.
        ci?: #Attestation
        
        // Results of security scans run in the build and release process.
        release?: #Attestation
      }

    }]
  }

  // Documentation links for the repository, including links to contributing guides, dependency management policies, governance documents, and review policies.
  documentation?: {
    // URL to a document outlining the process for contributing to the repository.
    "contributing-guide"?:           #URL @go(ContributingGuide)
    // URL to a document outlining the process for managing dependencies in the repository.
    "dependency-management-policy"?: #URL @go(DependencyManagementPolicy)
    // URL to any governance documents regarding roles, responsibilities, processes, and decision-making.
    governance?:                     #URL
    // URL to a document outlining the process for reviewing changes to the repository.
    "review-policy"?:                #URL @go(ReviewPolicy)
    // URL with information about the repository's security, including the policy for reporting security vulnerabilities.
    "security-policy"?:              #URL @go(SecurityPolicy)
  }

  // Release describes the release process for the repository.
  release?: {
    // Indicates if the repository uses an automated release pipeline.
    "automated-pipeline": bool @go(AutomatedPipeline)
    // A list of 1 or more links describing where the repository’s releases are distributed. This may be the VCS releases page, a package manager, or other distribution points.
    "distribution-points": [#Link, ...] @go(DistributionPoints,type=[]Link)
    // A URL to the repository’s release changelog. The URL value should include placeholders such as `{version}` if relevant.
    changelog?:    #URL
    // Describes the license details specifically for releases. This should be used when the release license differs from the repository license.
    license?:      #License
    // List of attestations for the repository’s releases.
    attestations?: [...#Attestation]
  }
}
