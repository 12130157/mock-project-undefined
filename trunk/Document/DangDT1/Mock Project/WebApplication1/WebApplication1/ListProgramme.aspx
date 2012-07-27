<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListProgramme.aspx.cs" Inherits="WebApplication1.ListProgramme" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div align =center style="height: 401px; width: 1203px;">
    
        <asp:Label ID="Label1" runat="server" Text="List All Programme" 
            Font-Names="Berlin Sans FB Demi" Font-Size="Larger" ForeColor="#0066FF"></asp:Label>
    
        <br />
        <br />
        
        <asp:Button ID="Button1" runat="server" Text="Display Active/Inactive" />&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
        <asp:GridView ID="dgvListProgramme" runat="server" AllowPaging="True" 
            AllowSorting="True">
            <EditRowStyle BackColor="#9999FF" />
            
            <Columns>
                    <asp:CommandField ShowSelectButton="true" SelectText="Edit" />
                    <asp:CommandField ShowDeleteButton="true" />
                </Columns>
        </asp:GridView>
    
        <br />
        <br />
        <br />
        Enter programme to filter&nbsp;         <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" Text="Filter" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
        <br />
        <asp:Button ID="Button5" runat="server" Text="Create New Programme" 
            onclick="Button5_Click" />
        <br />
    
    </div>
    </form>
</body>
</html>
