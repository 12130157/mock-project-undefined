<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LocationOpenDays.ascx.cs"
    Inherits="SD.Web.Controls.Premises.LocationOpenDays" %>
<link href="../../Css/Stylesheet1.css" rel="stylesheet" type="text/css" />

<script src="../../Scripts/PopupMarkDiv.js" type="text/javascript"></script>

<div class="TitleContent">
    Location Open Days
</div>
<hr />
<div style="width: 100%;">
    <table border="0px" cellpadding="2px" cellspacing="2px">
        <tr>
            <td>
            </td>
            <td style="width: 110px">
                Weekend Day
            </td>
            <td>
                Start time
            </td>
            <td>
                End time
            </td>
        </tr>
        <tr>
            <td>
                <asp:CheckBox ID="chkMondayEnable" runat="server" AutoPostBack="true" Checked="True"
                    OnCheckedChanged="ChkMondayEnableCheckedChanged" />
            </td>
            <td>
                Monday
            </td>
            <td>
                <asp:TextBox ID="txtMondayStartTime" runat="server" Width="45px" MaxLength="6">9:00</asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="txtMondayEndTime" runat="server" Width="45px" MaxLength="6">17:00</asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:CheckBox ID="chkTuesdayEnable" runat="server" AutoPostBack="true" Checked="True"
                    OnCheckedChanged="ChkTuesdayEnableCheckedChanged" />
            </td>
            <td>
                Tuesday
            </td>
            <td>
                <asp:TextBox ID="txtTuesdayStartTime" runat="server" Width="45px" MaxLength="6">9:00</asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="txtTuesdayEndTime" runat="server" Width="45px" MaxLength="6">17:00</asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:CheckBox ID="chkWednesdayEnable" runat="server" AutoPostBack="true" Checked="True"
                    OnCheckedChanged="ChkWednesdayEnableCheckedChanged" />
            </td>
            <td>
                Wednesday
            </td>
            <td>
                <asp:TextBox ID="txtWednesdayStartTime" runat="server" Width="45px" MaxLength="6">9:00</asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="txtWednesdayEndTime" runat="server" Width="45px" MaxLength="6">17:00</asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:CheckBox ID="chkThursdayEnable" runat="server" AutoPostBack="true" Checked="True"
                    OnCheckedChanged="ChkThursdayEnableCheckedChanged" />
            </td>
            <td>
                Thursday
            </td>
            <td>
                <asp:TextBox ID="txtThursdayStartTime" runat="server" Width="45px" MaxLength="6">9:00</asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="txtThursdayEndTime" runat="server" Width="45px" MaxLength="6">17:00</asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:CheckBox ID="chkFridayEnable" runat="server" AutoPostBack="true" Checked="True"
                    OnCheckedChanged="ChkFridayEnableCheckedChanged" />
            </td>
            <td>
                Friday
            </td>
            <td>
                <asp:TextBox ID="txtFridayStartTime" runat="server" Width="45px" MaxLength="6">9:00</asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="txtFridayEndTime" runat="server" Width="45px" MaxLength="6">17:00</asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:CheckBox ID="chkSaturdayEnable" runat="server" AutoPostBack="true" OnCheckedChanged="ChkSaturdayEnableCheckedChanged" />
            </td>
            <td>
                Sartuday
            </td>
            <td>
                <asp:TextBox ID="txtSaturdayStartTime" runat="server" Width="45px" Enabled="false"
                    MaxLength="6"></asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="txtSaturdayEndTime" runat="server" Width="45px" Enabled="false"
                    MaxLength="6"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:CheckBox ID="chkSundayEnable" runat="server" AutoPostBack="true" OnCheckedChanged="ChkSundayEnableCheckedChanged" />
            </td>
            <td>
                Sunday
            </td>
            <td>
                <asp:TextBox ID="txtSundayStartTime" runat="server" Width="45px" Enabled="false"
                    MaxLength="6"></asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="txtSundayEndTime" runat="server" Width="45px" Enabled="false" MaxLength="6"></asp:TextBox>
            </td>
        </tr>
    </table>
</div>
