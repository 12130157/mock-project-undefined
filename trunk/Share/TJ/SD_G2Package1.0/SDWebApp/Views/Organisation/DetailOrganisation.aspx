<%@ Page Language="C#" MasterPageFile="~/Shares/Site1.Master" AutoEventWireup="true"
    CodeBehind="DetailOrganisation.aspx.cs" Inherits="SD.Web.Views.Organisation.DetailOrganisation"
    Title="Detail Organisation" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="msgBox" Namespace="BunnyBear" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc1" TagName="AddressLookup" Src="~/Controls/Lookup/AddressLookup.ascx" %>
<%@ Register TagPrefix="uc2" TagName="ContactLookUp" Src="~/Controls/Contact/ContactSelect.ascx" %>
<%@ Register TagPrefix="uc3" TagName="TypeOfBusinessLookup" Src="~/Controls/Lookup/TypeOfBusinessLookup.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style2
        {
            width: 192px;
        }
        .style4
        {
            height: 10px;
            font-size: 10pt;
            width: 192px;
        }
        .style6
        {
            height: 15px;
            width: 181px;
        }
        .style7
        {
            height: 86px;
            font-size: 10pt;
            width: 181px;
        }
        .style12
        {
            width: 190px;
            height: 77px;
        }
        .style21
        {
            height: 14px;
            font-size: 10pt;
            width: 181px;
        }
        .style22
        {
            width: 190px;
            height: 14px;
        }
        .style31
        {
            height: 29px;
            font-size: 10pt;
            width: 181px;
        }
        .style32
        {
            width: 190px;
            height: 29px;
        }
        .style33
        {
            height: 29px;
        }
        .style35
        {
            width: 190px;
            height: 38px;
        }
        .style46
        {
            width: 190px;
            height: 10px;
        }
        .style47
        {
            height: 15px;
            font-size: 10pt;
            width: 181px;
        }
        .style48
        {
            width: 190px;
            height: 15px;
        }
        .style49
        {
            height: 8px;
            font-size: 10pt;
            width: 181px;
        }
        .style50
        {
            width: 190px;
            height: 8px;
        }
        .style51
        {
            height: 23px;
            font-size: 10pt;
            width: 181px;
        }
        .style52
        {
            width: 190px;
            height: 23px;
        }
        .style53
        {
            height: 23px;
        }
        .style54
        {
            height: 21px;
            font-size: 10pt;
            width: 181px;
        }
        .style55
        {
            width: 190px;
            height: 21px;
        }
        .style56
        {
            height: 21px;
        }
        .style57
        {
            height: 24px;
            font-size: 10pt;
            width: 181px;
        }
        .style58
        {
            width: 190px;
            height: 24px;
        }
        .style59
        {
            height: 24px;
        }
        .style60
        {
            height: 17px;
            font-size: 10pt;
            width: 181px;
        }
        .style61
        {
            width: 190px;
            height: 17px;
        }
        .style62
        {
            height: 17px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div class="TitleContent">
            Organisation Details</div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnInactive" runat="server" Text="In-Active" Style="margin-left: 0px"
            Width="69px" Visible="false" OnClick="BtnInactiveClick" />
        &nbsp;<asp:Button ID="btnSave" runat="server" Text="Save" Style="margin-left: 0px"
            Width="61px" OnClick="BtnSaveClick" CommandName="Create" />
        &nbsp;<asp:Button ID="btnBack" runat="server" Text="Back" Width="66px" OnClick="BtnBackClick" />
        <ajaxToolkit:TabContainer runat="server" ID="Tabs" Height="447px" ActiveTabIndex="5"
            Width="780px">
            <ajaxToolkit:TabPanel runat="server" ID="Panel1" HeaderText="Details 1">
                <ContentTemplate>
                    <table>
                        <tr>
                            <td class="style31">
                                Organisation Name
                                <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="*"></asp:Label>
                            </td>
                            <td class="style32">
                                <asp:TextBox ID="txtName" runat="server" Width="158px" MaxLength="50"></asp:TextBox>
                            </td>
                            <td class="style32">
                                Preferred Organisation
                            </td>
                            <td class="style33">
                                <asp:CheckBox ID="chkPrefer" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style7" rowspan="2">
                                Organisation Short<br />
                                Description&#160;
                                <asp:Label ID="Label2" runat="server" ForeColor="Red" Text="*"></asp:Label>
                            </td>
                            <td class="style2" rowspan="2">
                                <asp:TextBox ID="txtShortDesc" runat="server" Height="43px" Width="159px" Columns="5"
                                    MaxLength="250" Rows="4" TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="style46">
                                Expression of Interest
                            </td>
                            <td class="style4">
                                <asp:CheckBox ID="ChkExp" runat="server" AutoPostBack="True" OnCheckedChanged="ChkExp_CheckedChanged" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style35">
                                Type of business
                                <asp:Label ID="Label3" runat="server" ForeColor="Red" Text="*"></asp:Label>
                            </td>
                            <td class="style35">
                                <asp:TextBox ID="txtTypeOfBus" runat="server" Width="122px" Enabled="False"></asp:TextBox>&#160;
                                <asp:Button ID="btnBusinessSelect" runat="server" Font-Bold="True" Text="..." OnClick="BtnBusinessSelectClick" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style47">
                                Lead Contact
                            </td>
                            <td class="style47">
                                <asp:TextBox ID="txtContact" runat="server" Width="122px" Enabled="False" MaxLength="50"></asp:TextBox>&#160;<asp:Button
                                    ID="btnContactSelect" runat="server" Font-Bold="True" Text="..." OnClick="BtnContactSelectClick" />
                            </td>
                            <td class="style48">
                                SIC Code
                            </td>
                            <td class="style6">
                                <asp:TextBox ID="txtSicCode" runat="server" Enabled="False" Width="158px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style49">
                                Address Line 1
                                <asp:Label ID="Label4" runat="server" ForeColor="Red" Text="*"></asp:Label>
                            </td>
                            <td class="style50">
                                <asp:TextBox ID="txtAddr1" runat="server" Width="158px"></asp:TextBox>
                            </td>
                            <td rowspan="2" class="style12">
                                Organisation Full
                                <br />
                                Description
                            </td>
                            <td rowspan="2">
                                <asp:TextBox ID="txtFullDesc" runat="server" Height="43px" Width="159px" TextMode="MultiLine"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style21">
                                Address Line 2
                            </td>
                            <td class="style22">
                                <asp:TextBox ID="txtAddr2" runat="server" Width="158px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style51">
                                Address Line 3
                            </td>
                            <td class="style52">
                                <asp:TextBox ID="txtAddr3" runat="server" Width="158px"></asp:TextBox>
                            </td>
                            <td class="style52">
                                Phone number
                                <asp:Label ID="Label5" runat="server" ForeColor="Red" Text="*"></asp:Label>
                            </td>
                            <td class="style53">
                                <asp:TextBox ID="txtPhone" runat="server" Width="158px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style54">
                                Postcode
                                <asp:Label ID="Label6" runat="server" ForeColor="Red" Text="*"></asp:Label>
                            </td>
                            <td class="style55">
                                <asp:TextBox ID="txtPostCode" runat="server" Width="122px" AutoPostBack="True" OnTextChanged="TxtPostCodeTextChanged"></asp:TextBox>&#160;
                                <asp:Button ID="btnPostcodeSelect" runat="server" Font-Bold="True" Text="..." OnClick="BtnPostcodeSelectClick" />
                            </td>
                            <td class="style55">
                                Fax
                            </td>
                            <td class="style56">
                                <asp:TextBox ID="txtFax" runat="server" Width="158px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style51">
                                City/ Town
                            </td>
                            <td class="style52">
                                <asp:TextBox ID="txtTown" runat="server" Width="158px"></asp:TextBox>
                            </td>
                            <td class="style52">
                                Email
                            </td>
                            <td class="style53">
                                <asp:TextBox ID="txtEmail" runat="server" Width="158px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style57">
                                County
                            </td>
                            <td class="style58">
                                <asp:TextBox ID="txtCounty" runat="server" Width="158px"></asp:TextBox>
                            </td>
                            <td class="style58">
                                Web Address
                            </td>
                            <td class="style59">
                                <asp:TextBox ID="txtWebAddr" runat="server" Width="158px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style57">
                                Nation/ Country
                            </td>
                            <td class="style58">
                                <asp:DropDownList ID="ddlCountry" runat="server" Width="166px" Height="25px">
                                </asp:DropDownList>
                            </td>
                            <td class="style58">
                                Charity Number
                            </td>
                            <td class="style59">
                                <asp:TextBox ID="txtCharity" runat="server" Width="158px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style60">
                                <asp:Label ID="lblActive" runat="server"></asp:Label>
                            </td>
                            <td class="style61">
                            </td>
                            <td class="style61">
                                Company Number
                            </td>
                            <td class="style62">
                                <asp:TextBox ID="txtCompany" runat="server" Width="158px"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel runat="server" ID="pnlDetails2" HeaderText="Details 2">
                <HeaderTemplate>
                    Details 2</HeaderTemplate>
                <ContentTemplate>
                    <table style="width: 754px">
                        <tr>
                            <td class="style7">
                                Organisation<br />
                                Specicalism
                            </td>
                            <td class="style2">
                                <asp:Panel ID="Panel4" runat="server" BorderWidth="1px" Height="74px" ScrollBars="Vertical">
                                    <asp:CheckBoxList ID="chkLstOrgSpec" runat="server">
                                    </asp:CheckBoxList>
                                </asp:Panel>
                            </td>
                            <td class="style8">
                                &#160;&#160; Service Personal<br />
                                &#160; Circumstances<br />
                                &#160; Capilities
                            </td>
                            <td class="style10">
                                <asp:Panel ID="Panel8" runat="server" BorderWidth="1px" Height="80px" ScrollBars="Vertical">
                                    <asp:CheckBoxList ID="chkLstSpcc" runat="server">
                                    </asp:CheckBoxList>
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td class="style7">
                                Service Disabilities<br />
                                Capabilities
                            </td>
                            <td class="style2">
                                <asp:Panel ID="Panel5" runat="server" BorderWidth="1px" Height="80px" ScrollBars="Vertical">
                                    <asp:CheckBoxList ID="chkLstSdiscap" runat="server">
                                    </asp:CheckBoxList>
                                </asp:Panel>
                            </td>
                            <td class="style8">
                                &#160;&#160; Service Ethnicity<br />
                                &#160; Caplilities
                            </td>
                            <td class="style10">
                                <asp:Panel ID="Panel9" runat="server" BorderWidth="1px" Height="80px" ScrollBars="Vertical">
                                    <asp:CheckBoxList ID="chkLstSec" runat="server" Width="180px">
                                    </asp:CheckBoxList>
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td class="style7">
                                Service Barries<br />
                                Capalities
                            </td>
                            <td class="style2">
                                <asp:Panel ID="Panel6" runat="server" BorderWidth="1px" Height="75px" ScrollBars="Vertical">
                                    <asp:CheckBoxList ID="chkLstSbarcap" runat="server">
                                    </asp:CheckBoxList>
                                </asp:Panel>
                            </td>
                            <td class="style8">
                                &#160;&#160; Service<br />
                                &#160; Acrediation
                            </td>
                            <td class="style10">
                                <asp:Panel ID="Panel10" runat="server" BorderWidth="1px" Height="75px" ScrollBars="Vertical">
                                    <asp:CheckBoxList ID="chkLstSa" runat="server" Width="181px">
                                    </asp:CheckBoxList>
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td class="style6">
                                Service Benefits<br />
                                Capalities
                            </td>
                            <td class="style4">
                                <asp:Panel ID="Panel7" runat="server" BorderWidth="1px" Height="80px" ScrollBars="Vertical">
                                    <asp:CheckBoxList ID="chkLstSbencap" runat="server">
                                    </asp:CheckBoxList>
                                </asp:Panel>
                            </td>
                            <td class="style9">
                                &#160;&#160;
                            </td>
                            <td class="style3">
                                &#160;&#160;
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel runat="server" ID="pnlDetails3" HeaderText="Details 3" Visible="false">
                <HeaderTemplate>
                    Details 3</HeaderTemplate>
                <ContentTemplate>
                    <table class="style1">
                        <tr>
                            <td class="style9">
                                EOI Programmes
                            </td>
                            <td class="style4">
                                <asp:Panel ID="Panel2" runat="server" BorderWidth="1px" ForeColor="Black" Height="80px"
                                    ScrollBars="Vertical" Width="238px">
                                    <asp:CheckBoxList ID="chkLstEoiPro" runat="server" Width="238px">
                                    </asp:CheckBoxList>
                                </asp:Panel>
                            </td>
                            <td class="style3">
                            </td>
                            <td class="style3">
                            </td>
                        </tr>
                        <tr>
                            <td class="style9">
                                EOI Services
                            </td>
                            <td class="style8">
                                <asp:Panel ID="Panel11" runat="server" BorderWidth="1px" Height="80px" ScrollBars="Vertical"
                                    Width="240px">
                                    <asp:CheckBoxList ID="chkLstEoiSer" runat="server">
                                    </asp:CheckBoxList>
                                </asp:Panel>
                            </td>
                            <td>
                                &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;
                                &#160;
                            </td>
                            <td>
                                &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;
                                &#160;
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel runat="server" ID="pnlDetails4" HeaderText="Details 4" Visible="false">
                <ContentTemplate>
                    <fieldset style="width: 727px">
                        <legend>Premise</legend>
                        <asp:Panel ID="pnlGridViewPremise" runat="server">
                            <asp:GridView ID="grdPremises" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                ForeColor="#333333" Width="712px">
                                <RowStyle BackColor="#EFF3FB" />
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:HyperLinkField DataTextField="Name" HeaderText="Premise Name" />
                                    <asp:BoundField DataField="AddressLine1" HeaderText="Address" />
                                    <asp:BoundField DataField="PrimaryLocation" HeaderText="Primary Location" />
                                    <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" />
                                </Columns>
                                <EditRowStyle BackColor="#2461BF" />
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            </asp:GridView>
                        </asp:Panel>
                        <asp:Label ID="lblNoDataPremise" runat="server" Text="No record has been found" Visible="false"></asp:Label>
                    </fieldset>
                    &nbsp;<br />
                    <br />
                    <fieldset style="width: 731px">
                        <legend>Located In</legend>
                        <table class="style1">
                            <tr>
                                <td class="style2">
                                    Ward:
                                </td>
                                <td class="style2">
                                    <asp:TextBox ID="txtWard" runat="server" Width="161px" Enabled="False"></asp:TextBox>
                                </td>
                                <td class="style2">
                                    NHS Authority:
                                </td>
                                <td class="style2">
                                    <asp:TextBox ID="txtNhs" runat="server" Width="160px" Enabled="False"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    Borough:
                                </td>
                                <td class="style2">
                                    <asp:TextBox ID="txtBorough" runat="server" Width="159px" Enabled="False"></asp:TextBox>
                                </td>
                                <td class="style2">
                                    Gov office:
                                </td>
                                <td class="style2">
                                    <asp:DropDownList ID="ddlGovOff" runat="server" Height="21px" Width="174px">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    Local Authority:
                                </td>
                                <td class="style2">
                                    <asp:TextBox ID="txtLocal" runat="server" Width="158px" Enabled="False"></asp:TextBox>
                                </td>
                                <td class="style2">
                                    Trust Region:
                                </td>
                                <td class="style2">
                                    <asp:DropDownList ID="ddlTrustRegion" runat="server" Height="21px" Width="174px">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    Unitory:
                                </td>
                                <td class="style2">
                                    <asp:TextBox ID="txtUnitory" runat="server" Width="155px" Enabled="False"></asp:TextBox>
                                </td>
                                <td class="style2">
                                    Trust District:
                                </td>
                                <td class="style2">
                                    <asp:DropDownList ID="ddlTrustDistrict" runat="server" Height="21px" Width="174px">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel runat="server" ID="Details5" HeaderText="Details 5" Visible="false">
                <HeaderTemplate>
                    &#160;Details 5</HeaderTemplate>
                <ContentTemplate>
                    <fieldset style="width: 726px">
                        <legend></legend>
                        <div style="font-weight: bold">
                            Current List of Supporting Materials&#160;&#160;
                        </div>
                        <table style="width: 733px">
                            <tr>
                                <td class="style2" style="text-align: center;">
                                    &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;
                                    <asp:Button ID="btnCreateSp" runat="server" Text="Create" OnClick="BtnCreateSpClick" /><asp:CheckBox
                                        ID="chkInCludeSp" runat="server" Text="Include In-active" AutoPostBack="True"
                                        OnCheckedChanged="FilterChangedSupporting" />
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    <asp:Panel ID="pnlGridViewSupporting" runat="server">
                                        <asp:GridView ID="grdSupporting" runat="server" CellPadding="4" ForeColor="#333333"
                                            AutoGenerateColumns="False" Width="727px">
                                            <RowStyle BackColor="#EFF3FB" />
                                            <AlternatingRowStyle BackColor="White" />
                                            <Columns>
                                                <asp:TemplateField Visible="False">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lblid" Text='<%#Eval("ID") %>' /></ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="URL">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lbtnName" runat="server" Text='<%#Eval("Url")%>' OnClick="LbtnNameClick" /></ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="Description" HeaderText="Description" />
                                                <asp:BoundField DataField="Type" HeaderText="Type" />
                                                <asp:BoundField DataField="UserName" HeaderText="Added By" />
                                                <asp:BoundField DataField="AddedDate" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Added Date" />
                                                <asp:TemplateField HeaderText="Is Active?" SortExpression="IsActive">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblIsActive" runat="server" Text='<%# Boolean.Parse(Eval("IsActive").ToString()) ? "Yes" : "No" %>' /></ItemTemplate>
                                                    <ItemStyle Width="10%"></ItemStyle>
                                                </asp:TemplateField>
                                            </Columns>
                                            <EditRowStyle BackColor="#2461BF" />
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        </asp:GridView>
                                    </asp:Panel>
                                    <asp:Label ID="lblNoDataSupporting" runat="server" Text="No record has been found"
                                        Visible="False"></asp:Label>
                                    <div align="center">
                                        <table align="center">
                                            <tr>
                                                <td>
                                                    &#160;<asp:LinkButton ID="LinkButton17" runat="server" OnClick="FilterChangedSupporting"><<</asp:LinkButton>&#160;&nbsp;<asp:LinkButton
                                                        ID="LinkButton18" runat="server" OnClick="FilterChangedSupporting"><</asp:LinkButton>&#160;<asp:TextBox
                                                            ID="txtPageSizeSupporting" runat="server" Columns="2" Text="3" Font-Bold="True"
                                                            OnTextChanged="FilterChangedSupporting" AutoPostBack="true"></asp:TextBox><asp:Label
                                                                ID="lblSep" runat="server" Font-Size="X-Small" Enabled="False">/</asp:Label>&#160;<asp:Label
                                                                    ID="lblTotalPagesSupporting" runat="server" Font-Bold="True" Onclick="FilterChangedSupporting">1</asp:Label><asp:LinkButton
                                                                        ID="LinkButton19" runat="server" OnClick="FilterChangedSupporting">></asp:LinkButton>&#160;&nbsp;<asp:LinkButton
                                                                            ID="LinkButton20" runat="server" OnClick="FilterChangedSupporting">>></asp:LinkButton>&#160;
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel runat="server" ID="panelDir" HeaderText="BU/Directorates" Visible="false">
                <ContentTemplate>
                    <fieldset style="width: 729px">
                        <legend></legend>
                        <table style="width: 740px">
                            <tr>
                                <td align="left" class="filter">
                                    <asp:LinkButton ID="lbtnAllDirectors" runat="server" OnClick="FilterChangedDirectors">All</asp:LinkButton>|
                                    <asp:LinkButton ID="lbtn09Directors" runat="server" OnClick="FilterChangedDirectors">0 - 9</asp:LinkButton>|
                                    <asp:LinkButton ID="lbtnAeDirectors" runat="server" OnClick="FilterChangedDirectors">A B C D E</asp:LinkButton>|
                                    <asp:LinkButton ID="lbtnFjDirectors" runat="server" OnClick="FilterChangedDirectors">F G H I J</asp:LinkButton>|
                                    <asp:LinkButton ID="lbtnKnDirectors" runat="server" OnClick="FilterChangedDirectors">K L M N</asp:LinkButton>|
                                    <asp:LinkButton ID="lbtnOrDirectors" runat="server" OnClick="FilterChangedDirectors">O P Q R</asp:LinkButton>|
                                    <asp:LinkButton ID="lbtnSvDirecors" runat="server" OnClick="FilterChangedDirectors">S T U V</asp:LinkButton>|
                                    <asp:LinkButton ID="lbtnWzDirectors" runat="server" OnClick="FilterChangedDirectors">W X Y Z</asp:LinkButton>
                                </td>
                                <td align="left" class="style3">
                                    <asp:Button ID="btnCreateDirectors" runat="server" Text="Create" OnClick="BtnCreateDirectorsClick" /><asp:CheckBox
                                        ID="chkIncludeDirectors" runat="server" Text="Include In-active" AutoPostBack="True"
                                        OnCheckedChanged="FilterChangedDirectors" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Panel ID="pnlGridViewDirector" runat="server">
                                        <asp:GridView ID="grdDirectors" runat="server" CellPadding="4" ForeColor="#333333"
                                            AutoGenerateColumns="False" Width="724px">
                                            <RowStyle BackColor="#EFF3FB" />
                                            <AlternatingRowStyle BackColor="White" />
                                            <Columns>
                                                <asp:TemplateField Visible="False">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lblidDirector" Text='<%#Eval("ID") %>' /></ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="BU/Director name">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lbtnNameDirector" runat="server" Text='<%#Eval("Name")%>' OnClick="LbtnNameDirectorClick" /></ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="Addr1" HeaderText="Office Address Line 1" />
                                                <asp:BoundField DataField="PostCode" HeaderText="Postcode" />
                                                <asp:BoundField DataField="SurName" HeaderText="Contact" />
                                                <asp:TemplateField HeaderText="Is Active?" SortExpression="IsActive">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblIsActiveDirector" runat="server" Text='<%# Boolean.Parse(Eval("IsActive").ToString()) ? "Yes" : "No" %>' /></ItemTemplate>
                                                    <ItemStyle Width="10%"></ItemStyle>
                                                </asp:TemplateField>
                                            </Columns>
                                            <EditRowStyle BackColor="#2461BF" />
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        </asp:GridView>
                                    </asp:Panel>
                                    <asp:Label ID="lblNoDataDirector" runat="server" Text="No record has been found"
                                        Visible="False"></asp:Label>
                                    <div align="center">
                                        <table align="center">
                                            <tr>
                                                <td>
                                                    &#160;<asp:LinkButton ID="lbtnStart" runat="server" OnClick="FilterChangedDirectors"><<</asp:LinkButton>&#160;&nbsp;<asp:LinkButton
                                                        ID="lbtnDirectorsBefore" runat="server" OnClick="FilterChangedDirectors"><</asp:LinkButton>&#160;<asp:TextBox
                                                            ID="txtPageSizeDirectors" runat="server" Columns="2" Text="3" Font-Bold="True"
                                                            OnTextChanged="FilterChangedDirectors" AutoPostBack="true"></asp:TextBox><asp:Label
                                                                ID="Label7" runat="server" Font-Size="X-Small" Enabled="False" Onclick="FilterChangedDirectors">/</asp:Label>&#160;<asp:Label
                                                                    ID="lblTotalPagesDirectors" runat="server" Font-Bold="True" Onclick="FilterChangedDirectors">1</asp:Label><asp:LinkButton
                                                                        ID="lbtnDirectorsAfter" runat="server" OnClick="FilterChangedDirectors">></asp:LinkButton>&#160;&nbsp;<asp:LinkButton
                                                                            ID="lbtnEnd" runat="server" OnClick="FilterChangedDirectors">>></asp:LinkButton>&#160;
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
        </ajaxToolkit:TabContainer>
        <div class="Error">
            <asp:Label runat="server" ID="lblError" /><br />
            <cc1:msgBox ID="msgInActive" runat="server" />
        </div>
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
        <%--  <asp:Label ID="Label7" runat="server"></asp:Label>--%>
    </div>
    <cc1:msgBox ID="msgError" runat="server" />
    <cc1:msgBox ID="msgPostCode" runat="server" />
</asp:Content>
