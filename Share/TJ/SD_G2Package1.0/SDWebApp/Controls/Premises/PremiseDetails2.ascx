<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PremiseDetails2.ascx.cs" Inherits="SD.Web.Controls.Premises.PremiseDetail2" %>
<%@ Register Src="~/Controls/Contact/ContactSelect.ascx" TagName="ContactLookUp" TagPrefix="uc1" %> 
<link href="../../Css/Stylesheet1.css" rel="stylesheet" type="text/css" />

<table style="width:100%;">
    <tr>
        <td>
            Accredictation
        </td>
        <td >
            <asp:Panel ID="pnlAccredictation" runat="server" Height="124px" Width="170px" ScrollBars="Vertical" 
                BorderWidth="1px">
                <asp:CheckBoxList ID="cblAccredictation" runat="server">
                </asp:CheckBoxList>
            </asp:Panel>
        </td>
        <td>
            JPC Offices
        </td>
        <td>
            <asp:Panel ID="pnlJpcOffices" runat="server" Height="124px" Width="170px" ScrollBars="Vertical" BorderWidth="1px">
                <asp:CheckBoxList ID="cblJpcOffices" runat="server" >
                </asp:CheckBoxList>
            </asp:Panel>
        </td>
    </tr>
    <tr>
        <td>
            Media contact</td>
        <td>
            <asp:CheckBox ID="chkMediaContact" runat="server" AutoPostBack="true"
                oncheckedchanged="ChkMediaContactCheckedChanged" />
        </td>
        <td>
            Catering Facilities</td>
        <td>
            <asp:CheckBox ID="chkCateringFacilities" runat="server" AutoPostBack="true"
                oncheckedchanged="ChkCateringFacilitiesCheckedChanged" />
        </td>
    </tr>
    <tr>
        <td>
            Media contact name</td>
        <td>
            <asp:TextBox ID="txtMediaContactName" runat="server" ReadOnly="True" 
                Width="135px" Enabled="False"></asp:TextBox>
            <asp:Button ID="btnMediaContactSelect" runat="server" Text="..." 
                Enabled="False" onclick="BtnMediaContactSelectClick" 
                UseSubmitBehavior="False" />
        </td>
        <td>
            Catering contact</td>
        <td>
            <asp:TextBox ID="txtCateringContact" runat="server" ReadOnly="True" 
                Width="135px" Enabled="False"></asp:TextBox>
            <asp:Button ID="btnCateringContactSelect" runat="server" Text="..." 
                Enabled="False" onclick="BtnCateringContactSelectClick" 
                UseSubmitBehavior="False" />
        </td>
    </tr>
     <tr>
        <td rowspan="4">
            Local Demographic<br />
            Issues</td>
        <td rowspan="4">
            <asp:Panel ID="pnlLocalDemographic" runat="server" Height="124px" Width="170px" ScrollBars="Vertical" BorderWidth="1px">
                <asp:CheckBoxList ID="cblLocalDemographic" runat="server" >
                </asp:CheckBoxList>
            </asp:Panel>
        </td>
        <td >
            Catering type</td>
        <td>
            <asp:DropDownList ID="ddlCateringType" runat="server" Width="170px" 
                Enabled="False">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td> IS/Network</td>
        <td>
            <asp:DropDownList ID="ddlIsNetwork" runat="server" Width="170px">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td>Client IT Facilities</td>
        <td>
            <asp:CheckBox ID="chkClientItFacilities" runat="server" AutoPostBack="true"
                oncheckedchanged="ChkClientItFacilitiesCheckedChanged" />
        </td>
    </tr>
    <tr>
        <td rowspan="2">Client IT Facilities Details</td>
        <td rowspan="2">
            <asp:TextBox CssClass="DetailMulti" ID="txtClientItFacilitiesDetails" runat="server" 
                TextMode="MultiLine" Width="170px" Enabled="False"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td rowspan="3">Location Demographic<br />
            Notes</td>
        <td rowspan="3">
            <asp:TextBox CssClass="DetailMulti" ID="txtLocalDemographicNotes" runat="server" TextMode="MultiLine" Width="170px"></asp:TextBox>
        </td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td>Rooms Availability</td>
        <td>
            <asp:CheckBox ID="chkRoomsAvailability" runat="server" />
        </td>
    </tr>
    <tr>
        <td>Volunteering Opportunities</td>
        <td>
            <asp:CheckBox ID="chkVolunteering" runat="server" AutoPostBack="true"
                oncheckedchanged="ChkVolunteeringCheckedChanged" />
        </td>
    </tr>
    <tr>
        <td>
            </td>
    </tr>
</table>

<div id="MaskedDiv" runat="server" visible="false">
</div>
<div id="ContactLookupRegion" runat="server" visible="false">
    <uc1:ContactLookUp ID="ContactLookup" runat="server" OnButtonCloseClick="CloseContactPopup" OnButtonSelectClick="SelectContact" />
</div>