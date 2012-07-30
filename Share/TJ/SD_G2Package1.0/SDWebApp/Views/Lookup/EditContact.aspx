<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditContact.aspx.cs" Inherits="SD.Web.Views.Lookup.EditContact" %>
<%@ Register TagPrefix="uc" TagName="editcontact" Src="~/Controls/Contact/EditContact.ascx" %>
<%@ Register TagPrefix="uc" TagName="addcontact" Src="~/Controls/Contact/AddContact.ascx" %>
<%@ Register TagPrefix="cc1" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit, Version=3.5.50927.0, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Edit Contact</title>
</head>
<body>
    <form id="form1" runat="server">
     <cc1:ToolkitScriptManager runat="server" ID="ScriptManager1" />
     <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div>
               <uc:editcontact id="edit" runat="server"/>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    </form>
</body>
</html>
