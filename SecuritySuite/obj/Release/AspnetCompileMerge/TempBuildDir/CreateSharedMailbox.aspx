<%@ Page Title="Create Shared Mailbox" Language="C#" AutoEventWireup="true" MasterPageFile="~/Alice.Master" CodeBehind="CreateSharedMailbox.aspx.cs" Inherits="ExecutionCreateSharedMailbox.Default" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
  
            <div id="content" style="width:1000px; margin:auto auto;text-align:left;">
             <h1 style="font-family:georgia,serif;color:#9adaf3" >Create Shared Mailbox</h1>
             <p style="font-family:georgia,serif;color:#f9fcff">This will create shared mailboxes and their corresponding permission groups.</p>  
              <table> 
                <tr><td>
                    <p style="font-family:georgia,serif;color:#f9fcff">Choose the type of request : <asp:Button ID="DisplaySinglePanel" class="formbutton" runat="server" Text="Single"  onclick="DisplaySinglePanel_Click"/> |  <asp:Button ID="DisplayBulkPanel" class="formbutton" runat="server" Text="Bulk"  onclick="DisplayBulkPanel_Click"/></p><br /><br />
                    <asp:Panel ID= "SinglePanel" visible="false"  runat = "server">
                    <ul class="menu">
                        <li>&nbsp; &nbsp; Enter mailbox name : <span style="display:inline-block; width: 20px;"></span><asp:TextBox id="MailboxName" Class="formtextbox" runat="server" Width="250px"></asp:TextBox>&nbsp;</li>
                        <li>&nbsp; &nbsp; Alias / Logon Name : <span style="display:inline-block; width: 19px;"></span> <asp:TextBox id="Alias" Class="formtextbox" runat="server" Width="250px" Placeholder=" Must not exceed 20 characters"></asp:TextBox></li>
                        <li>&nbsp; &nbsp; INC number : <span style="display:inline-block; width: 75px;"></span><asp:TextBox id="INC" Class="formtextbox" runat="server" Width="250px"></asp:TextBox></li> 
                        <li>&nbsp; &nbsp; Mailbox owner : <span style="display:inline-block; width: 58px;"></span><asp:TextBox id="Owner" Class="formtextbox" runat="server" Width="250px"></asp:TextBox></li>
                        <li>&nbsp; &nbsp; PBO : <span style="display:inline-block; width: 132px;"></span><asp:TextBox id="PBO" Class="formtextbox" runat="server" Width="250px"></asp:TextBox>
                        <li>&nbsp; &nbsp; Group : <span style="display:inline-block; width: 119px;"></span><asp:TextBox id="Group" Class="formtextbox" runat="server" Width="250px" Placeholder=" e.g. Banking and Financial Services"></asp:TextBox>
                        <li>&nbsp; &nbsp; Approvers : <span style="display:inline-block; width: 90px;"></span><asp:TextBox id="Approvers" Class="formtextbox" runat="server" Width="250px" Placeholder=" Mail Approvers XXX"></asp:TextBox>
                        <li> &nbsp; &nbsp; Members : <span style="display:inline-block; width: 96.5px;"></span><asp:TextBox id="FullAccessMembers" Class="formtextbox" runat="server" Width="250px" Rows="5" Textmode="MultiLine" Placeholder=" Separate by new line (enter)"></asp:TextBox>
                        </li>
                    </ul>
                    <br /><br />
                    <span style="display:inline-block; width: 200px;"></span><asp:Button ID="ExecuteCreateSharedMailbox" runat="server" Text="Create" Height="30" Width="175" style="font-family:verdana,geneva,sans-serif;" onclick="ExecuteCreateSharedMailbox_Click"/>&nbsp;&nbsp;&nbsp;
               
                     </asp:Panel>
                     </td></tr> 
                   <tr><td style="font-family:georgia,serif;color:#f9fcff"><br /><br />
                   <div>
                       <asp:Label runat="server" ID="Result" style="font-family:georgia,serif;color:#ff6860;font-size:20px" />
                   </div>
                   </td></tr>
                            
                   <tr><td>
                   <br />
                   <h3 style="font-family:georgia,serif;color:#9adaf3;">Guide</h3><br /><br />
                   <p style="font-family:georgia,serif;color:#f9fcff">&nbsp; &nbsp;Choose whether you want to create a single mailbox or otherwise. <br />&nbsp; &nbsp;Fill up the form and click <span style="color:#ff6860;"><strong>Create</strong></span> to create the shared mailbox/es.</p>       
                   </td></tr>

               </table>
               </div>
          

   
</asp:Content>