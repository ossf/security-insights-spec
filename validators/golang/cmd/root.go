package cmd

import (
	"fmt"
	"os"

	"github.com/spf13/cobra"
	"github.com/spf13/viper"
)

var (
	buildVersion       string
	buildGitCommitHash string
	buildTime          string

	// rootCmd represents the base command when called without any subcommands
	rootCmd = &cobra.Command{
		Use:   "si-validator",
		Short: "This simple CLI tool will validate the contents of a SECURITY-INSIGHTS.yml file.",
		Run: func(thisCmd *cobra.Command, args []string) {
			// print the input file value to stdout
			fmt.Println("Input File:", viper.GetString("input"))

			// initialize the schema object
			schema := SecurityInsightsSchema{}
			err := schema.Validate()
			if err != nil {
				fmt.Println(err)
			}
		},
	}
)

// Execute adds all child commands to the root command and sets flags appropriately.
// This is called by main.main(). It only needs to happen once to the rootCmd.
func Execute(version, commitHash, builtAt string) {
	buildVersion = version
	buildGitCommitHash = commitHash
	buildTime = builtAt

	err := rootCmd.Execute()
	if err != nil {
		os.Exit(1)
	}
}

func init() {
	// set input file flag
	rootCmd.PersistentFlags().StringP("input", "i", "SECURITY-INSIGHTS.yml", "Input File, JSON or YAML")
	viper.BindPFlag("input", rootCmd.PersistentFlags().Lookup("input"))
}
