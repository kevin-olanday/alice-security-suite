using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Management.Automation;
using System.Text;
using System.IO;

namespace RenameMailboxExecution
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Input_TextChanged(object sender, EventArgs e)
        {
            ExecuteCheckMailbox.Visible = true;
            ResultPanel.Visible = false;
            ProcessMessage.Text = string.Empty;
        }

        protected void ExecuteCheckSharedMailbox_Click(object sender, EventArgs e)
        {

           
 
            if (string.IsNullOrWhiteSpace(Input.Text))
            {
                ProcessMessage.Text = "Enter a mailbox";

            }

            else
            {
                string userName = System.Environment.UserName;
                ProcessMessage.Text = string.Empty;



                // Initialize PowerShell engine
                var shell = PowerShell.Create();
                shell.Commands.AddScript("C:\\Scripts\\Powershell\\ALICECheckObject.ps1 -name " + "'" + Input.Text  + "'" );

                var results = shell.Invoke();
                var builder = new StringBuilder();

                foreach (var psObject in results)
                {
                    // Convert the Base Object to a string and append it to the string builder.
                    // Add \r\n for line breaks
                    builder.Append(psObject.BaseObject.ToString() + "\r\n");
                }

                var Result = Server.HtmlEncode(builder.ToString()); 

                if(Result.Contains("Mailbox found"))
                { 

                ResultPanel.Visible = true;
                ExecuteCheckMailbox.Visible = false;
                }    
                ProcessMessage.Text = Server.HtmlEncode(builder.ToString());
                
            }
        }

        protected void ExecuteRenameSharedMailbox_Click(object sender, EventArgs e)
        {



            if (string.IsNullOrWhiteSpace(NewName.Text))
            {
                ResultMessage.Text = "Enter a New Name for " + Input.Text;

            }

            else
            {
                string userName = System.Environment.UserName;
                ResultMessage.Text = string.Empty;

                // Initialize PowerShell engine
                var shell = PowerShell.Create();
                shell.Commands.AddScript("C:\\Scripts\\Powershell\\ALICERenameSharedMailbox.ps1 -mailboxname " + "'" + Input.Text + "'" + " -newname " + "'" + NewName.Text + "'" + " -username " + userName);

                var results = shell.Invoke();
                var builder = new StringBuilder();

                foreach (var psObject in results)
                {
                    // Convert the Base Object to a string and append it to the string builder.
                    // Add \r\n for line breaks
                    builder.Append(psObject.BaseObject.ToString() + "\r\n");
                }

                var Result = Server.HtmlEncode(builder.ToString());
            
  
                ResultMessage.Text = Result.Replace(".", ".</br>");

            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }


    }

}


