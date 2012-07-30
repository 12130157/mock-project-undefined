<%@ Page Language="C#" MasterPageFile="~/Shares/Site1.Master" AutoEventWireup="true" ValidateRequest="false"
    CodeBehind="MinorWorksDetails.aspx.cs" Inherits="SD.Web.Views.Premises.MinorWorksDetails"
    Title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" %>
<%@ Register Src="~/Controls/Premises/MinorWorksDetailsInfo.ascx" TagName="DetailsInfo"
    TagPrefix="uc1" %>
<%@ Register Src="~/Controls/Contact/ContactSelect.ascx" TagName="ContactSelect"
    TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="../../Scripts/script.js" type="text/javascript"></script>

    <title>Project/Minor Works</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="TitleContent">
        Project / Minor Works
        <br />
        <div style="float: right; padding-right: 30px;">
            <asp:Button ID="btnInActive" runat="server" Text="In-Active" 
                OnClick="BtnInActiveClick"  />
            <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="BtnSaveClick" 
                 />
            <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="BtnBackClick" 
                 />
        </div>
        <br />
    </div>
    <div style="width: 100%">
        <ajaxToolkit:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0">
            <ajaxToolkit:TabPanel runat="server" HeaderText="Project / Minor Works" ID="TabPanel1">
                <ContentTemplate>
                    <uc1:DetailsInfo ID="DetailsInfo" runat="server" />
                    <asp:Label ID="errorSaving" runat="server" Visible="False" 
                                Text="Minor Work/Project save fail!" ForeColor="Red" />
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
        </ajaxToolkit:TabContainer>
    </div>
</asp:Content>
