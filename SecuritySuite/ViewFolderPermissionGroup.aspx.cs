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



namespace ExecutionViewFolderPermissionGroup
{
    public partial class Default : System.Web.UI.Page
    {

    
        protected void ExecuteViewFolderPermissionGroup_Click(object sender, EventArgs e)
        {
            
            string userName = Environment.UserName;
            Result.Text = string.Empty;

            if (string.IsNullOrWhiteSpace(Input.Text))
            {
                Result.Text = string.Empty;
            }

            else
            {
 
                RunspaceConfiguration psConfig = RunspaceConfiguration.Create();
                Runspace psRunspace = RunspaceFactory.CreateRunspace(psConfig);
                psRunspace.ApartmentState = System.Threading.ApartmentState.STA;
                psRunspace.ThreadOptions = System.Management.Automation.Runspaces.PSThreadOptions.UseCurrentThread;
   
                using (Pipeline psPipeline = psRunspace.CreatePipeline())
                {

                    psRunspace.Open();

                    psPipeline.Commands.AddScript("C:\\Scripts\\Powershell\\ALICEViewFolderPermissions.ps1 -path " + Input.Text);

                    // Invoke the cmdlet
          
                  
                    var results = psPipeline.Invoke();
                    var builder = new StringBuilder();

                    foreach (var psObject in results)
                    {
                        // Convert the Base Object to a string and append it to the string builder.
                        // Add \r\n for line breaks
                        builder.Append(psObject.BaseObject.ToString() + "\r\n");
                    }

                    DirectPermissionsLabel.Visible = true;
                    ResultBox.Visible = true;
                    ResultBox.Text = builder.ToString();
                    psRunspace.Close();
                    if (CheckBoxIndirect.Checked)
                    {
                        RunspaceConfiguration psConfig2 = RunspaceConfiguration.Create();
                        Runspace psRunspace2 = RunspaceFactory.CreateRunspace(psConfig2);
                        using (Pipeline psPipeline2 = psRunspace2.CreatePipeline())
                        {

                            psRunspace2.Open();

                            psPipeline2.Commands.AddScript("C:\\Scripts\\Powershell\\ALICEViewFolderPermissions.ps1 -path " + Input.Text + " -indirect");

                            var results2 = psPipeline2.Invoke();
                            var builder2 = new StringBuilder();

                            foreach (var psObject in results2)
                            {
                                // Convert the Base Object to a string and append it to the string builder.
                                // Add \r\n for line breaks
                                builder2.Append(psObject.BaseObject.ToString() + "\r\n");
                            }


                            IndirectPermissionsLabel.Visible = true;
                            ResultBox2.Visible = true;
                            ResultBox2.Text = builder2.ToString();
                        }
                    }
                }
            }       
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }


    }

}

