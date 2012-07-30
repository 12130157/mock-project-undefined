<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FacilityDetailsInfo.ascx.cs" Inherits="SD.Web.Controls.Premises.FacilityDetailsInfo" %>
<%@ Register TagPrefix="uc1" TagName="ContactLookUp" Src="~/Controls/Contact/ContactSelect.ascx" %>
<link href="../../Css/Stylesheet1.css" rel="stylesheet" type="text/css" />


<table style="width:100%">
    <tr>
        <td>
            Facility Type<asp:Label ID="lblFacilityTypeRequirement" runat="server" Text="*" ForeColor="Red"></asp:Label>
        </td>
        <td>
            <asp:DropDownList ID="cboFacilityType" runat="server" AutoPostBack="true" 
                onselectedindexchanged="CboFacilityTypeSelectedIndexChanged" 
                Width="200px">
            </asp:DropDownList>
        </td>
        <td>
            Lead Contact</td>
        <td>
            <asp:TextBox ID="txtLeadContact" runat="server" MaxLength="200" Width="165px" ReadOnly="True"></asp:TextBox>
            <asp:Button ID="btnLeadContactSelect" runat="server" Text="..." 
                onclick="BtnLeadContactSelectClick" UseSubmitBehavior="False" />
            </td>
    </tr>
    <tr>
        <td>
            Facility Description<asp:Label ID="lblDesRequirement" runat="server" Text="*" 
                ForeColor="Red"></asp:Label>
        </td>
        <td>
            <asp:TextBox CssClass="DetailMulti" ID="txtFacilityDescription" runat="server" TextMode="MultiLine" 
                MaxLength="250" Width="200px"></asp:TextBox>
        </td>
        <td>Rooms Host</td>
        <td>
            <asp:TextBox  ID="txtRoomHost" runat="server" MaxLength="200" Width="165px" ReadOnly="True"></asp:TextBox>
            <asp:Button ID="btnRoomHostSelect" runat="server" Text="..." 
                onclick="BtnRoomHostSelectClick" UseSubmitBehavior="False" />
        </td>
    </tr>
    <tr>
        <td>Room Capacility</td>
        <td>
            <asp:TextBox ID="txtRoomCapacility" runat="server" Width="200px" MaxLength="100"></asp:TextBox>
        </td>
        <td>Equipment Avaiable</td>
        <td>
            <asp:CheckBox ID="chkEquipmentAvaiable" runat="server" AutoPostBack="true"
                oncheckedchanged="ChkEquipmentAvaiableCheckedChanged" />
        </td>
    </tr>
    <tr>
        <td>Room Size</td>
        <td>
            <asp:TextBox ID="txtRoomSize" runat="server" MaxLength="100" Width="200px"></asp:TextBox>
        </td>
        <td rowspan="3">Room and Equipment Notes</td>
        <td rowspan="3">
            <asp:TextBox CssClass="DetailMulti" ID="txtRoomEquipmentNote" runat="server" TextMode="MultiLine" Width="200px"
                Height="52px" MaxLength="250"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>Room Connectivity</td>
        <td>
            <asp:CheckBox ID="chkRoomConnectivity" runat="server" AutoPostBack="true"
                oncheckedchanged="ChkRoomConnectivityCheckedChanged" />
        </td>
    </tr>
    <tr>
        <td>Connectivity Type</td>
        <td>
            <asp:DropDownList ID="cboConnectivityType" runat="server" Width="200px" AutoPostBack="true" >
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td>Wireless Access Information</td>
        <td>
            <asp:TextBox ID="txtWirelessAccessInfo" runat="server" MaxLength="100" Width="200px"></asp:TextBox>
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