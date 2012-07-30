<%@ Page Language="C#" MasterPageFile="~/Shares/Site1.Master" AutoEventWireup="true" ValidateRequest="false"
    CodeBehind="PremiseDetailsAmend.aspx.cs" Inherits="SD.Web.Views.Premises.PremiseDetails"
    Title="Untitled Page" %>

<%@ Register Assembly="msgBox" Namespace="BunnyBear" TagPrefix="cc2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" %>
<%@ Register Src="~/Controls/Premises/PremiseDetails1.ascx" TagName="PremiseDetails1"
    TagPrefix="uc1" %>
<%@ Register Src="~/Controls/Premises/PremiseDetails2.ascx" TagName="PremiseDetails2"
    TagPrefix="uc2" %>
<%@ Register Src="~/Controls/Premises/PremiseDetails3.ascx" TagName="PremiseDetails3"
    TagPrefix="uc3" %>
<%@ Register Src="~/Controls/Premises/PremiseDetails4.ascx" TagName="PremiseDetails4"
    TagPrefix="uc4" %>
<%@ Register Src="~/Controls/Premises/PremiseFacilityMaintenance.ascx" TagName="Facility"
    TagPrefix="uc5" %>
<%@ Register Src="~/Controls/Premises/PremiseVolunterringOpportunity.ascx" TagName="Volunteering"
    TagPrefix="uc6" %>
<%@ Register Src="~/Controls/Premises/PremiseMinorWorks.ascx" TagName="MinorWork"
    TagPrefix="uc7" %>
<%@ Register Src="~/Controls/Premises/PremiseServices.ascx" TagName="Services" TagPrefix="uc8" %>
<%@ Register Src="~/Controls/Premises/LocationOpenDays.ascx" TagName="OpenDays" TagPrefix="ucOP" %>
<%@ Register Assembly="Dune5.DateTimeUI" Namespace="Dune5.DateTimeUI" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Premise</title>
    <link href="../../Css/Stylesheet1.css" rel="stylesheet" type="text/css" />

    <script src="../../Scripts/script.js" type="text/javascript"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="udpViewRegion" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="TitleContent">
                Premise details
                <br />
            </div>
            <div style="float: right">
                <asp:Button ID="btnInActive" runat="server" Text="In-Active" OnClick="BtnInActiveClick"
                     />
                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="BtnSaveClick"  />
                <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="BtnBackClick"  />
            </div>
            <br />
            <div>
                <ajaxToolkit:TabContainer ID="tabContainer" runat="server" ActiveTabIndex="0">
                    <ajaxToolkit:TabPanel runat="server" HeaderText="Details 1" ID="TabPanel1">
                        <ContentTemplate>
                            <uc1:PremiseDetails1 ID="tabPremiseDetail1" runat="server" OnLocationTypeUpdate="LocationType_SelectChange"
                                OnLocationVenueHotel="ShowTabDetail4" />
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel ID="tabPremiseDetails2" runat="server" HeaderText="Details 2">
                        <ContentTemplate>
                            <uc2:PremiseDetails2 ID="PremiseDetails2" runat="server" OnVolunteerCheckChange="ChangeVolunteerCheck" />
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel ID="tabPremiseDetails3" runat="server" HeaderText="Details 3">
                        <ContentTemplate>
                            <uc3:PremiseDetails3 ID="PremiseDetails3" runat="server" />
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel ID="tabPremiseDetails4" runat="server" HeaderText="Details 4">
                        <ContentTemplate>
                            <uc4:PremiseDetails4 ID="PremiseDetails4" runat="server" />
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel ID="tabPremiseFacility" runat="server" HeaderText="Facility">
                        <ContentTemplate>
                            <asp:UpdatePanel ID="udpFacility" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <uc5:Facility ID="Facility" runat="server" />
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel ID="tabPremiseVolunteering" runat="server" HeaderText="Volunteering">
                        <ContentTemplate>
                            <asp:UpdatePanel ID="updVolunteer" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <uc6:Volunteering ID="Volunteering" runat="server" />
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel ID="tabPremiseMinorWork" runat="server" HeaderText="MinorWork">
                        <ContentTemplate>
                            <asp:UpdatePanel ID="udpMinorWork" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <uc7:MinorWork ID="MinorWork" runat="server" />
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel ID="tabPremiseServices" runat="server" HeaderText="Services">
                        <ContentTemplate>
                            <uc8:Services ID="Services" runat="server" />
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                </ajaxToolkit:TabContainer>
                <asp:Label ID="errorSaving" runat="server" Visible="False" Text="Premise save fail!"
                    ForeColor="Red" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
