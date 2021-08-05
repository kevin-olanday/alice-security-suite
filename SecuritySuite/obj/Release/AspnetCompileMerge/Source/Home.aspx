<%@ Page Title="Welcome" Language="C#" MasterPageFile="~/Alice.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="AliceOnline.Default" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    	<div id="content">
             <br />
             <div class="center">
                    <asp:Image  ID="Image1" runat="server" ImageUrl="~/Images/weblogo.png" BorderStyle="None"  />
                    <br />
                    <p >The <strong style="color:#9adaf3">Automated Lightweight Interface Control Environment</strong> will help you process Security LAN requests.</p>
             </div> <br />     
                 
        <div class="subcontent">
             <span style="display:inline-block; height: 50px;"></span>
              <ul class="metro">
  <li><i class="fa fa-group"></i><span>AD Groups</span></li>
  <li><i class="fa fa-envelope"></i><span>Mailboxes</span></li>
  <li><i class="fa fa-android"></i><span>Gen. Accounts</span></li>
  <li><i class="fa fa-folder-open-o"></i><span>Shared Folders</span></li>
  <li><i class="fa fa-laptop"></i><span>Server Groups</span></li>
  <li><i class="fa fa-calendar"></i><span>Calendars</span></li>
  <li><i class="fa fa-search"></i><span>AD Queries</span></li>
  <li><i class="fa fa-heart-o"></i><span>Favorites</span></li>
  
</ul>
                    <span style="display:inline-block; height: 360px;"></span>
             
  
            <!--
             <table style="display: inline-table;" cellspacing="20" width="900px">
                 <tr>
                    <td style="width:420px">
                       <div style="float:left;margin-right:25px;">
                       <a href="~/Aporia.aspx" runat="server" >
                          <img src="~/Images/aporialogo.png" width="100" height="100"  alt="Aporia Logo" runat="server"  /></a>
                       <br />
                       </div>
                      <br />

                      <a class="link" href="~/aporia.aspx" runat="server">Aporia</a>
                      <p class="list">A lightweight web-based tool for handling STL transfer requests.</p>
                       <br />
                    </td>

                    <td style="width:420px">
                       <div style="float:left;margin-right:25px;">
                       <a href="~/createfolderpermissiongroup.aspx" runat="server" >
                          <img src="~/Images/createfolderpermissiongrouplogo.png" width="100" height="100"  alt="Create Permission Group Logo" runat="server"  /></a>
                       <br />
                       </div>
                      <br />

                      <a class="link" href="~/createfolderpermissiongroup.aspx" runat="server">Create Folder Permission Group</a>
                      <p class="list">Use this to create Read/Write and Read Only groups for network folders.(WO/WF - RO/RW)</p>
                       <br />
                    </td>
                  </tr>   
                  <tr>
                    <td style="width:420px">
                       <div style="float:left;margin-right:25px;">
                       <a href="~/createservergroup.aspx" runat="server" >
                          <img src="~/Images/createservergrouplogo.png" width="100" height="100"  alt="Create Server Group Logo" runat="server"  /></a>
                       <br />
                       </div>
                      <br />

                      <a class="link" href="~/createservergroup.aspx" runat="server">Create Server Group</a>
                      <p class="list">Use this to create elevated (SGG) server groups.(WO/WF - RO/RW)</p>
                       <br />
                    </td>

                    <td style="width:420px">
                       <div style="float:left;margin-right:25px;">
                       <a href="~/createsharedmailbox.aspx" runat="server" >
                          <img src="~/Images/createmailboxlogo.png" width="100" height="100" alt="Create Shared Mailbox Logo" runat="server" /></a>
                       </div>
                       <br />
                       <a class="link" href="~/viewscreatesharedmailbox.aspx" runat="server" >Create Shared Mailbox</a>
                       <p class="list">Use this to create shared mailboxes and their corresponding permission groups.</p>
                       <br />
                    </td>        

                  </tr>  
                    <tr>
                    <td style="width:420px">
                       <div style="float:left;margin-right:25px;">
                       <a href="~/creategenericaccount.aspx" runat="server" >
                          <img src="~/Images/creategenalogo.png" width="100" height="100" alt="Create Generic Account Logo" runat="server" /></a>
                       </div>
                       <br />
                       <a class="link" href="~/creategenericaccount.aspx" runat="server" >Create Generic Account</a>
                       <p class="list">Use this to create generic accounts in Active Directory.</p>
                       <br />
                    </td>
                    <td style="width:420px">
                       <div style="float:left;margin-right:25px;">
                       <a href="~/convertgenericaccount.aspx" runat="server" >
                          <img src="~/Images/modifygenalogo.png" width="100" height="100" alt="Convert Generic Account logo" runat="server" /></a>
                       </div>
                       <br />
                       <a class="link" href="~/convertgenericaccount.aspx" runat="server" >Convert Generic Account</a>
                       <p class="list">Use this to convert an interactive generic account into a non-interactive one and vice versa.</p>
                       <br />
                    </td>        

                  </tr>  
 
              </table>
            --></table>
            </div>
          </div>
			
</asp:Content>