<%@ Page Language="C#" MasterPageFile="~/Shares/Site1.Master" AutoEventWireup="true"
    CodeBehind="DetailDepartments.aspx.cs" Inherits="SD.Web.Views.Organisation.DetailDepartments"
    Title="Detail Department" %>

<%@ Register Assembly="msgBox" Namespace="BunnyBear" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register TagPrefix="uc2" TagName="ContactLookUp" Src="~/Controls/Contact/ContactSelect.ascx" %>
<%@ Register TagPrefix="uc1" TagName="AddressLookup" Src="~/Controls/Lookup/AddressLookup.ascx" %>
<%@ Register TagPrefix="uc3" TagName="TypeOfBusinessLookup" Src="~/Controls/Lookup/TypeOfBusinessLookup.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style3
        {
            height: 9px;
        }
        .style4
        {
            height: 40px;
            font-size: 10pt;
            font-weight: bold;
            width: 473px;
        }
        .style5
        {
            width: 87px;
        }
        .style6
        {
            width: 106px;
        }
        .style7
        {
            width: 116px;
        }
        .style8
        {
            width: 541px;
        }
        .style9
        {
            width: 343px;
        }
        .style10
        {
            width: 463px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div>
            <asp:LinkButton ID="LinkButton1" runat="server">Organisation > Directors ></asp:LinkButton>
        </div>
        <div class="TitleContent">
            Departments Details</div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button
            ID="btnInActive" runat="server" Text="In-Active" Style="margin-left: 0px" Width="61px"
            OnClick="BtnInActiveClick" />
        &nbsp;<asp:Button ID="btnSave" runat="server" Text="Save" Style="margin-left: 0px"
            Width="61px" CommandName="Create" OnClick="BtnSaveClick" />
        &nbsp;<asp:Button ID="btnBack" runat="server" Text="Back" Width="66px" OnClick="BtnBackClick" />
        <ajaxToolkit:TabContainer runat="server" ID="Tabs" Height="500px" ActiveTabIndex="0"
            Width="776px">
            <ajaxToolkit:TabPanel runat="server" ID="Panel1" HeaderText="Details">
                <ContentTemplate>
                    <table style="width: 761px">
                        <tr>
                            <td class="style10">
                                Department Name
                                <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="*"></asp:Label>
                            </td>
                            <td class="style9" colspan="2">
                                <asp:TextBox ID="txtDeptName" runat="server" Width="158px"></asp:TextBox>
                            </td>
                            <td class="style8">
                                Type of business
                            </td>
                            <td class="style5">
                                <asp:TextBox ID="txtDeptBusiness" runat="server" Width="124px"></asp:TextBox>
                                &nbsp;<asp:Button ID="btnTypeOfBusinessSelect" runat="server" Font-Bold="True" Text="..."
                                    OnClick="BtnTypeOfBusinessSelectClick" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style10" rowspan="2">
                                Department Short<br />
                                Description&nbsp;
                                <asp:Label ID="Label2" runat="server" ForeColor="Red" Text="*"></asp:Label>
                            </td>
                            <td class="style9" rowspan="2" colspan="2">
                                <asp:TextBox ID="txtDeptDesc" runat="server" Height="43px" Width="159px" TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="style8">
                                SIC Code
                            </td>
                            <td class="style4">
                                <asp:TextBox ID="txtDeptSicCode" runat="server" Enabled="False" Width="158px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style8">
                                Department Full
                                <br />
                                Description
                            </td>
                            <td class="style3">
                                <asp:TextBox ID="txtDeptFullDesc" runat="server" Height="43px" Width="159px" TextMode="MultiLine"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style10">
                                Lead Contact
                            </td>
                            <td class="style9" colspan="2">
                                <asp:TextBox ID="txtDeptContact" runat="server" Width="97px"></asp:TextBox>&nbsp;&nbsp;<asp:Button
                                    ID="btnContactSelect" runat="server" Font-Bold="True" Text="..." OnClick="BtnContactSelectClick" />
                            </td>
                            <td class="style8">
                                &nbsp;Phone number
                            </td>
                            <td class="style6">
                                <asp:TextBox ID="txtDeptPhoneNumber" runat="server" Width="158px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style7">
                                Copy Address From
                            </td>
                            <td class="style7">
                                <asp:RadioButton ID="rdbOrganisation" runat="server" AutoPostBack="True" GroupName="address"
                                    Text="Organisation" OnCheckedChanged="RdbOrganisationCheckedChanged" />
                            </td>
                            <td class="style7">
                                <asp:RadioButton ID="rdbParent" runat="server" AutoPostBack="True" GroupName="address"
                                    Text="Parent" OnCheckedChanged="RdbParentCheckedChanged" />
                            </td>
                            <td class="style8">
                                Fax
                            </td>
                            <td class="style6">
                                <asp:TextBox ID="txtDeptFax" runat="server" Width="158px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style10">
                                Address Line 1
                            </td>
                            <td class="style9" colspan="2">
                                <asp:TextBox ID="txtAddr1" runat="server" Width="158px"></asp:TextBox>
                            </td>
                            <td rowspan="2" class="style8">
                                Email
                            </td>
                            <td rowspan="2">
                                <asp:TextBox ID="txtDeptEmail" runat="server" Width="158px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style10">
                                Address Line 2
                            </td>
                            <td class="style9" colspan="2">
                                <asp:TextBox ID="txtAddr2" runat="server" Width="158px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style10">
                                Address Line 3
                            </td>
                            <td class="style9" colspan="2">
                                <asp:TextBox ID="txtAddr3" runat="server" Width="158px"></asp:TextBox>
                            </td>
                            <td class="style8">
                                Web Address
                            </td>
                            <td class="style5">
                                <asp:TextBox ID="txtDeptWeb" runat="server" Width="158px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style10">
                                Postcode
                            </td>
                            <td class="style9" colspan="2">
                                <asp:TextBox ID="txtDeptPostCode" runat="server" Width="97px"></asp:TextBox>&nbsp;&nbsp;<asp:Button
                                    ID="btnPostcodeSelect" runat="server" Font-Bold="True" Text="..." OnClick="BtnPostcodeSelectClick" />
                            </td>
                            <td class="style8">
                                &nbsp;
                            </td>
                            <td class="style5">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="style10">
                                City/ Town
                            </td>
                            <td class="style9" colspan="2">
                                <asp:TextBox ID="txtDeptCity" runat="server" Width="158px"></asp:TextBox>
                            </td>
                            <td class="style8">
                                &nbsp;
                            </td>
                            <td class="style5">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="style10">
                                County
                            </td>
                            <td class="style9" colspan="2">
                                <asp:TextBox ID="txtDeptCounty" runat="server" Width="158px"></asp:TextBox>
                            </td>
                            <td class="style8">
                                &#160;
                            </td>
                            <td class="style5">
                                &#160;
                            </td>
                        </tr>
                        <tr>
                            <td class="style10">
                                Nation/ Country
                            </td>
                            <td class="style9" colspan="2">
                                <asp:DropDownList ID="ddlDeptCountry" runat="server" Width="168px" Height="23px">
                                </asp:DropDownList>
                            </td>
                            <td class="style8">
                                &#160;
                            </td>
                            <td class="style5">
                                &#160;
                            </td>
                        </tr>
                        <tr>
                            <td class="style10">
                            </td>
                            <td class="style9" colspan="2">
                            </td>
                            <td class="style8">
                                &#160;
                            </td>
                            <td class="style5">
                                &#160;
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel runat="server" ID="panelTeam" HeaderText="Teams" Visible="false">
                <ContentTemplate>
                    <fieldset style="width: 729px">
                        <legend></legend>
                        <table style="width: 760px">
                            <tr>
                                <td align="left" class="style4">
                                    <asp:LinkButton ID="lbtnAllTeams" runat="server" OnClick="FilterChangedTeam">All</asp:LinkButton>|
                                    <asp:LinkButton ID="lbtn09Teams" runat="server" OnClick="FilterChangedTeam">0 - 9</asp:LinkButton>|
                                    <asp:LinkButton ID="lbtnAeTeams" runat="server" OnClick="FilterChangedTeam">A B C D E</asp:LinkButton>|
                                    <asp:LinkButton ID="lbtnFjTeams" runat="server" OnClick="FilterChangedTeam">F G H I J</asp:LinkButton>|
                                    <asp:LinkButton ID="lbtnKnTeams" runat="server" OnClick="FilterChangedTeam">K L M N</asp:LinkButton>|
                                    <asp:LinkButton ID="lbtnOrTeams" runat="server" OnClick="FilterChangedTeam">O P Q R</asp:LinkButton>|
                                    <asp:LinkButton ID="lbtnSvTeams" runat="server" OnClick="FilterChangedTeam">S T U V</asp:LinkButton>|
                                    <asp:LinkButton ID="lbtnWzTeams" runat="server" OnClick="FilterChangedTeam">W X Y Z</asp:LinkButton>
                                </td>
                                <td align="left" class="style3">
                                    <asp:Button ID="btnCreateTeam" runat="server" Text="Create" Style="margin-left: 0px"
                                        OnClick="BtnCreateTeamClick" />
                                    <asp:CheckBox ID="chkIncludeTeam" runat="server" Text="Include In-active" AutoPostBack="True"
                                        OnCheckedChanged="FilterChangedTeam" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Panel ID="pnlGridViewTeam" runat="server">
                                        <asp:GridView ID="grdTeams" runat="server" CellPadding="4" ForeColor="#333333" AutoGenerateColumns="False"
                                            Width="724px">
                                            <AlternatingRowStyle BackColor="White" />
                                            <Columns>
                                                <asp:TemplateField Visible="false">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lblidTeam" Text='<%#Eval("ID") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Team Name">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lbtnNameTeam" runat="server" Text='<%#Eval("Name")%>' OnClick="LbtnNameTeamClick" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="Addr1" HeaderText="Address Line 1" />
                                                <asp:BoundField DataField="PostCode" HeaderText="Postcode" />
                                                <asp:BoundField DataField="SurName" HeaderText="Contact" />
                                                <asp:TemplateField HeaderText="Is Active?" SortExpression="IsActive">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblIsActiveTeam" runat="server" Text='<%# Boolean.Parse(Eval("IsActive").ToString()) ? "Yes" : "No" %>' /></ItemTemplate>
                                                    <ItemStyle Width="10%"></ItemStyle>
                                                </asp:TemplateField>
                                            </Columns>
                                            <EditRowStyle BackColor="#2461BF" />
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                            <RowStyle BackColor="#EFF3FB" />
                                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        </asp:GridView>
                                    </asp:Panel>
                                    <asp:Label ID="lblNoDataTeam" runat="server" Text="No record has been found" Visible="false"></asp:Label>
                                    <div align="center">
                                        <table align="center">
                                            <tr>
                                                <td>
                                                    &#160;<asp:LinkButton ID="lbtnStart" runat="server" OnClick="FilterChangedTeam"><<</asp:LinkButton>&#160;&nbsp;<asp:LinkButton
                                                        ID="lbtnDeptBefore" runat="server" OnClick="FilterChangedTeam"><</asp:LinkButton>&#160;<asp:TextBox
                                                            ID="txtPageSizeTeam" runat="server" Columns="2" Text="3" Font-Bold="True" OnTextChanged="FilterChangedTeam"
                                                            AutoPostBack="true"></asp:TextBox><asp:Label ID="Label3" runat="server" Font-Size="X-Small"
                                                                Enabled="False" OnClick="FilterChangedTeam">/</asp:Label>&#160;<asp:Label ID="lblTotalPages"
                                                                    runat="server" Font-Bold="True" OnClick="FilterChangedTeam">1</asp:Label>
                                                    <asp:LinkButton ID="lbtnDeptAfter" runat="server" OnClick="FilterChangedTeam">></asp:LinkButton>&#160;&nbsp;<asp:LinkButton
                                                        ID="lbtnEnd" runat="server" OnClick="FilterChangedTeam">>></asp:LinkButton>&#160;
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
    <cc1:msgBox ID="msgError" runat="server" />
    <cc1:msgBox ID="msgInActive" runat="server" />
</asp:Content>
