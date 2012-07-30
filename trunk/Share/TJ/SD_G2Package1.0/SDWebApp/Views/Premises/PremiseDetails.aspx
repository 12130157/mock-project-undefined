<%@ Page Language="C#" MasterPageFile="~/Shares/Site1.Master" AutoEventWireup="true"
    CodeBehind="PremiseDetails.aspx.cs" Inherits="SD.Web.Views.Premises.WebForm3"
    Title="Untitled Page" %>

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
<%@ Register Assembly="Dune5.DateTimeUI" Namespace="Dune5.DateTimeUI" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Premise</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="TitleContent">
        Premise details
        <br />
        <link href="../../Css/Stylesheet1.css" rel="stylesheet" type="text/css" />
    </div>
    <div style="float: right">
        <asp:Button ID="Button1" runat="server" Text="In-Active" 
             />
        <asp:Button ID="Button2" runat="server" Text="Save" OnClick="Button2_Click" 
             />
        <asp:Button ID="Button3" runat="server" Text="Back" OnClick="Button3_Click" 
             />
    </div>
    <br />
    <div>
        <ajaxToolkit:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0">
            <ajaxToolkit:TabPanel runat="server" HeaderText="Details 1" ID="TabPanel1">
                <ContentTemplate>
                    <table class="styletable">
                        <tr>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text="Location Name"></asp:Label><asp:Label
                                    ID="Label2" runat="server" Text="*" ForeColor="Red"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Label ID="Label3" runat="server" Text="Primary location"></asp:Label>
                            </td>
                            <td>
                                <asp:CheckBox ID="CheckBox1" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Known As
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Label ID="Label6" runat="server" Text="Location managed"></asp:Label>
                            </td>
                            <td>
                                <asp:CheckBox ID="CheckBox2" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Location Orgnisation
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox><asp:Button ID="Button5"
                                    runat="server" Text="..." />
                            </td>
                            <td>
                                ST Networl Connectivity
                            </td>
                            <td>
                                <asp:CheckBox ID="CheckBox3" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label5" runat="server" Text="Location Status"></asp:Label><asp:Label
                                    ID="Label7" runat="server" Text="*" ForeColor="Red"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="DropDownList1" runat="server">
                                    <asp:ListItem>321321</asp:ListItem>
                                    <asp:ListItem>321321</asp:ListItem>
                                    <asp:ListItem>321321</asp:ListItem>
                                    <asp:ListItem>321321</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td rowspan="2">
                                <asp:Label ID="Label8" runat="server" Text="Location type"></asp:Label>
                            </td>
                            <td rowspan="2">
                                <asp:Panel ID="Panel1" runat="server" BorderWidth="1px" Height="96px" ScrollBars="Vertical"
                                    Width="216px" Wrap="False">
                                    <asp:CheckBoxList ID="CheckBoxList1" runat="server" AutoPostBack="True">
                                        <asp:ListItem Value="0">Venue</asp:ListItem>
                                        <asp:ListItem Value="1">Hotel</asp:ListItem>
                                        <asp:ListItem Value="2">Enterprise</asp:ListItem>
                                        <asp:ListItem Value="3">Support Center</asp:ListItem>
                                        <asp:ListItem Value="4">Project</asp:ListItem>
                                        <asp:ListItem Value="5">12213</asp:ListItem>
                                        <asp:ListItem Value="6">32142141</asp:ListItem>
                                    </asp:CheckBoxList>
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label9" runat="server" Text="Location status date"></asp:Label>
                            </td>
                            <td>
                                <cc1:JDatePicker runat="server" Culture="" Wrap="False"></cc1:JDatePicker>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label10" runat="server" Text="Address line 1"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox5" runat="server" Width="199px"></asp:TextBox>
                            </td>
                            <td rowspan="2">
                                <asp:Label ID="Label14" runat="server" Text="Location Description"></asp:Label>
                            </td>
                            <td rowspan="2">
                                <asp:TextBox ID="TextBox9" runat="server" Height="68px" TextMode="MultiLine" 
                                    Width="195px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label11" runat="server" Text="Address line 2"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox6" runat="server" Width="199px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label12" runat="server" Text="Address line 3"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox7" runat="server" Width="198px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Label ID="Label13" runat="server" Text="Phone number"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox8" runat="server" Width="192px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label15" runat="server" Text="Postcode"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox10" runat="server" Width="148px"></asp:TextBox><asp:Button
                                    ID="Button4" runat="server" Text="..." />
                            </td>
                            <td>
                                <asp:Label ID="Label16" runat="server" Text="General fax number"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox17" runat="server" Width="192px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label17" runat="server" Text="City/Town"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox12" runat="server" Width="198px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Label ID="Label18" runat="server" Text="Minicomm number"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox18" runat="server" Width="192px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label19" runat="server" Text="County"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox14" runat="server" Width="198px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Label ID="Label20" runat="server" Text="Is new shop?"></asp:Label>
                            </td>
                            <td>
                                <asp:CheckBox ID="CheckBox4" runat="server" Enabled="False" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label21" runat="server" Text="Nation/Country"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox16" runat="server" Width="198px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Label ID="Label22" runat="server" Text="Shop flag date"></asp:Label>
                            </td>
                            <td>
                                <cc1:JDatePicker ID="JDatePicker1" runat="server" Culture="" Wrap="False"></cc1:JDatePicker>
                            </td>
                        </tr>
                        <tr>
                            <td rowspan="2">
                                <asp:HyperLink ID="HyperLink3" runat="server">Location opening time</asp:HyperLink>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Label ID="Label24" runat="server" Text="Specialist shop"></asp:Label>
                            </td>
                            <td>
                                <asp:CheckBox ID="CheckBox5" runat="server" />
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel ID="TabPanel2" runat="server" HeaderText="Details 2">
                <ContentTemplate>
                    <uc2:PremiseDetails2 ID="PremiseDetails2" runat="server" />
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel ID="TabPanel3" runat="server" HeaderText="Details 3">
                <ContentTemplate>
                    <uc3:PremiseDetails3 ID="PremiseDetails3" runat="server" />
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel ID="TabPanel4" runat="server" HeaderText="Details 4">
                <ContentTemplate>
                    <uc4:PremiseDetails4 ID="PremiseDetails4" runat="server" />
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel ID="TabPanel5" runat="server" HeaderText="Facility">
                <ContentTemplate>
                    <uc5:Facility ID="Facility" runat="server" />
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel ID="TabPanel6" runat="server" HeaderText="Volunteering">
                <ContentTemplate>
                    <uc6:Volunteering ID="Volunteering" runat="server" />
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel ID="TabPanel7" runat="server" HeaderText="MinorWork">
                <ContentTemplate>
                    <uc7:MinorWork ID="MinorWork" runat="server" />
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel ID="TabPanel8" runat="server" HeaderText="Services">
                <ContentTemplate>
                    <uc8:Services ID="Services" runat="server" />
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
        </ajaxToolkit:TabContainer>
    </div>
</asp:Content>
