<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PremiseServicesAdd.ascx.cs"
    Inherits="SD.Web.Controls.Premises.PremiseServicesAdd" %>
<link href="../../Css/Stylesheet1.css" rel="stylesheet" type="text/css" />
<div style="padding: 10px; border: 1px">
    <div class="TitleContent">
        Select Service
    </div>
    <br />
    <asp:Panel ID="pnlGridViewRegion" runat="server">
        <div class="Gridview">
            <div>
                <asp:GridView ID="grdListServices" runat="server" CellPadding="4" ForeColor="#333333"
                    Width="100%" AutoGenerateColumns="False">
                    <RowStyle BackColor="#EFF3FB" />
                    <Columns>
                        <asp:TemplateField Visible="false">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lblId" Text='<%#Eval("ID") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:RadioButton runat="server" ID="selectedButton" AutoPostBack="true" OnCheckedChanged="SelectedButtonOnCheckChanged" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Name" HeaderText="Service Name" />
                        <asp:BoundField DataField="Description" HeaderText="Description" />
                        <asp:BoundField DataField="ServiceType" HeaderText="Service Type" />
                        <asp:BoundField DataField="Contact" HeaderText="Contact" />
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
                                AutoPostBack="true" Font-Bold="True" Width="20px" OnTextChanged="FilterChanged"></asp:TextBox>
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
    <div style="float: right">
        <asp:Button ID="btnSelect" runat="server" Text="Select" OnClick="BtnSelectClick" />
        <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="BtnBackClick" />
    </div>
    <asp:Label ID="lblNoData" runat="server" CssClass="NoData" Text="No record has been found"
        Visible="false"></asp:Label>
    <div style="float: right">
    </div>
    <div class="Error">
        <br />
        <asp:Label ID="lblError" runat="server" Visible="false">You must select a service</asp:Label>
    </div>
</div>
