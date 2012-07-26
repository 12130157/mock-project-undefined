<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ControlLogOn.ascx.cs" Inherits="Blog.Web.UserControls.ControlLogOn" %>
<table style="width: 34%;">
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
            ID:</td>
        <td>
            <asp:TextBox ID="txtId" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:Label ID="labelCheckId" runat="server" ForeColor="Red"></asp:Label>
        </td>
        
    </tr>
    <tr>
        <td>
            Password:&nbsp;         </td>
        <td>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
        </td>
        <td>
            <asp:Label ID="labelCheckPassword" runat="server" ForeColor="Red"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td>
            <asp:Button ID="buttonLogOn" runat="server" Text="Login" onclick="ButtonLogOnClick" 
                 />
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
</table>
