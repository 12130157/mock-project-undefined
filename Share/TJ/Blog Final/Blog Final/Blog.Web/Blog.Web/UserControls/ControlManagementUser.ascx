<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ControlManagementUser.ascx.cs" Inherits="Blog.Web.UserControls.ControlManagementUser" %>

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
            Management Users</td>
    </tr>
    <tr>
        <td>
            &nbsp;
            <asp:LinkButton ID="linkNewUsers" runat="server" onclick="LinkNewUsersClick" >Insert Users</asp:LinkButton>
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
<asp:DataGrid ID="DataGetAllUsers" runat="server" Width="100%" 
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
                        <asp:LinkButton ID="Edit" runat="server" CommandArgument ='<%# Eval("UserID") %>' 
                                oncommand="EditCommand1" >Edit </asp:LinkButton>
                              <asp:LinkButton ID="Delete" runat="server" OnClientClick="javascript:return confirm(Are you Sure?);" 
                                CommandArgument ='<%# Eval("UserID") %>' oncommand="DeleteCommand1">Delete </asp:LinkButton>                              
                        </ItemTemplate>
                        <ItemStyle CssClass="Function" />
                    </asp:TemplateColumn>
                </Columns>
            </asp:DataGrid>


</asp:Panel>
<asp:Panel ID="panelInsertUser" runat="server">
<table style="width: 100%;">
    <tr>
        <td class="style1" colspan="3">
            Insert a User</td>
    </tr>
    <tr>
        <td>
            Users Names: </td>
        <td>
            <asp:TextBox ID="txtInsertUserNames" runat="server" Width="199px"></asp:TextBox>
        </td>
        <td>
            <asp:Label ID="labelInsertErrorUserName" runat="server" ForeColor="Red"></asp:Label></td>
    </tr>
    <tr>
        <td>
            Password:</td>
        <td>
            <asp:TextBox ID="txtInsertPassword" runat="server" Width="199px"></asp:TextBox>
        </td>
        <td>
            <asp:Label ID="labelInsertErrorPassword" runat="server" ForeColor="Red"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            Re-Password:</td>
        <td>
            <asp:TextBox ID="txtInsertAgainPassword" runat="server" Width="198px"></asp:TextBox>
        </td>
        <td>
            <asp:Label ID="labelInsertErrorAgainPassword" runat="server" ForeColor="Red"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            Full-Name:</td>
        <td>
            <asp:TextBox ID="txtInsertFullName" runat="server" Width="199px"></asp:TextBox>
        </td>
        <td>
            <asp:Label ID="labelInsertErrorFullName" runat="server" ForeColor="Red"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            BirthDay:</td>
        <td>
            <asp:TextBox ID="txtInsertBirthday" runat="server" Width="199px"></asp:TextBox>
        </td>
        <td>
            <asp:Label ID="labelInsertErrorBirthday" runat="server" ForeColor="Red"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            Email:</td>
        <td>
            <asp:TextBox ID="txtInsertEmail" runat="server" Width="199px"></asp:TextBox>
        </td>
        <td>
            <asp:Label ID="labelInsertErrorEmail" runat="server" ForeColor="Red"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            Phone:</td>
        <td>
            <asp:TextBox ID="txtInsertPhone" runat="server" Width="199px"></asp:TextBox>
        </td>
        <td>
            <asp:Label ID="labelInsertErrorPhone" runat="server" ForeColor="Red"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            Address</td>
        <td>
            <asp:TextBox ID="txtInsertAddress" runat="server" Width="199px"></asp:TextBox>
        </td>
        <td>
            <asp:Label ID="labelInsertErrorAddress" runat="server" ForeColor="Red"></asp:Label>
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
                Text="Summit" onclick="ButtonInsertSummitClick"  />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="buttonInsertReset" runat="server" Text="Reset" />
        </td>
        <td>
            &nbsp;</td>
    </tr>
</table>
</asp:Panel>

<asp:Panel ID="panelUpdateUser" runat="server">
    <table style="width:100%;">
        <tr>
            <td colspan="3" style="text-align: center">
                Update User</td>
        </tr>
        <tr>
            <td>
                UserID</td>
            <td>
                <asp:TextBox ID="txtUpdateUserId" runat="server" ReadOnly="True" Width="200px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                Password</td>
            <td>
                <asp:TextBox ID="txtUpdatePassword" runat="server" Width="199px"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="labelUpdateErrorPassword" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                Full-Name</td>
            <td>
                <asp:TextBox ID="txtUpdateFullName" runat="server" Width="199px"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="labelUpdateErrorFullName" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                BirthDay</td>
            <td>
                <asp:TextBox ID="txtUpdateBirthday" runat="server" Width="202px"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="labelUpdateErrorBirthday" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                Email</td>
            <td>
                <asp:TextBox ID="txtUpdateEmail" runat="server" Width="196px"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="labelUpdateErrorEmail" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                Phone</td>
            <td>
                <asp:TextBox ID="txtUpdatePhone" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="labelUpdateErrorPhone" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                Address</td>
            <td>
                <asp:TextBox ID="txtUpdateAddress" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="labelUpdateErrorAddress" runat="server" ForeColor="Red"></asp:Label>
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