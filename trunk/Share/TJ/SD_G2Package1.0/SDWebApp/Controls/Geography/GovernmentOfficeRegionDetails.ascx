<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GovernmentOfficeRegionDetails.ascx.cs"
    Inherits="SD.Web.Controls.Geography.GovernmentOfficeRegionDetails" %>
<link href="../../Css/Stylesheet1.css" rel="stylesheet" type="text/css" />
<table>
    <tr>
        <td>
            <div class="labelformat">
                Government Office Region Name
            </div>
        </td>
        <td>
            <asp:TextBox ID="txtGovtOffRegName" runat="server" Width="250px"></asp:TextBox>
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
    <tr>
        <td>
            <div class="labelformat">
                County</div>
        </td>
        <td>
            <asp:TextBox CssClass="DetailMulti" ID="txtCounty" runat="server" TextMode="MultiLine"
                Width="250px" Height="60"></asp:TextBox>
        </td>
    </tr>
</table>
