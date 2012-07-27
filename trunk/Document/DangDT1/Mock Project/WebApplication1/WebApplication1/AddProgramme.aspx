<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddProgramme.aspx.cs" Inherits="WebApplication1.AddProgramme" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
        }
        .style3
        {
            width: 198px;
        }
        .style4
        {
            width: 99px;
        }
        .style5
        {
            width: 214px;
        }
        .style6
        {
            height: 40px;
        }
        .style7
        {
            width: 198px;
            height: 40px;
        }
        .style8
        {
            width: 99px;
            height: 40px;
        }
        .style9
        {
            width: 214px;
            height: 40px;
        }
        .style10
        {
            width: 122px;
            height: 40px;
        }
        .style11
        {
            width: 122px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div></div>
        <div align=center>
    
            <asp:Label ID="Label1" runat="server" Text="Add New Programme" Font-Bold="True" 
                Font-Names="Arial" Font-Size="Larger" ForeColor="#66FF66"></asp:Label>
        </div>
    
        <br />
        <br />
        <table class="style1">
            <tr>
                <td class="style2" colspan="3">
                    &nbsp;</td>
                <td class="style5" align=center>
                    <asp:Button ID="Button1" runat="server" Text="Deactive" />&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button2" runat="server" Text="Save" Width="57px" />
                </td>
                <td>
                    &nbsp;&nbsp;
                    <asp:Button ID="Button3" runat="server" Text="Back" Width="61px" />
                </td>
            </tr>
            <tr>
                <td class="style10">
                    Programme Name</td>
                <td class="style7">
                    <asp:TextBox ID="tbProgramme" runat="server" Width="245px"></asp:TextBox>
                </td>
                <td class="style8">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Contact</td>
                <td class="style9">
                    <asp:TextBox ID="tbContact" runat="server" Enabled="False" ReadOnly="True" 
                        Width="199px"></asp:TextBox>
                </td>
                <td class="style6">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="LinkButton1" runat="server" Font-Overline="False" 
                        Font-Underline="False">Lookup</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td class="style11">
                    Description</td>
                <td class="style3">
                    <asp:TextBox ID="tbDescription" runat="server" Height="60px" Width="245px"></asp:TextBox>
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
    
    </div>
    </form>
</body>
</html>
