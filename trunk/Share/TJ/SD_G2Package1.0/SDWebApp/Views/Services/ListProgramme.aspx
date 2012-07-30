<%@ Page Title="" Language="C#" MasterPageFile="~/Shares/Site1.Master" AutoEventWireup="true"
    CodeBehind="ListProgramme.aspx.cs" Inherits="SD.Web.Views.Services.ListProgramme" %>

<%@ Register Assembly="msgBox" Namespace="BunnyBear" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <table style="border: 1px solid #9e9f9f; width: 98%">
                <tr>
                    <td>
                        <div class="TitleContent">
                            List Programmes
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="filter">
                            <asp:LinkButton ID="lbtnAll" runat="server" OnClick="FilterChanged">All</asp:LinkButton>
                            &nbsp;|
                            <asp:LinkButton ID="lbtn0to9" runat="server" OnClick="FilterChanged">0-9</asp:LinkButton>
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
                            <div id="create">
                                <asp:Button ID="btnCreate" runat="server" Text="Create" OnClick="BtnCreate_Click" />
                                <asp:CheckBox ID="chkIncludeInactive" runat="server" Text="Include In-active" AutoPostBack="True"
                                    OnCheckedChanged="FilterChanged" />
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Panel ID="pnlGridViewProgramme" runat="server">
                            <div class="Gridview">
                                <asp:GridView ID="grdProgramme" runat="server" AutoGenerateColumns="False" Height="16px"
                                    Width="100%" AllowPaging="True" PageSize="15" CellPadding="4" ForeColor="#333333"
                                    OnRowDataBound="GrdProgrammeRowDataBound" OnRowCommand="GrdProgrammeRowCommand"
                                    AllowSorting="true" OnSorting="GrdProgramme_OnSorting">
                                    <RowStyle BackColor="#EFF3FB" />
                                    <Columns>
                                        <asp:TemplateField Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblid" runat="server" Text='<%#Eval("ID") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Programme Name" SortExpression="Name">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnProgrammeName" runat="server" CommandName="select" CommandArgument='<%# Eval("ID") %>'
                                                    Text='<%#Eval("Name") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                                        <asp:TemplateField HeaderText="Contact" SortExpression="FirstName">
                                            <ItemTemplate>
                                                <asp:Label ID="lblContact" runat="server" Text='<%#Eval("FirstName")+" "+Eval("SurName") %>'
                                                    HeaderText="Contact" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Is Active?" SortExpression="IsActive">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl" runat="server" Text='<%#Boolean.Parse(Eval("IsActive").ToString())?"Yes":"No"%>'></asp:Label>
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
                                                &nbsp;<asp:LinkButton ID="lbtnFirstPage" runat="server" OnClick="FilterChanged"><<</asp:LinkButton>&nbsp;
                                                <asp:LinkButton ID="lbtnPreviousPage" runat="server" OnClick="FilterChanged"><</asp:LinkButton>
                                                &nbsp;<asp:TextBox ID="txtCurrentPage" runat="server" Columns="2" Text="3" Font-Bold="True"
                                                    Width="20px" AutoPostBack="True" OnTextChanged="FilterChanged"></asp:TextBox><asp:Label
                                                        ID="lblSeparate" runat="server" Font-Size="X-Small" Enabled="False">/</asp:Label>&nbsp;<asp:Label
                                                            ID="lblTotalPages" runat="server" Font-Bold="True">1</asp:Label><asp:LinkButton ID="lbtnNextPage"
                                                                runat="server" OnClick="FilterChanged">></asp:LinkButton>&nbsp;
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
            <cc1:msgBox ID="MsgBox1" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
