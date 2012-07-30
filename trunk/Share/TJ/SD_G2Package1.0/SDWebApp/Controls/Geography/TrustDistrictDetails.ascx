<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TrustDistrictDetails.ascx.cs"
    Inherits="SD.Web.Controls.Geography.TrustDistrictDetails" %>
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
                        Trust Region Name</div>
                </td>
                <td>
                    <asp:TextBox ID="txtTrustRegionName" runat="server" Width="250px" ReadOnly="True"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="labelformat">
                        Trust District Name <span class="style1">*</span></div>
                </td>
                <td>
                    <asp:TextBox ID="txtTrustDistrictName" runat="server" Width="250px"></asp:TextBox>
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
