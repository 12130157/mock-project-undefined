<%@ Page Language="C#" MasterPageFile="~/Shares/Site1.Master" AutoEventWireup="true" CodeBehind="ServiceSelectPremise.aspx.cs" Inherits="SD.Web.Views.Services.ServiceSelectPrimise" Title="Untitled Page" %>

<%@ Register src="../../Controls/Services/ServiceAddPremise.ascx" tagname="ServiceAddPremise" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Select Service</title>
    <link href="../../Css/Stylesheet1.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="TitleContent">
        Select Service<br />
    </div>
    <asp:UpdatePanel ID="selectService" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
        
            <uc1:ServiceAddPremise ID="ServiceAddPremise1" runat="server" />
        
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
