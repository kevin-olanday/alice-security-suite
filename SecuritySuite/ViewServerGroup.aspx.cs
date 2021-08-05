using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Management.Automation;
using System.Text;
using System.IO;
using System.Web.SessionState;
using System.Threading;


namespace ExecutionViewServerGroup
{
    public partial class Default : System.Web.UI.Page
    {

    
        protected void ExecuteViewServerGroup_Click(object sender, EventArgs e)
        {

            string userName = Environment.UserName;
            Result.Text = string.Empty;

            if (string.IsNullOrWhiteSpace(Input.Text))
            {
                Result.Text = string.Empty;
            }

            else
            {

                // Initialize PowerShell engine
                var shell = PowerShell.Create();
                shell.Commands.AddScript("C:\\Scripts\\Powershell\\ALICEViewServerGroups.ps1 -server " + Input.Text);

                var results = shell.Invoke();
                var builder = new StringBuilder();

                foreach (var psObject in results)
                {
                    // Convert the Base Object to a string and append it to the string builder.
                    // Add \r\n for line breaks
                    builder.Append(psObject.BaseObject.ToString() + "\r\n");
                }

                string resultString = builder.ToString();
                string localadminsString = "SGG-LocalAdmins-" + Input.Text;
                string localRDPString = "SGG-LocalRDP-" + Input.Text;
                string logonlocallyString = "SGG-LogonLocally-" + Input.Text;
                string localpowerusersString = "SGG-LocalPowerUsers-" + Input.Text;
                string localprintoperatorsString = "SGG-LocalPrintOperators-" + Input.Text;

                if(resultString.Contains(localadminsString))
                {
                    LocalAdminsCell.Text = localadminsString;
                }
                else
                {
                    LocalAdminsCell.Text = "-";
                }

                if (resultString.Contains(localRDPString))
                {
                    LocalRDPCell.Text = localRDPString;
                }
                else
                {
                    LocalRDPCell.Text = "-";
                }


                if (resultString.Contains(logonlocallyString))
                {
                    LogonLocallyCell.Text = logonlocallyString;
                }
                else
                {
                    LogonLocallyCell.Text = "-";
                }


                if (resultString.Contains(localpowerusersString))
                {
                    LocalPowerUsersCell.Text = localpowerusersString;
                }
                else
                {
                    LocalPowerUsersCell.Text = "-";
                }


                if (resultString.Contains(localprintoperatorsString))
                {
                    LocalPrintOperatorsCell.Text = localprintoperatorsString;
                }
                else
                {
                    LocalPrintOperatorsCell.Text = "-";
                }


            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }


    }

}


