﻿<%@ Page Title="Convert Generic Account" Language="C#" AutoEventWireup="true" MasterPageFile="~/Alice.Master" CodeBehind="ConvertGenericAccount.aspx.cs" Inherits="ExecutionConvertGenericAccount.Default" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
  
            <div id="content" style="width:1000px; margin:auto auto;text-align:left;">
             <h1 style="font-family:georgia,serif;color:#9adaf3" >Convert Generic Account</h1>
             <p style="font-family:georgia,serif;color:#f9fcff">This will convert an interactive generic account into a non-interactive one and vice versa.</p>  
              <table> 
                <tr><td>
                    <p style="font-family:georgia,serif;color:#f9fcff">
                    Enter Gena here : &nbsp;<asp:TextBox ID="Input" width="420px" runat="server"></asp:TextBox> &nbsp; &nbsp; <asp:Button ID="ExecuteConvertGenericAccount" runat="server" Text="Convert" Height="30" Width="175" style="font-family:verdana,geneva,sans-serif;" onclick="ExecuteConvertGenericAccount_Click"/>&nbsp;&nbsp;&nbsp; 
                    </p>
                    <br /><br /><br />
                    <div>
                       <asp:Label runat="server" ID="Result" style="font-family:georgia,serif;color:#ff6860;font-size:20px" />
                    </div>
                 <tr><td>
                    <br /><br />
                    <h3 style="font-family:georgia,serif;color:#9adaf3;">Guide</h3><br /><br />
                     <p style="font-family:georgia,serif;color:#f9fcff">&nbsp; &nbsp;This web tool will convert a generic account's interactivity status.</p> <br />
                     <p style="font-family:georgia,serif;color:#f9fcff">&nbsp; &nbsp;Click <span style="color:#ff6860;"><strong>Convert</strong></span> convert an interactive generic account into a non-interactive one and vice versa.</p> <br />    
               </table>
              </div>


     
           

   
</asp:Content>