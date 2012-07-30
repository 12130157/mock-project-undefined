<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TrustDistricts.ascx.cs"
    Inherits="SD.Web.Controls.Geography.TrustDistricts" %>
<style type="text/css">
    .style1
    {
        width: 484px;
    }
    .style2
    {
        width: 521px;
    }
    .Gridview
    {
        font-size: small;
    }
</style>
<link href="../../Css/Stylesheet1.css" rel="stylesheet" type="text/css" />
<asp:UpdatePanel runat="server" UpdateMode="Conditional">
    <ContentTemplate>
        <table style="border: 1px solid #9e9f9f;">
            <tr>
                <td class="style2">
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
                <td align="right">
                    <asp:Button ID="btnCreate" runat="server" Text="Create" OnClick="BtnCreate_Click" />&nbsp;
                    <asp:CheckBox ID="chkIncludeInactive" runat="server" Text="Include Inactive" AutoPostBack="True"
                        OnCheckedChanged="FilterChanged" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Panel CssClass="Gridview" ID="pnlGridViewDistrict" runat="server">
                        <div>
                            <asp:GridView ID="grdDistrict" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                ForeColor="#333333" GridLines="Both" Width="775px" PageSize="15" AllowSorting="True"
                                OnSorting="GrdDistrict_OnSorting" Font-Size="Small" OnRowDataBound="GrdDistrictRowDataBound"
                                OnRowCommand="GrdDistrictRowCommand">
                                <RowStyle BackColor="#EFF3FB" />
                                <Columns>
                                    <asp:TemplateField Visible="false">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblid" Text='<%#Eval("ID") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Trust District Name" SortExpression="Name">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbtnDistrictName" runat="server" CommandName="select" CommandArgument='<%# Eval("ID") %>'
                                                Text='<%#Eval("Name")%>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField HeaderText="Description" DataField="Description" SortExpression="Description" />
                                    <asp:BoundField HeaderText="Region" DataField="TrustRegionName" SortExpression="TrustRegionName" />
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
                                            &nbsp;<asp:TextBox ID="txtCurrentPage" runat="server" Columns="2" Text="3" Font-Bold="True"
                                                AutoPostBack="True" OnTextChanged="FilterChanged"></asp:TextBox>
                                            <asp:Label ID="lblSeparate" runat="server" Font-Size="X-Small" Enabled="False">/</asp:Label>
                                            &nbsp;<asp:Label ID="lblTotalPages" runat="server" Font-Bold="True">1</asp:Label>
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
                    <asp:Label ID="lblNoData" runat="server" Text="No record has been found" Visible="false"></asp:Label>
                </td>
            </tr>
        </table>
    </ContentTemplate>
</asp:UpdatePanel>
