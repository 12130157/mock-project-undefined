<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PremiseServices.ascx.cs"
    Inherits="SD.Web.Controls.Premises.PremiseServices" %>
<%@ Register TagPrefix="uc1" tagName="PremiseServicesAdd" Src="~/Controls/Premises/PremiseServicesAdd.ascx" %>
<link href="../../Css/Stylesheet1.css" rel="stylesheet" type="text/css" />
<asp:Panel ID="pnlGridViewRegion" runat="server">
    <div class="Gridview">
        <div>
            <asp:GridView ID="grdListServices" runat="server" CellPadding="4" ForeColor="#333333"
                Width="100%" AutoGenerateColumns="False">
                <RowStyle BackColor="#EFF3FB" />
                <Columns>
                    <asp:TemplateField Visible="False">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblId" Text='<%#Eval("ID") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Name" HeaderText="Service Name" />
                    <asp:BoundField DataField="Description" HeaderText="Description" />
                    <asp:BoundField DataField="ServiceType" HeaderText="Service Type" />
                    <asp:BoundField DataField="Contact" HeaderText="Contact" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="lbtnRemove" Text="Remove" OnClick="LbtnRemoveClick" />
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
                        &nbsp;<asp:LinkButton ID="lbtnFirstPage" runat="server" OnClick="FilterChanged"><<</asp:LinkButton>
                        &nbsp;
                        <asp:LinkButton ID="lbtnPreviousPage" runat="server" OnClick="FilterChanged"><</asp:LinkButton>
                        &nbsp;&nbsp;<asp:TextBox ID="txtCurrentPage" runat="server" Columns="2" Text="3"
                            Font-Bold="True" Width="20px" OnTextChanged="FilterChanged" AutoPostBack="true"></asp:TextBox>
                        <asp:Label ID="lblSeperate" runat="server" Font-Size="X-Small" Enabled="False">/</asp:Label>
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
<asp:Label ID="lblNoData" runat="server" CssClass="NoData" Text="No record has been found" Visible="false"></asp:Label>
<table width="100%">
    <tr>
        <td>
            <div style="float: right">
                <asp:Button ID="btnAdd" runat="server" Text="Associate new service" OnClick="BtnAddClick" />
            </div>
        </td>
    </tr>
</table>
<div id="MaskedDiv" runat="server" visible="false">
</div>
<div id="SelectServiceRegion" runat="server" visible="false">
    <uc1:PremiseServicesAdd ID="premiseServicesAdd" runat="server" OnButtonBackClick="ClosePopup"
        OnButtonSelectClick="SelectService" />
</div>
