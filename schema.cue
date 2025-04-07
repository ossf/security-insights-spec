//// Definitions ////

import (
  "time"
)

#URL: =~"^https?://[^\\s]+$"
#Email: =~"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
#Date: time.Format("2006-01-02")
#SchemaVersion: =~"^[1-9]+\\.[0-9]+\\.[0-9]+$"

#Assessment: {
  comment:   string
  name?:     string
  evidence?: #URL
  date?:     #Date
}

#Attestation: {
  name:             string
  location:         #URL
  "predicate-uri":  string
  comment?:         string
}

#Contact: {
  name:         string
  primary:      bool
  affiliation?: string
  email?:       #Email
  social?:      string
}

#License: {
  url:        #URL
  expression: string
}

#Link: {
  uri:     string
  comment: string
}

//// Schema ////

header: {
  "last-reviewed":      #Date
  "last-updated":       #Date
  "schema-version":     #SchemaVersion
  url:                  #URL
  comment?:             string
  "project-si-source"?: #URL
}

project?: {
  name:      string
  homepage?: #URL
  roadmap?:  #URL
  funding?:  #URL
  steward?:  #Link

  administrators: [#Contact, ...]

  repositories: [{
    name:    string
    comment: string
    url:     #URL
  }, ...]

  "vulnerability-reporting": {
    "reports-accepted":        bool
    "bug-bounty-available":    bool
    "bug-bounty-program"?:     #URL
    contact?:                  #Contact
    comment?:                  string
    "security-policy"?:        #URL
    "pgp-key"?:                string

    "in-scope"?:               [...string]
    "out-of-scope"?:           [...string]
  }

  documentation?: {
    "detailed-guide"?:         #URL
    "code-of-conduct"?:        #URL
    "quickstart-guide"?:       #URL
    "release-process"?:        #URL
    "support-policy"?:         #URL
    "signature-verification"?: #URL
  }
}

repository?: {  
  status: "active" | "abandoned" | "concept" | "inactive" | "moved" | "suspended" | "unsupported" | "WIP"
  
  url:                                 #URL
  "accepts-change-request":            bool
  "accepts-automated-change-request":  bool
  "bug-fixes-only"?:                   bool
  "no-third-party-packages"?:          bool

  "core-team": [#Contact, ...]

  license: #License

  security: {
    assessments: {
      self: #Assessment
      "third-party"?: [...#Assessment]
    }

    champions?: [...#Contact]

    tools?: [...{
      name:     string
      type: "fuzzing" | "container" | "secret" | "SCA" | "SAST" | "other"
      version?: string
      comment?: string

      rulesets: ["default"] | [...string]

      integration: {
        adhoc:   bool
        ci:      bool
        release: bool
      }

      results: {
        adhoc?: #Attestation
        ci?: #Attestation
        release?: #Attestation
      }

    }]
  }

  documentation?: {
    "contributing-guide"?:           #URL
    "dependency-management-policy"?: #URL
    governance?:                     #URL
    "review-policy"?:                #URL
    "security-policy"?:              #URL
  }

  release?: {
    "automated-pipeline": bool

    "distribution-points": [#Link, ...]

    changelog?:    #URL
    license?:      #License

    attestations?: [...#Attestation]
  }
}
