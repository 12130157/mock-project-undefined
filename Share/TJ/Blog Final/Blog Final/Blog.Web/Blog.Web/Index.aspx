<%@ Page Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Blog.Web.Index" Title="MyBlog" %>
<%@ Register src="UserControls/ControlSearch.ascx" tagname="ControlSearch" tagprefix="uc1" %>
<%@ Register src="UserControls/ControlCategory.ascx" tagname="ControlCategory" tagprefix="uc2" %>
<%@ Register src="UserControls/ControlLogOn.ascx" tagname="ControlLogOn" tagprefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentSearch" runat="server">
    <uc1:ControlSearch ID="ControlSearch1" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentContent" runat="server">
    <asp:PlaceHolder ID="placeCenter" runat="server"></asp:PlaceHolder>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentLogOn" runat="server">
    <asp:PlaceHolder ID="placeLogOn" runat="server"></asp:PlaceHolder>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="contentCategories" runat="server">
    <uc2:ControlCategory ID="ControlCategory1" runat="server" />
</asp:Content>
