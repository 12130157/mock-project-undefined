<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Funding.ascx.cs" Inherits="SD.Web.Views.Funding" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="Dune5.DateTimeUI" Namespace="Dune5.DateTimeUI" TagPrefix="cc1" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="uc" TagName="ContactLookUp" Src="~/Controls/Contact/ContactSelect.ascx" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit, Version=3.5.50927.0, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e" %>
<style type="text/css">
    .style2
    {
        color: #FF0000;
    }
</style>
<table>
    <tr>
        <td colspan="4">
            <b>General</b>
        </td>
    </tr>
    <tr>
        <td>
            Funding Source
        </td>
        <td>
            <asp:DropDownList ID="ddlFundingSource" runat="server" Height="26px" Width="217px"
                AppendDataBoundItems="True">
            </asp:DropDownList>
        </td>
        <td>
            Funding Needs
        </td>
        <td>
            <asp:TextBox ID="txtFundingNeeds" runat="server" Style="margin-left: 0px" Width="211px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            Funding Contact Detail <span class="style2">*</span>
        </td>
        <td>
            <asp:TextBox ID="txtFundingContactDetail" runat="server" Width="175px"></asp:TextBox>
            <asp:Button ID="btnLookupContact" runat="server" Text="..." OnClick="BtnLookupContact_Click" />
        </td>
        <td>
            Funding Countinuation Needed
        </td>
        <td>
            <asp:CheckBox ID="chkFundingCountinuationNeeded" runat="server" AutoPostBack="True"
                OnCheckedChanged="chkFundingCountinuationNeeded_CheckedChanged" />
        </td>
    </tr>
    <tr>
        <td>
            Funding Amount <span class="style2">*</span>
        </td>
        <td>
            <asp:TextBox ID="txtFundingAmount" runat="server" Width="211px"></asp:TextBox>
        </td>
        <td>
            Funding Countinuation Amount
        </td>
        <td>
            <asp:TextBox ID="txtFundingCountinuationAmount" runat="server" Width="211px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            Funding Start
        </td>
        <td>
            <asp:TextBox ID="txtFundingStart" runat="server"></asp:TextBox>
            <asp:ImageButton runat="Server" ID="ImageButton4" ImageUrl="~/Image/Calendar.png"
                AlternateText="Click to show calendar" /><br />
            <ajaxToolkit:CalendarExtender ID="CalendarExtender4" runat="server" TargetControlID="txtFundingStart"
                PopupButtonID="ImageButton4" CssClass="MyCalendar" />
        </td>
        <td rowspan="2">
            Funding Countinuation Details
        </td>
        <td rowspan="2">
            <asp:TextBox ID="txtFundingCountinuationDetails" runat="server" Height="60px" Width="211px"
                TextMode="MultiLine"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            Funding End
        </td>
        <td>
            <asp:TextBox ID="txtFundingEnd" runat="server"></asp:TextBox>
            <asp:ImageButton runat="Server" ID="ImageButton3" ImageUrl="~/Image/Calendar.png"
                AlternateText="Click to show calendar" /><br />
            <ajaxToolkit:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="txtFundingEnd"
                PopupButtonID="ImageButton3" CssClass="MyCalendar" />
        </td>
    </tr>
    <tr>
        <td colspan="4">
            <b>Fundraising For Service Project </b>
        </td>
    </tr>
    <tr>
        <td rowspan="2">
            Fundraising For Text
        </td>
        <td rowspan="2">
            <asp:TextBox ID="txtFundrasingForText" runat="server" Height="68px" Width="219px"
                TextMode="MultiLine"></asp:TextBox>
        </td>
        <td>
            Fundraising Needs
        </td>
        <td>
            <asp:TextBox ID="txtFundrasingNeeds" runat="server" Width="211px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            Fundraising Required By
        </td>
        <td>
            <asp:TextBox ID="txtFundrasingRequiredBy" runat="server"></asp:TextBox>
            <asp:ImageButton runat="Server" ID="ImageButton2" ImageUrl="~/Image/Calendar.png"
                AlternateText="Click to show calendar" /><br />
            <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtFundrasingRequiredBy"
                PopupButtonID="ImageButton2" CssClass="MyCalendar" />
        </td>
    </tr>
    <tr>
        <td rowspan="2">
            Fundraising Why
        </td>
        <td rowspan="2">
            <asp:TextBox ID="txtFundraisingWhy" runat="server" Height="68px" Width="219px" TextMode="MultiLine"></asp:TextBox>
        </td>
        <td>
            Fundraising Complete
        </td>
        <td>
            <asp:CheckBox ID="chkFundrasingComplete" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            Fundraising Completed Date
        </td>
        <td>
            <asp:TextBox runat="server" ID="txtFundrasingCompletedDate"></asp:TextBox>
            <asp:ImageButton runat="Server" ID="Image1" ImageUrl="~/Image/Calendar.png" AlternateText="Click to show calendar" /><br />
            <ajaxToolkit:CalendarExtender ID="calendarButtonExtender" runat="server" TargetControlID="txtFundrasingCompletedDate"
                PopupButtonID="Image1" CssClass="MyCalendar" />
        </td>
    </tr>
    <tr>
        <td colspan="4">
            <b>Fundraising Donor</b>
        </td>
    </tr>
    <tr>
        <td>
            Fundraising Donor
        </td>
        <td>
            <asp:CheckBox ID="chkFundrasingDonor" runat="server" />
        </td>
        <td>
            Fundraising Donation Date
        </td>
        <td>
            <asp:TextBox runat="server" ID="txtFundraisingDonationDate"></asp:TextBox>
            <asp:ImageButton runat="Server" ID="ImageButton1" ImageUrl="~/Image/Calendar.png"
                AlternateText="Click to show calendar" /><br />
            <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtFundraisingDonationDate"
                PopupButtonID="ImageButton1" CssClass="MyCalendar" />
        </td>
    </tr>
    <tr>
        <td>
            Fundrasing Donor Amount
        </td>
        <td>
            <asp:TextBox ID="txtFundrasingDonorAmount" runat="server" Width="220px"></asp:TextBox>
        </td>
        <td>
            Fundraising Donation Incremental
        </td>
        <td>
            <asp:CheckBox ID="chkDonationIncremental" runat="server" />
        </td>
    </tr>
</table>
<div id="MaskedDiv" runat="server" visible="false">
</div>
<div id="ContactLookUpDetail1" runat="server" visible="false">
    <uc:ContactLookUp ID="ContactLookUp" runat="server" OnButtonCloseClick="CloseContactPopup"
        OnButtonSelectClick="SelectContact" />
</div>
