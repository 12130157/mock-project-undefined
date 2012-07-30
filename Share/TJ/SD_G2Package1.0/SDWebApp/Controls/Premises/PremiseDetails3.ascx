<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PremiseDetails3.ascx.cs" Inherits="SD.Web.Controls.Premises.PremiseDetail3" %>
<%@ Register TagPrefix="uc1" TagName="ContactLookUp" Src="~/Controls/Contact/ContactSelect.ascx" %>
<link href="../../Css/Stylesheet1.css" rel="stylesheet" type="text/css" />

<table style="width:100%;">
    <tr>
        <td>
            Outreach location
        </td>
        <td>
            <asp:Panel ID="pnlOutreachLocation" runat="server" Height="124px" Width="200px" ScrollBars="Vertical" BorderWidth="1px">
                <asp:CheckBoxList ID="cblOutreachLocation" runat="server" >
                </asp:CheckBoxList>
            </asp:Panel>
        </td>
        <td>
            Local Hotels</td>
        <td>
            <asp:Panel ID="pnlLocalHotels" runat="server" Height="124px" Width="200px" ScrollBars="Vertical" BorderWidth="1px">
                <asp:CheckBoxList ID="cblLocalHotels" runat="server" >
                </asp:CheckBoxList>
            </asp:Panel>
        </td>
    </tr>
    <tr>
        <td>Travel Details</td>
        <td>
            <asp:TextBox ID="txtTravelDetails" Width="200px" runat="server"></asp:TextBox>
        </td>
        <td>Visitor Parking Onsite</td>
        <td>
            <asp:CheckBox ID="chkVisitorParkingOnsite" runat="server" AutoPostBack="true" 
                oncheckedchanged="ChkVisitorParkingOnsiteCheckedChanged" />
        </td>
    </tr>
    <tr>
        <td>Travel Nearest - Bus</td>
        <td>
            <asp:TextBox ID="txtNearestBus" Width="200px" runat="server"></asp:TextBox>
        </td>
        <td>Visitor Parking Space</td>
        <td>
            <asp:TextBox ID="txtParkingSpace" runat="server" Width="200px" Enabled="False" 
                MaxLength="10">0</asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>Travel Nearest - Rail</td>
        <td>
            <asp:TextBox ID="txtNearestRail" Width="200px" runat="server"></asp:TextBox>
        </td>
        <td rowspan="2">Visitor Parking Alternative</td>
        <td rowspan="2">
            <asp:TextBox CssClass="DetailMulti" ID="txtParkingAlternative" Width="200px" runat="server" TextMode="MultiLine"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>Travel Nearest - Airport</td>
        <td>
            <asp:TextBox ID="txtNearestAirport" Width="200px" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>Host Visits</td>
        <td>
            <asp:CheckBox ID="chkHostVisits" runat="server" AutoPostBack="true" 
                oncheckedchanged="ChkHostVisitsCheckedChanged" />
        </td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td>Hosting Contact</td>
        <td>
            <asp:TextBox ID="txtHostingContact" runat="server" Width="165px" 
                Enabled="False" ReadOnly="True"></asp:TextBox>
            <asp:Button ID="btnHostingContactSelect" runat="server" Text="..." 
                Enabled="False" onclick="BtnHostingContactSelectClick" 
                UseSubmitBehavior="False" />
        </td>
        <td></td>
        <td></td>
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