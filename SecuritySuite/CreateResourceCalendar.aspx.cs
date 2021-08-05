using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Management.Automation;
using System.Text;
using System.IO;


namespace ExecutionCreateSharedCalendar
{
    public partial class Default : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ExecuteCreateSharedCalendar_Click(object sender, EventArgs e)
        {
            // Clean the Result TextBox
            Result.Text = string.Empty;

            string userName = System.Environment.UserName;


            if (string.IsNullOrWhiteSpace(MailboxName.Text))
            {
                Result.Text = "Please enter a name for the shared mailbox!";
            }

            else if (string.IsNullOrWhiteSpace(Alias.Text))
            {
                Result.Text = "Please enter an alias for the shared mailbox!";
            }

            else if (string.IsNullOrWhiteSpace(Owner.Text))
            {

                Result.Text = "Please enter the owner of the shared mailbox!";
            }

            else if (string.IsNullOrWhiteSpace(PBO.Text))
            {

                Result.Text = "Please enter the owner's cost centre!";
            }

            else if (string.IsNullOrWhiteSpace(Approvers.Text))
            {

                Result.Text = "Please enter the approvers for this mailbox!";
            }



            else
            {

                // Initialize PowerShell engine
                var shell = PowerShell.Create();
            
                // Add the script to the PowerShell object
                shell.Commands.AddScript("C:\\Scripts\\Powershell\\ALICECreateResourceCalendar.ps1 -mailboxname " + "'" + MailboxName.Text + "'" + " -alias " + "'" + Alias.Text + "'" + " -inc " + "'" + INC.Text + "'" + " -owner " + "'" + Owner.Text + "'" + " -pbo " + "'" + PBO.Text +  "'" + " -approvers " + "'" + Approvers.Text + "'" + " -authors " + "'" + Authors.Text + "'" + " -editors " + "'" + Editors.Text + "'" + " -username " + userName );
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
                    Result.Text = Server.HtmlEncode(builder.ToString());
                    Result.Text = Result.Text.Replace(".", ".</br>").Replace("!", ".</br>");

                }
            }
        }

      
        protected void DisplaySinglePanel_Click(object sender, EventArgs e)
        {
            SinglePanel.Visible = true;
            DisplaySinglePanel.BackColor = System.Drawing.Color.SlateGray;
            DisplayBulkPanel.BackColor = System.Drawing.Color.Transparent;
        }

        protected void DisplayBulkPanel_Click(object sender, EventArgs e)
        {
            SinglePanel.Visible = false;
            DisplayBulkPanel.BackColor = System.Drawing.Color.SlateGray;
            DisplaySinglePanel.BackColor = System.Drawing.Color.Transparent;
        }
    }


}


