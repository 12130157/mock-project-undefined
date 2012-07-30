<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="VolunteeringDetailsInfo.ascx.cs" Inherits="SD.Web.Controls.Premises.VolunteeringDetailsInfo" %>

<%@ Register TagPrefix="uc1" TagName="ContactLookUp" Src="~/Controls/Contact/ContactSelect.ascx" %>
<link href="../../Css/Stylesheet1.css" rel="stylesheet" type="text/css" />

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>


<style type="text/css">
    .style1
    {
        width: 197px;
    }
</style>


<table>
    <tr>
        <td>Volunteering Contact</td>
        <td class="style1">
            <asp:TextBox ID="txtContact" runat="server" Width="210px"></asp:TextBox>
            <asp:Button ID="btnContactSearch" runat="server" Text="..." 
                onclick="BtnContactSearchClick" style="height: 26px" 
                UseSubmitBehavior="False" />
        </td>
    </tr>
    <tr>
        <td>Volunteer Purpose</td>
        <td class="style1">
            <asp:TextBox CssClass="DetailMulti" ID="txtVolunteerPurpose" runat="server" TextMode="MultiLine" Height="36px" 
                Width="250px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>Volunteering Opporturnity Details</td>
        <td class="style1">
            <asp:TextBox CssClass="DetailMulti" ID="txtDetails" runat="server" TextMode="MultiLine" Height="37px" 
                Width="250px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>Start Date</td>
        <td class="style1">
            <asp:TextBox runat="server" ID="txtStartDate" Width="220px" MaxLength="20" />
            <asp:ImageButton runat="Server" ID="ImageButton1" ImageUrl="~/Image/Calendar.png" AlternateText="Click to show calendar" /><br />
            <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtStartDate"
                PopupButtonID="ImageButton1" CssClass="MyCalendar" />
        </td>
    </tr>
    <tr>
        <td>End Date</td>
        <td class="style1">
            <asp:TextBox runat="server" ID="txtEndDate" Width="220px" MaxLength="20" />
            <asp:ImageButton runat="Server" ID="ImageButton2" ImageUrl="~/Image/Calendar.png" AlternateText="Click to show calendar" /><br />
            <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtEndDate"
                PopupButtonID="ImageButton2" CssClass="MyCalendar" />
        </td>
    </tr>
    <tr>
        <td>Volunteer Nos</td>
        <td class="style1">
            <asp:TextBox ID="txtVolunteerNumber" runat="server"
                Width="250px"></asp:TextBox>
        </td>
    </tr>
</table>

<div class="Error">
    <br />
    <asp:Label ID="lblError" runat="server" Visible="false"></asp:Label>
</div>
<div id="MaskedDiv" runat="server" visible="false">
</div>
<div id="ContactLookupRegion" runat="server" visible="false">
    <uc1:ContactLookUp ID="ContactLookup" runat="server" OnButtonCloseClick="CloseContactPopup" OnButtonSelectClick="SelectContact" />
</div>