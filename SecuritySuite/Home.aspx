<%@ Page Title="Welcome" Language="C#" MasterPageFile="~/Alice.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="AliceOnline.Default" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    	<div id="content">
             <br />
             <div class="center">
                    <asp:Image  ID="Image1" runat="server" ImageUrl="~/Images/weblogo.png" BorderStyle="None"  />
                    <br />
                    <img src="images/therearenocentaursinoxford.png" class="alice" alt="">
             </div> <br />     
                 
            <div class="subcontent">
                 <span style="display:inline-block; height: 50px;"></span>
                 <ul class="metro">
                       <li><i class="icon icon-world"></i><span>AD Groups</span></li>
                      <li><i class="icon icon-mail"></i><span>Mailboxes</span></li>
                      <li><i class="icon icon-male"></i><span>Gen. Accounts</span></li>
                      <li><i class="icon icon-wallet"></i><span>Shared Folders</span></li>
                      <li><i class="icon icon-display"></i><span>Server Groups</span></li>
                      <li><i class="icon icon-calendar"></i><span>Calendars</span></li>
                      <li><i class="icon icon-search"></i><span>AD Queries</span></li>
                      <li><i class="icon icon-heart"></i><span>Favorites</span></li>
                </ul>
                <span style="display:inline-block; height: 360px;"></span>             
            </div>

        
      </div>		
</asp:Content>