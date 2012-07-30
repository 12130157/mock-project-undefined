<%@ Page Language="C#" MasterPageFile="~/Shares/Site1.Master" AutoEventWireup="true" CodeBehind="PopupDemo.aspx.cs" Inherits="SDApplication.PopupDemo" Title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register
    Assembly="AjaxControlToolkit"
    Namespace="AjaxControlToolkit"
    TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:TabContainer ID="TabContainer1" runat="server">
    </asp:TabContainer>
   <ajaxToolkit:ToolkitScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
    <div class="demoarea">
    
        <div class="demoheading">PopupControl Demonstration</div>
        Enter date for new reminder:
        <asp:TextBox ID="DateTextBox" runat="server" Width="80" autocomplete="off" /><br /><br />
         
        <asp:Panel ID="Panel1" runat="server" CssClass="popupControl">
            <asp:UpdatePanel runat="server" ID="up1">
                <ContentTemplate>
                   <center>
                        <asp:Calendar ID="Calendar1" runat="server" Width="160px" DayNameFormat="Shortest"
                            BackColor="White" BorderColor="#999999" CellPadding="1" Font-Names="Verdana"
                            Font-Size="8pt" ForeColor="Black">
                                <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                                <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                                <SelectorStyle BackColor="#CCCCCC" />
                                <WeekendDayStyle BackColor="#FFFFCC" />
                                <OtherMonthDayStyle ForeColor="#808080" />
                                <NextPrevStyle VerticalAlign="Bottom" />
                                <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                                <TitleStyle BackColor="#999999" Font-Size="7pt" BorderColor="Black" Font-Bold="True" />
                        </asp:Calendar>
                   
                    </center>
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>
        <ajaxToolkit:PopupControlExtender ID="PopupControlExtender1" runat="server"
            TargetControlID="DateTextBox"
            PopupControlID="Panel1"
            Position="Right" />
        
        Reminder message:
        <asp:TextBox ID="MessageTextBox" runat="server" Width="200" autocomplete="off" /><br /><br />
        <asp:Panel ID="Panel2" runat="server" CssClass="popupControl">
            <div style="border: 1px outset white; width: 100px">
                <asp:UpdatePanel runat="server" ID="up2">
                    <ContentTemplate>
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="true">
                                <asp:ListItem Text="Walk dog" />
                                <asp:ListItem Text="Feed dog" />
                                <asp:ListItem Text="Feed cat" />
                                <asp:ListItem Text="Feed fish" />
                                <asp:ListItem Text="Cancel" Value="" />
                        </asp:RadioButtonList>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </asp:Panel>
        <ajaxToolkit:PopupControlExtender ID="PopupControlExtender2" runat="server"
            TargetControlID="MessageTextBox"
            PopupControlID="Panel2"
            CommitProperty="value"
            Position="Bottom"
            CommitScript="e.value += ' - do not forget!';" />

        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
            <ContentTemplate>
                <asp:Button ID="ReminderButton" runat="server" Text="Add reminder"  />
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

</asp:Content>
