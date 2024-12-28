//// Definitions ////

#URL: =~"^https?://[^\\s]+$"
#Email: =~"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"

#Assessment: {
  evidence?: #URL
  date?:     string
  comment:   string
}

#Attestation: {
  name:            string
  "predicate-uri": #URL
  location:        #URL
  comment:         string
}

#Contact: {
  name:         string
  affiliation?: string
  email?:       #Email
  social?:      string
  primary:      bool
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
  "last-updated":      string
  "last-reviewed":     string
  "schema-version":    string
  url:                 #URL
  comment?:            string
  "parent-si-source"?: #URL
}

project?: {
  name:      string
  homepage:  #URL
  funding:   #URL
  roadmap:   #URL

  administrators: [...#Contact]

  repositories: [...{
    name:    string
    url:     #URL
    comment: string
  }]

  "vulnerability-reporting": {
    "reports-accepted":       bool
    "bug-bounty-available":   bool
    "bug-bounty-program"?:     #URL
    "security-policy"?:        #URL
    "pgp-key"?:                string
    contact:                  #Contact
    comment?:                  string

    "in-scope"?:               [...string]
    "out-of-scope"?:           [...string]
  }

  documentation?: {
    "quickstart-guide"?:       #URL
    "detailed-guide"?:        #URL
    "code-of-conduct"?:       #URL
    "release-process"?:       #URL
    "signature-verification"?: #URL
  }
}

repository?: {
  "accepts-change-request":           bool
  "accepts-automated-change-request": bool
  "bug-fixes-only":                   bool
  "no-third-party-packages":          bool
  status:                             string
  url:                                #URL

  license:                            #License

  "core-team": [...#Contact]

  documentation?: {
    "contributing-guide"?:           #URL
    "dependency-management-policy"?: #URL
    governance?:                     #URL
    "review-policy"?:                #URL
    "security-policy"?:              #URL
  }

  release?: {
    "automated-pipeline": bool

    "distribution-points": [...#Link]

    changelog?:            #URL
    
    license?: #License

    attestations?: [...#Attestation]
  }

  security: {
    assessments: {
      self: #Assessment
      "third-party": [...#Assessment]
    }

    champions?: [...#Contact]

    tools?: [...{
      name: string
      type:    string
      version?: string
      comment?: string

      rulesets: [...string]

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
}
