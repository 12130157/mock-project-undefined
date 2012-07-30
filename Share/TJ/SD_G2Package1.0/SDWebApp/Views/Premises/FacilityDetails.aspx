<%@ Page Language="C#" MasterPageFile="~/Shares/Site1.Master" AutoEventWireup="true" ValidateRequest="false"
    CodeBehind="FacilityDetails.aspx.cs" Inherits="SD.Web.Views.Premises.FacilityDetails"
    Title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" %>
<%@ Register Src="~/Controls/Premises/FacilityDetailsInfo.ascx" TagName="DetailsInfo"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="../../Scripts/script.js" type="text/javascript"></script>

    <title>Facility Details</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="TitleContent">
                Facility Details
                <br />
                <div style="float: right;">
                    <asp:Button ID="btnInActive" runat="server" Text="In-Active" 
                        OnClick="BtnInActiveClick" />
                    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="BtnSaveClick" />
                    <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="BtnBackClick"/>
                </div>
                <br />
            </div>
            <div>
                <ajaxToolkit:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0">
                    <ajaxToolkit:TabPanel runat="server" HeaderText="Details" ID="TabPanel1">
                        <ContentTemplate>
                            <uc1:DetailsInfo ID="DetailsInfo" runat="server" />
                            <asp:Label ID="errorSaving" runat="server" Visible="False" Text="Facility save fail!"
                                ForeColor="Red" />
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                </ajaxToolkit:TabContainer>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
