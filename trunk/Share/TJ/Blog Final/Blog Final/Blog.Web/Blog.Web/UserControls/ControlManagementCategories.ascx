<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ControlManagementCategories.ascx.cs" Inherits="Blog.Web.UserControls.ControlManagementCategories" %>

<style type="text/css">
    .style1
    {
        text-align: center;
    }
</style>

<table style="width: 100%;">
    <tr>
        <td class="style1" colspan="3">
            Management Categories</td>
    </tr>
    <tr>
        <td>
            
            <asp:LinkButton ID="linkInsertCategory" runat="server" onclick="LinkInsertCategoryClick" 
              >Insert Category</asp:LinkButton>
            
        </td>
        <td>
            &nbsp;
        </td>
        <td>
            &nbsp;
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;
        </td>
        <td>
            &nbsp;
        </td>
        <td>
            &nbsp;
        </td>
    </tr>
</table>

<asp:Panel ID="panelShowAllData" runat="server">
<asp:DataGrid ID="DataGetAllCategory" runat="server" Width="100%" CssClass="TableView" 
                CellPadding="4" ForeColor="#333333" GridLines="None">
                <HeaderStyle CssClass="trHeader" BackColor="#507CD1" Font-Bold="True" 
                    ForeColor="White"></HeaderStyle>
                <ItemStyle CssClass="trOdd" BackColor="#EFF3FB"></ItemStyle>
                
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <EditItemStyle BackColor="#2461BF" />
                <SelectedItemStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                
                <AlternatingItemStyle CssClass="trEven" BackColor="White"></AlternatingItemStyle>
                <Columns>
                    <asp:TemplateColumn ItemStyle-CssClass="Function">
                        <HeaderTemplate>
                            Func</HeaderTemplate>
                        <ItemTemplate>
                        <asp:LinkButton ID="Edit" runat="server" CommandArgument ='<%# Eval("Categoryid") %>' 
                                oncommand="EditCommand1" >Edit </asp:LinkButton>
                              <asp:LinkButton ID="Delete" runat="server" OnClientClick="javascript:return confirm(Are you Sure?);" 
                                CommandArgument ='<%# Eval("Categoryid") %>' oncommand="DeleteCommand1">Delete </asp:LinkButton>                              
                        </ItemTemplate>
                        <ItemStyle CssClass="Function" />
                    </asp:TemplateColumn>
                </Columns>
            </asp:DataGrid>


</asp:Panel>
<asp:Panel ID="panelInsertCategory" runat="server">
<table style="width: 100%;">
    <tr>
        <td class="style1" colspan="3">
            Insert a Category</td>
    </tr>
    <tr>
        <td>
            Category Name:</td>
        <td>
            <asp:TextBox ID="txtInsertCategoryName" runat="server" Width="268px"></asp:TextBox>
        </td>
        <td>
            &nbsp;<asp:Label ID="labelInsertErrorCategoryName" runat="server" 
                ForeColor="Red"></asp:Label></td>
    </tr>
    <tr>
        <td>
            Category Description</td>
        <td>
            <asp:TextBox ID="txtInsertCategoryDescription" runat="server" Width="265px"></asp:TextBox>
        </td>
        <td>
            <asp:Label ID="labelInsertErrorCategoryDes" runat="server" ForeColor="Red"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td>
            <asp:Button ID="buttonInsertSummit" runat="server" 
                Text="Summit" onclick="ButtonInsertSummitClick" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="buttonInsertReset" runat="server" Text="Reset" />
        </td>
        <td>
            &nbsp;</td>
    </tr>
</table>
</asp:Panel>


<asp:Panel ID="panelUpdateCategory" runat="server">
    <table style="width:100%;">
        <tr>
            <td colspan="3" style="text-align: center">
                Update Category</td>
        </tr>
        <tr>
            <td>
                Category ID</td>
            <td>
                <asp:TextBox ID="txtUpdateCategoryId" runat="server" ReadOnly="True" 
                    Width="87px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                Category Name</td>
            <td>
                <asp:TextBox ID="txtUpdateCategoryName" runat="server" Width="261px"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="labelUpdateErrorCategoryName" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                Category Description</td>
            <td>
                <asp:TextBox ID="txtUpdateCategoryDescription" runat="server" Width="256px"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="labelUpdateErrorCategoryDescription" runat="server" 
                    ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="buttonUpdateSummit" runat="server" Text="Summit" onclick="ButtonUpdateSummitClick" 
                   />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="buttonUpdateReset" runat="server" Text="Reset" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    
    
</asp:Panel>