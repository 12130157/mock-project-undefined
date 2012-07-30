<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="popupedit.ascx.cs" Inherits="SD.Web.Views.popupedit" %>
<style type="text/css">
    .style1
    {
        text-align: right;
    }
</style>
<asp:Panel ID="Panel1" runat="server" Height="154px" Width="311px">
    <asp:Label ID="Label1" runat="server" Text="Change Roles of Orgnisation"></asp:Label>
    <asp:Panel ID="Panel2" runat="server" Height="100px" Width="313px">
        <asp:CheckBoxList ID="CheckBoxList1" runat="server" Width="251px">
            <asp:ListItem>Funder</asp:ListItem>
            <asp:ListItem>Lead</asp:ListItem>
            <asp:ListItem>Delivery</asp:ListItem>
            <asp:ListItem>Autidor</asp:ListItem>
        </asp:CheckBoxList>
        <div class="style1">
            <asp:Button ID="OK" runat="server" Text="Button" />
            <asp:Button ID="Button2" runat="server" Text="Cancle" />
            <br />
        </div>
    </asp:Panel>
</asp:Panel>
