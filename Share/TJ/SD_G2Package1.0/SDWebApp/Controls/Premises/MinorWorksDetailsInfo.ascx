<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MinorWorksDetailsInfo.ascx.cs"
    Inherits="SD.Web.Controls.Premises.MinorWorksDetailsInfo" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="uc1" TagName="ContactLookUp" Src="~/Controls/Contact/ContactSelect.ascx" %>
<link href="../../Css/Stylesheet1.css" rel="stylesheet" type="text/css" />
<table style="width: 100%">
    <tr>
        <td rowspan="2">
            P/MW Description<asp:Label ID="lblDesRequirement" runat="server" Text="*" ForeColor="Red"></asp:Label>
        </td>
        <td rowspan="2">
            <asp:TextBox CssClass="DetailMulti" ID="txtPMWDescription" runat="server" 
                TextMode="MultiLine" Width="200px" Height="38px"></asp:TextBox>
        </td>
        <td>
            Contact
        </td>
        <td>
            <asp:TextBox ID="txtContact" runat="server" Width="160px"></asp:TextBox>
            <asp:Button ID="btnContactSelect" runat="server" Text="..." OnClick="BtnContactSelectClick"
                UseSubmitBehavior="False" />
        </td>
    </tr>
    <tr>
        <td>
            Authorised by Name
        </td>
        <td>
            <asp:TextBox ID="txtAuthorised" runat="server" Width="160px"></asp:TextBox>
            <asp:Button ID="btnAuthorisedSelect" runat="server" Text="..." OnClick="BtnAuthorisedSelectClick"
                UseSubmitBehavior="False" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:RadioButton ID="rbtnProject" runat="server" GroupName="PMWType" Text="Project" />
        </td>
        <td>
            <asp:RadioButton ID="rbtnMinorWorks" runat="server" GroupName="PMWType" Text="Minor Works" />
        </td>
        <td>
            Status
        </td>
        <td>
            <asp:TextBox ID="txtStatus" Enabled="false" runat="server" Width="200px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            Is TBA?
        </td>
        <td>
            <asp:CheckBox ID="chkIsTBA" runat="server" OnCheckedChanged="ChkIsTbaCheckedChanged" />
        </td>
        <td>
            P/MW Enquiry Received Date
        </td>
        <td>
            <asp:TextBox runat="server" ID="txtEnqRecDate" Width="180px" MaxLength="20" />
            <asp:ImageButton runat="Server" ID="ImageButton1" ImageUrl="~/Image/Calendar.png"
                AlternateText="Click to show calendar" /><br />
            <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtEnqRecDate"
                PopupButtonID="ImageButton1" CssClass="MyCalendar" />
        </td>
    </tr>
    <tr>
        <td rowspan="2">
            Note Action
        </td>
        <td rowspan="2">
            <asp:TextBox CssClass="DetailMulti" ID="txtNoteAction" runat="server" TextMode="MultiLine" Height="57px"
                Width="200px"></asp:TextBox>
        </td>
        <td>
            Authorised Date
        </td>
        <td>
            <asp:TextBox runat="server" ID="txtAuthorisedDate" Width="180px" MaxLength="20" />
            <asp:ImageButton runat="Server" ID="ImageButton2" ImageUrl="~/Image/Calendar.png"
                AlternateText="Click to show calendar" /><br />
            <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtAuthorisedDate"
                PopupButtonID="ImageButton2" CssClass="MyCalendar" />
        </td>
    </tr>
    <tr>
        <td>
            Actual Start Date
        </td>
        <td>
            <asp:TextBox runat="server" ID="txtActualStartDate" Width="180px" MaxLength="20" />
            <asp:ImageButton runat="Server" ID="ImageButton3" ImageUrl="~/Image/Calendar.png"
                AlternateText="Click to show calendar" /><br />
            <ajaxToolkit:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="txtActualStartDate"
                PopupButtonID="ImageButton3" CssClass="MyCalendar" />
        </td>
    </tr>
    <tr>
        <td>
            Estimate Cost
        </td>
        <td>
            <asp:TextBox ID="txtEstimateCost" runat="server" Width="200px"></asp:TextBox>
        </td>
        <td>
            Anticipate Completion
        </td>
        <td>
            <asp:TextBox runat="server" ID="txtAnticipateCompletion" Width="180px" MaxLength="20" />
            <asp:ImageButton runat="Server" ID="ImageButton4" ImageUrl="~/Image/Calendar.png"
                AlternateText="Click to show calendar" /><br />
            <ajaxToolkit:CalendarExtender ID="CalendarExtender4" runat="server" TargetControlID="txtAnticipateCompletion"
                PopupButtonID="ImageButton4" CssClass="MyCalendar" />
        </td>
    </tr>
    <tr>
        <td>
            Actual Cost
        </td>
        <td>
            <asp:TextBox ID="txtActualCost" runat="server" Width="200px"></asp:TextBox>
        </td>
        <td>
            Actual Completion Date
        </td>
        <td>
            <asp:TextBox runat="server" ID="txtActualCompletionDate" Width="180px" MaxLength="20" />
            <asp:ImageButton runat="Server" ID="ImageButton5" ImageUrl="~/Image/Calendar.png"
                AlternateText="Click to show calendar" /><br />
            <ajaxToolkit:CalendarExtender ID="CalendarExtender5" runat="server" TargetControlID="txtActualCompletionDate"
                PopupButtonID="ImageButton5" CssClass="MyCalendar" />
        </td>
    </tr>
    <tr>
        <td>
            Directorate
        </td>
        <td>
            <asp:DropDownList ID="ddlDiretorate" runat="server" Width="200px">
            </asp:DropDownList>
        </td>
    </tr>
</table>
<div class="Error">
    <br />
    <asp:Label ID="lblError" runat="server" Visible="false"></asp:Label>
</div>
<div id="MaskedDiv" runat="server" visible="false">
</div>
<div id="ContactLookupRegion" runat="server" visible="false">
    <uc1:ContactLookUp ID="ContactLookup" runat="server" OnButtonCloseClick="CloseContactPopup"
        OnButtonSelectClick="SelectContact" />
</div>
