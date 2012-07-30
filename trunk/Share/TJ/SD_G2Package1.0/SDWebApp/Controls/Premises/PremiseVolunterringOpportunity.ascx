﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PremiseVolunterringOpportunity.ascx.cs"
    Inherits="SD.Web.Controls.Premises.PremiseVolunterringOpportunity" %>
<link href="../../Css/Stylesheet1.css" rel="stylesheet" type="text/css" />
<div class="filter">
    <asp:LinkButton ID="lbtnAll" runat="server" OnClick="FilterChanged">All</asp:LinkButton>
    &nbsp;|
    <asp:LinkButton ID="lbtnNumber" runat="server" OnClick="FilterChanged">0-9</asp:LinkButton>
    &nbsp;|
    <asp:LinkButton ID="lbtnABCDE" runat="server" OnClick="FilterChanged">A B C D E</asp:LinkButton>
    &nbsp;|
    <asp:LinkButton ID="lbtnFGHIJ" runat="server" OnClick="FilterChanged">F G H I J</asp:LinkButton>
    &nbsp;|
    <asp:LinkButton ID="lbtnKLMN" runat="server" OnClick="FilterChanged">K L M N</asp:LinkButton>
    &nbsp;|
    <asp:LinkButton ID="lbtnOPQR" runat="server" OnClick="FilterChanged">O P Q R</asp:LinkButton>
    &nbsp;|
    <asp:LinkButton ID="lbtnSTUV" runat="server" OnClick="FilterChanged">S T U V</asp:LinkButton>
    &nbsp;|
    <asp:LinkButton ID="lbtnWXYZ" runat="server" OnClick="FilterChanged">W X Y Z</asp:LinkButton>
    <div style="float: right;">
        <asp:Button ID="btnCreate" runat="server" Text="Create" 
            OnClick="BtnCreateClick" UseSubmitBehavior="False" />
        &nbsp;<asp:CheckBox ID="chkIncludeInactive" runat="server" Text="Include In-active"
            AutoPostBack="True" OnCheckedChanged="FilterChanged" />
    </div>
</div>
<asp:Panel ID="pnlGridviewRegion" Style="width: 100%" runat="server">
    <div class="Gridview">
        <asp:GridView ID="grdVolunteers" runat="server" CellPadding="4" ForeColor="#333333"
            Width="100%" AutoGenerateColumns="False" OnRowDataBound="GridViewRowDataBound"
            OnRowCommand="GridViewRowCommand" AllowSorting="True" 
            onsorting="GrdVolunteersSorting">
            <Columns>
                <asp:BoundField DataField="ID" Visible="false" SortExpression="ID" />
                <asp:TemplateField HeaderText="Contact" SortExpression="ContactName">
                    <ItemTemplate>
                        <asp:LinkButton ID="lbtnContact" CommandName="select" CommandArgument='<%# Eval("ID") %>'
                            runat="server" Text='<%# Eval("ContactName") %>'>
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="VolunteerPurpose" HeaderText="Purpose" SortExpression="VolunteerPurpose" />
                <asp:BoundField DataField="VolunteerNo" HeaderText="Number" SortExpression="VolunteerNo" />
                <asp:BoundField DataField="StartDate" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Start Date" SortExpression="StartDate" />
                <asp:BoundField DataField="EndDate" DataFormatString="{0:dd/MM/yyyy}" HeaderText="End Date" SortExpression="EndDate" />
                <asp:BoundField DataField="IsActive" HeaderText="Is Active?" SortExpression="IsActive" />
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
                        &nbsp;&nbsp;<asp:TextBox ID="txtCurrentPage" runat="server" Columns="2" Text="3" AutoPostBack="true"
                            Font-Bold="True" Width="20px" OnTextChanged="FilterChanged"></asp:TextBox>
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
<asp:Label ID="lblNoData" runat="server" CssClass="NoData" Text="No record has been found"></asp:Label>