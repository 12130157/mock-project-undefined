<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactLookup.aspx.cs" Inherits="SD.Web.Views.Lookup.ContactLookup" %>
<%@Register tagPrefix="uc" tagName="Contact" src="~/Controls/Contact/ContactSelect.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Contact lookup</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <uc:Contact ID="contact" runat="server"></uc:Contact>
    </div>
    </form>
</body>
</html>
