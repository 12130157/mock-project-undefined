<%@ Page Language="C#" MasterPageFile="~/Shares/Site1.Master" AutoEventWireup="true"
    CodeBehind="TrustRegionList.aspx.cs" Inherits="SD.Web.Views.Geography.TrustRegionList"
    Title="Trust Region List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <table style="border: 1px solid #9e9f9f;">
                <tr>
                    <td>
                        <div class="TitleContent">
                            Trust Region List
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="filter">
                        <asp:LinkButton ID="lbtnAll" runat="server" OnClick="FilterChanged">All</asp:LinkButton>
                        &nbsp;|
                        <asp:LinkButton ID="lbtn0to9" runat="server" OnClick="FilterChanged">0 - 9</asp:LinkButton>
                        &nbsp;|
                        <asp:LinkButton ID="lbtnABCDE" runat="server" OnClick="FilterChanged">ABCDE</asp:LinkButton>
                        &nbsp;|
                        <asp:LinkButton ID="lbtnFGHIJ" runat="server" OnClick="FilterChanged">FGHIJ</asp:LinkButton>
                        &nbsp;|
                        <asp:LinkButton ID="lbtnKLMN" runat="server" OnClick="FilterChanged">KLMN</asp:LinkButton>
                        &nbsp;|
                        <asp:LinkButton ID="lbtnOPQR" runat="server" OnClick="FilterChanged">OPQR</asp:LinkButton>
                        &nbsp;|
                        <asp:LinkButton ID="lbtnSTUV" runat="server" OnClick="FilterChanged">STUV</asp:LinkButton>
                        &nbsp;|
                        <asp:LinkButton ID="lbtnWXYZ" runat="server" OnClick="FilterChanged">WXYZ</asp:LinkButton>
                    </td>
                    <td align="right" class="filter">
                        <asp:Button ID="btnCreate" runat="server" Text="Create" OnClick="BtnCreate_Click" />&nbsp;
                        <asp:CheckBox ID="chkIncludeInactive" runat="server" Text="Include Inactive" AutoPostBack="True"
                            OnCheckedChanged="FilterChanged" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Panel ID="pnlGridViewRegion" runat="server">
                            <div class="Gridview">
                                <asp:GridView ID="grdRegion" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                    ForeColor="#333333" Width="775px" OnRowDataBound="GrdRegionRowDataBound" OnRowCommand="GrdRegionRowCommand"
                                    AllowSorting="true" OnSorting="GrdRegion_OnSorting">
                                    <RowStyle BackColor="#EFF3FB" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="Trust Region Name" SortExpression="Name">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnRegionName" runat="server" CommandName="select" CommandArgument='<%# Eval("ID") %>'
                                                    Text='<%#Eval("Name")%>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField HeaderText="Description" DataField="Description" SortExpression="Description" />
                                        <asp:BoundField HeaderText="Nation/Country" DataField="NationCountry" SortExpression="NationCountry" />
                                        <asp:TemplateField HeaderText="Is Active?" SortExpression="IsActive">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%#Boolean.Parse(Eval("IsActive").ToString())?"Yes":"No"%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
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
                                                    Font-Bold="True" AutoPostBack="True" OnTextChanged="FilterChanged"></asp:TextBox>
                                                <asp:Label ID="lblSeparate" runat="server" Font-Size="X-Small" Enabled="False">/</asp:Label>
                                                <asp:Label ID="lblTotalPages" runat="server" Font-Bold="True">1</asp:Label>
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
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
