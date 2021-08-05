using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Management.Automation;
using System.Text;
using System.IO;

namespace CheckFolderApproversExecution
{
    public partial class Default : System.Web.UI.Page
    {


        protected void ExecuteCheckFolderApprovers_Click(object sender, EventArgs e)
        {

            string userName = System.Environment.UserName;
            ProcessMessage.Text = string.Empty;
            ResultPanel.Visible = false;
      
            if (string.IsNullOrWhiteSpace(Input.Text))
            {
                ProcessMessage.Text = "Please enter a shared folder.";

            }

            else
            {
                if(!Directory.Exists(Input.Text))
                {
                    ProcessMessage.Text = "This folder does not exist or you do not have access to view it.";

                }
                else
                {
                    ProcessMessage.Text = "Directory found.";
                    // Initialize PowerShell engine
                    var shell = PowerShell.Create();
                    shell.Commands.AddScript("C:\\Scripts\\Powershell\\ALICECheckFolderApprovers.ps1 -path " + "'" + Input.Text  + "'" + " -username " + userName);

                    var results = shell.Invoke();
                    var builder = new StringBuilder();

                    foreach (var psObject in results)
                    {
                        // Convert the Base Object to a string and append it to the string builder.
                        // Add \r\n for line breaks
                        builder.Append(psObject.BaseObject.ToString() + "\r\n");
                    }
                    ResultPanel.Visible = true;
                    string resultString = builder.ToString();

                    string[] words = resultString.Split(',');

                    SuggestedROGroupCell.Text = words[0];
                    SuggestedRWGroupCell.Text = words[1];
                    ApproversCell.Text = words[2];
                   
                }           
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }


    }

}


