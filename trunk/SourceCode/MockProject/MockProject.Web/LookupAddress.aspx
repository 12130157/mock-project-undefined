<%@ Page Language="C#" MasterPageFile="~/MainTemplate.Master" AutoEventWireup="true" CodeBehind="LookupAddress.aspx.cs" Inherits="MockProject.Web.LookupAddress" Title="Lookup Address Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div id="mainFormSearchPostcode">
        <b>Search Postcode</b>
        <br /><br>
        <div id="searchPostcode">
            <asp:Label ID="LabelPostcode" CssClass="label" runat="server" Text="Postcode:"></asp:Label>
            <asp:TextBox ID="TextBoxPostcode" CssClass="textboxSearch" runat="server"></asp:TextBox>
            <asp:Label ID="LabelStreet" CssClass="label" runat="server" Text="Street"></asp:Label>
            <asp:TextBox ID="TextBoxStreet" CssClass="textboxSearch" runat="server"></asp:TextBox>
            <asp:Label ID="LabelTown" CssClass="label" runat="server" Text="Town"></asp:Label>
            <asp:TextBox ID="TextBoxTown" CssClass="textboxSearch" runat="server"></asp:TextBox>
        </div>
        <div id="ButtonContact">
            <asp:Button ID="ButtonSearchAddress" CssClass="button" runat="server" 
                Text="Search Address" />
            <asp:Button ID="Button2" CssClass="button" runat="server" Text="None" />
            <asp:Button ID="Button3" CssClass="button" runat="server" Text="Clear" />
        </div>

        <div id="gridView">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                Height="33px">
                <Columns>
                    <asp:CheckBoxField />
                    <asp:BoundField HeaderText="Address" />
                    <asp:BoundField HeaderText="Post code" />
                    <asp:BoundField HeaderText="Town" />
                    <asp:BoundField HeaderText="County" />
                    <asp:BoundField HeaderText="Country" />
                </Columns>
            </asp:GridView>
        </div>
        <div id="paging">
            
        </div>
        <div id="buttonfooter">
            <asp:Button ID="Button5" CssClass="button" runat="server" Text="Select" />
            <asp:Button ID="Button7" CssClass="button" runat="server" Text="Close" />
        </div>
            
    </div>
</asp:Content>
