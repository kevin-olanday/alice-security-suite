<%@ Page Title="Create AD Group" Language="C#" AutoEventWireup="true" MasterPageFile="~/Alice.Master" CodeBehind="CreateADGroup.aspx.cs" Inherits="ExecutionCreateADGroup.Default" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
  
            <div id="content" style="width:1000px; margin:auto auto;text-align:left;">
             <h1 style="font-family:georgia,serif;color:#9adaf3" >Create AD Group</h1>
             <p style="font-family:georgia,serif;color:#f9fcff">This will create user groups in Active Directory.</p>  
              <table> 
                <tr><td>
                    <p style="font-family:georgia,serif;color:#f9fcff">Choose the type of request : <asp:Button ID="DisplaySinglePanel" class="formbutton" runat="server" Text="Single"  onclick="DisplaySinglePanel_Click"/> |  <asp:Button ID="DisplayBulkPanel" class="formbutton" runat="server" Text="Bulk"  onclick="DisplayBulkPanel_Click"/></p><br /><br />
                    <asp:Panel ID= "SinglePanel" visible="false"  runat = "server">                       
                        <p style="font-family:georgia,serif;color:#f9fcff">Choose the type of group to create : <asp:Button ID="DisplayACGPanel" class="formbutton" runat="server" Text="ACG"  onclick="DisplayACGPanel_Click"/> |  <asp:Button ID="DisplayAGGPanel" class="formbutton" runat="server" Text="AGG"  onclick="DisplayAGGPanel_Click"/> |  <asp:Button ID="DisplayAPPPanel" class="formbutton" runat="server" Text="APP"  onclick="DisplayAPPPanel_Click"/> |  <asp:Button ID="DisplayDGPanel" class="formbutton" runat="server" Text="DG"  onclick="DisplayDGPanel_Click"/> |  <asp:Button ID="DisplayDMDLPanel" class="formbutton" runat="server" Text="DMDL"  onclick="DisplayDMDLPanel_Click"/> |  <asp:Button ID="DisplayRADLPanel" class="formbutton" runat="server" Text="RADL"  onclick="DisplayRADLPanel_Click"/> |  <asp:Button ID="DisplaySMDLPanel" class="formbutton" runat="server" Text="SMDL"  onclick="DisplaySMDLPanel_Click"/></p><br /><br />
                        <asp:Panel ID= "ACGPanel" visible="false"  runat = "server">
                        <ul class="menu">
                            <li>&nbsp; &nbsp; Enter ACG group name : <span style="display:inline-block; width: 20px;"></span><asp:TextBox id="ACGGroup" Class="formtextbox" runat="server" Width="250px"></asp:TextBox>&nbsp;</li>
                            <li>&nbsp; &nbsp; Description : <span style="display:inline-block; width: 97px;"></span> <asp:TextBox id="ACGDescription" Class="formtextbox" runat="server" Width="400px"></asp:TextBox></li> 
                            <li>&nbsp; &nbsp; Notes : <span style="display:inline-block; width: 143px;"></span><asp:TextBox id="ACGNotes" Class="formtextbox" runat="server" Width="400px"></asp:TextBox></li>
                            <li>&nbsp; &nbsp; ManagedBy : <span style="display:inline-block; width: 100px;"></span><asp:TextBox id="ACGManagedBy" Class="formtextbox" runat="server" Width="250px"></asp:TextBox>
                            <li> &nbsp; &nbsp; Members : <span style="display:inline-block; width: 117px;"></span><asp:TextBox id="ACGMembers" Class="formtextbox" runat="server" Width="250px" Rows="5" Textmode="MultiLine" Placeholder="Separate by new line (enter)"></asp:TextBox>
                            </li>
                        </ul>
                        <br /><br />
                        <span style="display:inline-block; width: 200px;"></span><asp:Button ID="ExecuteCreateACGGroup" runat="server" Text="Create" Height="30" Width="175" style="font-family:verdana,geneva,sans-serif;" onclick="ExecuteCreateADGroup_Click"/>&nbsp;&nbsp;&nbsp;
                       </asp:Panel>
      
                        <asp:Panel ID= "AGGPanel" visible="false"  runat = "server">
                        <ul class="menu">
                            <li>&nbsp; &nbsp; Enter AGG group name : <span style="display:inline-block; width: 20px;"></span><asp:TextBox id="AGGGroup" Class="formtextbox" runat="server" Width="250px"></asp:TextBox>&nbsp;</li>
                            <li>&nbsp; &nbsp; Description : <span style="display:inline-block; width: 97px;"></span> <asp:TextBox id="AGGDescription" Class="formtextbox" runat="server" Width="400px"></asp:TextBox></li> 
                            <li>&nbsp; &nbsp; Notes : <span style="display:inline-block; width: 143px;"></span><asp:TextBox id="AGGNotes" Class="formtextbox" runat="server" Width="400px"></asp:TextBox></li>
                            <li>&nbsp; &nbsp; ManagedBy : <span style="display:inline-block; width: 100px;"></span><asp:TextBox id="AGGManagedBy" Class="formtextbox" runat="server" Width="250px"></asp:TextBox> </li>
                            <li> &nbsp; &nbsp; Members : <span style="display:inline-block; width: 117px;"></span><asp:TextBox id="AGGMembers" Class="formtextbox" runat="server" Width="250px" Rows="5" Textmode="MultiLine" Placeholder="Separate by new line (enter)"></asp:TextBox>
                            </li>

                        </ul>
                        <br /><br />
                        <span style="display:inline-block; width: 200px;"></span><asp:Button ID="ExecuteCreateAGGGroup" runat="server" Text="Create" Height="30" Width="175" style="font-family:verdana,geneva,sans-serif;" onclick="ExecuteCreateADGroup_Click"/>&nbsp;&nbsp;&nbsp;
                       </asp:Panel>
                                   
                        <asp:Panel ID= "APPPanel" visible="false"  runat = "server">
                        <ul class="menu">
                            <li>&nbsp; &nbsp; Enter APP group name : <span style="display:inline-block; width: 20px;"></span><asp:TextBox id="APPGroup" Class="formtextbox" runat="server" Width="250px"></asp:TextBox>&nbsp;</li>
                            <li>&nbsp; &nbsp; Description : <span style="display:inline-block; width: 97px;"></span> <asp:TextBox id="APPDescription" Class="formtextbox" runat="server" Width="400px"></asp:TextBox></li> 
                            <li>&nbsp; &nbsp; Notes : <span style="display:inline-block; width: 143px;"></span><asp:TextBox id="APPNotes" Class="formtextbox" runat="server" Width="400px"></asp:TextBox></li>
                            <li>&nbsp; &nbsp; ManagedBy : <span style="display:inline-block; width: 100px;"></span><asp:TextBox id="APPManagedBy" Class="formtextbox" runat="server" Width="250px"></asp:TextBox> </li>
                            <li> &nbsp; &nbsp; Members : <span style="display:inline-block; width: 117px;"></span><asp:TextBox id="APPMembers" Class="formtextbox" runat="server" Width="250px" Rows="5" Textmode="MultiLine" Placeholder="Separate by new line (enter)"></asp:TextBox>
                        </ul>
                        <br /><br />
                        <span style="display:inline-block; width: 200px;"></span><asp:Button ID="ExecuteCreateAPPGroup" runat="server" Text="Create" Height="30" Width="175" style="font-family:verdana,geneva,sans-serif;" onclick="ExecuteCreateADGroup_Click"/>&nbsp;&nbsp;&nbsp;
                       </asp:Panel>
                 
                         <asp:Panel ID= "DGPanel" visible="false"  runat = "server">
                        <ul class="menu">
                            <li>&nbsp; &nbsp; Enter DG group name : <span style="display:inline-block; width: 27px;"></span><asp:TextBox id="DGGroup" Class="formtextbox" runat="server" Width="250px"></asp:TextBox>&nbsp;</li>
                            <li>&nbsp; &nbsp; Description : <span style="display:inline-block; width: 97px;"></span> <asp:TextBox id="DGDescription" Class="formtextbox" runat="server" Width="400px"></asp:TextBox></li> 
                            <li>&nbsp; &nbsp; Notes : <span style="display:inline-block; width: 143px;"></span><asp:TextBox id="DGNotes" Class="formtextbox" runat="server" Width="400px"></asp:TextBox></li>
                             <li> &nbsp; &nbsp; Members : <span style="display:inline-block; width: 117px;"></span><asp:TextBox id="DGMembers" Class="formtextbox" runat="server" Width="250px" Rows="5" Textmode="MultiLine" Placeholder="Separate by new line (enter)"></asp:TextBox>
                        </ul>
                        <br /><br />
                        <span style="display:inline-block; width: 200px;"></span><asp:Button ID="ExecuteCreateDGGroup" runat="server" Text="Create" Height="30" Width="175" style="font-family:verdana,geneva,sans-serif;" onclick="ExecuteCreateADGroup_Click"/>&nbsp;&nbsp;&nbsp;
                       </asp:Panel>

                
                         <asp:Panel ID= "DMDLPanel" visible="false"  runat = "server">
                        <ul class="menu">
                            <li>&nbsp; &nbsp; Enter DMDL group name : <span style="display:inline-block; width: 3px;"></span><asp:TextBox id="DMDLGroup" Class="formtextbox" runat="server" Width="250px"></asp:TextBox>&nbsp;</li>
                            <li>&nbsp; &nbsp; Description : <span style="display:inline-block; width: 97px;"></span> <asp:TextBox id="DMDLDescription" Class="formtextbox" runat="server" Width="400px"></asp:TextBox></li> 
                            <li>&nbsp; &nbsp; Notes : <span style="display:inline-block; width: 143px;"></span><asp:TextBox id="DMDLNotes" Class="formtextbox" runat="server" Width="400px"></asp:TextBox></li>
                            <li>&nbsp; &nbsp; ManagedBy : <span style="display:inline-block; width: 100px;"></span><asp:TextBox id="DMDLManagedBy" Class="formtextbox" runat="server" Width="250px"></asp:TextBox> </li>
                            <li> &nbsp; &nbsp; Members : <span style="display:inline-block; width: 117px;"></span><asp:TextBox id="DMDLMembers" Class="formtextbox" runat="server" Width="250px" Rows="5" Textmode="MultiLine" Placeholder="Separate by new line (enter)"></asp:TextBox>
                            </ul>
                        <br /><br />
                        <span style="display:inline-block; width: 200px;"></span><asp:Button ID="ExecuteCreateDMDLGroup" runat="server" Text="Create" Height="30" Width="175" style="font-family:verdana,geneva,sans-serif;" onclick="ExecuteCreateADGroup_Click"/>&nbsp;&nbsp;&nbsp;
                       </asp:Panel>

                           
                         <asp:Panel ID= "RADLPanel" visible="false"  runat = "server">
                        <ul class="menu">
                            <li>&nbsp; &nbsp; Enter RADL group name : <span style="display:inline-block; width: 7px;"></span><asp:TextBox id="RADLGroup" Class="formtextbox" runat="server" Width="250px"></asp:TextBox>&nbsp;</li>
                            <li>&nbsp; &nbsp; Description : <span style="display:inline-block; width: 97px;"></span> <asp:TextBox id="RADLDescription" Class="formtextbox" runat="server" Width="400px"></asp:TextBox></li> 
                            <li>&nbsp; &nbsp; Notes : <span style="display:inline-block; width: 143px;"></span><asp:TextBox id="RADLNotes" Class="formtextbox" runat="server" Width="400px"></asp:TextBox></li>
                            <li>&nbsp; &nbsp; ManagedBy : <span style="display:inline-block; width: 100px;"></span><asp:TextBox id="RADLManagedBy" Class="formtextbox" runat="server" Width="250px"></asp:TextBox> </li>
                            <li> &nbsp; &nbsp; Members : <span style="display:inline-block; width: 117px;"></span><asp:TextBox id="RADLMembers" Class="formtextbox" runat="server" Width="250px" Rows="5" Textmode="MultiLine" Placeholder="Separate by new line (enter)"></asp:TextBox>
                         </ul>
                        <br /><br />
                        <span style="display:inline-block; width: 200px;"></span><asp:Button ID="ExecuteCreateRADLGroup" runat="server" Text="Create" Height="30" Width="175" style="font-family:verdana,geneva,sans-serif;" onclick="ExecuteCreateADGroup_Click"/>&nbsp;&nbsp;&nbsp;
                       </asp:Panel>

                    
                         <asp:Panel ID= "SMDLPanel" visible="false"  runat = "server">
                       <ul class="menu">
                           <li>&nbsp; &nbsp; Enter SMDL group name : <span style="display:inline-block; width: 5px;"></span><asp:TextBox id="SMDLGroup" Class="formtextbox" runat="server" Width="250px"></asp:TextBox>&nbsp;</li>
                           <li>&nbsp; &nbsp; Description : <span style="display:inline-block; width: 97px;"></span> <asp:TextBox id="SMDLDescription" Class="formtextbox" runat="server" Width="400px"></asp:TextBox></li> 
                           <li>&nbsp; &nbsp; Notes : <span style="display:inline-block; width: 143px;"></span><asp:TextBox id="SMDLNotes" Class="formtextbox" runat="server" Width="400px"></asp:TextBox></li>
                           <li>&nbsp; &nbsp; ManagedBy : <span style="display:inline-block; width: 100px;"></span><asp:TextBox id="SMDLManagedBy" Class="formtextbox" runat="server" Width="250px"></asp:TextBox> </li>
                           <li> &nbsp; &nbsp; Members : <span style="display:inline-block; width: 117px;"></span><asp:TextBox id="SMDLMembers" Class="formtextbox" runat="server" Width="250px" Rows="5" Textmode="MultiLine" Placeholder="Separate by new line (enter)"></asp:TextBox>
                       </ul>
                        <br /><br />
                        <span style="display:inline-block; width: 200px;"></span><asp:Button ID="ExecuteCreateSMDLGroup" runat="server" Text="Create" Height="30" Width="175" style="font-family:verdana,geneva,sans-serif;" onclick="ExecuteCreateADGroup_Click"/>&nbsp;&nbsp;&nbsp;
                       </asp:Panel>
                    </asp:Panel>
               
                    <asp:Panel ID= "BulkPanel" visible="false"  runat = "server">
                        <div class="panel">
  
                    <p style="font-family:georgia,serif;color:#f9fcff">
                        Please import the Bulk template below: <br /> <br />
                            <asp:FileUpload id="FileUploadControl" runat="server" />  <span style="display:inline-block; width: 50px;"></span><asp:Button ID="ImportButton" runat="server" Text="Import" Height="30" Width="175" style="font-family:verdana,geneva,sans-serif;" onclick="UploadButton_Click"/>
                    
               
                    <br /><br />
                             
                     <asp:Label runat="server" id="StatusLabel" text="Upload status: Idle" /><span style="display:inline-block; width: 50px;"></span><asp:Button ID="ExecuteCreateADGroupBulkButton" visible="false" runat="server" Text="Create" Height="30" Width="175" style="font-family:verdana,geneva,sans-serif;" onclick="ExecuteCreateADGroupBulk_Click"/>
                     </p>
                           </div> 
                   </asp:Panel>
                   </td></tr> 
                       
                   <tr><td style="font-family:georgia,serif;color:#f9fcff"><br /><br />

                   <div>
                       <asp:Label runat="server" ID="Result" style="font-family:georgia,serif;color:#ff6860;font-size:20px" />
                         <asp:Label runat="server" ID="Filename" Visible="false" style="font-family:georgia,serif;color:#ff6860;font-size:20px" />
                   </div>
                   </td></tr>
                            
                   <tr><td>
                   <br />
                   <h3 style="font-family:georgia,serif;color:#9adaf3;">Guide</h3><br /><br />
                    <p style="font-family:georgia,serif;color:#f9fcff">&nbsp; &nbsp; For <span style="color:#ff6860;"><strong>Single</strong></span> group requests, choose the type of group you need and fill up the form and click <span style="color:#ff6860;"><strong>Create</strong></span>.</p><br />       
                    <p style="font-family:georgia,serif;color:#f9fcff">&nbsp; &nbsp; For <span style="color:#ff6860;"><strong>Bulk</strong></span> group requests, <span style="color:#ff6860;"><strong>Import</strong></span> the bulk adgroup template and click <span style="color:#ff6860;"><strong>Create</strong></span>.</p><br /><br />
                    <p style="font-family:georgia,serif;color:#f9fcff">&nbsp; &nbsp; The bulk generic account template can be downloaded <strong><asp:LinkButton class="downloadlink" onclick="BulkTemplate_Download" runat="server" >here.</asp:LinkButton></strong></p>
                   </td></tr>

               </table>
               </div>
          

   
</asp:Content>