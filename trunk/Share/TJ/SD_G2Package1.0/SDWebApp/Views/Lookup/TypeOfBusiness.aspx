<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TypeOfBusiness.aspx.cs" Inherits="SD.Web.Views.Lookup.TypeOfBusiness" %>
<%@Register tagPrefix="uc" tagName="TypeOfBusinesss" src="~/Controls/Lookup/TypeOfBusinessLookup.ascx"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <uc:TypeOfBusinesss ID="typeofbusiness" runat="server"></uc:TypeOfBusinesss>
    </div>
    </form>
</body>
</html>
