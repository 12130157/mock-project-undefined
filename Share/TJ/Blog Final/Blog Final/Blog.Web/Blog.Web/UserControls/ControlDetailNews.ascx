<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ControlDetailNews.ascx.cs" Inherits="Blog.Web.UserControls.ControlDetailNews" %>
<style type="text/css">
    .style1
    {
        height: 40px;
    }
</style>
<script src="../ckeditor/ckeditor_source.js" type="text/javascript"></script>
<script src="../ckeditor/ckeditor.js" type="text/javascript"></script>
<table style="width: 100%; border-bottom: 1px dotted black;">
                <tr>
                    <td colspan="3" style="color:Blue; font-weight:bold; font-size:medium">
                   <%-- Title here--%>
                   
                   <asp:Label ID="labelTitle" runat="server"/>
                  
                        </td>
                </tr>
                <tr>
                    <td>
                        Author : &nbsp; <asp:Label ID="labelAuthors" style="color:Blue" 
                            runat="server"  /></td>
                    <td>
                  <%--  author here--%>
                  
                  
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        Create Date: &nbsp; 
                        <asp:Label ID="labelCreateTime" runat="server" 
                     /></td>
                    <td>
                    <%--create time here--%>
                   
                        
                        </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td colspan="3">
                    <%--shortcontent here--%>
                    <asp:Label ID="labelContentNew" runat="server" 
                     />
                        </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td >
                        Views&nbsp;(<asp:Label ID="labelViewNumber" runat="server" 
                    ></asp:Label>)</td>
                    <td>
                    <%--view here--%>
                    
                        &nbsp;</td>
                </tr>
            </table>
            
<asp:ListView ID="LvViewComments" runat="server">
<LayoutTemplate>
        <ul ID="itemPlaceholderContainer" runat="server" style="">
            <li ID="itemPlaceholder" runat="server" />
            </ul>
            <div style="">
            </div>
        </LayoutTemplate>
        
        
        <ItemTemplate>
         <table style="width: 100%; border-bottom: 1px dotted black;">
                <tr>
                    <td>
                        Author : &nbsp; <asp:Label ID="AuthorLabel" style="color:Blue" runat="server" Text='<%# Eval("Author") %>' /></td>
                    <td>
                  <%--  author here--%>
                  
                  
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        Create Date: &nbsp; <asp:Label ID="CreatetimeLabel" runat="server" 
                    Text='<%# Eval("Createtime") %>' /></td>
                    <td>
                    <%--create time here--%>
                   
                        
                        </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        Email: 
                        <asp:Label ID="emailLabel" runat="server"  Text='<%# Eval("email") %>' /> </td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td colspan="3">
                    <%--shortcontent here--%>
                    <asp:Label ID="contentcommentsLabel" runat="server"  Text='<%# Eval("contentcomments") %>' />
                       </td>
                </tr>
                </table>

 
        </ItemTemplate> 
<ItemSeparatorTemplate>
            <br />
        </ItemSeparatorTemplate>

   </asp:ListView>
    <table style="width:100%;">
        <tr>
            <td colspan="3" style="text-align: center" >
                Send Your Comment</td>
        </tr>
        <tr>
            <td>
                Your Name</td>
            <td>
                <asp:TextBox ID="txtYourName" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="labelErrorName" runat="server" style="color: #FF0000"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                Email</td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="labelErrorEmail" runat="server" style="color: #FF0000"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style1">
                </td>
            <td class="style1">
                <asp:TextBox ID="txtComment"  runat="server" 
                    CssClass="ckeditor" TextMode="MultiLine"></asp:TextBox>
            </td>
            <td class="style1">
                <asp:Label ID="labelErrorComment" runat="server" style="color: #FF0000"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="ButtonComments" runat="server" Text="Send Comments" 
                    onclick="ButtonComments_Click" />
                
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>