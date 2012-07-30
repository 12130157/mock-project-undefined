<%@ Page Language="C#" MasterPageFile="~/Shares/Site1.Master" AutoEventWireup="true" ValidateRequest="false"
    CodeBehind="AmendServiceDetails.aspx.cs" Inherits="SD.Web.Views.Services.AdmendServiceDetails"
    Title="Service Details" %>

<%@ Register Assembly="msgBox" Namespace="BunnyBear" TagPrefix="cc1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="../../Controls/Services/Detail1.ascx" TagName="Detail1" TagPrefix="uc1" %>
<%@ Register Src="../../Controls/Services/Detail2.ascx" TagName="Detail2" TagPrefix="uc2" %>
<%@ Register Src="../../Controls/Services/Detail3.ascx" TagName="Detail3" TagPrefix="uc3" %>
<%@ Register Src="../../Controls/Services/Ognization.ascx" TagName="Ognization" TagPrefix="uc4" %>
<%@ Register Src="../../Controls/Services/PremiseServices.ascx" TagName="Premise" TagPrefix="uc5" %>
<%@ Register Src="../../Controls/Services/Funding.ascx" TagName="Funding" TagPrefix="uc6" %>
<%@ Register Src="../../Controls/Services/Contact.ascx" TagName="Contact" TagPrefix="uc7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script type="text/javascript">
                 
        function PanelClick() {
            var messages = $get('<%=Messages.ClientID%>');
            Highlight(messages);
        }

        function ActiveTabChanged(sender) {
            var CurrentTab = $get('<%=CurrentTab.ClientID%>');
            //CurrentTab.innerHTML = sender.get_activeTab().get_headerText();
            Highlight(CurrentTab);
        }

        var HighlightAnimations = {};
        function Highlight(el) {
            if (HighlightAnimations[el.uniqueID] == null) {
                HighlightAnimations[el.uniqueID] = Sys.Extended.UI.Animation.createAnimation({
                    AnimationName: "color",
                    duration: 0.5,
                    property: "style",
                    propertyKey: "backgroundColor",
                    startValue: "#FFFF90",
                    endValue: "#FFFFFF"
                }, el);
            }
            HighlightAnimations[el.uniqueID].stop();
            HighlightAnimations[el.uniqueID].play();
        }

        //        function ToggleHidden(value) {
        //            $find('<%=Tabs.ClientID%>').get_tabs()[1].set_enabled(value);
        //        }
    </script>
    <div class="TitleContent">Service Detail</div>
    <div>
        <div style="text-align: right">
            <asp:Button ID="btnInactive" runat="server" Text="In-active"  
                onclick="btnInactive_Click"/>
            <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="BtnSave_Click"  />
            <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="BtnBack_Click" />
        </div>
        <ajaxToolkit:TabContainer runat="server" ID="Tabs" Height="138px" OnClientActiveTabChanged="ActiveTabChanged"
            ActiveTabIndex="0" Width="100%">
            <ajaxToolkit:TabPanel runat="server" ID="pnlDetail1" HeaderText="Detail1" TabIndex="0">
                <HeaderTemplate>
                    Detail1
                </HeaderTemplate> 
                <ContentTemplate>
                    <uc1:Detail1 ID="ucDetail1" runat="server" OnChange="SubTypeChange" />
                    

                </ContentTemplate>
                
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel runat="server" ID="pnlDetail2" HeaderText="Detail2" TabIndex="1">
                <ContentTemplate>
                    <uc2:Detail2 ID="ucDetail2" runat="server" />
                    

                </ContentTemplate>
                
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel runat="server" ID="pnlDetail3" HeaderText="Detail3" TabIndex="2">
                <ContentTemplate>
                    <uc3:Detail3 ID="ucDetail3" runat="server" />
                    

                </ContentTemplate>
                
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel runat="server" ID="pnlOrganisation" HeaderText="Organisation"
                TabIndex="3" Visible="False">
                <ContentTemplate>
                    <uc4:Ognization ID="ucOgnization" runat="server" />
                    

                </ContentTemplate>
                
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel runat="server" ID="pnlPremise" HeaderText="Premise" Visible="False"
                TabIndex="4">
                <HeaderTemplate>
                    Premise

                </HeaderTemplate>
                
                <ContentTemplate><uc5:Premise ID="ucPremise" runat="server" />
                </ContentTemplate>
                
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel runat="server" ID="pnlContract" HeaderText="Contract" TabIndex="5">
                <ContentTemplate>
                    <uc7:Contact ID="ucContact" runat="server" />
                    

                </ContentTemplate>
                
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel runat="server" ID="pnlFunding" HeaderText="Funding" Visible="False"
                TabIndex="6">
                <ContentTemplate>
                    <uc6:Funding ID="ucFunding" runat="server" />
                    
 
                </ContentTemplate>
                
            </ajaxToolkit:TabPanel>
        </ajaxToolkit:TabContainer>
        
        <asp:Label runat="server" ID="CurrentTab" /><br />
        <asp:Label runat="server" ID="Messages" />
    </div>
    <div class="Error">
        <asp:Label runat="server" ID="lblServiceNameErr" />
        
    </div>
<cc1:msgBox ID="msgInActive" runat="server" />
    
</asp:Content>
