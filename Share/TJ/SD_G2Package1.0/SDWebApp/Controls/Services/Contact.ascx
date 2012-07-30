<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Contact.ascx.cs" Inherits="SD.Web.Views.WebUserControl2" %>


<table cellpadding="10">
    <tr>
        <td >
            Contract Outcome</td>
        <td  >
            <asp:Panel ID="pnlContractOutcome" runat="server" BorderWidth="1px" ScrollBars="Both" 
                Width="200px">
                <asp:CheckBoxList ID="chkContractOutcome" runat="server" Width="216px" 
                    Height="121px">
                </asp:CheckBoxList>
            </asp:Panel>
        </td>
        <td >
            Contract Obligation</td>
        <td  >
            <asp:Panel ID="pnlContractObligation" runat="server" Height="121px" BorderWidth="1px" 
                Width="200px" ScrollBars="Both">
                <asp:CheckBoxList ID="chkContractObligation" runat="server">
                </asp:CheckBoxList>
            </asp:Panel>
        </td>
    </tr>
    <tr>
        <td >
            Participation</td>
        <td colspan="3" >
            <asp:DropDownList ID="ddlParticipation" runat="server" Height="26px" 
                Width="200px">
            </asp:DropDownList>
        </td>
    </tr>
</table>
