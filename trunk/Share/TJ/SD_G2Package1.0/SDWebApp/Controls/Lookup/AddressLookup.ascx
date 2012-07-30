<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddressLookup.ascx.cs"
    Inherits="SD.Web.Controls.Lookup.AddressLookup" %>
<style>
    .search
    {
        color: #0076a3;
        font-size: 17pt;
        font-weight: bold;
    }
</style>
<link href="../../Css/Stylesheet1.css" rel="stylesheet" type="text/css" />

<script src="../../Scripts/Domwindow.js" type="text/javascript"></script>

<div>
    <div>
        <asp:Label ID="Label1" runat="server" Text="Search Postcode" CssClass="TitleContent"></asp:Label>
        <asp:Panel ID="Panel1" runat="server" BorderWidth="1px">
            <table id="Table1" runat="server">
                <tr>
                    <td>
                        Postcode:
                    </td>
                    <td>
                        <asp:TextBox ID="txtPostCode" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        Street:
                    </td>
                    <td>
                        <asp:TextBox ID="txtStreet" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        Town:
                    </td>
                    <td>
                        <asp:TextBox ID="txtTown" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:Button ID="btnSearchAddress" runat="server" Text="SearchAddress" OnClick="btnSearchAddress_Click" />&nbsp;
                        <asp:Button ID="btnNone" runat="server" Text="None" onclick="btnNone_Click" />&nbsp;
                        <asp:Button ID="btnClear" runat="server" Text="Clear" Width="46px" OnClick="btnClear_Click" />&nbsp;
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </div>
    <div>
        <table style="width: 100%">
            <tr>
                <td>
                    <div class="Gridview">
                        <asp:GridView ID="grdAddress" runat="server" CellPadding="4" ForeColor="#333333"
                            AllowSorting="True" Width="100%" AutoGenerateColumns="False" DataKeyNames="ID"
              >
                            <RowStyle BackColor="#EFF3FB" />
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:RadioButton runat="server" ID="rdbSelect" AutoPostBack="true" OnCheckedChanged="AddressCheckedChanged" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--<asp:BoundField DataField="ID" HeaderText="ID" Visible="false" />--%>
                                <asp:TemplateField HeaderText="ID" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="id" Text='<%#Eval("ID") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Address">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="name" Text='<%#Eval("AddressName") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Postcode">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="postcode" Text='<%#Eval("Postcode") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="TownName" HeaderText="Town" />
                                <asp:BoundField DataField="CountiesName" HeaderText="County" />
                                <asp:BoundField DataField="NationCountiesName" HeaderText="Country" />
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
                                        &nbsp;<asp:LinkButton ID="lbtnBegin" runat="server" OnClick="FilterChanged"><<</asp:LinkButton>&nbsp;
                                        <asp:LinkButton ID="lbtnPre" runat="server" OnClick="FilterChanged"><</asp:LinkButton>
                                        &nbsp;<asp:TextBox ID="txtPageSize" runat="server" Columns="2" Text="3" Font-Bold="True">
                                        </asp:TextBox><asp:Label ID="SepLbl" runat="server" Font-Size="X-Small" Enabled="False">/</asp:Label>&nbsp;<asp:Label
                                            ID="txtTotalPages" runat="server" Font-Bold="True">1</asp:Label><asp:LinkButton ID="lbtnNext"
                                                runat="server" OnClick="FilterChanged">></asp:LinkButton>&nbsp;
                                        <asp:LinkButton ID="lbtnEnd" runat="server" OnClick="FilterChanged">>></asp:LinkButton>
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Button ID="btnSelect" runat="server" Text="Select" OnClick="btnSelect_Click" />
                    <asp:Button ID="btnClose" runat="server" Text="Close" OnClick="btnClose_Click" OnClientClick="javascript:window.close();" />
                </td>
            </tr>
        </table>
    </div>
</div>
