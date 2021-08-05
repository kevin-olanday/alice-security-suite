<%@ Page Title="Rename Shared Mailbox" Language="C#" AutoEventWireup="true" MasterPageFile="~/Alice.Master" CodeBehind="RenameSharedMailbox.aspx.cs" Inherits="RenameMailboxExecution.Default" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


      <div style="width:1000px; margin:0 auto;text-align:left;">
         <h1 style="color:#9adaf3" >Rename Shared Mailbox</h1>
         <p style="color:#f9fcff">This will rename a shared mailbox as well as its corresponding permission groups.</p>   <hr />
          <table> 
            <tr><td>
                <p style="color:#f9fcff">
                Enter mailbox here : &nbsp;<asp:TextBox ID="Input" width="375px" Class="formtextbox" ontextchanged="Input_TextChanged" AutoPostBack="true" runat="server"  ></asp:TextBox> &nbsp; &nbsp;
               <asp:Button ID="ExecuteCheckMailbox" cssClass="aspButton"   runat="server" Text="Check"   onclick="ExecuteCheckSharedMailbox_Click"/>&nbsp;&nbsp;&nbsp;   <br /><br />               
                    <asp:Label runat="server" ID="ProcessMessage" style="color:#ff6860" /> &nbsp; &nbsp; &nbsp;
                </p>
           
            </td></tr> 
                <tr><td><br />
                     <div style="float:left;">
                      <asp:Panel ID= "ResultPanel" visible="false"  runat = "server">
                            <p style="color:#f9fcff">
                            Enter new name : <span style="display:inline-block; width: 26px;"></span><asp:TextBox ID="NewName" width="375px" Class="formtextbox"  runat="server" ></asp:TextBox> &nbsp; &nbsp;
                             <asp:Button ID="ExecuteRenameSharedMailbox" runat="server" Text="Rename"  OnClick="ExecuteRenameSharedMailbox_Click"  />&nbsp;&nbsp;&nbsp;<br /><br />
                                <asp:Label runat="server" ID="ResultMessage" style="color:#ff6860" /> &nbsp; &nbsp; &nbsp;                  
                             </p>

                      </asp:Panel><br />
                        </div>
                  </td></tr>
        
                <tr><td>
                <br /><br />
                 <h3 style="color:#9adaf3;">Guide</h3><br/><br/>
                <p style="color:#f9fcff">&nbsp; &nbsp;Enter the mailbox you need to rename and click <span style="color:#ff6860;"><strong>Check</strong></span> to verify the identity of the mailbox. </p> <br/>       
                <p style="color:#f9fcff">&nbsp; &nbsp;Once verified, enter the new name for the mailbox and click <span style="color:#ff6860;"><strong>Rename</strong></span>.  </p> <br/>       
                 </td></tr>
           </table>
       </div>


</asp:Content>