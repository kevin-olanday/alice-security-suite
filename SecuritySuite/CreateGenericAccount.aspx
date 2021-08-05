<%@ Page Title="Create Generic Account" Language="C#" AutoEventWireup="true" MasterPageFile="~/Alice.Master" CodeBehind="CreateGenericAccount.aspx.cs" Inherits="ExecutionCreateGenericAccount.Default" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
  
            <div id="content" background-color:"black"  style="width:1000px; margin:auto auto;text-align:left;">
             <h1 style="color:#9adaf3" >Create Generic Account</h1>
             <p style="color:#f9fcff">This will create generic accounts in Active Directory.</p>   <hr />
              <table> 
                <tr><td>
                    <p style="color:#f9fcff">Choose the type of request : <asp:Button ID="DisplaySinglePanel" class="formbutton" runat="server" Text="Single"  onclick="DisplaySinglePanel_Click"/> |  <asp:Button ID="DisplayBulkPanel" class="formbutton" runat="server" Text="Bulk"  onclick="DisplayBulkPanel_Click"/></p><br /><br />
                    <asp:Panel ID= "SinglePanel" visible="false"  runat = "server">
      
                    <ul class="menu">
                    <li>&nbsp; &nbsp; Enter name here : <span style="display:inline-block; width: 32px;"></span><asp:TextBox id="genaname" Class="formtextbox" runat="server"></asp:TextBox>&nbsp;</li>
                    <li>&nbsp; &nbsp; Application domain : <span style="display:inline-block; width: 7.2px;"></span> <asp:TextBox id="genadomain" Class="formtextbox" runat="server"></asp:TextBox></li> 
                    <li>&nbsp; &nbsp; INC# : <span style="display:inline-block; width: 111px;"></span><asp:TextBox id="genaINC" Class="formtextbox" runat="server"></asp:TextBox></li>
                    <li>&nbsp; &nbsp; Password to set : <span style="display:inline-block; width: 40px;"></span><asp:TextBox id="genapassword" Class="formtextbox" runat="server"></asp:TextBox></li>  
                    <li>&nbsp; &nbsp; Is the account interactive? &nbsp; <asp:CheckBox ID="CheckBoxInteractive" style="" runat="server" Text="  Yes"  AutoPostBack="true" /></li>
                    </ul>
                    <br /><br />
                    <span style="display:inline-block; width: 200px;"></span><asp:Button ID="ExecuteCreateGenericAccount" cssClass="aspButton"  runat="server" Text="Create"  onclick="ExecuteCreateGenericAccount_Click"/>&nbsp;&nbsp;&nbsp;

                              </asp:Panel>
                    <asp:Panel ID= "BulkPanel" visible="false"  runat = "server">
                        <div class="panel">
  
                    <p style="color:#f9fcff">
                        Please import the Bulk template below: <br /> <br />
                            <asp:FileUpload id="FileUploadControl"  runat="server" />  <span style="display:inline-block; width: 50px;"></span><asp:Button ID="ImportButton" cssClass="aspButton"   runat="server" Text="Import"  onclick="UploadButton_Click"/>
                    
               
                    <br /><br />
                             
                     <asp:Label runat="server" id="StatusLabel" text="Upload status: Idle" /><span style="display:inline-block; width: 50px;"></span><asp:Button ID="ExecuteCreateGenericAccountBulkButton" cssClass="aspButton"   visible="false" runat="server" Text="Create"  onclick="ExecuteCreateGenericAccountBulk_Click"/>
                     </p>
                           </div> 
                   </asp:Panel>
                   
                </td></tr> 
                <tr><td style="color:#f9fcff"><br /><br />
                    <div>
                       <asp:Label runat="server" ID="Result" style="color:#ff6860;font-size:20px" />
                        <asp:Label runat="server" ID="Filename" Visible="false" style="color:#ff6860;font-size:20px" />
                    </div>
                </td></tr>

          
                    <tr><td>
                    <br />
                    <h3 style="color:#9adaf3;">Guide</h3><br /><br />
                    <p style="color:#f9fcff">&nbsp; &nbsp; For <span style="color:#ff6860;"><strong>Single</strong></span> generic account requests, simply fill up the form and click <span style="color:#ff6860;"><strong>Create</strong></span>.</p><br />       
                    <p style="color:#f9fcff">&nbsp; &nbsp; For <span style="color:#ff6860;"><strong>Bulk</strong></span> generic account requests, <span style="color:#ff6860;"><strong>Import</strong></span> the bulk generic account template and click <span style="color:#ff6860;"><strong>Create</strong></span>.</p><br /><br />
                    <p style="color:#f9fcff">&nbsp; &nbsp; The bulk generic account template can be downloaded <strong><asp:LinkButton class="downloadlink" onclick="BulkTemplate_Download" runat="server" >here.</asp:LinkButton></strong></p>
                    </td></tr>

               </table>
               </div>
     
         
           

   
</asp:Content>