<%@ Page Language="C#" MasterPageFile="~/Shares/Site1.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SD.Web.Default" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Home</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="right">
    <%--<asp:LinkButton ID="LinkButton1" runat="server" onclick="Logout_Click">Logout</asp:LinkButton></div>--%>
    <div align="center" style="margin-top: 50px">
        <h1><asp:Label ID="Label1" runat="server" Text="Label" CssClass="TitleContent"></asp:Label></h1></div>
    </div>
</asp:Content>
