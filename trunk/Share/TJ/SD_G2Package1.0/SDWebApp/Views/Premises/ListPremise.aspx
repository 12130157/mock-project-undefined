<%@ Page Language="C#" MasterPageFile="~/Shares/Site1.Master" AutoEventWireup="true"
    ValidateRequest="false" CodeBehind="ListPremise.aspx.cs" Inherits="SD.Web.Views.Premises.ListPremise"
    Title="Untitled Page" %>

<%@ Register Assembly="msgBox" Namespace="BunnyBear" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../Css/Stylesheet1.css" rel="stylesheet" type="text/css" />

    <script src="../../Scripts/script.js" type="text/javascript"></script>

    <title>List Premises</title>
</asp:Content>
<asp:Content ID="listbody" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="TitleContent">
        Premise List
    </div>
    <br />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="filter">
                <asp:LinkButton ID="lbtnAll" runat="server" OnClick="FilterChanged">All</asp:LinkButton>
                &nbsp; |
                <asp:LinkButton ID="lbtnNumber" runat="server" OnClick="FilterChanged">0 - 9</asp:LinkButton>
                |
                <asp:LinkButton ID="lbtnABCDE" runat="server" OnClick="FilterChanged">A B C D E</asp:LinkButton>
                |
                <asp:LinkButton ID="lbtnFGHIJ" runat="server" OnClick="FilterChanged">F G H I J</asp:LinkButton>
                |
                <asp:LinkButton ID="lbtnKLMN" runat="server" OnClick="FilterChanged">K L M N</asp:LinkButton>
                |
                <asp:LinkButton ID="lbtnOPQR" runat="server" OnClick="FilterChanged">O P Q R</asp:LinkButton>
                |
                <asp:LinkButton ID="lbtnSTUV" runat="server" OnClick="FilterChanged">S T U V</asp:LinkButton>
                |
                <asp:LinkButton ID="lbtnWXYZ" runat="server" OnClick="FilterChanged">W X Y Z</asp:LinkButton>
                &nbsp;
                <div id="buttonArea" style="float: right">
                    <asp:Button ID="btnCreate" runat="server" Text="Create" Width="69px" OnClick="BtnCreateClick"
                        UseSubmitBehavior="False" />&nbsp;
                    <asp:CheckBox ID="chkIncludeInActive" runat="server" Text="Include In-active" AutoPostBack="True"
                        OnCheckedChanged="FilterChanged" />
                </div>
            </div>
            <asp:Panel ID="pnlGridViewRegion" runat="server">
                <div class="Gridview">
                    <asp:GridView ID="grdPremises" runat="server" CellPadding="4" ForeColor="#333333"
                        Width="100%" AutoGenerateColumns="False" OnRowDataBound="GridViewRowDataBound"
                        OnRowCommand="GridViewRowCommand" AllowSorting="True" OnSorting="GrdPremisesSorting">
                        <RowStyle BackColor="#EFF3FB" />
                        <Columns>
                            <asp:TemplateField Visible="false">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblId" Text='<%#Eval("ID") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="Name" DataField="Name" Visible="False" HtmlEncode="False" />
                            <asp:TemplateField HeaderText="Location Name" SortExpression="LocationName">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnLocation" runat="server" CommandName="select" CommandArgument='<%# Eval("ID") %>'
                                        Text='<%# Eval("LocationName") %>'>
                                    </asp:LinkButton>
                                    <asp:Image ID="imgButton" runat="server" ImageUrl='<%# Eval("ImgNewShop") %>'></asp:Image>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="Address line 1" DataField="AddressLine1" SortExpression="AddressLine1" />
                            <asp:BoundField HeaderText="Postcode" DataField="Postcode" SortExpression="Postcode" />
                            <asp:BoundField DataField="IsActive" HeaderText="Is Active?" SortExpression="IsActive" />
                        </Columns>
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#2461BF" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                    <div align="center">
                        <table align="center">
                            <tr>
                                <td>
                                    &nbsp;<asp:LinkButton ID="lbtnFirstPage" runat="server" OnClick="FilterChanged"><<</asp:LinkButton>
                                    &nbsp;
                                    <asp:LinkButton ID="lbtnPreviousPage" runat="server" OnClick="FilterChanged"><</asp:LinkButton>
                                    &nbsp;&nbsp;<asp:TextBox ID="txtCurrentPage" runat="server" Columns="2" Text="3"
                                        AutoPostBack="true" Font-Bold="True" Width="20px" OnTextChanged="FilterChanged"></asp:TextBox>
                                    <asp:Label ID="lblSeperate" runat="server" Font-Size="X-Small" Enabled="False">/</asp:Label>
                                    <asp:Label ID="lblTotalPages" runat="server">1</asp:Label>
                                    &nbsp;
                                    <asp:LinkButton ID="lbtnNextPage" runat="server" OnClick="FilterChanged">></asp:LinkButton>
                                    &nbsp;
                                    <asp:LinkButton ID="lbtnLastPage" runat="server" OnClick="FilterChanged">>></asp:LinkButton>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </asp:Panel>
            <asp:Label ID="lblNoData" runat="server" CssClass="NoData" Text="No record has been found"
                Visible="false"></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>
    <cc1:msgBox ID="msgBoxPremises" runat="server" />
</asp:Content>
