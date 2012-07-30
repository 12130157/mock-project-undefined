<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Detail1.ascx.cs" Inherits="SD.Web.Views.WebUserControl1" %>
<%@ Register Assembly="Dune5.DateTimeUI" Namespace="Dune5.DateTimeUI" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>
<%@ Register TagPrefix="uc" TagName="ContactLookUp" Src="~/Controls/Contact/ContactSelect.ascx" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit, Version=3.5.50927.0, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e" %>
<link href="../../Css/Stylesheet1.css" rel="stylesheet" type="text/css" />
<script src="../../Scripts/script.js" type="text/javascript"></script>

<style type="text/css">
    .style1
    {
        width: 100%;
    }
    .style3
    {
        width: 266px;
    }
    .style4
    {
        width: 136px;
    }
    .style5
    {
        width: 169px;
    }
    .style6
    {
        width: 221px;
    }
    .style7
    {
        color: #FF0000;
    }
</style>
<table>
    <tr>
        <td>
            Service Name<span class="style7">*</span>
        </td>
        <td>
            <asp:TextBox ID="txtServiceName" runat="server" Width="250px"></asp:TextBox>
        </td>
        <td>
            <asp:Label ID="Label2" runat="server" Text="Service Active"></asp:Label>
        </td>
        <td>
            <asp:CheckBox ID="chkServiceActive" runat="server" Checked="True" Enabled="False"
                EnableTheming="True" />
        </td>
    </tr>
    <tr>
        <td>
            Service Short Description <span class="style7">*</span>
        </td>
        <td>
            <asp:TextBox ID="txtShortDescription" runat="server" Width="250px" Height="60px"
                TextMode="MultiLine" CssClass="DetailMulti"></asp:TextBox>
        </td>
        <td>
            <asp:Label ID="Label4" runat="server" Text="Service Full Description"></asp:Label>
        </td>
        <td>
            <asp:TextBox CssClass="DetailMulti" ID="txtFullDescription" runat="server" Height="60px" Width="250px" TextMode="MultiLine" ></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            Sub Type
        </td>
        <td>
            <asp:DropDownList ID="ddlSubType" runat="server" Style="margin-left: 0px; margin-right: 4px;"
                Width="250px" Height="26px" AutoPostBack="true" OnSelectedIndexChanged="ddlSubType_SelectedIndexChanged"
                AppendDataBoundItems="True">
            </asp:DropDownList>
        </td>
        <td>
            Dept Code <span class="style7">*</span>
        </td>
        <td>
            <asp:TextBox ID="txtDepartmentID" runat="server" Width="250px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            Lead Contract<span class="style7">*</span>
        </td>
        <td>
            <asp:TextBox ID="txtContactID" runat="server" Width="210px"></asp:TextBox>
            <asp:Button ID="btnLookupContact" runat="server" Text="..." Width="30px" OnClick="BtnLookupContact_Click" />
        </td>
        <td>
            Service Type<span class="style7">*</span>
        </td>
        <td>
            <asp:DropDownList ID="ddlServiceType" runat="server" Style="margin-left: 0px" Width="250px"
                Height="26px" AppendDataBoundItems="True">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td>
            Client Description
        </td>
        <td>
            <asp:TextBox CssClass="DetailMulti" ID="txtClientDescription" runat="server" Height="60px" Width="250px"
                TextMode="MultiLine"></asp:TextBox>
        </td>
        <td>
            Service Description-Delivery
        </td>
        <td>
            <asp:TextBox CssClass="DetailMulti" ID="txtServiceDescriptionDelivery" runat="server" Height="60px" Width="250px"
                TextMode="MultiLine"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            Service Attendance
        </td>
        <td>
            <asp:DropDownList ID="ddlAttendance" runat="server" Style="margin-left: 0px" Width="250px"
                AppendDataBoundItems="True">
            </asp:DropDownList>
        </td>
        <td>
            Service Contract Code
        </td>
        <td>
            <asp:TextBox ID="txtServiceContractCode" runat="server" Width="250px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            Service Start Expected
        </td>
        <td>
            <asp:TextBox ID="txtStartExpected" runat="server" MaxLength="10" ></asp:TextBox>
            <asp:ImageButton runat="Server" ID="ImageButton3" ImageUrl="~/Image/Calendar.png"
                AlternateText="Click to show calendar" /><br />
            <ajaxToolkit:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="txtStartExpected"
                PopupButtonID="ImageButton3" CssClass="MyCalendar" />
        </td>
        <td>
            Service Contract Value
        </td>
        <td>
            <asp:TextBox ID="txtServiceContractValue" runat="server" Width="250px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            Service Start Date
        </td>
        <td>
            <asp:TextBox ID="txtStartDate" runat="server" MaxLength="10"></asp:TextBox>
            <asp:ImageButton runat="Server" ID="ImageButton4" ImageUrl="~/Image/Calendar.png"
                AlternateText="Click to show calendar" /><br />
            <ajaxToolkit:CalendarExtender ID="CalendarExtender4" runat="server" TargetControlID="txtStartDate"
                PopupButtonID="ImageButton4" CssClass="MyCalendar" />
        </td>
        <td>
            Contract Staged Payment
        </td>
        <td>
            <asp:CheckBox ID="chkContractStagedPayment" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            Service End Date
        </td>
        <td>
            <asp:TextBox ID="txtEndDate" runat="server" MaxLength="10"></asp:TextBox>
            <asp:ImageButton runat="Server" ID="ImageButton1" ImageUrl="~/Image/Calendar.png"
                AlternateText="Click to show calendar" /><br />
            <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtEndDate"
                PopupButtonID="ImageButton1" CssClass="MyCalendar" />
        </td>
        <td>
            Referral Process/Method
        </td>
        <td>
            <asp:DropDownList ID="ddlReferral" runat="server" Style="margin-left: 0px" Width="250px"
                AppendDataBoundItems="True">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td>
            Service Extendable
        </td>
        <td>
            <asp:CheckBox ID="chkServiceExtendable" runat="server" AutoPostBack="True" Checked="True"
                OnCheckedChanged="chkServiceExtendable_CheckedChanged" />
        </td>
        <td>
            Service Time Limited
        </td>
        <td>
            <asp:CheckBox ID="chkServiceTimeLimited" runat="server" AutoPostBack="True" Checked="True"
                OnCheckedChanged="chkServiceTimeLimited_CheckedChanged" />
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;
        </td>
        <td>
            <asp:TextBox ID="txtYearExtends" runat="server" MaxLength="2" onkeypress="return keypress(event);"></asp:TextBox>
            <cc2:NumericUpDownExtender ID="NumericUpDownExtender1" runat="server" TargetControlID="txtYearExtends"
                Width="40" RefValues="" ServiceDownMethod="" ServiceUpMethod="" TargetButtonDownID=""
                TargetButtonUpID="" Minimum="0" Maximum="99" />
            Years
            <asp:TextBox ID="txtMonthExtends" runat="server" MaxLength="2" onkeypress="return keypress(event);" ></asp:TextBox>
            <cc2:NumericUpDownExtender ID="NumericUpDownExtender2" runat="server" TargetControlID="txtMonthExtends"
                Width="40" RefValues="" ServiceDownMethod="" ServiceUpMethod="" TargetButtonDownID=""
                TargetButtonUpID="" Minimum="0" Maximum="12" />
            Months
        </td>
        <td>
            &nbsp;
        </td>
        <td>
            <asp:TextBox ID="txtYearLimited" runat="server" MaxLength="2" onkeypress="return keypress(event);"></asp:TextBox>
            <cc2:NumericUpDownExtender ID="NumericUpDownExtender3" runat="server" TargetControlID="txtYearLimited"
                Width="40" RefValues="" ServiceDownMethod="" ServiceUpMethod="" TargetButtonDownID=""
                TargetButtonUpID="" Minimum="0" Maximum="99" />
            Years
            <asp:TextBox ID="txtMonthLimited" runat="server" MaxLength="2" onkeypress="return keypress(event);"></asp:TextBox>
            <cc2:NumericUpDownExtender ID="NumericUpDownExtender4" runat="server" TargetControlID="txtMonthLimited"
                Width="40" RefValues="" ServiceDownMethod="" ServiceUpMethod="" TargetButtonDownID=""
                TargetButtonUpID="" Minimum="0" Maximum="12" />
            Months
        </td>
    </tr>
</table>
<div id="MaskedDiv" runat="server" visible="false">
</div>
<div id="ContactLookUpDetail1" runat="server" visible="false">
    <uc:ContactLookUp ID="ContactLookUp" runat="server" OnButtonCloseClick="CloseContactPopup"
        OnButtonSelectClick="SelectContact" />
</div>
