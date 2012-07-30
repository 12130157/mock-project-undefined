<%@ Page Language="C#" MasterPageFile="~/Shares/Site1.Master" AutoEventWireup="true"
    CodeBehind="ListOrganisation.aspx.cs" Inherits="SD.Web.Views.Organisation.ListOrganisation"
    Title="List Organisation" %>

<%@ Register Assembly="msgBox" Namespace="BunnyBear" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td>
                <div class="TitleContent">
                    Organisation List
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="filter">
                    <asp:LinkButton ID="lbtnAll" runat="server" OnClick="FilterChanged">All</asp:LinkButton>
                    &nbsp; |
                    <asp:LinkButton ID="lbtn09" runat="server" OnClick="FilterChanged">0 - 9</asp:LinkButton>
                    |
                    <asp:LinkButton ID="lbtnAE" runat="server" OnClick="FilterChanged">A B C D E</asp:LinkButton>
                    |
                    <asp:LinkButton ID="lbtnFJ" runat="server" OnClick="FilterChanged">F G H I J</asp:LinkButton>
                    |
                    <asp:LinkButton ID="lbtnKN" runat="server" OnClick="FilterChanged">K L M N</asp:LinkButton>
                    |
                    <asp:LinkButton ID="lbtnOR" runat="server" OnClick="FilterChanged">O P Q R</asp:LinkButton>
                    |
                    <asp:LinkButton ID="lbtnSV" runat="server" OnClick="FilterChanged">S T U V</asp:LinkButton>
                    |
                    <asp:LinkButton ID="lbtnWZ" runat="server" OnClick="FilterChanged">W X Y Z</asp:LinkButton>
                    &nbsp;
                    <asp:Button ID="btnCreate" runat="server" Text="Create" Width="69px" OnClick="BtnCreateClick" />&nbsp;
                    <asp:CheckBox ID="CheckActive" runat="server" Text="Include In-active" AutoPostBack="True"
                        OnCheckedChanged="FilterChanged" />
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlGridViewOrganisation" runat="server">
                    <div class="Gridview">
                        <asp:GridView ID="grdOrganisation" runat="server" AutoGenerateColumns="False" CellPadding="4"
                            ForeColor="#333333" Width="775px">
                            <RowStyle BackColor="#EFF3FB" />
                            <Columns>
                                <asp:TemplateField Visible="false">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblid" Text='<%#Eval("ID") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Organisation Name">
                                    <ItemTemplate>
                                        <%-- <asp:HyperLink runat="server" id="h"  Text='<%#Eval("Name")%>' NavigateUrl='<%# Boolean.Parse(Eval("IsActive").ToString())? "DetailOrganisation.aspx?pid="+ Eval("ID"):""%>'>
                                
                                </asp:HyperLink>--%>
                                        <asp:LinkButton ID="lbtnName" runat="server" Text='<%#Eval("Name")%>' OnClick="LbtnNameClick" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--  
                        <asp:HyperLinkField
                            DataNavigateUrlFields="Name" HeaderText="Organisation name"
                            DataTextField="Name"></asp:HyperLinkField>--%>
                                <asp:BoundField HeaderText="Head Office Address Line 1 " DataField="Addr1" />
                                <asp:BoundField HeaderText="Postcode" DataField="Postcode" />
                                <asp:BoundField HeaderText="Contact" DataField="SurName" />
                                <asp:TemplateField HeaderText="Is Active?" SortExpression="IsActive">
                                    <ItemTemplate>
                                        <asp:Label ID="lblIsActive" runat="server" Text='<%# Boolean.Parse(Eval("IsActive").ToString()) ? "Yes" : "No" %>' /></ItemTemplate>
                                    <ItemStyle Width="10%"></ItemStyle>
                                </asp:TemplateField>
                            </Columns>
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <EditRowStyle BackColor="#2461BF" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:GridView>
                        <div align="center">
                            <table align="center">
                                <tr>
                                    <td>
                                        &nbsp;<asp:LinkButton ID="LinkButton17" runat="server" OnClick="FilterChanged"><<</asp:LinkButton>
                                        &nbsp;
                                        <asp:LinkButton ID="LinkButton18" runat="server" OnClick="FilterChanged"><</asp:LinkButton>
                                        &nbsp;<asp:TextBox ID="txtPageSize" runat="server" Columns="2" Text="3" Font-Bold="True" OnTextChanged="FilterChanged" AutoPostBack="true"></asp:TextBox>
                                        <asp:Label ID="lblSep" runat="server" Font-Size="X-Small" Enabled="False">/</asp:Label>
                                        &nbsp;<asp:Label ID="lblTotalPages" runat="server" Font-Bold="True">1</asp:Label>
                                        <asp:LinkButton ID="LinkButton19" runat="server" OnClick="FilterChanged">></asp:LinkButton>
                                        &nbsp;
                                        <asp:LinkButton ID="LinkButton20" runat="server" OnClick="FilterChanged">>></asp:LinkButton>
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </asp:Panel>
                            <asp:Label ID="lblNoData" runat="server" CssClass="NoData" Text="No record has been found" Visible="false"></asp:Label>
            </td>
        </tr>
    </table>
    <cc1:msgBox ID="msgActive" runat="server" />
</asp:Content>
