<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Ognization.ascx.cs"
    Inherits="SD.Web.Views.AmenDetail1" %>
<link href="../../Css/Stylesheet1.css" rel="stylesheet" type="text/css" />
<script src="../../Scripts/script.js" type="text/javascript"></script>
<asp:Panel ID="pnlGridViewRegion" runat="server">
    <div class="Gridview">
        <asp:GridView ID="grvOrganisation" runat="server" CellPadding="4" ForeColor="#333333"
            Width="100%" AutoGenerateColumns="False">
            <RowStyle BackColor="#EFF3FB" />
            <Columns>
                <asp:BoundField HeaderText="Organisation Name" DataField="OrganisationName" />
                <asp:BoundField HeaderText="Description" DataField="Description" />
                <asp:BoundField HeaderText="Roles" DataField="Roles"></asp:BoundField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="lbtnChangeRole" OnClick="LbtnChangeRoleClick"  runat="server">Edit Roles</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:HiddenField ID="hdfId" runat="server" Value='<%# Bind("ID") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
    </div>
    <div align="center">
        <table align="center">
            <tr>
                <td>
                    &nbsp;<asp:LinkButton ID="lbtnFirstPage" runat="server" OnClick="lbtnFirstPage_Click"><<</asp:LinkButton>
                    &nbsp;
                    <asp:LinkButton ID="lbtnPreviousPage" runat="server" OnClick="lbtnPreviousPage_Click"><</asp:LinkButton>
                    &nbsp;&nbsp;<asp:TextBox ID="txtCurrentPage" runat="server" Columns="2" Text="3"
                        Font-Bold="True" Width="20px" OnTextChanged="txtCurrentPage_TextChanged"></asp:TextBox>
                    <asp:Label ID="lblSeperate" runat="server" Font-Size="X-Small" Enabled="False">/</asp:Label>
                    <asp:Label ID="lblTotalPages" runat="server" Font-Bold="True">1</asp:Label>
                    &nbsp;
                    <asp:LinkButton ID="lbtnNextPage" runat="server" OnClick="lbtnNextPage_Click">></asp:LinkButton>
                    &nbsp;
                    <asp:LinkButton ID="lbtnLastPage" runat="server" OnClick="lbtnLastPage_Click">>></asp:LinkButton>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    <asp:HiddenField ID="hdfServiceOrganisationId" runat="server" />
                    <asp:HiddenField ID="hdfRole" runat="server" />
                </td>
            </tr>
        </table>
    </div>
</asp:Panel>
<asp:Label ID="lblNoData" runat="server" Text="No record has been found" Visible="false"></asp:Label>
