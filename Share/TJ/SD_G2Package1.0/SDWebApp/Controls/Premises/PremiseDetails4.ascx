<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PremiseDetails4.ascx.cs"
    Inherits="SD.Web.Controls.Premises.PremiseDetail4" %>
<%@ Register Assembly="Dune5.DateTimeUI" Namespace="Dune5.DateTimeUI" TagPrefix="cc1" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>

<link href="../../Css/Stylesheet1.css" rel="stylesheet" type="text/css" />
<table style="width: 100%;" cellpadding="1px" cellspacing="1px">
    <tr>
        <td>
            Room only rate
        </td>
        <td>
            <asp:TextBox ID="txtRoomOnlyRate" runat="server" Width="180px"></asp:TextBox>
        </td>
        <td>
            Negotiated Room Only Rate
        </td>
        <td>
            <asp:TextBox ID="txtNegotiatedRoomOnlyRate" runat="server" Width="180px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            B&amp;B Rate
        </td>
        <td>
            <asp:TextBox ID="txtBbRate" runat="server" Width="180px"></asp:TextBox>
        </td>
        <td>
            &nbsp;B&amp;B Negotiated Rate
        </td>
        <td>
            <asp:TextBox ID="txtBbNegotiatedRate" runat="server" Width="180px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            DBB Rate
        </td>
        <td>
            <asp:TextBox ID="txtDbbRate" runat="server" Width="180px"></asp:TextBox>
        </td>
        <td>
            &nbsp;DBB Negotiated Rate
        </td>
        <td>
            <asp:TextBox ID="txtDbbNegotiatedRate" runat="server" Width="180px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            DD Rate
        </td>
        <td>
            <asp:TextBox ID="txtDdRate" runat="server" Width="180px"></asp:TextBox>
        </td>
        <td>
            &nbsp;DD Negotiated Rate
        </td>
        <td>
            <asp:TextBox ID="txtDdNegotiatedRate" runat="server" Width="180px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            24h Rate
        </td>
        <td>
            <asp:TextBox ID="txt24hRate" runat="server" Width="180px"></asp:TextBox>
        </td>
        <td>
            &nbsp;24h Negotiated Rate
        </td>
        <td>
            <asp:TextBox ID="txt24hNegotiatedRate" runat="server" Width="180px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            Tea and Coffee
        </td>
        <td>
            <asp:TextBox ID="txtTeaAndCoffee" runat="server" Width="180px"></asp:TextBox>
        </td>
        <td>
            &nbsp;Last Negotiated Date
        </td>
        <td>
            <asp:TextBox runat="server" ID="txtLastNegotiatedDate" Width="160px" MaxLength="20" />
            <asp:ImageButton runat="Server" ID="ImageButton1" ImageUrl="~/Image/Calendar.png" AlternateText="Click to show calendar" /><br />
            <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtLastNegotiatedDate"
                PopupButtonID="ImageButton1" CssClass="MyCalendar" />
        </td>
    </tr>
    <tr>
        <td>
            Lunch
        </td>
        <td>
            <asp:CheckBox ID="chkLunch" runat="server" />
        </td>
        <td>
            &nbsp;Re-negotiated On
        </td>
        <td>
            <asp:TextBox runat="server" ID="txtReNegotiatedDate" Width="160px" MaxLength="20" />
            <asp:ImageButton runat="Server" ID="ImageButton2" ImageUrl="~/Image/Calendar.png" AlternateText="Click to show calendar" /><br />
            <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtReNegotiatedDate"
                PopupButtonID="ImageButton2" CssClass="MyCalendar" />
        </td>
    </tr>
    <tr>
        <td>
            No of Meeting Rooms
        </td>
        <td>
            <asp:TextBox ID="txtNoOfMeetingRoom" runat="server" Width="180px"></asp:TextBox>
        </td>
        <td>
            &nbsp;Preferred Status
        </td>
        <td>
            <asp:DropDownList ID="ddlPreferredStatus" runat="server" Width="180px">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td>
            Meeting Room Rate per Day
        </td>
        <td>
            <asp:TextBox ID="txtMeetingRoomRate" runat="server" Width="180px"></asp:TextBox>
        </td>
        <td rowspan="2">
            &nbsp;Comments
        </td>
        <td rowspan="2">
            <asp:TextBox CssClass="DetailMulti" ID="txtComments" runat="server" TextMode="MultiLine" Width="180px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            Codings
        </td>
        <td>
            <asp:DropDownList ID="ddlCodings" runat="server" Width="180px">
            </asp:DropDownList>
        </td>
        <td>
        </td>
        <td>
        </td>
    </tr>
</table>
<div class="Error">
    <br />
    <asp:Label ID="lblError" runat="server" Visible="false"></asp:Label>
</div>
