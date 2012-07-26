<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ControlNews.ascx.cs" Inherits="Blog.Web.UserControls.ControlNews" %>
<asp:ListView ID="listNews" runat="server" >

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
                    <td colspan="3" style="color:Blue; font-weight:bold; font-size:medium">
                   <%-- Title here--%>
                   <asp:HyperLink Style="Text-Decoration:none; color:blue" ID="hpldetail" runat="server" NavigateUrl='<%#Eval("Newsid","~/index.aspx?wuc=pd&chitiet={0}") %>'>
                   <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                   </asp:HyperLink>
                        </td>
                </tr>
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
                    <td colspan="3">
                    <%--shortcontent here--%>
                    <asp:Label ID="shortcontentLabel" runat="server" 
                    Text='<%# Eval("shortcontent") %>' />
                        &nbsp;...</td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td style="color:Blue" >
                        Comments &nbsp;(<asp:Label  ID="numbercommentLabel" runat="server" 
                    Text='<%# Eval("numbercomment") %>' />)
                         </td>
                    <td>
                    <%--comment here--%>
                    
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td >
                        Views&nbsp;(<asp:Label ID="numberviewsLabel" runat="server" 
                    Text='<%# Eval("numberviews") %>' />) </td>
                    <td>
                    <%--view here--%>
                    
                        &nbsp;</td>
                </tr>
            </table>
            
</ItemTemplate> 
<ItemSeparatorTemplate>
            <br />
        </ItemSeparatorTemplate>
</asp:ListView>

