<%@ Page Language="C#" MasterPageFile="~/Shares/Site1.Master" AutoEventWireup="true" ValidateRequest="false"
    CodeBehind="VolunteeringDetails.aspx.cs" Inherits="SD.Web.Views.Premises.VolunteeringDetails"
    Title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" %>
<%@ Register Src="~/Controls/Premises/VolunteeringDetailsInfo.ascx" TagName="DetailsInfo"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Volunteering</title>

    <script src="../../Scripts/script.js" type="text/javascript"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="TitleContent">
        Volunteering Opportunity Details
        <br />
        <br />
    </div>
    <div style="float: right; padding-right: 30px;">
        <asp:Button ID="btnInActive" runat="server" Text="In-Active" 
            onclick="BtnInActiveClick" />
        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="BtnSaveClick" />
        <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="BtnBackClick" />
    </div>
    <br />
    <ajaxToolkit:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0">
        <ajaxToolkit:TabPanel runat="server" HeaderText="Details" ID="TabPanel1">
            <ContentTemplate>
                <uc1:DetailsInfo ID="DetailsInfo" runat="server" />
                <asp:Label ID="errorSaving" runat="server" Visible="False" Text="Volunteer save fail!"
                    ForeColor="Red" />
            </ContentTemplate>
        </ajaxToolkit:TabPanel>
    </ajaxToolkit:TabContainer>
</asp:Content>
