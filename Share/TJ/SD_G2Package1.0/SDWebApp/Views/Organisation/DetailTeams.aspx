<%@ Page Language="C#" MasterPageFile="~/Shares/Site1.Master" AutoEventWireup="true"
    CodeBehind="DetailTeams.aspx.cs" Inherits="SD.Web.Views.Organisation.DetailTeams"
    Title="Detail team" %>

<%@ Register Assembly="msgBox" Namespace="BunnyBear" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register TagPrefix="uc2" TagName="ContactLookUp" Src="~/Controls/Contact/ContactSelect.ascx" %>
<%@ Register TagPrefix="uc1" TagName="AddressLookup" Src="~/Controls/Lookup/AddressLookup.ascx" %>
<%@ Register TagPrefix="uc3" TagName="TypeOfBusinessLookup" Src="~/Controls/Lookup/TypeOfBusinessLookup.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style3
        {
            width: 78px;
        }
        .style4
        {
            width: 71px;
        }
        .style5
        {
            width: 69px;
        }
        .style6
        {
            width: 68px;
        }
        .style7
        {
            width: 60px;
        }
        .style9
        {
            width: 171px;
        }
        .style10
        {
            width: 61px;
        }
        .style12
        {
            width: 154px;
        }
        .style13
        {
            width: 75px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div>
            <asp:LinkButton ID="LinkButton1" runat="server">Organisation > Directors > Departments ></asp:LinkButton>
        </div>
        <div class="TitleContent">
            Team Details</div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button
            ID="btnInActive" runat="server" Text="In-Active" Style="margin-left: 0px" Width="61px"
            OnClick="BtnInActiveClick" />
        &nbsp;<asp:Button ID="btnSave" runat="server" Text="Save" Style="margin-left: 0px"
            Width="61px" CommandName="Create" OnClick="BtnSaveClick" />
        &nbsp;<asp:Button ID="btnBack" runat="server" Text="Back" Width="66px" OnClick="BtnBackClick" />
        <ajaxToolkit:TabContainer runat="server" ID="Tabs" Height="465px" ActiveTabIndex="0"
            Width="773px">
            <ajaxToolkit:TabPanel runat="server" ID="Panel1" HeaderText="Details">
                <ContentTemplate>
                    <table style="width: 734px">
                        <tr>
                            <td class="style9">
                                Team Name
                                <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="*"></asp:Label>
                            </td>
                            <td class="style10" colspan="2">
                                <asp:TextBox ID="txtTeamName" runat="server" Width="158px"></asp:TextBox>
                            </td>
                            <td class="style12">
                                Type of business
                            </td>
                            <td class="style5">
                                <asp:TextBox ID="txtTeamBusiness" runat="server" Width="124px"></asp:TextBox>
                                &nbsp;<asp:Button ID="btnTypeOfBusinessSelect" runat="server" Font-Bold="True" Text="..."
                                    OnClick="BtnTypeOfBusinessSelectClick" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style9" rowspan="2">
                                Department Short<br />
                                Description&nbsp;
                            </td>
                            <td class="style10" rowspan="2" colspan="2">
                                <asp:TextBox ID="txtTeamDesc" runat="server" Height="43px" Width="159px" TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="style12">
                                SIC Code
                            </td>
                            <td class="style4">
                                <asp:TextBox ID="txtTeamSicCode" runat="server" Enabled="False" Width="158px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style12">
                                Department Full
                                <br />
                                Description
                            </td>
                            <td class="style3">
                                <asp:TextBox ID="txtTeamFullDesc" runat="server" Height="43px" Width="159px" TextMode="MultiLine"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style9">
                                Lead Contact
                            </td>
                            <td class="style10" colspan="2">
                                <asp:TextBox ID="txtTeamContact" runat="server" Width="97px"></asp:TextBox>
                                &#160;&#160;<asp:Button ID="btnContactSelect" runat="server" Font-Bold="True" Text="..."
                                    OnClick="BtnContactSelectClick" />
                            </td>
                            <td class="style12">
                                &nbsp;Phone number
                            </td>
                            <td class="style6">
                                <asp:TextBox ID="txtTeamPhoneNumber" runat="server" Width="158px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style9">
                                Copy Address From
                            </td>
                            <td class="style7">
                                <asp:RadioButton ID="rdbtnOrg" runat="server" Text="Organisation" AutoPostBack="True"
                                    GroupName="address" OnCheckedChanged="RdbtnOrgCheckedChanged" />
                            </td>
                            <td class="style13">
                                <asp:RadioButton ID="rdbtnParent" runat="server" Text="Parent" AutoPostBack="True"
                                    GroupName="address" OnCheckedChanged="RdbtnParentCheckedChanged" />
                            </td>
                            <td class="style12">
                                Fax
                            </td>
                            <td class="style6">
                                <asp:TextBox ID="txtTeamFax" runat="server" Width="158px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style9">
                                Address Line 1
                            </td>
                            <td class="style10" colspan="2">
                                <asp:TextBox ID="txtAddr1" runat="server" Width="158px"></asp:TextBox>
                            </td>
                            <td rowspan="2" class="style12">
                                Email
                            </td>
                            <td rowspan="2">
                                <asp:TextBox ID="txtTeamEmail" runat="server" Width="158px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style9">
                                Address Line 2
                            </td>
                            <td class="style10" colspan="2">
                                <asp:TextBox ID="txtAddr2" runat="server" Width="158px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style9">
                                Address Line 3
                            </td>
                            <td class="style10" colspan="2">
                                <asp:TextBox ID="txtAddr3" runat="server" Width="158px"></asp:TextBox>
                            </td>
                            <td class="style12">
                                Web Address
                            </td>
                            <td class="style5">
                                <asp:TextBox ID="txtTeamWeb" runat="server" Width="158px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style9">
                                Postcode
                            </td>
                            <td class="style10" colspan="2">
                                <asp:TextBox ID="txtTeamPostCode" runat="server" Width="97px"></asp:TextBox>
                                &#160;&#160;<asp:Button ID="btnPostCodeSelect" runat="server" Font-Bold="True" Text="..."
                                    OnClick="BtnPostCodeSelectClick" />
                            </td>
                            <td class="style12">
                                &nbsp;
                            </td>
                            <td class="style5">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="style9">
                                City/ Town
                            </td>
                            <td class="style10" colspan="2">
                                <asp:TextBox ID="txtTeamTown" runat="server" Width="158px"></asp:TextBox>
                            </td>
                            <td class="style12">
                                &nbsp;
                            </td>
                            <td class="style5">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="style9">
                                County
                            </td>
                            <td class="style10" colspan="2">
                                <asp:TextBox ID="txtTeamCounty" runat="server" Width="158px"></asp:TextBox>
                            </td>
                            <td class="style12">
                                &#160;
                            </td>
                            <td class="style5">
                                &#160;
                            </td>
                        </tr>
                        <tr>
                            <td class="style9">
                                Nation/ Country
                            </td>
                            <td class="style10" colspan="2">
                                <asp:DropDownList ID="ddlTeamCountry" runat="server" Width="168px" Height="23px">
                                </asp:DropDownList>
                            </td>
                            <td class="style12">
                                &#160;
                            </td>
                            <td class="style5">
                                &#160;
                            </td>
                        </tr>
                        <tr>
                            <td class="style9">
                            </td>
                            <td class="style10" colspan="2">
                            </td>
                            <td class="style12">
                                &#160;
                            </td>
                            <td class="style5">
                                &#160;
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
        </ajaxToolkit:TabContainer>
        <div class="Error">
            <asp:Label ID="lblError" runat="server"></asp:Label></div>
        <div id="MaskedDiv" runat="server" visible="false">
        </div>
        <div id="AddressLookUpRegion" runat="server" visible="false">
            <uc1:AddressLookup ID="AddressLookup" runat="server" OnbtnCloseClick="CloseAddressPopupClick"
                OnbtnSelectClick="SelectAddressClick" />
        </div>
        <div id="ContactLookupRegion" runat="server" visible="false">
            <uc2:ContactLookUp ID="ContactLookup" runat="server" OnButtonCloseClick="CloseContactPopup"
                OnButtonSelectClick="SelectContact" />
        </div>
        <div id="TypeOfBusinessLookupRegion" runat="server" visible="false">
            <uc3:TypeOfBusinessLookup ID="TypeOfBusinessLookup" runat="server" OnButtonCloseClick="CloseTypeOfBusinessPopup"
                OnButtonSelectClick="SelectTypeOfBusiness" />
        </div>
        <br />
        <asp:Label runat="server" ID="CurrentTab" /><br />
        <br />
        <br />
        <%--  <asp:Label ID="Label7" runat="server"></asp:Label>--%>
    </div>
    <cc1:msgBox ID="msgInActive" runat="server" />
</asp:Content>
