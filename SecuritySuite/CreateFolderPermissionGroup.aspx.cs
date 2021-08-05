using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Management.Automation;
using System.Management.Automation.Runspaces;
using System.Text;
using System.IO;
using System.Web.SessionState;
using System.Threading;
using System.Security.Principal;



namespace ExecutionCreateFolderPermissionGroup
{
    public partial class Default : System.Web.UI.Page
    {

    
        protected void ExecuteCreateWFPermissionGroups_Click(object sender, EventArgs e)
        {

            string userName = System.Environment.UserName;
            Result.Text = string.Empty;

            if (string.IsNullOrWhiteSpace(Input.Text))
            {
                Result.Text = string.Empty;
            }

            else
            {
          
                // Initialize PowerShell engine
                var shell = PowerShell.Create();

                // Add the script to the PowerShell object
             
                shell.Commands.AddScript("C:\\Scripts\\Powershell\\ALICECreateFolderPermissionGroups.ps1 -path " + Input.Text + " -type WF -username " + userName);

                // Execute the script
                var results = shell.Invoke();
     
                // display results, with BaseObject converted to string
                // Note : use |out-string for console-like output
                if (results.Count > 0)
                {
                    // We use a string builder ton create our result text
                    var builder = new StringBuilder();

                    foreach (var psObject in results)
                    {
                        // Convert the Base Object to a string and append it to the string builder.
                        // Add \r\n for line breaks
                        builder.Append(psObject.BaseObject.ToString() + "\r\n");
                    }

                    // Encode the string in HTML (prevent security issue with 'dangerous' characters like < >
                    string[] AllInputs = builder.ToString().Split(new string[] { Environment.NewLine }, StringSplitOptions.None);
                    foreach (var item in AllInputs)
                    {
                        Result.Text += item;
                        Result.Text += "<br/>";
                    }
                  
                }
            }       
        }


        protected void ExecuteCreateWOPermissionGroups_Click(object sender, EventArgs e)
        {

            string userName = System.Environment.UserName;
            Result.Text = string.Empty;

            if (string.IsNullOrWhiteSpace(Input.Text))
            {
                Result.Text = string.Empty;
            }

            else
            {

                // Initialize PowerShell engine
                var shell = PowerShell.Create();

                // Add the script to the PowerShell object

                shell.Commands.AddScript("C:\\Scripts\\Powershell\\ALICECreateFolderPermissionGroups.ps1 -path " + Input.Text + " -type WO -username " + userName);

                // Execute the script
                var results = shell.Invoke();

                // display results, with BaseObject converted to string
                // Note : use |out-string for console-like output
                if (results.Count > 0)
                {
                    // We use a string builder ton create our result text
                    var builder = new StringBuilder();

                    foreach (var psObject in results)
                    {
                        // Convert the Base Object to a string and append it to the string builder.
                        // Add \r\n for line breaks
                        builder.Append(psObject.BaseObject.ToString() + "\r\n");
                    }

                    // Encode the string in HTML (prevent security issue with 'dangerous' characters like < >
                    string[] AllInputs = builder.ToString().Split(new string[] { Environment.NewLine }, StringSplitOptions.None);
                    foreach (var item in AllInputs)
                    {
                        Result.Text += item;
                        Result.Text += "<br/>";
                    }

                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }


    }

}

