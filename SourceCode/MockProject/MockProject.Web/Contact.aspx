<%@ Page Language="C#" MasterPageFile="~/MainTemplate.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="MockProject.Web.Contact" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    Contact
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div id="mainFormContact">
        <div id="header">
            <asp:Label ID="Label1" runat="server" Text="Search Contact"></asp:Label>
        </div>
        <div id="searchContact">
            <asp:Label ID="LabelFirstName" CssClass="label" runat="server" Text="First Name:"></asp:Label>
            <asp:TextBox ID="TextBoxFirstName" CssClass="textboxSearch" runat="server"></asp:TextBox>
            <asp:Label ID="LabelSurName" CssClass="label" runat="server" Text="SurName"></asp:Label>
            <asp:TextBox ID="TextBoxSurName" CssClass="textboxSearch" runat="server"></asp:TextBox>
        </div>
        <div id="ButtonContact">
            <asp:Button ID="Button1" CssClass="button" runat="server" Text="Search Contact" />
            <asp:Button ID="Button2" CssClass="button" runat="server" Text="None" />
            <asp:Button ID="Button3" CssClass="button" runat="server" Text="Clear" />
            <asp:Button ID="Button4" CssClass="button" runat="server" Text="Create" />
        </div>
        
        <div id="checkboxContact">
            <asp:CheckBox ID="CheckBoxActive" runat="server" /> &nbsp;Include in-active contact
        </div>
        <div id="gridView">
            <asp:GridView ID="GridView1" runat="server">
                <Columns>
                    <asp:CheckBoxField />
                </Columns>
            </asp:GridView>
        </div>
        <div id="paging">
            
        </div>
        <div id="buttonfooter">
            <asp:Button ID="Button5" CssClass="button" runat="server" Text="Select" />
            <asp:Button ID="Button6" CssClass="button" runat="server" Text="Edit" />
            <asp:Button ID="Button7" CssClass="button" runat="server" Text="Close" />
        </div>
            
    </div>
    
</asp:Content>
