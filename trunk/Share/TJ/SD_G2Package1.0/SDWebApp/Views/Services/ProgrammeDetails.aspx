<%@ Page Language="C#" MasterPageFile="~/Shares/Site1.Master" AutoEventWireup="true"
    CodeBehind="ProgrammeDetails.aspx.cs" Inherits="SD.Web.Views.Services.ProgrammeDetails"
    Title="Programme Details" %>

<%@ Register Assembly="msgBox" Namespace="BunnyBear" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register TagPrefix="uc" TagName="ProgrammeDetails" Src="~/Controls/Services/ProgrammeDetails.ascx" %>
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
    <table style="border: 1px solid #9e9f9f; width: 100%">
        <tr>
            <td>
                <div class="TitleContent">
                    Programme Details
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="filter">
                    <div style="text-align: right">
                        <asp:Button ID="btnDeactivate" runat="server" Text="Deactivate" Style="width: 75px"
                            OnClick="BtnDeactivate_Click" />
                        <asp:Button ID="btnSave" runat="server" Text="Save" CommandName="Create" OnClick="BtnSave_Click" />
                        <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="BtnBack_Click" />
                    </div>
                    <div>
                        <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0">
                            <asp:TabPanel runat="server" ID="Details" HeaderText="Details">
                                <ContentTemplate>
                                    <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <uc:ProgrammeDetails ID="ProgDetails" runat="server"></uc:ProgrammeDetails>
                                            <div class="error">
                                                <asp:Label ID="lblProgErr" runat="server"></asp:Label>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
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
    <cc1:msgBox ID="MsgBox1" runat="server" />
</asp:Content>
