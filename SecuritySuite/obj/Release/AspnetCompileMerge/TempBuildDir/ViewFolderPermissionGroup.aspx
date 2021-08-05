<%@ Page Title="View Folder Permissions" Language="C#" AutoEventWireup="true" MasterPageFile="~/Alice.Master" CodeBehind="ViewFolderPermissionGroup.aspx.cs" Inherits="ExecutionViewFolderPermissionGroup.Default" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
  
            <div id="content" style="width:1000px; margin:auto auto;text-align:left;">
             <h1 style="font-family:georgia,serif;color:#9adaf3" >View Folder Permission Groups</h1>
             <p style="font-family:georgia,serif;color:#f9fcff">This will display users and groups who have privileges on a network folder.</p>  
              <table> 
                <tr><td>
                    <p style="font-family:georgia,serif;color:#f9fcff">
                    Enter shared folder here : &nbsp;<asp:TextBox ID="Input" width="450px" runat="server"></asp:TextBox> &nbsp; &nbsp;
                   <asp:Button ID="ExecuteViewFolderPermissionGroup" runat="server" Text="Check" Height="30" Width="100" style="font-family:verdana,geneva,sans-serif;font-size:16px" onclick="ExecuteViewFolderPermissionGroup_Click"/>&nbsp;&nbsp;&nbsp;Include Indirect?&nbsp;&nbsp;<asp:CheckBox ID="CheckBoxIndirect" style="font-family:georgia,serif;" runat="server" Text="  Yes"  AutoPostBack="true" />
                    </p>
                </td></tr> 
                <tr><td style="font-family:georgia,serif;color:#f9fcff"><br /><br />
                     </td></tr>
                    <tr><td>
                        <asp:Label ID="DirectPermissionsLabel" runat="server" Text="Direct Permissions" style="font-family:georgia,serif;color:#ff6860;font-size:20px" Visible="false"></asp:Label> <br /><br />
                       <asp:TextBox ID="ResultBox" TextMode="MultiLine" Width="600" Height="200" Visible="false"  runat="server" ></asp:TextBox>
                      <br /><br />
                         <asp:Label ID="IndirectPermissionsLabel" runat="server" Text="Indirect Permissions" style="font-family:georgia,serif;color:#ff6860;font-size:20px" Visible="false"></asp:Label> <br /><br />
                         <asp:TextBox ID="ResultBox2" TextMode="MultiLine" Width="600" Height="200" Visible="false"  runat="server" ></asp:TextBox>
                        <br />   
                    </td></tr>             
                    <tr><td>
                      <asp:Label runat="server" ID="Result" style="font-family:georgia,serif;color:#ff6860" />
                   </td></tr>

 
                    <tr><td>
                    <br /><br />
                    <h3 style="font-family:georgia,serif;color:#9adaf3;">Guide</h3><br /><br />
                    <p style="font-family:georgia,serif;color:#f9fcff">&nbsp; &nbsp;Enter the UNC path and click <span style="color:#ff6860;"><strong>Check</strong></span> to obtain a list of users and groups with permissions to the directory.</p>
                    <br />
                    <p style="font-family:georgia,serif;color:#f9fcff">&nbsp; &nbsp;If you need to create WF or WO Groups, you may do so by going <strong><a href="CreateFolderPermissionGroup.aspx" style="text-decoration:none;color:#19B5FE">here.</a></strong></p>       
               </table>


               </div>
     
         
           

   
</asp:Content>