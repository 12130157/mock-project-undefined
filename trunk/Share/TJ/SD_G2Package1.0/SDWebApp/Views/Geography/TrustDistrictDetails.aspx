<%@ Page Language="C#" MasterPageFile="~/Shares/Site1.Master" AutoEventWireup="true"
    CodeBehind="TrustDistrictDetails.aspx.cs" Inherits="SD.Web.Views.Geography.TrustDistrictDetails"
    Title="Trust District Details" %>

<%@ Register Assembly="msgBox" Namespace="BunnyBear" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register TagPrefix="uc" TagName="Details" Src="~/Controls/Geography/TrustDistrictDetails.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="border: 1px solid #9e9f9f; width: 100%">
        <tr>
            <td>
                <div class="TitleContent">
                    Trust District Details
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="filter">
                    <div style="text-align: right">
                        <asp:Button ID="btnInactive" runat="server" Text="Inactive" OnClick="BtnInactive_Click" />
                        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="BtnSave_Click" />
                        <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="BtnBack_Click" />
                        <asp:ConfirmButtonExtender ID="cbeInactive" runat="server" TargetControlID="btnInactive"
                            ConfirmText="Do you want to make this Trust District inactive?">
                        </asp:ConfirmButtonExtender>
                    </div>
                    <div>
                        <asp:TabContainer ID="TabContainer" runat="server" ActiveTabIndex="0">
                            <asp:TabPanel runat="server" HeaderText="Details" ID="Details">
                                <ContentTemplate>
                                    <uc:Details ID="DistrictDetails" runat="server" />
                                    <div class="Error">
                                        <asp:Label ID="lblDistrictErr" runat="server"></asp:Label>
                                    </div>
                                </ContentTemplate>
                            </asp:TabPanel>
                        </asp:TabContainer>
                    </div>
                </div>
            </td>
        </tr>
    </table>
    <cc1:msgBox ID="MsgBox1" runat="server" />
</asp:Content>
