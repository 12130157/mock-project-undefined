<%@ Page Language="C#" MasterPageFile="~/MainTemplate.Master" AutoEventWireup="true" CodeBehind="GovernmentOfficeRegionDetail.aspx.cs" Inherits="MockProject.Web.GovernmentOfficeRegionDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    Government Office Region Detail
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div id="MainOfficeRegion-memeberOne">
         <table width="90%" border="0" style=" border: 1px solid rgb(192, 192, 192); margin: 0 auto;">
                        <tr>
                            <td height="35" align="right" style="padding-right: 20px; width: 194px;">
                                <strong style="color:#474747">Government Office Region Name:</strong>
                            </td>
                            <td style="width: 576px">
                                <asp:TextBox ID="txtNameCategory"  Enabled="False" runat="server" Width="450px" Height="20px"></asp:TextBox>
                                </td>
                        </tr>
                        <tr>
                            <td height="53" align="right" style="padding-right: 20px; width: 194px;">
                                <strong style="color:#474747">Description:</strong>
                            </td>
                            <td style="width: 576px">
                               <asp:TextBox ID="txtIntro" Enabled="False" runat="server" Width="450px" Height="99px" TextMode="MultiLine"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td height="53" align="right" style="padding-right: 20px; width: 194px;">
                                <strong style="color:#474747">County:</strong>
                            </td>
                            <td style="width: 576px">
                                <asp:ListBox  Enabled="False" ID="ListBox1" runat="server">
                                    <asp:ListItem Value="1">HaNoi</asp:ListItem>
                                    <asp:ListItem Value="2">BacNinh</asp:ListItem>
                                    <asp:ListItem Value="3">CaMau</asp:ListItem>
                                    <asp:ListItem></asp:ListItem>
                                </asp:ListBox>
                            </td>
                        </tr>
                        <tr>
                                <td>
                                </td>
                                <td height="46">
                                    <asp:Button ID="Post" runat="server" Text="Back" />
                                </td>
                            </tr>
                </table>
    </div>
</asp:Content>
