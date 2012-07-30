<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddContact.ascx.cs" Inherits="SD.Web.Controls.Contact.AddContact" %>
<%@ Register TagPrefix="uc" TagName="ContactLookUp" Src="~/Controls/Contact/ContactSelect.ascx" %>
<link href="../../Css/Stylesheet1.css" rel="stylesheet" type="text/css" />


<div class="TitleContent">
    Add a Contact
</div>
<div>
    <table style="width:80%;">
        <tr>
            <td>First Name
                <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="*"></asp:Label>
            </td>
            <td width="30%">
                <asp:TextBox ID="txtFirstName" runat="server" Width="90%"></asp:TextBox>
            </td>
            <td>Manager Name</td>
            <td width="30%">
                <asp:TextBox ID="txtManagerName" runat="server" BackColor="Silver" Width="60%"></asp:TextBox>
                <asp:Button ID="btnManager" runat="server" Text="..." 
                    onclick="btnManager_Click" />
            </td>
        </tr>
        <tr>
            <td>Surname
                <asp:Label ID="Label2" runat="server" ForeColor="Red" Text="*"></asp:Label>
            </td>
            <td width="30%">
                <asp:TextBox ID="txtSurName" runat="server" Width="90%"></asp:TextBox>
            </td>
            <td>Contact Type <asp:Label ID="Label3" runat="server" ForeColor="Red" Text="*"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlContactType" runat="server" Width="80%">
                    
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>Known As</td>
            <td width="30%">
                <asp:TextBox ID="txtKnownAs" runat="server" Width="90%"></asp:TextBox>
            </td>
            <td>Best Contact Method</td>
            <td>
                <asp:DropDownList ID="ddlBestContact" runat="server" Width="80%">
                   
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>Office Phone</td>
            <td width="30%">
                <asp:TextBox ID="txtOfficePhone" runat="server" Width="90%"></asp:TextBox>
            </td>
            <td>Job Role</td>
            <td>
                <asp:TextBox ID="txtJobRole" runat="server" Width="90%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Mobile Phone</td>
            <td width="30%">
                <asp:TextBox ID="txtMobilePhone" runat="server" Width="90%"></asp:TextBox>
            </td>
            <td>Workbase</td>
            <td>
                <asp:TextBox ID="txtWorkBase" runat="server" Width="90%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>ST Home Phone</td>
            <td width="30%">
                <asp:TextBox ID="txtSTHome" runat="server" Width="90%"></asp:TextBox>
            </td>
            <td>Job Title</td>
            <td>
                <asp:TextBox ID="txtJobTitle" runat="server" Width="90%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Email Address</td>
            <td width="30%">
                <asp:TextBox ID="txtEmail" runat="server" Width="90%"></asp:TextBox>
            </td>
            <td>Is Active?</td>
            <td>
                <asp:CheckBox ID="chkIsActive" runat="server" />
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td width="30%">
                &nbsp;</td>
            <td>&nbsp;</td>
            <td align="right">
    <asp:Button ID="btnSave" runat="server" Text="Save" onclick="btnSave_Click" />
    &nbsp;<%--<asp:Button ID="btnBack" runat="server" Text="Back" onclick="javascript:history.back();" 
                    style="height: 26px" />--%>
             <INPUT type="button" value="Back" onClick="history.back()"> 
            </td>
        </tr>
    </table>

</div>
<div style="text-align: center">
<asp:Label runat="server" ID="lblerror" CssClass="Error" Visible="false"></asp:Label> <br />
<asp:Label runat="server" ID="lblmessage" CssClass="Error" Visible="false"></asp:Label>

</div>
<div id="MaskedDiv" runat="server" visible="false">
</div>
<div id="ContactLookupRegion" runat="server" visible="false">
    <uc:ContactLookUp ID="ContactLookup" runat="server" OnButtonCloseClick="ClosePopup" OnButtonSelectClick="SelectValueContact"/>
</div>
