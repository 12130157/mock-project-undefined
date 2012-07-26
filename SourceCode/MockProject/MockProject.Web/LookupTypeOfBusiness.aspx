<%@ Page Language="C#" MasterPageFile="~/MainTemplate.Master" AutoEventWireup="true" CodeBehind="LookupTypeOfBusiness.aspx.cs" Inherits="MockProject.Web.LookupTypeOfBusiness" Title="Lookup type of business page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div id="mainFormContact">
        <b>Search Business Type</b>
        <div id="searchBusinessType" style="margin-top:10px;">
            <asp:Label ID="LabelBusinessName" CssClass="searchBusiness" runat="server" Text="Business Name:"></asp:Label>
            <asp:TextBox ID="TextBoxPostcode" CssClass="searchBusiness" runat="server"></asp:TextBox>
            <asp:Label ID="LabelSICCode" CssClass="searchBusiness" runat="server" Text="SIC Code:"></asp:Label>
            <asp:TextBox ID="TextBoxSICCode" CssClass="searchBusiness" runat="server"></asp:TextBox>
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
                    <asp:BoundField HeaderText="Business Name" />
                    <asp:BoundField HeaderText=" SIC Code" />
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
