<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Detail2.ascx.cs" Inherits="SD.Web.Views.WebUserControl3" %>



<table  cellpadding="10">
    <tr>
        <td >
            Service Benifits Criterion</td>
        <td  >
            <asp:Panel ID="pnlSerBenCrit" runat="server" BorderWidth="1px" Height="100px" 
                ScrollBars="Both">
                <asp:CheckBoxList ID="chkSerBenCrit" runat="server" Height="105px">
                </asp:CheckBoxList>
            
            </asp:Panel>
        </td>
        <td  >
            <asp:Panel ID="Panel7" runat="server" Width="170px">
                Service Disability
            </asp:Panel>
        </td>
        <td >
            <asp:Panel ID="pnlSerDisability" runat="server" BorderWidth="1px" Height="100px" 
                ScrollBars="Both" Width="190px">
                <asp:CheckBoxList ID="chkSerDisability" runat="server">
                </asp:CheckBoxList>
            </asp:Panel>
        </td>
    </tr>
    <tr>
        <td >
            Service Barriers Criterion</td>
        <td  >
            <asp:Panel ID="pnlSerBarCrit" runat="server" BorderWidth="1px" Height="100px" 
                ScrollBars="Both">
                <asp:CheckBoxList ID="chkSerBarCrit" runat="server" Width="182px">
                </asp:CheckBoxList>
            </asp:Panel>
        </td>
        <td >
            <asp:Panel ID="Panel8" runat="server" Width="170px">
                <span  
                    style="color: rgb(0, 0, 0); font-family: verdana, tahoma, helvetica; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-align: -webkit-auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); ">
                Service Personal Circumstances Criterion</span>
            </asp:Panel>
        </td>
        <td >
            <asp:Panel ID="pnlSerPerCirCrit" runat="server" BorderWidth="1px" Height="100px" 
                ScrollBars="Both" Width="190px">
                <asp:CheckBoxList ID="chkSerPerCirCrit" runat="server">
                </asp:CheckBoxList>
            </asp:Panel>
        </td>
    </tr>
    <tr>
        <td >
            Service Ethnicity Criterion</td>
        <td   >
            <asp:Panel ID="pnlSerEthCrit" runat="server" BorderWidth="1px" Height="100px" 
                ScrollBars="Both">
                <asp:CheckBoxList ID="chkSerEthCrit" runat="server">
                </asp:CheckBoxList>
            </asp:Panel>
        </td>
        <td >
            <asp:Panel ID="Panel9" runat="server" Width="170px">
                Other Service Participation Criterion
            </asp:Panel>
        </td>
        <td >
            <asp:Panel ID="Panel6" runat="server" BorderWidth="1px" Height="100px" 
                ScrollBars="Both" Width="190px">
                <asp:CheckBoxList ID="chkOtherCrit" runat="server">
                </asp:CheckBoxList>
            </asp:Panel>
        </td>
    </tr>
</table>
