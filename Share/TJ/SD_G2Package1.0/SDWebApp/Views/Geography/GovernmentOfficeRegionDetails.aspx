<%@ Page Language="C#" MasterPageFile="~/Shares/Site1.Master" AutoEventWireup="true"
    CodeBehind="GovernmentOfficeRegionDetails.aspx.cs" Inherits="SD.Web.Views.Geography.GovernmentOfficeRegionDetails"
    Title="Government Office Region Details" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register TagPrefix="uc" TagName="GovtOfficeRegionDetails" Src="~/Controls/Geography/GovernmentOfficeRegionDetails.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      
   <table style="border: 1px solid #9e9f9f; width:100%">
        <tr>
        <td><div class="TitleContent">
            Government Office Region Details
               
        </div></td>
        </tr>
            <tr><td><div class="filter">
    <div style="text-align: right">
        <asp:Button ID="btnBack" runat="server" Text="Back" onclick="btnBack_Click" />
    </div>
    <div>
        <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0">
            <asp:TabPanel runat="server" HeaderText="Details" ID="Details">
                <ContentTemplate>
                    <uc:GovtOfficeRegionDetails ID="GovtOfficeRegionDetails1" runat="server" />
                </ContentTemplate>
            </asp:TabPanel>
        </asp:TabContainer>
    </div></div>
    </td>
    </tr>
    </table>
</asp:Content>
