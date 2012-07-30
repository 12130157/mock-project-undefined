<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PremiseMinorWorks.ascx.cs"
    Inherits="SD.Web.Controls.Premises.PremiseMinorWorks" %>
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
        <asp:Button ID="btnCreate" runat="server" Text="Create" OnClick="BtnCreateClick" />
        &nbsp;<asp:CheckBox ID="chkIncludeInActive" runat="server" AutoPostBack="true" Text="Include In-active"
            OnCheckedChanged="FilterChanged" />
    </div>
</div>
<asp:Panel ID="pnlGridviewRegion" Style="width: 100%" runat="server">
    <div class="Gridview">
        <asp:GridView ID="grdMinorWork" runat="server" CellPadding="4" ForeColor="#333333"
            Width="100%" AutoGenerateColumns="False" DataKeyNames="ID" Style="margin-right: 0px"
            OnRowDataBound="GridViewRowDataBound" OnRowCommand="GridViewRowCommand" 
            AllowSorting="True" onsorting="GrdMinorWorkSorting">
            <RowStyle BackColor="#EFF3FB" />
            <Columns>
                <asp:BoundField DataField="ID" Visible="false" SortExpression="ID" />
                <asp:TemplateField HeaderText="Description" SortExpression="PMWDescription">
                    <ItemTemplate>
                        <asp:LinkButton ID="lbtnDescription" CommandName="select" CommandArgument='<%# Eval("ID") %>'
                            runat="server" Text='<%# Eval("PMWDescription") %>'>
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="Enq Received Date" DataField="PMWEnquiryReceivedDate"
                    DataFormatString="{0:dd/MM/yyyy}" SortExpression="PMWEnquiryReceivedDate" />
                <asp:BoundField HeaderText="Notes Action" DataField="NoteActions" SortExpression="NoteActions" />
                <asp:BoundField HeaderText="Directorate" DataField="DirectorateName" SortExpression="DirectorateName" />
                <asp:BoundField HeaderText="Contact" DataField="ContactName" SortExpression="ContactName" />
                <asp:BoundField HeaderText="Status" DataField="Status" SortExpression="Status" />
                <asp:BoundField HeaderText="Is Active?" DataField="IsActive" SortExpression="IsActive" />
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
                        <asp:Label ID="lblTotalPages" runat="server" >1</asp:Label>
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
