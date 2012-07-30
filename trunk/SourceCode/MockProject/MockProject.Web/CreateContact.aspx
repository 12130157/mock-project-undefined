<%@ Page Language="C#" MasterPageFile="~/MainTemplate.Master" AutoEventWireup="true" CodeBehind="CreateContact.aspx.cs" Inherits="MockProject.Web.CreateContact" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    Create New Contact
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div id="mainCreateContact">
        <div id="line1">
            <div class="colum1">
                    <asp:Label ID="Label1" CssClass="labelCreateContact" runat="server" Text="Firt Name"></asp:Label>
                    <asp:TextBox ID="TextBoxFirstName" CssClass="texboxCreateContact" runat="server"></asp:TextBox>
            </div>
            <div class="colum2">
                    <asp:Label ID="Label2" CssClass="labelCreateContact" runat="server" Text="Manager Name"></asp:Label>
                    <asp:TextBox ID="TextBoxManagerName" runat="server"></asp:TextBox> &nbsp;&nbsp;
                    <asp:HyperLink ID="HyperLink1" runat="server">Lookup</asp:HyperLink>
            </div>
            
        </div>
        <div id="line2">
            <div class="colum1">
                    <asp:Label ID="LabelSurname" CssClass="labelCreateContact" runat="server" Text="Surname"></asp:Label>
                    <asp:TextBox ID="TextBoxSurname" CssClass="texboxCreateContact" runat="server"></asp:TextBox>
            </div>
            <div class="colum2">
                    <asp:Label ID="Label4" CssClass="labelCreateContact" runat="server" Text="Contact Type"></asp:Label>
                    <asp:DropDownList ID="DropDownListContactType" CssClass="texboxCreateContact" runat="server">
                </asp:DropDownList>
            </div>
            
        </div>
        <div id="line3">
            <div class="colum1">
                    <asp:Label ID="Label5" CssClass="labelCreateContact" runat="server" Text="Know As"></asp:Label>
                    <asp:TextBox ID="TextBoxKnow" CssClass="texboxCreateContact" runat="server"></asp:TextBox>
            </div>
            <div class="colum2">
                    <asp:Label ID="Label6" CssClass="labelCreateContact" runat="server" Text="Best Contact Method"></asp:Label>
                <asp:DropDownList ID="DropDownListBestMethod" CssClass="texboxCreateContact" runat="server">
                </asp:DropDownList>
            </div>
            
        </div>
        <div id="line4">
            <div class="colum1">
                    <asp:Label ID="Label7" CssClass="labelCreateContact" runat="server" Text="Office Phone"></asp:Label>
                    <asp:TextBox ID="TextBoxOfficePhone" CssClass="texboxCreateContact" runat="server"></asp:TextBox>
            </div>
            <div class="colum2">
                    <asp:Label ID="Label8" CssClass="labelCreateContact" runat="server" Text="Job Role"></asp:Label>
                    <asp:TextBox ID="TextBoxJobRole" CssClass="texboxCreateContact" runat="server"></asp:TextBox>
            </div>
        </div>
        <div id="line5">
            <div class="colum1">
                    <asp:Label ID="Label9" CssClass="labelCreateContact" runat="server" Text="Mobile Phone"></asp:Label>
                    <asp:TextBox ID="TextBoxMobile" CssClass="texboxCreateContact" runat="server"></asp:TextBox>
            </div>
            <div class="colum2">
                    <asp:Label ID="Label10" CssClass="labelCreateContact" runat="server" Text="Workbase"></asp:Label>
                    <asp:TextBox ID="TextBoxWorkbase" CssClass="texboxCreateContact" runat="server"></asp:TextBox>
            </div>
        </div>
        <div id="line6">
            <div class="colum1">
                    <asp:Label ID="Label11" CssClass="labelCreateContact" runat="server" Text="ST Home Phone"></asp:Label>
                    <asp:TextBox ID="TextBoxHomePhone" CssClass="texboxCreateContact" runat="server"></asp:TextBox>
            </div>
            <div class="colum2">
                    <asp:Label ID="Label12" CssClass="labelCreateContact" runat="server" Text="Job Title"></asp:Label>
                    <asp:TextBox ID="TextBoxJobTitle" CssClass="texboxCreateContact" runat="server"></asp:TextBox>
            </div>
        </div>
        <div id="line7">
            <div class="colum1">
                    <asp:Label ID="Label13" CssClass="labelCreateContact" runat="server" Text="Email Adress"></asp:Label>
                    <asp:TextBox ID="TextBoxEmail" CssClass="texboxCreateContact" runat="server"></asp:TextBox>
            </div>
            <div class="colum2">
                    <asp:Label ID="Label14" CssClass="labelCreateContact" runat="server" Text="Is Active?"></asp:Label>
                    <asp:CheckBox ID="CheckBox1" runat="server" />
            </div>
        </div>
        
        
        
        
        <div id="buttonCreateContact">
            <asp:Button ID="Button1" CssClass="buttonContact" runat="server" Text="Back" />
            <asp:Button ID="Button2" CssClass="buttonContact" runat="server" Text="Save" />
        </div>
    </div>
</asp:Content>
