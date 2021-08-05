using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Management.Automation;
using System.Text;
using System.IO;

namespace ComparoExecution
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ExecuteComparo(object sender, EventArgs e)
        {
            // Clean the Result TextBox
            ResultBox.Text = string.Empty;

            if (string.IsNullOrWhiteSpace(InputA.Text))
            {
                Label1.Text = "Please enter a value for User A!";
                return;
            }

            if (string.IsNullOrWhiteSpace(InputB.Text))
            {
                Label2.Text = "Please enter a value for User B!";
                return;
            }


            // Initialize PowerShell engine
            var shell = PowerShell.Create();

            // Add the script to the PowerShell object
            shell.Commands.AddScript("C:\\Scripts\\Powershell\\ComparoCheck.ps1 " + InputA.Text);

            // Execute the script
            var results = shell.Invoke();
            var builder = new StringBuilder();
            foreach (var psObject in results)
            {
                // Convert the Base Object to a string and append it to the string builder.
                // Add \r\n for line breaks
                builder.Append(psObject.BaseObject.ToString() + "\r\n");
            }

            Label1.Text = Server.HtmlEncode(builder.ToString());

            shell.Commands.Clear();
            builder.Clear();

            // Add the script to the PowerShell object
            shell.Commands.AddScript("C:\\Scripts\\Powershell\\ComparoCheck.ps1 -user " + InputB.Text);

            // Execute the script
            results = shell.Invoke();


            foreach (var psObject in results)
            {
                // Convert the Base Object to a string and append it to the string builder.
                // Add \r\n for line breaks
                builder.Append(psObject.BaseObject.ToString() + "\r\n");
            }

            Label2.Text = Server.HtmlEncode(builder.ToString());

            shell.Commands.Clear();
            builder.Clear();


            // Add the script to the PowerShell object
            shell.Commands.AddScript("C:\\Scripts\\Powershell\\Comparo.ps1 -userA " + InputA.Text + " -userB " + InputB.Text);

            results = shell.Invoke();


            string groupsA = File.ReadAllText("C:\\AliceOnline\\Comparo\\" + InputA.Text + "-" + InputB.Text + ".txt");
            ResultBox.Text = groupsA;
            string groupsB = File.ReadAllText("C:\\AliceOnline\\Comparo\\" + InputB.Text + "-" + InputA.Text + ".txt");
            ResultBox2.Text = groupsB;
            File.Delete("C:\\AliceOnline\\Comparo\\" + InputA.Text + "-" + InputB.Text + ".txt");
            File.Delete("C:\\AliceOnline\\Comparo\\" + InputB.Text + "-" + InputA.Text + ".txt");
        }
    }
}


