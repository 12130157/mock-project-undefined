<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPass.aspx.cs" Inherits="SD.Web.Views.ForgotPass" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Forgot pass</title>
    <link rel="stylesheet" href="~/Css/Stylesheet1.css" type="text/css" media="screen"
        title="default" />
    <style type="text/css">
        .style1
        {
            height: 39px;
        }
        .error
        {
            color: red;
        }
    </style>
</head>
<body id="login-bg">
    <div align="center">
        <form id="form1" runat="server">
        <asp:Label ID="Label3" runat="server" Text="Please input username and email to retrieve password"></asp:Label>
        <br />
        <table cellpadding="3" cellspacing="3" border="0" width="20%">
            <tr>
                <td>
                    Username:
                </td>
                <td>
                    <asp:TextBox ID="txtUserName" runat="server" Height="26px" Width="182px"></asp:TextBox>
                </td>
                <td>
                    <asp:Label runat="server" Text="*" CssClass="error"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Email:
                </td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server" Height="26px" Width="182px"></asp:TextBox>
                </td>
                <td>
                <asp:Label ID="lblEmail" runat="server" Text="*" CssClass="error"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td style="margin-left: 40px" colspan="2">
                    <asp:Button ID="btnSend" runat="server" Text="Send" Width="49px" OnClick="btnSend_Click" />&nbsp;
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                </td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;
                </td>
                <td style="margin-left: 40px" class="style1">
                    <asp:Label ID="lblError" runat="server" Text="" Visible="false" CssClass="error"></asp:Label>
                </td>
            </tr>
        </table>
        </form>
    </div>
</body>
</html>
