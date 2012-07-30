<%@ Page Language="C#" MasterPageFile="~/MainTemplate.Master" AutoEventWireup="true" CodeBehind="GovernmentOfficeRegionList.aspx.cs" Inherits="MockProject.Web.GovernmentOfficeRegionList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    Government Office Region List
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div id="MainOfficeRegion-memeberOne">
        <div id="IncludeSearch-memeberOne">
            <div id="searchChar-memeberOne"></div>
            <div id="searchStatus-memeberOne"><asp:CheckBox ID="CheckBox1" runat="server" /> Include In-Active</div>
        </div>
        <div id="content-memeberOne">
            
        </div>
    </div>
</asp:Content>
