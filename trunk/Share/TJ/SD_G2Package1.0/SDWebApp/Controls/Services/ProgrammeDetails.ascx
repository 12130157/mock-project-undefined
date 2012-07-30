<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProgrammeDetails.ascx.cs"
    Inherits="SD.Web.Controls.Services.ProgrammeDetails" %>
<%@ Register Src="~/Controls/Contact/ContactSelect.ascx" TagName="ContactLookUp"
    TagPrefix="uc" %>
<style type="text/css">
    .style1
    {
        width: 100%;
    }
    .style2
    {
        color: #FF0000;
    }
</style>
<link href="../../Css/Stylesheet1.css" rel="stylesheet" type="text/css" />
<table class="style1">
    <tr>
        <td>
            <div class="labelformat">
                <asp:Label ID="lblProgName" runat="server" Text="Programme Name" Font-Bold="False"></asp:Label>
                &nbsp;<span class="style2">*</span>
            </div>
        </td>
        <td>
            <asp:TextBox ID="txtProgName" runat="server" Width="250px"></asp:TextBox>
        </td>
        <td>
            <div class="labelformat">
                <asp:Label ID="lblContact" runat="server" Text="Contact"></asp:Label>
            </div>
        </td>
        <td>
            <div class="labelformat">
                <asp:TextBox ID="txtContact" runat="server"></asp:TextBox>
            </div>
        </td>
        <td>
            <asp:Button ID="btnLookup" runat="server" Text="..." OnClick="btnLookup_Click" />
        </td>
    </tr>
    <tr>
        <td>
            <div class="labelformat">
                <asp:Label ID="lblDescription" runat="server" Text="Description"></asp:Label>
            </div>
        </td>
        <td>
            <asp:TextBox CssClass="DetailMulti" ID="txtDescription" runat="server" TextMode="MultiLine"
                Width="250px" Height="80"></asp:TextBox>
        </td>
        <td>
            &nbsp;
        </td>
        <td>
            &nbsp;
        </td>
        <td>
            &nbsp;
        </td>
        <td>
            &nbsp;
        </td>
    </tr>
</table>
<div id="MaskedDiv" runat="server" visible="false">
</div>
<div id="ContactLookUpProgramme" runat="server" visible="false">
    <uc:ContactLookUp ID="ContactLookUp" runat="server" OnButtonCloseClick="CloseContactPopup"
        OnButtonSelectClick="SelectContact" />
</div>
