<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ControlCategory.ascx.cs" Inherits="Blog.Web.UserControls.ControlCategory" %>
<div id="barcategories">
    Categories
</div>
<div id="allcategory">
    <asp:Repeater ID="rptCategory" runat="server">

        <ItemTemplate >
            <li >
                <asp:HyperLink ID="hplCategory" runat="server" Text="" NavigateUrl='<%# Eval("categoryname", "~/index.aspx?wuc=mnt&midt={0}") %>'><%# Eval("categoryname")%></asp:HyperLink>
            </li>
        </ItemTemplate>
</asp:Repeater>
    
</div>