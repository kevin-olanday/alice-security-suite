<%@ Page Title="Create Server Group" Language="C#" AutoEventWireup="true" MasterPageFile="~/Alice.Master" CodeBehind="CreateServerGroup.aspx.cs" Inherits="ExecutionCreateServerGroup.Default" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
  
            <div id="content" style="width:1000px; margin:auto auto;text-align:left;">
             <h1 style="color:#9adaf3" >Create Server Group</h1>
             <p style="color:#f9fcff">This will create elevated (SGG) server groups.</p>   <hr />
              <table> 
                <tr><td>
                    <p style="color:#f9fcff">
                    Enter Server here : &nbsp;<asp:TextBox ID="Input" runat="server"></asp:TextBox> &nbsp; &nbsp; &nbsp;
                   <asp:Button cssClass="aspButton"  ID="ExecuteCreateServerGroup" runat="server" Text="Create"  onclick="ExecuteCreateServerGroup_Click"/>&nbsp;&nbsp;&nbsp;
                    </p>
                </td></tr> 
                <tr><td style="color:#f9fcff"><br /><br />
                    <div style="float:left;margin-right: 100px;">
                      &nbsp; &nbsp; <asp:CheckBox ID="CheckBoxAdmin" style="color:#9adaf3;" runat="server" Text="  Local Administrators"  AutoPostBack="true" /><br /><br />
                      &nbsp; &nbsp; <asp:CheckBox ID="CheckBoxRDP" style="color:#9adaf3;" runat="server" Text="  Local Remote Desktop Users"  AutoPostBack="true" /><br /><br />
                      &nbsp; &nbsp; <asp:CheckBox ID="CheckBoxLocal" style="color:#9adaf3;" runat="server" Text="  Logon Locally Group" AutoPostBack="true" /><br /><br />
                      &nbsp; &nbsp; <asp:CheckBox ID="CheckBoxPower" style="color:#9adaf3;" runat="server" Text="  Local Power Users"  AutoPostBack="true" /><br /><br />
                      &nbsp; &nbsp; <asp:CheckBox ID="CheckBoxPrint" style="color:#9adaf3;" runat="server" Text="  Local Print Operators" AutoPostBack="true" /><br /> <br />                
                    </div>
                    <div>
                      <asp:Label runat="server" ID="Result" style="color:#ff6860" />
                    </div>
                </td></tr>

          
                    <tr><td>
                    <br /><br />
                    <h3 style="color:#9adaf3;">Guide</h3><br /><br />
                    <p style="color:#f9fcff">&nbsp; &nbsp;Tick the groups you want to be created then click <span style="color:#ff6860;"><strong>Create</strong></span> to create the corresponding groups.</p>       
                    </td></tr>

               </table>
               </div>
     
         
           

   
</asp:Content>