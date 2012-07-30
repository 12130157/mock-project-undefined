<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Detail3.ascx.cs" Inherits="SD.Web.Views.Detail3" %>



<table >
    <tr>
        <td >
            <asp:Panel ID="Panel10" runat="server" Width="140px">
                Client Support Process
            </asp:Panel>
        </td>
        <td >
            <asp:Panel ID="Panel1" runat="server" BorderWidth="1px" ScrollBars="Vertical" 
                Height="100px">
                <asp:CheckBoxList ID="chkClienSupportProcess" runat="server">
                </asp:CheckBoxList>
            </asp:Panel>
        </td>
        <td>
            <asp:Panel ID="Panel11" runat="server" Width="140px">
                Client Outcome
            </asp:Panel>
        </td>
        <td>
            <asp:Panel ID="Panel2" runat="server" BorderWidth="1px" ScrollBars="Vertical" 
                Height="100px">
                <asp:CheckBoxList ID="chkClientOutcome" runat="server">
                </asp:CheckBoxList>
            </asp:Panel>
        </td>
    </tr>
    <tr>
        <td>
            Intervention</td>
        <td >
            <asp:Panel ID="Panel4" runat="server" BorderWidth="1px" ScrollBars="Vertical" 
                Height="100px">
                <asp:CheckBoxList ID="chkIntervention" runat="server">
                </asp:CheckBoxList>
            </asp:Panel>
        </td>
        <td>
            Target Client</td>
        <td>
            <asp:Panel ID="Panel3" runat="server" BorderWidth="1px" ScrollBars="Vertical" 
                Height="100px">
                <asp:CheckBoxList ID="chkTargetClient" runat="server">
                </asp:CheckBoxList>
            </asp:Panel>
        </td>
    </tr>
    <tr>
        <td >
            Client Journey</td>
        <td >
            <asp:Panel ID="Panel5" runat="server" BorderWidth="1px" ScrollBars="Vertical" 
                Height="100px">
                <asp:CheckBoxList ID="chkCLienJourney" runat="server">
                </asp:CheckBoxList>
            </asp:Panel>
        </td>
        <td>
            Accreditations</td>
        <td>
            <asp:Panel ID="Panel6" runat="server" BorderWidth="1px" ScrollBars="Vertical" 
                Height="100px">
                <asp:CheckBoxList ID="chkAccreditaions" runat="server">
                </asp:CheckBoxList>
            </asp:Panel>
        </td>
    </tr>
    <tr>
        <td >
            Other Services</td>
        <td >
            <asp:Panel ID="Panel7" runat="server" BorderWidth="1px" ScrollBars="Vertical" 
                Height="100px">
                <asp:CheckBoxList ID="chkOtherServices" runat="server">
                </asp:CheckBoxList>
            </asp:Panel>
         </td>
        <td>
            Referral Sources</td>
        <td>
            <asp:Panel ID="Panel9" runat="server" BorderWidth="1px" ScrollBars="Vertical" 
                Height="100px">
                <asp:CheckBoxList ID="chkReferralSources" runat="server">
                </asp:CheckBoxList>
            </asp:Panel></td>
    </tr>
    <tr>
        <td rowspan="2" >
            Support Centres</td>
        <td rowspan="2" >
            <asp:Panel ID="Panel8" runat="server" BorderWidth="1px" ScrollBars="Vertical" 
                Height="100px" Width="200px">
                <asp:CheckBoxList ID="chkSupportCentres" runat="server">
                </asp:CheckBoxList>
            </asp:Panel>
        </td>
        <td >
            Programme</td>
        <td style="margin-left: 120px" >
            <asp:DropDownList ID="ddlProgramme" runat="server" Width="200px" >
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            &nbsp;</td>
    </tr>
</table>
