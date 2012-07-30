<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TrustRegionDetails.ascx.cs"
    Inherits="SD.Web.Controls.Geography.TrustRegionDetails" %>
<style type="text/css">
    .style1
    {
        color: #FF0000;
    }
</style>
<link href="../../Css/Stylesheet1.css" rel="stylesheet" type="text/css" />
<asp:UpdatePanel runat="server" UpdateMode="Conditional">
    <ContentTemplate>
        <table>
            <tr>
                <td>
                    <div class="labelformat">
                        Nation/Country <span class="style1">*</span></div>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server" Width="250px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="labelformat">
                        Trust Region Name <span class="style1">*</span></div>
                </td>
                <td>
                    <asp:TextBox ID="txtTrustRegionName" runat="server" Width="250px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="labelformat">
                        Description</div>
                </td>
                <td>
                    <asp:TextBox CssClass="DetailMulti" ID="txtDescription" runat="server" TextMode="MultiLine"
                        Width="250px" Height="60"></asp:TextBox>
                </td>
            </tr>
        </table>
    </ContentTemplate>
</asp:UpdatePanel>
