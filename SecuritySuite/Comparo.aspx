<%@ Page Title="Comparo" Language="C#" AutoEventWireup="true" MasterPageFile="~/Alice.Master" CodeBehind="Comparo.aspx.cs" Inherits="ComparoExecution.Default" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <div style="width:1000px; margin:0 auto;text-align:left;">
         <h1 style="color:#9adaf3" >Comparo</h1>  
                <p style="color:#f9fcff">A lightweight web-based tool for comparing AD group memberships.</p>  <hr />
            <table> 
             <tr><td>
  
                  <div style="float:left;color:#f9fcff;margin-right:30px" >
                        Enter User A here : &nbsp;<asp:TextBox ID="InputA" runat="server" BackColor="#F3F3F3" BorderStyle="None" ></asp:TextBox><br/>
                        <br />
                        <asp:Label runat="server" ID="Label1" style="color:#ff6860" />
                  </div>
                  
                  <div style="float:left;color:#f9fcff;margin-right:30px" >
                        Enter User B here : &nbsp;<asp:TextBox ID="InputB" runat="server" BackColor="#F3F3F3" BorderStyle="None" ></asp:TextBox><br />
                        <br />
                        <asp:Label runat="server" ID="Label2" style="color:#ff6860" />
                  </div>
           
                  <asp:Button ID="ButtonExecuteComparo" cssClass="aspButton"  runat="server" Text="Compare!"  onclick="ExecuteComparo"/>&nbsp;
                  
              </td></tr>
        
              <tr><td>
        
                   <div style="float:left;margin-right: 25px;">
                        <h4 style="color:#9adaf3;text-align:center;position:relative;">Unique to User A</h4>
                         <asp:TextBox ID="ResultBox" TextMode="MultiLine" Width="450" Height="500" runat="server" BackColor="#F3F3F3" BorderStyle="None"></asp:TextBox>
                   </div>
         
                   <div style="float:left;margin-right: 25px;">
                        <h4 style="color:#9adaf3;text-align:center;position:relative;">Unique to User B</h4>
                          <asp:TextBox ID="ResultBox2" TextMode="MultiLine" Width="450" Height="500" runat="server" BackColor="#F3F3F3" BorderStyle="None"></asp:TextBox>
                   </div>
              
    
              </td></tr>

              <tr><td>
                  <br/>
                   <h3 style="color:#9adaf3;">Guide</h3><br /><br/>
                   <p style="color:#f9fcff">&nbsp; &nbsp;Click <span style="color:#ff6860"><strong>Compare!</strong></span> to compare the AD group memberships of <span style="color:#9adaf3;"><strong>User A</strong></span> and <span style="color:#9adaf3;"><strong>User B</strong></span>.</p>       
              </td></tr>
  
          </table>
    </div>

</asp:Content>