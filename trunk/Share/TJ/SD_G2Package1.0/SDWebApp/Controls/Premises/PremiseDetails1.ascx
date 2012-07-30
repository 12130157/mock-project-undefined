<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PremiseDetails1.ascx.cs"
    Inherits="SD.Web.Controls.Premises.PremiseDetails1" %>
<%@ Register Assembly="Dune5.DateTimeUI" Namespace="Dune5.DateTimeUI" TagPrefix="cc1" %>
<%@ Register Src="~/Controls/Lookup/AddressLookup.ascx" TagName="AddressLookup" TagPrefix="uc1" %>
<%@ Register Src="~/Controls/Contact/ContactSelect.ascx" TagName="ContactLookUp"
    TagPrefix="uc2" %>
<%@ Register Src="~/Controls/Premises/LocationOpenDays.ascx" TagName="OpenDay" TagPrefix="uc3" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<link href="../../Css/Stylesheet1.css" rel="stylesheet" type="text/css" />
<link href="../../Css/PopupStyle.css" rel="stylesheet" type="text/css" />

<script src="../../Scripts/PopupMarkDiv.js" type="text/javascript"></script>

<table style="width: 100%">
    <tr>
        <td>
            Premise Name
            <asp:Label ID="lblPhoneNumberRequirement" runat="server" Text="*" ForeColor="Red"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtPremiseName" runat="server" Width="200px" MaxLength="100"></asp:TextBox>
        </td>
        <td>
        </td>
        <td>
        </td>
    </tr>
    <tr>
        <td>
            Location Name
            <asp:Label ID="lblLocationNameRequirement" runat="server" Text="*" ForeColor="Red"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtLocationName" runat="server" Width="200px" MaxLength="100"></asp:TextBox>
        </td>
        <td>
            Primary location
        </td>
        <td>
            <asp:CheckBox ID="chkPrimaryLocation" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            Known As
        </td>
        <td>
            <asp:TextBox ID="txtKnownAs" runat="server" Width="200px" MaxLength="100"></asp:TextBox>
        </td>
        <td>
            Location managed
        </td>
        <td>
            <asp:CheckBox ID="chkLocationManaged" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            Location Orgnisation
        </td>
        <td>
            <asp:TextBox ID="txtLocationOrgnisation" runat="server" Width="165px" ReadOnly="True"></asp:TextBox>
            <asp:Button ID="btnLocationOrgSelect" runat="server" Text="..." OnClick="BtnLocationOrgSelectClick"
                UseSubmitBehavior="False" />
        </td>
        <td>
            ST Network Connectivity
        </td>
        <td>
            <asp:CheckBox ID="chkStNetWork" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            Location Status
            <asp:Label ID="lblLocationStatusRequirement" runat="server" Text="*" ForeColor="Red"></asp:Label>
        </td>
        <td>
            <asp:DropDownList ID="ddlLocationStatus" runat="server" Width="200px">
            </asp:DropDownList>
        </td>
        <td rowspan="2">
            Location type
            <asp:Label ID="lblLocationTypeRequirement" runat="server" Text="*" ForeColor="Red"></asp:Label>
        </td>
        <td rowspan="2">
            <asp:Panel ID="pnlLocationType" runat="server" BorderWidth="1px" Height="90px" ScrollBars="Vertical"
                Width="200px" Wrap="False">
                <asp:CheckBoxList ID="cblLocationType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="CblLocationTypeSelectedIndexChanged">
                </asp:CheckBoxList>
            </asp:Panel>
        </td>
    </tr>
    <tr>
        <td>
            Location status date
        </td>
        <td>
            <asp:TextBox runat="server" ID="txtLocationStatusDate" Width="180px" MaxLength="20" />
            <asp:ImageButton runat="Server" ID="Image1" ImageUrl="~/Image/Calendar.png" AlternateText="Click to show calendar" /><br />
            <ajaxToolkit:CalendarExtender ID="calendarButtonExtender" runat="server" TargetControlID="txtLocationStatusDate"
                PopupButtonID="Image1" CssClass="MyCalendar" />
        </td>
    </tr>
    <tr>
        <td>
            Address line 1
        </td>
        <td>
            <asp:TextBox ID="txtAddress1" runat="server" Width="200px" MaxLength="200"></asp:TextBox>
        </td>
        <td rowspan="2">
            Location Description
        </td>
        <td rowspan="2">
            <asp:TextBox CssClass="DetailMulti" ID="txtLocationDescription" runat="server" Height="50px" TextMode="MultiLine"
                Width="200px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            Address line 2
        </td>
        <td>
            <asp:TextBox ID="txtAddress2" runat="server" Width="200px" MaxLength="200"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            Address line 3
        </td>
        <td>
            <asp:TextBox ID="txtAddress3" runat="server" Width="200px" MaxLength="200"></asp:TextBox>
        </td>
        <td>
            Phone number
            <asp:Label ID="lblLocationNameRequirement1" runat="server" Text="*" ForeColor="Red"></asp:Label>
            <td>
                <asp:TextBox ID="txtPhoneNumber" runat="server" Width="200px" MaxLength="30"></asp:TextBox>
            </td>
    </tr>
    <tr>
        <td>
            Postcode
        </td>
        <td>
            <asp:TextBox ID="txtPostcode" runat="server" Width="165px" MaxLength="20" AutoPostBack="true"
                OnTextChanged="TxtPostcodeTextChanged"></asp:TextBox>
            <asp:Button ID="btnPostcodeSelect" runat="server" Text="..." OnClick="BtnPostcodeSelectClick"
                UseSubmitBehavior="False" CausesValidation="False" />
        </td>
        <td>
            General fax number
        </td>
        <td>
            <asp:TextBox ID="txtGeneralFaxNumber" runat="server" Width="200px" MaxLength="30"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            City/Town
        </td>
        <td>
            <asp:TextBox ID="txtCityTown" runat="server" Width="200px" MaxLength="100"></asp:TextBox>
        </td>
        <td>
            Minicomm number
        </td>
        <td>
            <asp:TextBox ID="txtMinicommNumber" runat="server" Width="200px" MaxLength="30"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            County
        </td>
        <td>
            <asp:TextBox ID="txtCounty" runat="server" Width="200px" MaxLength="100"></asp:TextBox>
        </td>
        <td>
            Is new shop?
        </td>
        <td>
            <asp:CheckBox ID="chkIsNewShop" runat="server" Enabled="False" />
        </td>
    </tr>
    <tr>
        <td>
            Nation/Country
        </td>
        <td>
            <asp:DropDownList ID="ddlNationCountry" runat="server" Width="200px">
            </asp:DropDownList>
        </td>
        <td>
            Shop flag date
        </td>
        <td>
            <asp:TextBox runat="server" ID="txtShopFlagDate" Width="180px" MaxLength="20" />
            <asp:ImageButton runat="Server" ID="ImageButton1" ImageUrl="~/Image/Calendar.png" AlternateText="Click to show calendar" /><br />
            <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtShopFlagDate"
                PopupButtonID="ImageButton1" CssClass="MyCalendar" />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:LinkButton runat="server" OnClick="ShowOpenDayPopup">Location opening
                time</asp:LinkButton>
        </td>
        <td>
            Specialist shop
        </td>
        <td>
            <asp:CheckBox ID="chkSpecilistShop" runat="server" />
        </td>
    </tr>
</table>
<div class="Error">
    <br />
    <asp:Label ID="lblPostcodeNotFound" runat="server" Visible="false" Text="Postcode not exit in database!<br/>" />
    <asp:Label ID="lblError" runat="server" Visible="false"></asp:Label>
</div>
<div id="MaskedDiv" runat="server" visible="false">
</div>
<div id="AddressLookUpRegion" runat="server" visible="false">
    <uc1:AddressLookup ID="AddressLookup" runat="server" OnbtnCloseClick="CloseAddressPopup"
        OnbtnSelectClick="SelectAddress" />
</div>
<div id="ContactLookupRegion" runat="server" visible="false">
    <uc2:ContactLookUp ID="ContactLookup" runat="server" OnButtonCloseClick="CloseContactPopup"
        OnButtonSelectClick="SelectContact" />
</div>
<div id="OpenDays" runat="server" visible="false">
    <uc3:OpenDay ID="OpenTime" runat="server" />
    <div style="float: right">
        <asp:Button ID="btnOpenDaysClose" Text="Back" runat="server" OnClick="CloseOpenDayPopup" />
    </div>
</div>
