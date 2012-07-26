<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ControlManagementNews.ascx.cs" Inherits="Blog.Web.UserControls.ControlManagementNews" %>

<script src="../ckeditor/ckeditor.js" type="text/javascript"></script>

<style type="text/css">
    .style1
    {
        text-align: center;
    }
</style>

<table style="width: 100%;">
    <tr>
        <td colspan="3">
            Management News</td>
    </tr>
    <tr>
        <td>
            &nbsp;
            <asp:LinkButton ID="linkAddNews" runat="server" onclick="LinkAddNewsClick">Insert a News</asp:LinkButton>
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
<asp:DataGrid ID="DataGetAllNews" runat="server" Width="100%" CssClass="TableView" 
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
                        <asp:LinkButton ID="Edit" runat="server" CommandArgument ='<%# Eval("NewsID") %>' 
                                oncommand="EditCommand1" >Edit </asp:LinkButton>
                              <asp:LinkButton ID="Delete" runat="server" OnClientClick="javascript:return confirm(Are you Sure?);" 
                                CommandArgument ='<%# Eval("NewsID") %>' oncommand="DeleteCommand1">Delete </asp:LinkButton>                              
                        </ItemTemplate>
                        <ItemStyle CssClass="Function" />
                    </asp:TemplateColumn>
                </Columns>
            </asp:DataGrid>


</asp:Panel>
<asp:Panel ID="panelInsertNews" runat="server">
<table style="width: 100%;">
    <tr>
        <td class="style1" colspan="3">
            Insert a News</td>
    </tr>
    <tr>
        <td>
            Title News: </td>
        <td>
            <asp:TextBox ID="txtInsertTitle" runat="server" Width="199px"></asp:TextBox>
        </td>
        <td>
            &nbsp;<asp:Label ID="labelInsertErrorTitle" runat="server" ForeColor="Red"></asp:Label></td>
    </tr>
    <tr>
        <td>
            Category Name:</td>
        <td>
            <asp:DropDownList ID="dropInsertCategory" runat="server" Width="201px" 
                 DataTextField="categoryname" 
                DataValueField="Categoryid">
            </asp:DropDownList>
        </td>
        <td>
            <asp:Label ID="labelInsertErrorCategory" runat="server" ForeColor="Red"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            Author:</td>
        <td>
            <asp:TextBox ID="txtInsertAuthor" runat="server" Width="198px"></asp:TextBox>
        </td>
        <td>
            <asp:Label ID="labelInsertErrorAuthor" runat="server" ForeColor="Red"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            Content:</td>
        <td>
            <asp:TextBox ID="txtInsertContent" runat="server" CssClass="ckeditor" TextMode="MultiLine"></asp:TextBox>
        </td>
        <td>
            <asp:Label ID="labelInsertErrorContent" runat="server" ForeColor="Red"></asp:Label>
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

<asp:Panel ID="panelUpdateNew" runat="server">
    <table style="width:100%;">
        <tr>
            <td colspan="3" style="text-align: center">
                Update New</td>
        </tr>
        <tr>
            <td>
                News ID</td>
            <td>
                <asp:TextBox ID="txtUpdateNewsId" runat="server" ReadOnly="True" Width="200px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                Title:</td>
            <td>
                <asp:TextBox ID="txtUpdateTitle" runat="server" Width="199px"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="labelUpdateErrorTitle" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                Category Name</td>
            <td>
                <asp:DropDownList ID="dropUpdateCategoryName" DataTextField="categoryname" 
                DataValueField="Categoryid" runat="server"  
                    Width="199px">
                </asp:DropDownList>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                Author</td>
            <td>
                <asp:TextBox ID="txtUpdateAuthor" runat="server" Width="202px"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="labelUpdateErrorAuthor" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                Comment</td>
            <td>
                <asp:TextBox ID="txtUpdateComment" runat="server" Width="196px"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="labelUpdateErrorComment" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                Views</td>
            <td>
                <asp:TextBox ID="txtUpdateViews" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="labelUpdateErrorViews" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                Content</td>
            <td>
                <asp:TextBox ID="txtUpdateContent" CssClass="ckeditor" runat="server" TextMode="MultiLine" 
                    Width="196px"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="labelUpdateErrorContent" runat="server" ForeColor="Red"></asp:Label>
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