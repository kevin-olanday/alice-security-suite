<%@ Page Title="Aporia" Language="C#" AutoEventWireup="true" MasterPageFile="~/Alice.Master" CodeBehind="Aporia.aspx.cs" Inherits="AporiaExecution.Default" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
      <div style="width:1000px; margin:0 auto;text-align:left;">
         <h1 style="font-family:georgia,serif;color:#9adaf3" > Apor&iacute;a</h1>
         <p style="font-family:georgia,serif;color:#f9fcff">A lightweight web-based tool for handling STL transfer requests.</p>  
          <table> 
            <tr><td>
                <p style="font-family:georgia,serif;color:#f9fcff">
                Enter User ID here : &nbsp;<asp:TextBox ID="Input" runat="server"></asp:TextBox> &nbsp; &nbsp; &nbsp;
               <asp:Button ID="ExecuteCodeLAN" runat="server" Text="LAN" Height="30" Width="175" style="font-family:verdana,geneva,sans-serif;" onclick="ExecuteCodeLAN_Click"/>&nbsp;&nbsp;&nbsp;
               <asp:Button ID="ExecuteCodeAPPSDB" runat="server" Text="Apps/DB" Height="30" Width="175" style="font-family:verdana,geneva,sans-serif;" onclick="ExecuteCodeAPPSDB_Click"/>&nbsp;&nbsp;&nbsp;
                <asp:Button ID="FullList" runat="server" Text="Full List" Height="30" Width="175" style="font-family:verdana,geneva,sans-serif;" onclick="ExecuteCodeFullList_Click"/><br><br>
                <asp:Label runat="server" ID="ProcessMessage" style="font-family:georgia,serif;color:#ff6860" /> &nbsp; &nbsp; &nbsp;<asp:Button ID="ExportButton" runat="server" Text="Download CSV" Height="35" Width="200" style="font-family:verdana,geneva,sans-serif;" visible = "false" onclick="ExportButton_Click"/>
                </p>
            </td></tr> 
            <tr><td>
                <h3 style="font-family:georgia,serif;color:#9adaf3;">Result:</h3><br />
            </td></tr>
                <tr><td>
                    <asp:TextBox ID="ResultBox" TextMode="MultiLine" Width="850" Height="470" runat="server" ></asp:TextBox>
                </td></tr>
                <td>&nbsp; &nbsp;</td>
          
                <tr><td>
                 <h3 style="font-family:georgia,serif;color:#9adaf3;">Guide</h3><br/><br/>
                <p style="font-family:georgia,serif;color:#f9fcff">&nbsp; &nbsp;Click <span style="color:#ff6860;"><strong>LAN</strong></span> when working on STL transfers tickets assigned to Security LAN-GLobal.</p> <br/>       
                <p style="font-family:georgia,serif;color:#f9fcff">&nbsp; &nbsp;Click <span style="color:#ff6860;"><strong>APPS/DB</strong></span> when working on STL, Name change, and Staff Departure tickets assigned to Security Unix/Sybase-GLobal.</p><br/>      
                <p style="font-family:georgia,serif;color:#f9fcff">&nbsp; &nbsp;Click <span style="color:#ff6860;"><strong>Full List</strong></span> to retrieve all of the user's current AD groups.</p>     
                </td></tr>
           </table>
       </div>
</asp:Content>