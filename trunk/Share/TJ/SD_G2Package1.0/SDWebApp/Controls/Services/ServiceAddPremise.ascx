<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ServiceAddPremise.ascx.cs" Inherits="SD.Web.Controls.Services.ServiceAddPremise" %>

<link href="../../Css/Stylesheet1.css" rel="stylesheet" type="text/css" />

        <asp:Panel ID="pnlGridViewRegion" runat="server">
            <div class="Gridview">
                <div>
                    <div style="text-align:center">
                    <span style="font-size:15; color:Blue;font-weight:bold">ProjectCode:</span> 
                    <asp:TextBox ID="txtProjectCode" runat="server"></asp:TextBox>
                </div>
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
                                    <asp:RadioButton runat="server" ID="selectedButton" AutoPostBack="true" OnCheckedChanged="selectedButton_OnCheckChanged" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:HyperLinkField DataTextField="Name" HeaderText="Premise Name" />
                            <asp:BoundField DataField="AddressLine1" HeaderText="Address" />
                            <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" />
                        </Columns>
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                        <EditRowStyle BackColor="#2461BF" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                </div>
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
                </table>
                <div style="float: right">
                    <asp:Button ID="btnSelect" runat="server" Text="Select" OnClick="btnSelect_Click" />
                    <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="btnBack_Click"/>
                </div>
            </div>
        </asp:Panel>
        <asp:Label ID="lblNoData" runat="server" Text="No record has been found" Visible="false"></asp:Label>
        <div style="float: right">
        </div>
