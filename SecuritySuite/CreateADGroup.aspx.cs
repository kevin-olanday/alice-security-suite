using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Management.Automation;
using System.Text;
using System.IO;


namespace ExecutionCreateADGroup
{
    public partial class Default : System.Web.UI.Page
    {

       
         

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ExecuteCreateADGroup_Click(object sender, EventArgs e)
        {
            // Clean the Result TextBox
            Result.Text = string.Empty;
            string userName = System.Environment.UserName;
            // Initialize PowerShell engine
                var shell = PowerShell.Create();

                // Add the script to the PowerShell object
               if(ACGPanel.Visible)
               {
                   if (ACGGroup.Text == string.Empty)
                   {
                       Result.Text = "Please enter a name for your ACG group.";
                       return;
                   }
                   else if(!(ACGGroup.Text.StartsWith("ACG-", StringComparison.OrdinalIgnoreCase)))
                   {
                       Result.Text = "Please check the group's name. Account groups must begin with 'ACG-'";
                       return;
                   }
                   else if (ACGManagedBy.Text == string.Empty)
                   {
                       Result.Text = "Please enter a manager for your ACG group.";
                       return;
                   }
                   else if (ACGMembers.Text == string.Empty)
                   {
                       shell.Commands.AddScript("C:\\Scripts\\Powershell\\ALICECreateADGroup.ps1 -groupname " + ACGGroup.Text + " -description " + "'" + ACGDescription.Text + "'" + " -notes " + "'" + ACGNotes.Text + "'" + " -managedby " + ACGManagedBy.Text + " -type acg" + " -username " + userName);
            
                   }
                   else
                   {
                       shell.Commands.AddScript("C:\\Scripts\\Powershell\\ALICECreateADGroup.ps1 -groupname " + ACGGroup.Text + " -description " + "'" + ACGDescription.Text + "'" + " -notes " + "'" + ACGNotes.Text + "'" + " -managedby " + ACGManagedBy.Text + " -members " + "'" + ACGMembers.Text + "'" + " -type acg" + " -username " + userName);
                   }
               }

               else if (AGGPanel.Visible)
               {
                   if (AGGGroup.Text == string.Empty)
                   {
                       Result.Text = "Please enter a name for your AGG group.";
                       return;
                   }
                   else if (!(AGGGroup.Text.StartsWith("AGG-", StringComparison.OrdinalIgnoreCase)))
                   {
                       Result.Text = "Please check the group's name. Application access groups must begin with 'AGG-'";
                       return;
                   }
                   else if (AGGManagedBy.Text == string.Empty)
                   {
                       Result.Text = "Please enter a manager for your AGG group.";
                       return;
                   }
                   else if (AGGMembers.Text == string.Empty)
                   {
                       shell.Commands.AddScript("C:\\Scripts\\Powershell\\ALICECreateADGroup.ps1 -groupname " + AGGGroup.Text + " -description " + "'" + AGGDescription.Text + "'" + " -notes " + "'" + AGGNotes.Text + "'" + " -managedby " + AGGManagedBy.Text + " -type agg" + " -username " + userName);

                   }
                   else
                   {
                       shell.Commands.AddScript("C:\\Scripts\\Powershell\\ALICECreateADGroup.ps1 -groupname " + AGGGroup.Text + " -description " + "'" + AGGDescription.Text + "'" + " -notes " + "'" + AGGNotes.Text + "'" + " -managedby " + AGGManagedBy.Text + " -members " + "'" + AGGMembers.Text + "'" + " -type agg" + " -username " + userName);
                   }
               }


               else if (APPPanel.Visible)
               {
                   if (APPGroup.Text == string.Empty)
                   {
                       Result.Text = "Please enter a name for your APP group.";
                       return;
                   }
                   else if (!(APPGroup.Text.StartsWith("APP-", StringComparison.OrdinalIgnoreCase)))
                   {
                       Result.Text = "Please check the group's name. Application Deployment groups must begin with 'APP-'";
                       return;
                   }
                   else if (APPManagedBy.Text == string.Empty)
                   {
                       Result.Text = "Please enter a manager for your APP group.";
                       return;
                   }
                   else if (APPMembers.Text == string.Empty)
                   {
                       shell.Commands.AddScript("C:\\Scripts\\Powershell\\ALICECreateADGroup.ps1 -groupname " + APPGroup.Text + " -description " + "'" + APPDescription.Text + "'" + " -notes " + "'" + APPNotes.Text + "'" + " -managedby " + APPManagedBy.Text + " -type app" + " -username " + userName);

                   }
                   else
                   {
                       shell.Commands.AddScript("C:\\Scripts\\Powershell\\ALICECreateADGroup.ps1 -groupname " + APPGroup.Text + " -description " + "'" + APPDescription.Text + "'" + " -notes " + "'" + APPNotes.Text + "'" + " -managedby " + APPManagedBy.Text + " -members " + "'" + APPMembers.Text + "'" + " -type app" + " -username " + userName);
                   }
               }
               else if (DGPanel.Visible)
               {
                   if (DGGroup.Text == string.Empty)
                   {
                       Result.Text = "Please enter a name for your DG group.";
                       return;
                   }
      
                   else if (DGMembers.Text == string.Empty)
                   {
                       shell.Commands.AddScript("C:\\Scripts\\Powershell\\ALICECreateADGroup.ps1 -groupname " + DGGroup.Text + " -description " + "'" + DGDescription.Text + "'" + " -notes " + "'" + DGNotes.Text + "'" + " -type DG" + " -username " + userName);

                   }
                   else
                   {
                       shell.Commands.AddScript("C:\\Scripts\\Powershell\\ALICECreateADGroup.ps1 -groupname " + DGGroup.Text + " -description " + "'" + DGDescription.Text + "'" + " -notes " + "'" + DGNotes.Text + "'" + " -members " + "'" + DGMembers.Text + "'" + " -type DG" + " -username " + userName);
                   }
               }
               else if (DMDLPanel.Visible)
               {
                   if (DMDLGroup.Text == string.Empty)
                   {
                       Result.Text = "Please enter a name for your DMDL group.";
                       return;
                   }
                   else if (!(DMDLGroup.Text.StartsWith("DMDL-", StringComparison.OrdinalIgnoreCase)))
                   {
                       Result.Text = "Please check the group's name. Data management groups must begin with 'DMDL-'";
                       return;
                   }
                   else if (DMDLManagedBy.Text == string.Empty)
                   {
                       Result.Text = "Please enter a manager for your DMDL group.";
                       return;
                   }
                   else if (DMDLMembers.Text == string.Empty)
                   {
                       shell.Commands.AddScript("C:\\Scripts\\Powershell\\ALICECreateADGroup.ps1 -groupname " + DMDLGroup.Text + " -description " + "'" + DMDLDescription.Text + "'" + " -notes " + "'" + DMDLNotes.Text + "'" + " -managedby " + DMDLManagedBy.Text + " -type dmdl" + " -username " + userName);

                   }
                   else
                   {
                       shell.Commands.AddScript("C:\\Scripts\\Powershell\\ALICECreateADGroup.ps1 -groupname " + DMDLGroup.Text + " -description " + "'" + DMDLDescription.Text + "'" + " -notes " + "'" + DMDLNotes.Text + "'" + " -managedby " + DMDLManagedBy.Text + " -members " + "'" + DMDLMembers.Text + "'" + " -type dmdl" + " -username " + userName);
                   }
               }

               else if (RADLPanel.Visible)
               {
                   if (RADLGroup.Text == string.Empty)
                   {
                       Result.Text = "Please enter a name for your RADL group.";
                       return;
                   }
                   else if (!(RADLGroup.Text.StartsWith("RADL-", StringComparison.OrdinalIgnoreCase)))
                   {
                       Result.Text = "Please check the group's name. Resource access groups must begin with 'RADL-'";
                       return;
                   }
                   else if (RADLManagedBy.Text == string.Empty)
                   {
                       Result.Text = "Please enter a manager for your RADL group.";
                       return;
                   }
                   else if (RADLMembers.Text == string.Empty)
                   {
                       shell.Commands.AddScript("C:\\Scripts\\Powershell\\ALICECreateADGroup.ps1 -groupname " + RADLGroup.Text + " -description " + "'" + RADLDescription.Text + "'" + " -notes " + "'" + RADLNotes.Text + "'" + " -managedby " + RADLManagedBy.Text + " -type radl" + " -username " + userName);

                   }
                   else
                   {
                       shell.Commands.AddScript("C:\\Scripts\\Powershell\\ALICECreateADGroup.ps1 -groupname " + RADLGroup.Text + " -description " + "'" + RADLDescription.Text + "'" + " -notes " + "'" + RADLNotes.Text + "'" + " -managedby " + RADLManagedBy.Text + " -members " + "'" + RADLMembers.Text + "'" + " -type radl" + " -username " + userName);
                   }
               }
               else if (SMDLPanel.Visible)
               {
                   if (SMDLGroup.Text == string.Empty)
                   {
                       Result.Text = "Please enter a name for your SMDL group.";
                       return;
                   }
                   else if (!(SMDLGroup.Text.StartsWith("SMDL-", StringComparison.OrdinalIgnoreCase)))
                   {
                       Result.Text = "Please check the group's name. Service management groups must begin with 'SMDL-'";
                       return;
                   }
                   else if (SMDLManagedBy.Text == string.Empty)
                   {
                       Result.Text = "Please enter a manager for your SMDL group.";
                       return;
                   }
                   else if (SMDLMembers.Text == string.Empty)
                   {
                       shell.Commands.AddScript("C:\\Scripts\\Powershell\\ALICECreateADGroup.ps1 -groupname " + SMDLGroup.Text + " -description " + "'" + SMDLDescription.Text + "'" + " -notes " + "'" + SMDLNotes.Text + "'" + " -managedby " + SMDLManagedBy.Text + " -type SMDL" + " -username " + userName);

                   }
                   else
                   {
                       shell.Commands.AddScript("C:\\Scripts\\Powershell\\ALICECreateADGroup.ps1 -groupname " + SMDLGroup.Text + " -description " + "'" + SMDLDescription.Text + "'" + " -notes " + "'" + SMDLNotes.Text + "'" + " -managedby " + SMDLManagedBy.Text + " -members " + "'" + SMDLMembers.Text + "'" + " -type SMDL" + " -username " + userName);
                   }
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
                    // Result.Text = Server.HtmlEncode(builder.ToString());
                    string[] AllInputs = builder.ToString().Split(new string[] { Environment.NewLine }, StringSplitOptions.None);
                    foreach (var item in AllInputs)
                    {
                        Result.Text += item;
                        Result.Text += "<br/>";
                    }
                  
                }
        }

        protected void ExecuteCreateADGroupBulk_Click(object sender, EventArgs e)
        {
            string userName = System.Environment.UserName;
            string filename = Filename.Text;
            ExecuteCreateADGroupBulkButton.Visible = false;
            StatusLabel.Text = "Upload status: Idle";
            if (File.Exists(filename))
            {

                // Initialize PowerShell engine
                var shell = PowerShell.Create();

                // Add the script to the PowerShell object

                shell.Commands.AddScript("C:\\Scripts\\Powershell\\ALICECreateADGroupBulk.ps1 -csv " + "'" + filename + "'" + " -username " + userName);

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
                    Result.Text = result.Replace(".", ".</br>").Replace("!", ".</br>");
     
                }
            }
            else
            {
                Result.Text = "File does not exists.";
            }
        }


        public void HidePanels()
        {
            ACGPanel.Visible = false;
            AGGPanel.Visible = false;
            APPPanel.Visible = false;
            DGPanel.Visible = false;
            DMDLPanel.Visible = false;
            RADLPanel.Visible = false;
            SMDLPanel.Visible = false;
            Result.Text = string.Empty;
        }

        public void ClearButtons()
        {
            DisplayACGPanel.BackColor = System.Drawing.Color.Transparent;
            DisplayAGGPanel.BackColor = System.Drawing.Color.Transparent;
            DisplayAPPPanel.BackColor = System.Drawing.Color.Transparent;
            DisplayDGPanel.BackColor = System.Drawing.Color.Transparent;
            DisplayDMDLPanel.BackColor = System.Drawing.Color.Transparent;
            DisplayRADLPanel.BackColor = System.Drawing.Color.Transparent;
            DisplaySMDLPanel.BackColor = System.Drawing.Color.Transparent;
        }

        protected void DisplayACGPanel_Click(object sender, EventArgs e)
        {
            HidePanels();
            ClearButtons();
            ACGPanel.Visible = true;
            DisplayACGPanel.BackColor = System.Drawing.Color.SlateGray;
        }


        protected void DisplayAGGPanel_Click(object sender, EventArgs e)
        {
            HidePanels();
            ClearButtons();
            AGGPanel.Visible = true;
            DisplayAGGPanel.BackColor = System.Drawing.Color.SlateGray;
        }

        protected void DisplayAPPPanel_Click(object sender, EventArgs e)
        {
            HidePanels();
            ClearButtons();
            APPPanel.Visible = true;
            DisplayAPPPanel.BackColor = System.Drawing.Color.SlateGray;
        }

        protected void DisplayDGPanel_Click(object sender, EventArgs e)
        {
            HidePanels();
            ClearButtons();
            DGPanel.Visible = true;
            DisplayDGPanel.BackColor = System.Drawing.Color.SlateGray;
        }

        protected void DisplayDMDLPanel_Click(object sender, EventArgs e)
        {
            HidePanels();
            ClearButtons();
            DMDLPanel.Visible = true;
            DisplayDMDLPanel.BackColor = System.Drawing.Color.SlateGray;
        }

        protected void DisplayRADLPanel_Click(object sender, EventArgs e)
        {
            HidePanels();
            ClearButtons();
            RADLPanel.Visible = true;
            DisplayRADLPanel.BackColor = System.Drawing.Color.SlateGray;
        }

        protected void DisplaySMDLPanel_Click(object sender, EventArgs e)
        {
            HidePanels();
            ClearButtons();
            SMDLPanel.Visible = true;
            DisplaySMDLPanel.BackColor = System.Drawing.Color.SlateGray;
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
            String Filepath = "D:\\Applications\\Alice\\AliceTemplates\\ADGroupBulk.csv";
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
                ExecuteCreateADGroupBulkButton.Visible = false;
                try
                {
                    if (FileUploadControl.FileName.EndsWith(".csv"))
                    {
                        if (FileUploadControl.PostedFile.ContentLength < 1000000)
                        {
                            string userName = Environment.UserName;
                            string filename = Path.GetFileName(FileUploadControl.FileName);
                            filename = "D:\\Applications\\Alice\\Uploads\\ADGroupBulk-" + userName + "-" + filename;
                            FileUploadControl.SaveAs(filename);
                            StatusLabel.Text = "Upload status: File uploaded!";
                            Filename.Text = filename;
                            ExecuteCreateADGroupBulkButton.Visible = true;
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

    }


}


