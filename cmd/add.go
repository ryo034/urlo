package cmd

import (
	"fmt"
	"github.com/fatih/color"
	"urlo/util"

	"github.com/spf13/cobra"
)

var addCmd = &cobra.Command{
	Use:   "add",
	Short: "Add a URL to the csv",
	Long:  "Add a URL to the csv",
	Args:  cobra.ExactArgs(2),
	Run: func(cmd *cobra.Command, args []string) {
		title := args[0]
		if title == "" {
			color.Red("Error: Title is empty\n")
			return
		}
		url := args[1]
		if url == "" {
			color.Red("Error: URL is empty\n")
			return
		}

		records, err := util.GetRecordsFromOpenCscFile()
		if err != nil {
			return
		}

		if records.IsAlreadyExist(title) {
			color.Red("Error: Already exist %s\n", title)
			return
		}

		res, err := util.ConvertToUrlMaps([][]string{{title, url}})
		if err != nil {
			return
		}

		addTarget := res[0]

		err = util.WriteValuesToFile(records.Add(addTarget))
		if err != nil {
			fmt.Println(err)
			return
		}
		color.Green("Add successfully %s - %s\n", addTarget.Title, addTarget.URL.String())
	},
}

func init() {
	addCmd.Flags().StringP("url", "u", "", "URL to add")
	addCmd.Flags().StringP("title", "t", "", "Title to add")
	rootCmd.AddCommand(addCmd)
}
