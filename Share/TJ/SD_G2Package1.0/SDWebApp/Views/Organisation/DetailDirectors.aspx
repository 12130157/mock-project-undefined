<%@ Page Language="C#" MasterPageFile="~/Shares/Site1.Master" AutoEventWireup="true"
    CodeBehind="DetailDirectors.aspx.cs" Inherits="SD.Web.Views.Organisation.DetailDirectors"
    Title="Directors" %>

<%@ Register Assembly="msgBox" Namespace="BunnyBear" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register TagPrefix="uc2" TagName="ContactLookUp" Src="~/Controls/Contact/ContactSelect.ascx" %>
<%@ Register TagPrefix="uc1" TagName="AddressLookup" Src="~/Controls/Lookup/AddressLookup.ascx" %>
<%@ Register TagPrefix="uc3" TagName="TypeOfBusinessLookup" Src="~/Controls/Lookup/TypeOfBusinessLookup.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div>
            <asp:LinkButton ID="LinkButton1" runat="server">Organisation ></asp:LinkButton>
        </div>
        <div class="TitleContent">
            Business Unit/ Directors Details</div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnInActive" runat="server" Text="In-Active" Style="margin-left: 0px"
            Width="61px" OnClick="BtnInActiveClick" />
        &nbsp;<asp:Button ID="btnSave" runat="server" Text="Save" Style="margin-left: 0px"
            Width="61px" CommandName="Create" OnClick="BtnSaveClick" />
        &nbsp;<asp:Button ID="btnBack" runat="server" Text="Back" Width="66px" OnClick="BtnBackClick" />
        <ajaxToolkit:TabContainer runat="server" ID="Tabs" Height="500px" ActiveTabIndex="0"
            Width="770px">
            <ajaxToolkit:TabPanel runat="server" ID="Panel1" HeaderText="Details 1">
                <ContentTemplate>
                    <table style="width: 772px">
                        <tr>
                            <td class="style13">
                                BU/Directorate name
                                <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="*"></asp:Label>
                            </td>
                            <td class="style10">
                                <asp:TextBox ID="txtDirectorsName" runat="server" Width="158px"></asp:TextBox>
                            </td>
                            <td class="style12">
                                Type of business
                                <asp:Label ID="Label7" runat="server" ForeColor="Red" Text="*"></asp:Label>
                            </td>
                            <td class="style5">
                                <asp:TextBox ID="txtDirectorsBusiness" runat="server" Width="124px"></asp:TextBox>&#160;<asp:Button
                                    ID="BtnBusinessSelect" runat="server" Font-Bold="True" Text="..." OnClick="BtnBusinessSelect_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style13" rowspan="2">
                                BU/Directorate Short<br />
                                Description&#160;
                            </td>
                            <td class="style10" rowspan="2">
                                <asp:TextBox ID="txtDirectorsDesc" runat="server" Height="43px" Width="159px" TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="style12">
                                SIC Code
                            </td>
                            <td class="style4">
                                <asp:TextBox ID="txtDirectorsSicCode" runat="server" Enabled="False" Width="158px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style12">
                                BU/Directorate Full
                                <br />
                                Description
                            </td>
                            <td class="style3">
                                <asp:TextBox ID="txtDirectorsFullDesc" runat="server" Height="43px" Width="159px"
                                    TextMode="MultiLine"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style13">
                                Lead Contact
                            </td>
                            <td class="style10">
                                <asp:TextBox ID="txtDirectorsContact" runat="server" Width="97px"></asp:TextBox>&nbsp;&nbsp;<asp:Button
                                    ID="btnContactSelect" runat="server" Font-Bold="True" Text="..." OnClick="BtnContactSelectClick" />
                            </td>
                            <td class="style12">
                                &#160;Phone number
                                <asp:Label ID="Label5" runat="server" ForeColor="Red" Text="*"></asp:Label>
                            </td>
                            <td class="style6">
                                <asp:TextBox ID="txtDirectorsPhoneNumber" runat="server" Width="158px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style7" colspan="2">
                                <asp:CheckBox ID="chkDirectorsCopyAddr" runat="server" Text="Copy Address from Organisation"
                                    AutoPostBack="True" OnCheckedChanged="ChkDirectorsCopyAddrCheckedChanged" />
                            </td>
                            <td class="style12">
                                Fax
                            </td>
                            <td class="style6">
                                <asp:TextBox ID="txtDirectorsFax" runat="server" Width="158px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style13">
                                Address Line 1
                                <asp:Label ID="Label4" runat="server" ForeColor="Red" Text="*"></asp:Label>
                            </td>
                            <td class="style10">
                                <asp:TextBox ID="txtAddr1" runat="server" Width="158px"></asp:TextBox>
                            </td>
                            <td rowspan="2" class="style12">
                                Email
                            </td>
                            <td rowspan="2">
                                <asp:TextBox ID="txtDirectorsEmail" runat="server" Width="158px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style13">
                                Address Line 2
                            </td>
                            <td class="style10">
                                <asp:TextBox ID="txtAddr2" runat="server" Width="158px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style13">
                                Address Line 3
                            </td>
                            <td class="style10">
                                <asp:TextBox ID="txtAddr3" runat="server" Width="158px"></asp:TextBox>
                            </td>
                            <td class="style12">
                                Web Address
                            </td>
                            <td class="style5">
                                <asp:TextBox ID="txtDirectorsWeb" runat="server" Width="158px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style13">
                                Postcode
                                <asp:Label ID="Label6" runat="server" ForeColor="Red" Text="*"></asp:Label>
                            </td>
                            <td class="style10">
                                <asp:TextBox ID="txtDirectorsPostCode" runat="server" Width="97px"></asp:TextBox>&nbsp;&nbsp;<asp:Button
                                    ID="btnPostCodeSelect" runat="server" Font-Bold="True" Text="..." OnClick="BtnPostCodeSelectClick" />
                            </td>
                            <td class="style12">
                                Charity Number
                            </td>
                            <td class="style5">
                                <asp:TextBox ID="txtDirectorsCharity" runat="server" Width="158px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style13">
                                City/ Town
                            </td>
                            <td class="style10">
                                <asp:TextBox ID="txtDirectorsCity" runat="server" Width="158px"></asp:TextBox>
                            </td>
                            <td class="style12">
                                Company Number
                            </td>
                            <td class="style5">
                                <asp:TextBox ID="txtDirectorsCompany" runat="server" Width="158px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style13">
                                County
                            </td>
                            <td class="style10">
                                <asp:TextBox ID="txtDirectorsCounty" runat="server" Width="158px"></asp:TextBox>
                            </td>
                            <td class="style12">
                                &#160;
                            </td>
                            <td class="style5">
                                &#160;
                            </td>
                        </tr>
                        <tr>
                            <td class="style13">
                                Nation/ Country
                            </td>
                            <td class="style10">
                                <asp:DropDownList ID="ddlDirectorsCountry" runat="server" Width="168px" Height="23px">
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
                            <td class="style13">
                            </td>
                            <td class="style10">
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
            <ajaxToolkit:TabPanel runat="server" ID="panelDepartment" HeaderText="Departments"
                Visible="false">
                <ContentTemplate>
                    <fieldset style="width: 729px">
                        <legend></legend>
                        <table style="width: 760px">
                            <tr>
                                <td align="left" class="style14">
                                    <asp:LinkButton ID="lbtnAllDept" runat="server" OnClick="FilterChangedDept">All</asp:LinkButton>|
                                    <asp:LinkButton ID="lbtn09Dept" runat="server" OnClick="FilterChangedDept">0 - 9</asp:LinkButton>|
                                    <asp:LinkButton ID="lbtnAeDept" runat="server" OnClick="FilterChangedDept">A B C D E</asp:LinkButton>|
                                    <asp:LinkButton ID="lbtnFjDept" runat="server" OnClick="FilterChangedDept">F G H I J</asp:LinkButton>|
                                    <asp:LinkButton ID="lbtnKnDept" runat="server" OnClick="FilterChangedDept">K L M N</asp:LinkButton>|
                                    <asp:LinkButton ID="lbtnOrDept" runat="server" OnClick="FilterChangedDept">O P Q R</asp:LinkButton>|
                                    <asp:LinkButton ID="lbtnSvDept" runat="server" OnClick="FilterChangedDept">S T U V</asp:LinkButton>|
                                    <asp:LinkButton ID="lbtnWzDept" runat="server" OnClick="FilterChangedDept">W X Y Z</asp:LinkButton>
                                </td>
                                <td align="left" class="style3">
                                    <asp:Button ID="btnCreateDept" runat="server" Text="Create" OnClick="BtnCreateDeptClick"
                                        Style="margin-left: 0px" /><asp:CheckBox ID="chkIncludeDept" runat="server" Text="Include In-active"
                                            AutoPostBack="True" OnCheckedChanged="FilterChangedDept" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Panel ID="pnlGridViewDept" runat="server">
                                        <asp:GridView ID="grdDepartments" runat="server" CellPadding="4" ForeColor="#333333"
                                            AutoGenerateColumns="False" Width="724px">
                                            <AlternatingRowStyle BackColor="White" />
                                            <Columns>
                                                <asp:TemplateField Visible="false">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lblidDept" Text='<%#Eval("ID") %>' /></ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Department Name">
                                                    <ItemTemplate>
                                                        <%-- <asp:HyperLink runat="server" id="h"  Text='<%#Eval("Name")%>' NavigateUrl='<%# Boolean.Parse(Eval("IsActive").ToString())? "DetailOrganisation.aspx?pid="+ Eval("ID"):""%>'>
                                                    
                                                    </asp:HyperLink>--%><asp:LinkButton ID="lbtnNameDept" runat="server" Text='<%#Eval("Name")%>'
                                                        OnClick="LbtnNameDeptClick" /></ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="Addr1" HeaderText="Address Line 1" />
                                                <asp:BoundField DataField="PostCode" HeaderText="Postcode" />
                                                <asp:BoundField DataField="SurName" HeaderText="Contact" />
                                                <asp:TemplateField HeaderText="Is Active?" SortExpression="IsActive">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblIsActiveDept" runat="server" Text='<%# Boolean.Parse(Eval("IsActive").ToString()) ? "Yes" : "No" %>' /></ItemTemplate>
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
                                        <asp:Label ID="lblNoDataDept" runat="server" Text="No record has been found" Visible="false"></asp:Label>
                                    </asp:Panel>
                                    <div align="center">
                                        <table align="center">
                                            <tr>
                                                <td>
                                                    &#160;<asp:LinkButton ID="lbtnStart" runat="server" OnClick="FilterChangedDept"><<</asp:LinkButton>&#160;&nbsp;<asp:LinkButton
                                                        ID="lbtnDeptBefore" runat="server" OnClick="FilterChangedDept"><</asp:LinkButton>&#160;<asp:TextBox
                                                            ID="txtPageSizeDept" runat="server" Columns="2" Text="3" Font-Bold="True" OnTextChanged="FilterChangedDept"
                                                            AutoPostBack="true"></asp:TextBox><asp:Label ID="Label3" runat="server" Font-Size="X-Small"
                                                                Enabled="False">/</asp:Label>&#160;<asp:Label ID="lblTotalPages" runat="server" Font-Bold="True">1</asp:Label><asp:LinkButton
                                                                    ID="lbtnDeptAfter" runat="server" OnClick="FilterChangedDept">></asp:LinkButton>&#160;&nbsp;<asp:LinkButton
                                                                        ID="lbtnEnd" runat="server" OnClick="FilterChangedDept">>></asp:LinkButton>&#160;
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
