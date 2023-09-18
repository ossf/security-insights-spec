package cmd

import (
	"fmt"
	"text/tabwriter"

	"github.com/spf13/cobra"
	"github.com/spf13/viper"
)

var (
	writer *tabwriter.Writer // enables bare line writing (for use in list & version)

	// versionCmd represents the version command
	versionCmd = &cobra.Command{
		Use:   "version",
		Short: "Display version details.",
		Long:  ``, // TODO
		Run: func(cmd *cobra.Command, args []string) {
			if viper.GetBool("verbose") {
				fmt.Fprintln(writer, fmt.Sprintf("Version:\t%s", buildVersion))
				fmt.Fprintln(writer, fmt.Sprintf("Commit:\t%s", buildGitCommitHash))
				fmt.Fprintln(writer, fmt.Sprintf("Build Time:\t%s", buildTime))
				writer.Flush()
			} else {
				fmt.Println(buildVersion)
			}
		},
	}
)

func init() {
	rootCmd.AddCommand(versionCmd)
}
