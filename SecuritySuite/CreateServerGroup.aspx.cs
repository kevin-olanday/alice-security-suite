using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Management.Automation;
using System.Text;
using System.IO;


namespace ExecutionCreateServerGroup
{
    public partial class Default : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ExecuteCreateServerGroup_Click(object sender, EventArgs e)
        {

            string userName = Environment.UserName;
            Result.Text = string.Empty;

            if (string.IsNullOrWhiteSpace(Input.Text))
            {
               Result.Text = "Please enter a server name!";
            }

            else
            {

                // Initialize PowerShell engine
                var shell = PowerShell.Create();
                var scriptbuilder = new StringBuilder();

                if(!CheckBoxAdmin.Checked && !CheckBoxRDP.Checked && !CheckBoxLocal.Checked && !CheckBoxLocal.Checked && !CheckBoxPower.Checked && !CheckBoxPrint.Checked)
                {

                    Result.Text = "Please specify the type of group to create!";
                }

                else
                {

                    if (CheckBoxAdmin.Checked)
                    {
                        // Add the script to the PowerShell object
                        scriptbuilder.AppendLine("C:\\Scripts\\Powershell\\ALICECreateServerGroups.ps1 -server " + Input.Text + " -type admin" + " -username " + userName);
                    }

                    else
                    {
                        scriptbuilder.AppendLine("'  '|out-string");

                    }

                    if (CheckBoxRDP.Checked)
                    {
                        // Add the script to the PowerShell object
                        scriptbuilder.AppendLine("C:\\Scripts\\Powershell\\ALICECreateServerGroups.ps1 -server " + Input.Text + " -type rdp " + " -username " + userName);
                    }

                    else
                    {
                        scriptbuilder.AppendLine("'  '|out-string");

                    }


                    if (CheckBoxLocal.Checked)
                    {
                        // Add the script to the PowerShell object
                        scriptbuilder.AppendLine("C:\\Scripts\\Powershell\\ALICECreateServerGroups.ps1 -server " + Input.Text + " -type local " + " -username " + userName);
                    }

                    else
                    {
                        scriptbuilder.AppendLine("'  '|out-string");

                    }

                    if (CheckBoxPower.Checked)
                    {
                        // Add the script to the PowerShell object
                        scriptbuilder.AppendLine("C:\\Scripts\\Powershell\\ALICECreateServerGroups.ps1 -server " + Input.Text + " -type power " + " -username " + userName);
                    }

                    else
                    {
                        scriptbuilder.AppendLine("'  '|out-string");

                    }

                    if (CheckBoxPrint.Checked)
                    {
                        // Add the script to the PowerShell object
                        scriptbuilder.AppendLine("C:\\Scripts\\Powershell\\ALICECreateServerGroups.ps1 -server " + Input.Text + " -type print " + " -username " + userName);
                    }

                    else
                    {
                        scriptbuilder.AppendLine("'  '|out-string");

                    }
                

                    shell.Commands.AddScript(scriptbuilder.ToString());

                    var results = shell.Invoke();
                    var builder = new StringBuilder();

                    foreach (var psObject in results)
                    {
                        // Convert the Base Object to a string and append it to the string builder.
                        // Add \r\n for line breaks
                        builder.Append(psObject.BaseObject.ToString() + "\r\n");
                    }

                    string[] AllInputs = builder.ToString().Split(new string[] { Environment.NewLine }, StringSplitOptions.None);
                    foreach (var item in AllInputs)
                    {
                        Result.Text += item;
                        Result.Text += "<br/>";
                    }
                }
            }
        }


    }

}


