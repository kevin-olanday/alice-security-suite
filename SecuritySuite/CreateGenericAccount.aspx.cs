using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Management.Automation;
using System.Text;
using System.IO;


namespace ExecutionCreateGenericAccount
{
    public partial class Default : System.Web.UI.Page
    {

        private static readonly Random Random = new Random();


 

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ExecuteCreateGenericAccount_Click(object sender, EventArgs e)
        {
            // Clean the Result TextBox
            Result.Text = string.Empty;

            string userName = System.Environment.UserName;


            if (string.IsNullOrWhiteSpace(genaname.Text))
            {
                Result.Text = "Please enter a name for the generic account!";
            }

            else if(string.IsNullOrWhiteSpace(genadomain.Text))
            {
                Result.Text = "Please enter a value for application domain!";
            }

            else if(string.IsNullOrWhiteSpace(genapassword.Text))
            {

                Result.Text = "Please enter a valid password to use!";
            }

            else
            {
          
                // Initialize PowerShell engine
                var shell = PowerShell.Create();

                // Add the script to the PowerShell object
                if (CheckBoxInteractive.Checked)
                {
                    shell.Commands.AddScript("C:\\Scripts\\Powershell\\ALICECreateGenericAccount.ps1 -name " + genaname.Text + " -domain " + "'" + genadomain.Text + "'" + " -inc " + genaINC.Text + " -password " + genapassword.Text + " -interactive $true" + " -username " + userName);
                }
                else
                {
                    shell.Commands.AddScript("C:\\Scripts\\Powershell\\ALICECreateGenericAccount.ps1 -name " + genaname.Text + " -domain " + "'" + genadomain.Text + "'" + " -inc " + genaINC.Text + " -password " + genapassword.Text + " -username " + userName);
                }
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
                  
                }
            }
        }


     

        protected void DisplaySinglePanel_Click(object sender, EventArgs e)
        {
            SinglePanel.Visible = true;
            BulkPanel.Visible = false;
            DisplaySinglePanel.BackColor = System.Drawing.Color.SlateGray;
            DisplayBulkPanel.BackColor = System.Drawing.Color.Transparent;
        }



        protected void UploadButton_Click(object sender, EventArgs e)
        {
            if (FileUploadControl.HasFile)
            {
                ExecuteCreateGenericAccountBulkButton.Visible = false;
                try
                {
                    if (FileUploadControl.FileName.EndsWith(".csv"))
                    {
                        if (FileUploadControl.PostedFile.ContentLength < 1000000)
                        {
                            string userName = Environment.UserName;
                            string filename = Path.GetFileName(FileUploadControl.FileName);
                            filename = "D:\\Applications\\Alice\\Uploads\\GenericAccountsBulk-" + userName + "-" + filename;
                            FileUploadControl.SaveAs(filename);
                            StatusLabel.Text = "Upload status: File uploaded!";
                            Filename.Text = filename;
                            ExecuteCreateGenericAccountBulkButton.Visible = true;
                        }
                        else
                            StatusLabel.Text = "Upload status: The file has to be less than 1 mb!";
                    }
                    else
                        StatusLabel.Text = "Upload status: Only CSV files are accepted!";
                }
                catch (Exception ex)
                {
                    StatusLabel.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                }
            }
        }

        protected void ExecuteCreateGenericAccountBulk_Click(object sender, EventArgs e)
        {

            string userName = System.Environment.UserName;
            string filename = Filename.Text;
            ExecuteCreateGenericAccountBulkButton.Visible = false;
            StatusLabel.Text = "Upload status: Idle";
            if (File.Exists(filename))
            {
         
                // Initialize PowerShell engine
                 var shell = PowerShell.Create();

                // Add the script to the PowerShell object
       
                shell.Commands.AddScript("C:\\Scripts\\Powershell\\ALICECreateGenericAccountBulk.ps1 -csv " + "'" + filename + "'" + " -username " + userName);
                
                // Execute the script
                var results = shell.Invoke();

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

                    string result = Server.HtmlEncode(builder.ToString());
                    Result.Text = result.Replace(".", ".</br>");

                }
            }
        }

        protected void DisplayBulkPanel_Click(object sender, EventArgs e)
        {
            SinglePanel.Visible = false;
            BulkPanel.Visible = true;
            DisplayBulkPanel.BackColor = System.Drawing.Color.SlateGray;
            DisplaySinglePanel.BackColor = System.Drawing.Color.Transparent;
        }

        protected void BulkTemplate_Download(object sender, EventArgs e)
        {
            String Filepath = "D:\\Applications\\Alice\\AliceTemplates\\GenericAccountBulk.csv";
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


