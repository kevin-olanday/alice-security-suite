<%@ Page Title="Check Folder Approvers" Language="C#" AutoEventWireup="true" MasterPageFile="~/Alice.Master" CodeBehind="CheckFolderApprovers.aspx.cs" Inherits="CheckFolderApproversExecution.Default" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
      <div style="width:1000px; margin:0 auto;text-align:left;">
         <h1 style="font-family:georgia,serif;color:#9adaf3" >Check Folder Approvers</h1>
         <p style="font-family:georgia,serif;color:#f9fcff">This will query a directory and output the corresponding approvers and permission groups.</p>  
          <table> 
            <tr><td>
                <p style="font-family:georgia,serif;color:#f9fcff">
                Enter shared folder here : &nbsp;<asp:TextBox ID="Input" width="450px" Class="formtextbox" placeholder=" \\servername\shared\folder\path" runat="server" ></asp:TextBox> &nbsp; &nbsp;
               <asp:Button ID="ExecuteCodeLAN" runat="server" Text="Check" Height="30" Width="175" style="font-family:verdana,geneva,sans-serif;" onclick="ExecuteCheckFolderApprovers_Click"/>&nbsp;&nbsp;&nbsp; <br /><br />                  
                    <asp:Label runat="server" ID="ProcessMessage" style="font-family:georgia,serif;color:#ff6860" /> &nbsp; &nbsp; &nbsp;
                </p>
           
            </td></tr> 
                <tr><td><br />
                     <div style="float:left;margin-left: 50px;">
                      <asp:Panel ID= "ResultPanel" visible="false"  runat = "server">

                        <asp:Table Class="resultstable" cellpadding="10" GridLines="Both" ID="ResultsTable" runat="server">
                         <asp:TableHeaderRow HorizontalAlign="center" ForeColor="#ff6860" runat="server">
                            <asp:TableHeaderCell>Approvers</asp:TableHeaderCell>
                            <asp:TableHeaderCell>Suggested RO group</asp:TableHeaderCell>
                            <asp:TableHeaderCell>Suggested RW group</asp:TableHeaderCell>
                        </asp:TableHeaderRow>
                        <asp:TableRow ID="TableRow1" HorizontalAlign="center" runat="server" ForeColor="">
                            <asp:TableCell ID="ApproversCell" ></asp:TableCell>
                            <asp:TableCell ID="SuggestedROGroupCell" ></asp:TableCell>
                            <asp:TableCell ID="SuggestedRWGroupCell" text="<br>"></asp:TableCell>
                        </asp:TableRow>
                      </asp:Table>
                          </asp:Panel><br />
                        </div>
                  </td></tr>
        
                <tr><td>
                <br /><br />
                 <h3 style="font-family:georgia,serif;color:#9adaf3;">Guide</h3><br/><br/>
                <p style="font-family:georgia,serif;color:#f9fcff">&nbsp; &nbsp;Enter the UNC path and click <span style="color:#ff6860;"><strong>Check</strong></span> to obtain the approvers for that directory. </p> <br/>       
                <p style="font-family:georgia,serif;color:#f9fcff">&nbsp; &nbsp;The tool will also suggest permission groups for both read only and read/write access. </p> <br/>       
                 </td></tr>
           </table>
       </div>
</asp:Content>