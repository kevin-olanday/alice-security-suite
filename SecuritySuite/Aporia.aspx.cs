using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Management.Automation;
using System.Text;
using System.IO;

namespace AporiaExecution
{
    public partial class Default : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ExecuteCodeLAN_Click(object sender, EventArgs e)
        {

            // Clean the Result TextBox
            ResultBox.Text = string.Empty;
            string userName = HttpContext.Current.User.Identity.Name.ToString();


            if (string.IsNullOrWhiteSpace(Input.Text))
            {
                ResultBox.Text = "No user selected!";
                ProcessMessage.Text = string.Empty;
            }

            else
            {

                // Initialize PowerShell engine
                var shell = PowerShell.Create();

                // Add the script to the PowerShell object
                shell.Commands.AddScript("C:\\Scripts\\Powershell\\AporiaCheck.ps1 -user " + Input.Text);

                // Execute the script
                var results = shell.Invoke();
                var builder = new StringBuilder();
                foreach (var psObject in results)
                {
                    // Convert the Base Object to a string and append it to the string builder.
                    // Add \r\n for line breaks
                    builder.Append(psObject.BaseObject.ToString() + "\r\n");
                }

                ProcessMessage.Text = builder.ToString();

                shell.Commands.Clear();
                builder.Clear();

                // Add the script to the PowerShell object
                shell.Commands.AddScript("C:\\Scripts\\Powershell\\AporiaLAN.ps1 -user " + Input.Text + " -username " + userName);

                // Execute the script
                results = shell.Invoke();

                // display results, with BaseObject converted to string
                // Note : use |out-string for console-like output
                if (results.Count > 0)
                {


                    foreach (var psObject in results)
                    {
                        // Convert the Base Object to a string and append it to the string builder.
                        // Add \r\n for line breaks
                        builder.Append(psObject.BaseObject.ToString() + "\r\n");
                    }

                    // Encode the string in HTML (prevent security issue with 'dangerous' caracters like < >
                    ResultBox.Text = builder.ToString();
                    ExportButton.Visible = true;
                }
            }
        }

        protected void ExecuteCodeAPPSDB_Click(object sender, EventArgs e)
        {
            // Clean the Result TextBox
            ResultBox.Text = string.Empty;
            string userName = HttpContext.Current.User.Identity.Name.ToString();


            if (string.IsNullOrWhiteSpace(Input.Text))
            {
                ResultBox.Text = "No user selected!";
                ProcessMessage.Text = string.Empty;
            }

            else
            {

                // Initialize PowerShell engine
                var shell = PowerShell.Create();

                // Add the script to the PowerShell object
                shell.Commands.AddScript("C:\\Scripts\\Powershell\\AporiaCheck.ps1 -user " + Input.Text + " -username " + userName);

                // Execute the script
                var results = shell.Invoke();
                var builder = new StringBuilder();
                foreach (var psObject in results)
                {
                    // Convert the Base Object to a string and append it to the string builder.
                    // Add \r\n for line breaks
                    builder.Append(psObject.BaseObject.ToString() + "\r\n");
                }

                ProcessMessage.Text = builder.ToString();

                shell.Commands.Clear();
                builder.Clear();


                // Add the script to the PowerShell object
                shell.Commands.AddScript("C:\\Scripts\\Powershell\\AporiaAPPSDB.ps1 -user " + Input.Text + " -username " + userName);
                // Execute the script
                results = shell.Invoke();


                // display results, with BaseObject converted to string
                // Note : use |out-string for console-like output
                if (results.Count > 0)
                {

                    foreach (var psObject in results)
                    {
                        // Convert the Base Object to a string and append it to the string builder.
                        // Add \r\n for line breaks
                        builder.Append(psObject.BaseObject.ToString() + "\r\n");
                    }

                    // Encode the string in HTML (prevent security issue with 'dangerous' characters like < >
                    ResultBox.Text = builder.ToString();
                    ExportButton.Visible = true;
                }
            }
        }

        protected void ExecuteCodeFullList_Click(object sender, EventArgs e)
        {

            // Clean the Result TextBox
            ResultBox.Text = string.Empty;
            string userName = HttpContext.Current.User.Identity.Name.ToString();


            if (string.IsNullOrWhiteSpace(Input.Text))
            {
                ResultBox.Text = "No user selected!";
                ProcessMessage.Text = string.Empty;
            }

            else
            {

                // Initialize PowerShell engine
                var shell = PowerShell.Create();

                // Add the script to the PowerShell object
                shell.Commands.AddScript("C:\\Scripts\\Powershell\\AporiaCheck.ps1 -user " + Input.Text);

                // Execute the script
                var results = shell.Invoke();
                var builder = new StringBuilder();
                foreach (var psObject in results)
                {
                    // Convert the Base Object to a string and append it to the string builder.
                    // Add \r\n for line breaks
                    builder.Append(psObject.BaseObject.ToString() + "\r\n");
                }

                ProcessMessage.Text = builder.ToString();

                shell.Commands.Clear();
                builder.Clear();

                // Add the script to the PowerShell object
                shell.Commands.AddScript("C:\\Scripts\\Powershell\\AporiaALL.ps1 -user " + Input.Text + " -username " + userName);

                results = shell.Invoke();


                // display results, with BaseObject converted to string
                // Note : use |out-string for console-like output
                if (results.Count > 0)
                {

                    foreach (var psObject in results)
                    {
                        // Convert the Base Object to a string and append it to the string builder.
                        // Add \r\n for line breaks
                        builder.Append(psObject.BaseObject.ToString() + "\r\n");
                    }

                    // Encode the string in HTML (prevent security issue with 'dangerous' characters like < >
                    ResultBox.Text = builder.ToString();
                    ExportButton.Visible = true;
                }
            }
        }


        protected void ExportButton_Click(object sender, EventArgs e)
        {
            string pattern = "*" + Input.Text + "*";
            var directory = new DirectoryInfo("D:\\Applications\\Aporia\\csv");
            var myfile = (from f in directory.GetFiles(pattern)
                          orderby f.LastWriteTime descending
                          select f).First();
            String Filepath = "D:\\Applications\\Aporia\\csv\\" + myfile;
            FileInfo file = new FileInfo(Filepath);

            if (file.Exists)
            {
                Response.Clear();
                Response.ClearHeaders();
                Response.ClearContent();
                Response.AddHeader("Content-Disposition", "attachment; filename=" + file.Name);
                Response.AddHeader("Content-Length", file.Length.ToString());
                Response.ContentType = "text/plain";
                Response.Flush();
                Response.TransmitFile(file.FullName);
                Response.End();
            }
        }


    }

}


