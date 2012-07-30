<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="SD.Web.Views.Lookup.Test" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>

    <script src="../../Scripts/Domwindow.js" type="text/javascript"></script>

</head>
<body>
    <form id="form1" runat="server">
    Code:
    <asp:TextBox runat="server" ID="abc"></asp:TextBox><br />
    Name:
    <asp:TextBox runat="server" ID="xyz"></asp:TextBox><br />
    ID:
    <asp:TextBox runat="server" ID="ok"></asp:TextBox><br />
    <asp:Button ID="Button1" runat="server" Text="AddressLookup" OnClientClick='ShowLookUp("AddressLookup.aspx");' /><br />
    <asp:Button ID="Button2" runat="server" Text="TypeOfBusinessLookup" OnClientClick='ShowLookUp("TypeOfBusiness.aspx");' /><br />
    <asp:Button ID="Button3" runat="server" Text="ContactLookup" OnClientClick='ShowLookUp("ContactLookup.aspx");' />
    </form>
</body>
</html>
