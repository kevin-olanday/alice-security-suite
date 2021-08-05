<%@ Page Title="Home Page" Language="C#" MasterPageFile="Alice.master" AutoEventWireup="true"
    CodeBehind="FeedTest.aspx.cs" Inherits="ReadFromTextFileToTextBoxWebApp._Default" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Welcome to ASP.NET!
    </h2>
     <div>
        <asp:HiddenField ID="HiddenField1" runat="server" />
                <asp:label runat="server" ID="feedtest"></asp:label>
        <p id="pTextData">
     
        </p>
     </div>
</asp:Content>