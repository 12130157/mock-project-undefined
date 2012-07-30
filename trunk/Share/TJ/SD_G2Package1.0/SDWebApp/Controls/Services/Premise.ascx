<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Premise.ascx.cs" Inherits="SD.Web.Views.Premise" %>
<div class="Gridview">
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
    CellPadding="4" ForeColor="#333333" Width="100%">
    <RowStyle BackColor="#EFF3FB" />
    <Columns>
        <asp:HyperLinkField DataTextField="preName" HeaderText="Premise Name" />
        <asp:BoundField DataField="address" HeaderText="Address" />
        <asp:BoundField DataField="phone" HeaderText="Phone Number" />
        <asp:BoundField DataField="projCode" HeaderText="Project Code" />
        <asp:CommandField DeleteText="Remove" ShowDeleteButton="True" />
    </Columns>
    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <EditRowStyle BackColor="#2461BF" />
    <AlternatingRowStyle BackColor="White" />
</asp:GridView>
</div>
<div style="text-align:right;">
    <br />
    <asp:Button ID="Button5" runat="server" style="margin-top: 0px" 
        Text="Associate new premise" /></div>
