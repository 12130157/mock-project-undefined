<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ContactSelect.ascx.cs"
    Inherits="SD.Web.Controls.Contact.ContactSelect" %>
<link href="../../Css/Stylesheet1.css" rel="stylesheet" type="text/css" />

<script src="../../Scripts/Domwindow.js" type="text/javascript"></script>
<div class="TitleContent">
    Search Contact</div>
<div>
    <table>
        <tr>
            <td>
                First Name:
            </td>
            <td>
                <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
            </td>
            <td>
                Surname:
            </td>
            <td>
                <asp:TextBox ID="txtSurname" runat="server"></asp:TextBox>
            </td>
        </tr>
    </table>
</div>
<div>
    <asp:Button ID="btnSearch" runat="server" Text="Search contact" OnClick="btnSearch_Click" />&nbsp;
    <asp:Button ID="btnNone" runat="server" Text="None" OnClick="btnNone_Click" />&nbsp;
    <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" />&nbsp;
    <asp:Button ID="btnCreate" runat="server" Text="Create" OnClick="btnCreate_Click" />&nbsp;
</div>
<div>
    <asp:CheckBox ID="chkIncludeActive" runat="server" AutoPostBack="true"
        Text="Include inactive contact" 
        oncheckedchanged="FilterChanged" />
</div>
<div class="Gridview">
    <asp:GridView ID="grdContact" runat="server" AllowPaging="True" AllowSorting="True"
        AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" PageSize="15"
        Width="100%">
        <RowStyle BackColor="#EFF3FB" />
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:RadioButton runat="server" ID="rdbSelect" AutoPostBack="true" OnCheckedChanged="ContactCheckedChanged" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ID" Visible="false">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lblid" Text='<%#Eval("ID") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Contact Name">
                <ItemTemplate>
                    <asp:Label runat="server" ID="name" Text='<%#Eval("ContactName") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ManagerID" Visible="false">
                <ItemTemplate>
                    <asp:Label runat="server" ID="managerid" Text='<%#Eval("ManagerId") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="HomePhone" HeaderText="Mobile Phone" />
            <asp:BoundField DataField="EmailAddress" HeaderText="Email" />
            <asp:BoundField DataField="ContactType" HeaderText="Contact Type" />
            <asp:BoundField DataField="IsActive" HeaderText="Is Active?" />
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
<div>
    <asp:Button ID="btnSelect" runat="server" Text="Select" OnClick="btnSelect_Click" />&nbsp;
    <asp:Button ID="btnEdit" runat="server" Text="Edit" OnClick="btnEdit_Click" />&nbsp;
    <asp:Button ID="btnClose" runat="server" Text="Close" OnClick="btnClose_Click" />
</div>
<div>
<asp:Label runat="server" ID="lblerror" CssClass="Error" Visible="false"></asp:Label>
</div>
