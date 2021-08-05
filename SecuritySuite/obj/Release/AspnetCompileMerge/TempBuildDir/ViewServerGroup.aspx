<%@ Page Title="View Server Group" Language="C#" AutoEventWireup="true" MasterPageFile="~/Alice.Master" CodeBehind="ViewServerGroup.aspx.cs" Inherits="ExecutionViewServerGroup.Default" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
  
            <div id="content" style="width:1000px; margin:auto auto;text-align:left;">
             <h1 style="font-family:georgia,serif;color:#9adaf3" >View Server Groups</h1>
             <p style="font-family:georgia,serif;color:#f9fcff">This will display SGG Groups associated with the server. Useful for checking if Elevated access groups exist.</p>  
              <table> 
                <tr><td>
                    <p style="font-family:georgia,serif;color:#f9fcff">
                    Enter Server here : &nbsp;<asp:TextBox ID="Input" runat="server"></asp:TextBox> &nbsp; &nbsp; &nbsp;
                   <asp:Button ID="ExecuteViewServerGroup" runat="server" Text="Check" Height="30" Width="175" style="font-family:verdana,geneva,sans-serif;" onclick="ExecuteViewServerGroup_Click"/>&nbsp;&nbsp;&nbsp;
                    </p>
                </td></tr> 
                <tr><td style="font-family:georgia,serif;color:#f9fcff"><br /><br />
                    <div style="float:left;margin-left: 50px;">
                      <asp:Table Class="resultstable" cellpadding="10" GridLines="Both" ID="ResultsTable" runat="server">
                         <asp:TableHeaderRow HorizontalAlign="center" ForeColor="#ff6860" runat="server">
                            <asp:TableHeaderCell>Local Administrators</asp:TableHeaderCell>
                            <asp:TableHeaderCell>Local RDP</asp:TableHeaderCell>
                            <asp:TableHeaderCell>Logon Locally</asp:TableHeaderCell>
                            <asp:TableHeaderCell>Local Power Users</asp:TableHeaderCell>
                            <asp:TableHeaderCell>Local Print Operators</asp:TableHeaderCell>
                         </asp:TableHeaderRow>
                        <asp:TableRow ID="TableRow1" HorizontalAlign="center" runat="server" ForeColor="">
                            <asp:TableCell ID="LocalAdminsCell" ></asp:TableCell>
                            <asp:TableCell ID="LocalRDPCell" ></asp:TableCell>
                            <asp:TableCell ID="LogonLocallyCell" ></asp:TableCell>
                            <asp:TableCell ID="LocalPowerUsersCell" ></asp:TableCell>
                            <asp:TableCell ID="LocalPrintOperatorsCell" Text="</br>"></asp:TableCell>
                        </asp:TableRow>
                      </asp:Table>
                    </div>
                    <div>
                      <asp:Label runat="server" ID="Result" style="font-family:georgia,serif;color:#ff6860" />
                    </div>
                </td></tr>

          
                    <tr><td>
                    <br /><br />
                    <h3 style="font-family:georgia,serif;color:#9adaf3;">Guide</h3><br /><br />
                    <p style="font-family:georgia,serif;color:#f9fcff">&nbsp; &nbsp;Enter the UNC path and click <span style="color:#ff6860;"><strong>Check</strong></span> to see the available SGG Groups.</p>
                    <br />
                    <p style="font-family:georgia,serif;color:#f9fcff">&nbsp; &nbsp;If you need to create WF or WO Groups, you may do so by going <strong><a href="CreateFolderPermissionGroup.aspx" style="text-decoration:none;color:#DF691A">here.</a></strong></p>       
                    </td></tr>

               </table>


               </div>
     
         
           

   
</asp:Content>