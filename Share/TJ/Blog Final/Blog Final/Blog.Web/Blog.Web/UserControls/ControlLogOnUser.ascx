<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ControlLogOnUser.ascx.cs" Inherits="Blog.Web.UserControls.ControlLogOnUser" %>
<table style="width:100%;">
    <tr>
        <td>
            Hello:
            <asp:Label ID="labelOwner" runat="server" ForeColor="Blue"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <asp:HyperLink ID="hlUser" NavigateUrl="~/index.aspx?wuc=mn&link=MUsers" runat="server">Management User</asp:HyperLink>
        </td>
    </tr>
    <tr>
        <td>
            <asp:HyperLink ID="hlNews" NavigateUrl="~/index.aspx?wuc=mn&link=MCategory" runat="server">Management Categories</asp:HyperLink>
        </td>
    </tr>
    <tr>
        <td>
            <asp:HyperLink ID="hlCategories" NavigateUrl="~/index.aspx?wuc=mn&link=MNews" runat="server">Management News</asp:HyperLink>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Button ID="buttonLogOn" runat="server" Text="Logout" onclick="ButtonLogOnClick" 
                />
        </td>
    </tr>
</table>
