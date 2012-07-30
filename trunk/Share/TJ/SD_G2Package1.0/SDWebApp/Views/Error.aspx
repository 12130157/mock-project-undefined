<%@ Page Language="C#" MasterPageFile="~/Shares/Site1.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="SD.Web.Views.Error" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<head>
    <title>Error page</title>
</head>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center" style="margin-top: 50px">
        <h1><asp:Label ID="lblMessage" runat="server"  CssClass="TitleContent"></asp:Label></h1>
       <%-- <center><asp:LinkButton ID="LinkButton1" runat="server" onclick="Logout_Click">Click me</asp:LinkButton></center>--%>   
        </div>     
</asp:Content>
