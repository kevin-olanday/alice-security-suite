﻿<%@ Page Title="Create Folder Permission Groups" Language="C#" AutoEventWireup="true" MasterPageFile="~/Alice.Master" CodeBehind="CreateFolderPermissionGroup.aspx.cs" Inherits="ExecutionCreateFolderPermissionGroup.Default" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
  
            <div id="content" style="width:1000px; margin:auto auto;text-align:left;">
             <h1 style="font-family:georgia,serif;color:#9adaf3" >Create Folder Permission Groups</h1>
             <p style="font-family:georgia,serif;color:#f9fcff">This will create Read/Write and Read Only groups for network folders.</p>  
              <table> 
                <tr><td>
                    <p style="font-family:georgia,serif;color:#f9fcff">
                    Enter folder here : &nbsp;<asp:TextBox ID="Input" width="420px" runat="server"></asp:TextBox> &nbsp; &nbsp; <asp:Button ID="ExecuteCreateWFPermissionGroups" runat="server" Text="Create WF" Height="30" Width="175" style="font-family:verdana,geneva,sans-serif;" onclick="ExecuteCreateWFPermissionGroups_Click"/>&nbsp;&nbsp;&nbsp; <asp:Button ID="ExecuteCreateWOPermissionGroups" runat="server" Text="Create WO" Height="30" Width="175" style="font-family:verdana,geneva,sans-serif;" onclick="ExecuteCreateWOPermissionGroups_Click"/>&nbsp;&nbsp;&nbsp;
                    </p>
                    <br /><br /><br />
                    <div>
                       <asp:Label runat="server" ID="Result" style="font-family:georgia,serif;color:#ff6860;font-size:20px" />
                    </div>
                 <tr><td>
                    <br /><br />
                    <h3 style="font-family:georgia,serif;color:#9adaf3;">Guide</h3><br /><br />
                     <p style="font-family:georgia,serif;color:#f9fcff">&nbsp; &nbsp;This web tool will create permission groups on network folders.</p> <br />
                     <p style="font-family:georgia,serif;color:#f9fcff">&nbsp; &nbsp;Click <span style="color:#ff6860;"><strong>Create WF</strong></span> when working with shared folders on file and print servers.</p> <br />    
                     <p style="font-family:georgia,serif;color:#f9fcff">&nbsp; &nbsp;Click <span style="color:#ff6860;"><strong>Create WO</strong></span> when working with shared folders on application and database servers.</p>     
               </table>
              </div>


     
           

   
</asp:Content>