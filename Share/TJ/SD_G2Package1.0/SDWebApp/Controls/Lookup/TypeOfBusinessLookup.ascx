<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TypeOfBusinessLookup.ascx.cs"
    Inherits="SD.Web.Controls.Lookup.TypeOfBusinessLookup" %>
<style type="text/css">
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
    <asp:Label ID="Label1" runat="server" Text="Search Postcode" CssClass="TitleContent"></asp:Label>
    <asp:Panel ID="Panel1" runat="server" BorderWidth="1px" Width="100%">
        <table id="Table1" runat="server">
            <tr>
                <td>
                    Business Name:
                </td>
                <td>
                    <asp:TextBox ID="txtBusinessName" runat="server" Width="250px"></asp:TextBox>
                </td>
                <td>
                    SIC Code:
                </td>
                <td>
                    <asp:TextBox ID="txtSicCode" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />&nbsp;
                    <asp:Button ID="btnNone" runat="server" Text="None" OnClick="btnNone_Click" />&nbsp;
                    <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" />&nbsp;
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
                    <asp:GridView ID="grdBusiness" runat="server" CellPadding="4" ForeColor="#333333"
                        GridLines="None" AutoGenerateColumns="False" Width="100%" >
                        <RowStyle BackColor="#EFF3FB" />
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                       <asp:RadioButton runat="server" ID="rdbSelect" AutoPostBack="true" OnCheckedChanged="BusinessCheckedChanged"/>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="ID" HeaderText="ID" Visible="false" />
                            <asp:BoundField HeaderText="Business Name" DataField="Name" />
                            <asp:BoundField HeaderText="SIC Code" DataField="SicCode" />
                            <asp:TemplateField Visible="false">
                                    <ItemTemplate>
                                        <asp:Label runat="server"  Visible="false" ID="id" Text='<%#Eval("ID") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField Visible="false">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="name" Visible="false" Text='<%#Eval("Name") %>'  />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField Visible="false">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="siccode" Visible="false" Text='<%#Eval("SicCode") %>' />
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
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnSelect" runat="server" Text="Select" Height="25px" OnClick="btnSelect_Click"/>
                <asp:Button ID="btnClose" runat="server" Text="Close" OnClick="btnClose_Click" OnClientClick="javascript:window.close();" />
            </td>
        </tr>
    </table>
</div>
