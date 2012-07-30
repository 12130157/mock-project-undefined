<%@ Page Language="C#" MasterPageFile="~/Shares/Site1.Master" AutoEventWireup="true"
    CodeBehind="Directorate.aspx.cs" Inherits="SD.Web.Views.Organisation.Directorate"
    Title="Directorate" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style4
        {
            width: 184px;
        }
        .style5
        {
            width: 166px;
        }
        .style6
        {
            width: 177px;
        }
        .style7
        {
        }
        .style10
        {
            width: 134px;
        }
        .style12
        {
            width: 171px;
        }
        .style13
        {
            width: 163px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script type="text/javascript">


        function ActiveTabChanged(sender) {
            var CurrentTab = $get('<%=CurrentTab.ClientID%>');
         //   CurrentTab.innerHTML = sender.get_activeTab().get_headerText();
            Highlight(CurrentTab);
        }

        var HighlightAnimations = {};
        function Highlight(el) {
            if (HighlightAnimations[el.uniqueID] == null) {
                HighlightAnimations[el.uniqueID] = Sys.Extended.UI.Animation.createAnimation({
                    AnimationName : "color",
                    duration : 0.5,
                    property : "style",
                    propertyKey : "backgroundColor",
                    startValue : "#FFFF90",
                    endValue : "#FFFFFF"
                }, el);
            }
            HighlightAnimations[el.uniqueID].stop();
            HighlightAnimations[el.uniqueID].play();
        }
       
//        function ToggleHidden(value) {
//            $find('<%=Tabs.ClientID%>').get_tabs()[1].set_enabled(value);
//        }
    </script>

    <div>
        <div>
            <asp:LinkButton ID="LinkButton1" runat="server">Organisation ></asp:LinkButton>
        </div>
        <div class="TitleContent">
            Business Unit/ Directorate Details</div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button
            ID="Button7" runat="server" Text="In-Active" Style="margin-left: 0px" Width="61px" />
        &nbsp;<asp:Button ID="Button1" runat="server" Text="Save" Style="margin-left: 0px"
            Width="61px" />
        &nbsp;<asp:Button ID="Button2" runat="server" Text="Back" Width="66px" />
        <ajaxToolkit:TabContainer runat="server" ID="Tabs" Height="500px" OnClientActiveTabChanged="ActiveTabChanged"
            ActiveTabIndex="0" Width="770px">
            <ajaxToolkit:TabPanel runat="server" ID="Panel1" HeaderText="Details 1">
                <ContentTemplate>
                    <asp:UpdatePanel ID="updatePanel1" runat="server">
                        <ContentTemplate>
                            <table style="width: 772px">
                                <tr>
                                    <td class="style13">
                                        BU/Directorate name
                                        <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                    </td>
                                    <td class="style10">
                                        <asp:TextBox ID="TextBox1" runat="server" Width="158px"></asp:TextBox>
                                    </td>
                                    <td class="style12">
                                        Type of business
                                        <asp:Label ID="Label7" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                    </td>
                                    <td class="style5">
                                        <asp:TextBox ID="TextBox19" runat="server" Width="124px" Enabled="False">man-made</asp:TextBox>
                                        &nbsp;<asp:Button ID="Button6" runat="server" Font-Bold="True" Text="..." />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style13" rowspan="2">
                                        BU/Directorate Short<br />
                                        Description&nbsp;
                                        <asp:Label ID="Label2" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                    </td>
                                    <td class="style10" rowspan="2">
                                        <asp:TextBox ID="TextBox2" runat="server" Height="43px" Width="159px"></asp:TextBox>
                                    </td>
                                    <td class="style12">
                                        SIC Code
                                    </td>
                                    <td class="style4">
                                        <asp:TextBox ID="TextBox5" runat="server" Enabled="False" Width="158px">3006</asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style12">
                                        BU/Directorate Full
                                        <br />
                                        Description
                                    </td>
                                    <td class="style3">
                                        <asp:TextBox ID="TextBox8" runat="server" Height="43px" Width="159px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style13">
                                        Lead Contact
                                    </td>
                                    <td class="style10">
                                        <asp:TextBox ID="TextBox4" runat="server" Width="97px"></asp:TextBox>&nbsp;&nbsp;<asp:Button
                                            ID="Button3" runat="server" Font-Bold="True" Text="..." />
                                    </td>
                                    <td class="style12">
                                        &nbsp;Phone number
                                        <asp:Label ID="Label5" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                    </td>
                                    <td class="style6">
                                        <asp:TextBox ID="TextBox10" runat="server" Width="158px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style7" colspan="2">
                                        <asp:CheckBox ID="CheckBox3" runat="server" Text="Copy Address from Organisation" />
                                    </td>
                                    <td class="style12">
                                        Fax
                                    </td>
                                    <td class="style6">
                                        <asp:TextBox ID="TextBox12" runat="server" Width="158px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style13">
                                        Address Line 1
                                        <asp:Label ID="Label4" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                    </td>
                                    <td class="style10">
                                        <asp:TextBox ID="TextBox6" runat="server" Width="158px"></asp:TextBox>
                                    </td>
                                    <td rowspan="2" class="style12">
                                        Email
                                    </td>
                                    <td rowspan="2">
                                        <asp:TextBox ID="TextBox14" runat="server" Width="158px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style13">
                                        Address Line 2
                                    </td>
                                    <td class="style10">
                                        <asp:TextBox ID="TextBox7" runat="server" Width="158px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style13">
                                        Address Line 3
                                    </td>
                                    <td class="style10">
                                        <asp:TextBox ID="TextBox9" runat="server" Width="158px"></asp:TextBox>
                                    </td>
                                    <td class="style12">
                                        Web Address
                                    </td>
                                    <td class="style5">
                                        <asp:TextBox ID="TextBox16" runat="server" Width="158px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style13">
                                        Postcode
                                        <asp:Label ID="Label6" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                    </td>
                                    <td class="style10">
                                        <asp:TextBox ID="TextBox11" runat="server" Width="97px"></asp:TextBox>&nbsp;&nbsp;<asp:Button
                                            ID="Button4" runat="server" Font-Bold="True" Text="..." />
                                    </td>
                                    <td class="style12">
                                        &#160;
                                    </td>
                                    <td class="style5">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style13">
                                        City/ Town
                                    </td>
                                    <td class="style10">
                                        <asp:TextBox ID="TextBox13" runat="server" Width="158px"></asp:TextBox>
                                    </td>
                                    <td class="style12">
                                        &#160;
                                    </td>
                                    <td class="style5">
                                        &#160;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style13">
                                        County
                                    </td>
                                    <td class="style10">
                                        <asp:TextBox ID="TextBox15" runat="server" Width="158px"></asp:TextBox>
                                    </td>
                                    <td class="style12">
                                        &#160;
                                    </td>
                                    <td class="style5">
                                        &#160;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style13">
                                        Nation/ Country
                                    </td>
                                    <td class="style10">
                                        <asp:DropDownList ID="DropDownList1" runat="server" Width="168px" Height="23px">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="style12">
                                        &#160;
                                    </td>
                                    <td class="style5">
                                        &#160;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style13">
                                    </td>
                                    <td class="style10">
                                    </td>
                                    <td class="style12">
                                        &#160;
                                    </td>
                                    <td class="style5">
                                        &#160;
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
        </ajaxToolkit:TabContainer>
        <br />
        <asp:Label runat="server" ID="CurrentTab" /><br />
        <br />
        <br />
        <%--  <asp:Label ID="Label7" runat="server"></asp:Label>--%>
    </div>
</asp:Content>
