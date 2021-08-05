using System;
using System.Drawing;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Management.Automation;
using System.Text;
using System.IO;

namespace ReadFromTextFileToTextBoxWebApp
{

    public class MyLabel : Label
    {
        public MyLabel()
        {
            if (this.Text == "success")
            {
                this.ForeColor = Color.Green;
            }
        }

      
    }

    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            const int neededLines = 3;
            var lines = new List<String>();
            foreach (var s in File.ReadLines(@"c:\\temp\\aliceconvertgenericaccount.log"))
            {
                lines.Add(s);
                if (lines.Count > neededLines)
                {
                    lines.RemoveAt(0);
                }
            }
            var data = String.Join("\n", lines.ToArray());

            string[] AllInputs = data.Split(new string[] { "||"}, StringSplitOptions.None);
            foreach (var item in AllInputs)
            {
                feedtest.Text += item;
                feedtest.Text += "<br/>";
            }
        }
    }
}