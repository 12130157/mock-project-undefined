<%@ Page Language="C#" MasterPageFile="~/Shares/Site1.Master" AutoEventWireup="true"
    CodeBehind="PremiseServiceSelect.aspx.cs" Inherits="SD.Web.Views.Premises.PremiseServiceSelect"
    Title="Untitled Page" %>

<%@ Register Src="~/Controls/Premises/PremiseServicesAdd.ascx" TagName="AddService"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Select Service</title>
    <link href="../../Css/Stylesheet1.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <asp:UpdatePanel ID="selectService" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <uc1:AddService ID="serviceSelect" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
