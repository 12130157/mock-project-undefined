<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Calendar.aspx.cs" Inherits="SD.Web.Calendar" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Calender</title>
    <link href="Css/Stylesheet1.css" rel="stylesheet" type="text/css" />
</head>
<body>
     <form id="form1" runat="server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" EnableScriptGlobalization="true"
        EnableScriptLocalization="true" ID="ScriptManager1" ScriptMode="Debug" CombineScripts="false" />
    <div>
        <asp:TextBox runat="server" ID="txtDate" />
        <asp:ImageButton runat="Server" ID="Image1" ImageUrl="~/Image/Calendar.png" AlternateText="Click to show calendar" /><br />
        <ajaxToolkit:CalendarExtender ID="calendarButtonExtender" runat="server" TargetControlID="txtDate" 
        PopupButtonID="Image1" CssClass="MyCalendar"/>
    </div>
    </form>
</body>
</html>
