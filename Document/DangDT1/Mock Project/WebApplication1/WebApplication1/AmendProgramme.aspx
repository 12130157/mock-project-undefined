<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AmendProgramme.aspx.cs" Inherits="WebApplication1.AmendProgramme" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">

        .style1
        {
            width: 100%;
        }
        .style5
        {
            width: 228px;
        }
        .style6
        {
            height: 40px;
        }
        .style7
        {
            width: 264px;
            height: 40px;
        }
        .style8
        {
            width: 77px;
            height: 40px;
        }
        .style9
        {
            width: 228px;
            height: 40px;
        }
        .style3
        {
            width: 264px;
        }
        .style4
        {
            width: 77px;
        }
        .style10
        {
            width: 117px;
            height: 40px;
        }
        .style11
        {
            width: 117px;
        }
        .style12
        {
            height: 34px;
        }
        .style13
        {
            width: 228px;
            height: 34px;
        }
    </style>
</head>
<body>
    <form id="form2" runat="server">
    <div></div>
        <div align=center>
    
            <asp:Label ID="Label1" runat="server" Text="Amend Programme" Font-Bold="True" 
                Font-Names="Arial" Font-Size="Larger" ForeColor="#FF9900"></asp:Label>
        </div>
    
        <br />
        <br />
        <table class="style1">
            <tr>
                <td class="style12" colspan="3">
                    </td>
                <td class="style13" align=left>
                    &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:Button ID="Button1" runat="server" Text="Deactive" />&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button2" runat="server" Text="Save" Width="57px" />
                </td>
                <td class="style12">
                    &nbsp;
                    <asp:Button ID="Button3" runat="server" Text="Back" Width="61px" />
                </td>
            </tr>
            <tr>
                <td class="style10">
                    Programme Name</td>
                <td class="style7">
                    <asp:TextBox ID="tbProgrammeName" runat="server" Width="318px"></asp:TextBox>
                </td>
                <td class="style8">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Contact</td>
                <td class="style9">
                    <asp:TextBox ID="tbContact" runat="server" Enabled="False" 
                        Width="221px"></asp:TextBox>
                </td>
                <td class="style6">
                    &nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="LinkButton1" runat="server" Font-Overline="False" 
                        Font-Underline="False">Lookup</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td class="style11">
                    Description</td>
                <td class="style3">
                    <asp:TextBox ID="tbDescription" runat="server" Height="79px" Width="318px"></asp:TextBox>
                </td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style5">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style11">
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style5">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </form>
</body>
</html>
