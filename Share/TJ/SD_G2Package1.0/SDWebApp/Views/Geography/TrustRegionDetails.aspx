<%@ Page Language="C#" MasterPageFile="~/Shares/Site1.Master" AutoEventWireup="true"
    CodeBehind="TrustRegionDetails.aspx.cs" Inherits="SD.Web.Views.Geography.TrustRegionDetails"
    Title="Trust Region Details" %>

<%@ Register Assembly="msgBox" Namespace="BunnyBear" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register TagPrefix="uc1" TagName="TrustRegionDetails" Src="~/Controls/Geography/TrustRegionDetails.ascx" %>
<%@ Register TagPrefix="uc2" TagName="TrustDistricts" Src="~/Controls/Geography/TrustDistricts.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .error
        {
            color: Red;
            font-size: 10pt;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <table style="border: 1px solid #9e9f9f; width: 100%">
            <tr>
                <td>
                    <div class="TitleContent">
                        Trust Region Details
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="filter">
                        <div style="text-align: right">
                            <asp:Button ID="btnInactive" runat="server" Text="Inactive" Style="width: 63px" OnClick="BtnInactive_Click" />
                            <asp:Button ID="btnSave" runat="server" Text="Save" CommandName="Create" OnClick="BtnSave_Click" />
                            <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="BtnBack_Click" />
                            <asp:ConfirmButtonExtender ID="cbeInactive" runat="server" TargetControlID="btnInactive"
                                ConfirmText="Do you want to make this Trust Region inactive?">
                            </asp:ConfirmButtonExtender>
                        </div>
                        <div>
                            <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0">
                                <asp:TabPanel runat="server" HeaderText="Details" ID="Details">
                                    <ContentTemplate>
                                        <uc1:TrustRegionDetails ID="RegionDetails" runat="server"></uc1:TrustRegionDetails>
                                        <div class="error">
                                            <asp:Label ID="lblRegionErr" runat="server"></asp:Label>
                                        </div>
                                    </ContentTemplate>
                                </asp:TabPanel>
                                <asp:TabPanel ID="TrustDistricts" runat="server" HeaderText="Trust Districts">
                                    <ContentTemplate>
                                        <uc2:TrustDistricts ID="Districts" runat="server"></uc2:TrustDistricts>
                                    </ContentTemplate>
                                </asp:TabPanel>
                            </asp:TabContainer>
                            <div>
                            </div>
                            <div>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
    </div>
    <cc1:msgBox ID="MsgBox1" runat="server" />
</asp:Content>
