package main

import (
	"fmt"

	"github.com/eddie-knight/security-insights-validator/cmd"
)

var (
	// Version is to be replaced at build time by the associated tag
	Version = "0.0.0"
	// VersionPostfix is a marker for the version such as "dev", "beta", "rc", etc.
	VersionPostfix = "dev"
	// GitCommitHash is the commit at build time
	GitCommitHash = ""
	// BuiltAt is the actual build datetime
	BuiltAt = ""
)

func main() {
	if VersionPostfix != "" {
		Version = fmt.Sprintf("%s-%s", Version, VersionPostfix)
	}
	cmd.Execute(Version, GitCommitHash, BuiltAt)
}
