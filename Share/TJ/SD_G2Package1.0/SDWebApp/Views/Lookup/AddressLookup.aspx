<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddressLookup.aspx.cs" Inherits="SD.Web.Views.Lookup.AddressLookup" %>
<%@Register tagName="Address" tagPrefix="uc" src="~/Controls/Lookup/AddressLookup.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Address Lookup</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <uc:Address ID="UcAddress" runat="server"></uc:Address>
    </div>
    </form>
</body>
</html>
