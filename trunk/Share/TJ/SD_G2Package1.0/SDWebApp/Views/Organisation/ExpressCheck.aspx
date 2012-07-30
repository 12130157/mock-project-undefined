<%@ Page Language="C#" MasterPageFile="~/Shares/Site1.Master" AutoEventWireup="true"
    CodeBehind="ExpressCheck.aspx.cs" Inherits="SD.Web.ExpressCheck" Title="Express Check" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style4
        {
            width: 283px;
            height: 45px;
        }
        .style8
        {
            width: 193px;
        }
        .style9
        {
            width: 207px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />

    <script type="text/javascript">
       

        function ActiveTabChanged(sender) {
        	var CurrentTab = $get('<%=CurrentTab.ClientID%>');

        	Highlight(CurrentTab);
        }

        var HighlightAnimations = { };

        function Highlight(el) {
        	if (HighlightAnimations[el.uniqueID] == null) {
        		HighlightAnimations[el.uniqueID] = Sys.Extended.UI.Animation.createAnimation({
        				AnimationName: "color",
        				duration: 0.5,
        				property: "style",
        				propertyKey: "backgroundColor",
        				startValue: "#FFFF90",
        				endValue: "#FFFFFF"
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
        <div class="TitleContent">
            Organisation Details<br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button1" runat="server" Text="Save" Width="68px" OnClick="Button1_Click" />&nbsp;<asp:Button
                ID="Button2" runat="server" Text="Back" Width="73px" OnClick="Button2_Click" />
        </div>
        <ajaxToolkit:TabContainer runat="server" ID="Tabs" Height="500px" OnClientActiveTabChanged="ActiveTabChanged"
            ActiveTabIndex="2" Width="770px">
            <ajaxToolkit:TabPanel runat="server" ID="Panel1" HeaderText="Details 1">
                <ContentTemplate>
                    <asp:UpdatePanel ID="updatePanel1" runat="server">
                        <ContentTemplate>
                            <table>
                                <tr>
                                    <td class="style10">
                                        Organisation Name
                                        <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox1" runat="server" Width="158px"></asp:TextBox>
                                    </td>
                                    <td class="style9">
                                        Preferred Organisation
                                    </td>
                                    <td class="style5">
                                        <asp:CheckBox ID="CheckBox1" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style10" rowspan="2">
                                        Organisation Short<br />
                                        Description&#160;
                                        <asp:Label ID="Label2" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                    </td>
                                    <td class="style8" rowspan="2">
                                        <asp:TextBox ID="TextBox2" runat="server" Height="43px" Width="159px"></asp:TextBox>
                                    </td>
                                    <td class="style9">
                                        Expression of Interest
                                    </td>
                                    <td class="style4">
                                        <asp:CheckBox ID="CheckBox2" runat="server" AutoPostBack="True" Checked="True" OnCheckedChanged="CheckBox2_CheckedChanged" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style9">
                                        Type of business
                                        <asp:Label ID="Label3" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                    </td>
                                    <td class="style3">
                                        <asp:TextBox ID="TextBox3" runat="server" Enabled="False" Width="103px"></asp:TextBox>&#160;&nbsp;<asp:Button
                                            ID="Button5" runat="server" Font-Bold="True" Text="..." />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style10">
                                        Lead Contact
                                    </td>
                                    <td class="style8">
                                        <asp:TextBox ID="TextBox4" runat="server" Width="97px"></asp:TextBox>&#160;&nbsp;<asp:Button
                                            ID="Button3" runat="server" Font-Bold="True" Text="..." />
                                    </td>
                                    <td class="style9">
                                        SIC Code
                                    </td>
                                    <td class="style6">
                                        <asp:TextBox ID="TextBox5" runat="server" Enabled="False" Width="158px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style10">
                                        Address Line 1
                                        <asp:Label ID="Label4" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                    </td>
                                    <td class="style8">
                                        <asp:TextBox ID="TextBox6" runat="server" Width="158px"></asp:TextBox>
                                    </td>
                                    <td rowspan="2" class="style9">
                                        Organisation Full
                                        <br />
                                        Description
                                    </td>
                                    <td rowspan="2">
                                        <asp:TextBox ID="TextBox8" runat="server" Height="43px" Width="159px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style10">
                                        Address Line 2
                                    </td>
                                    <td class="style8">
                                        <asp:TextBox ID="TextBox7" runat="server" Width="158px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style10">
                                        Address Line 3
                                    </td>
                                    <td class="style8">
                                        <asp:TextBox ID="TextBox9" runat="server" Width="158px"></asp:TextBox>
                                    </td>
                                    <td class="style9">
                                        Phone number
                                        <asp:Label ID="Label5" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                    </td>
                                    <td class="style5">
                                        <asp:TextBox ID="TextBox10" runat="server" Width="158px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style10">
                                        Postcode
                                        <asp:Label ID="Label6" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                    </td>
                                    <td class="style8">
                                        <asp:TextBox ID="TextBox11" runat="server" Width="97px"></asp:TextBox>&#160;&nbsp;<asp:Button
                                            ID="Button4" runat="server" Font-Bold="True" Text="..." />
                                    </td>
                                    <td class="style9">
                                        Fax
                                    </td>
                                    <td class="style5">
                                        <asp:TextBox ID="TextBox12" runat="server" Width="158px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style10">
                                        City/ Town
                                    </td>
                                    <td class="style8">
                                        <asp:TextBox ID="TextBox13" runat="server" Width="158px"></asp:TextBox>
                                    </td>
                                    <td class="style9">
                                        Email
                                    </td>
                                    <td class="style5">
                                        <asp:TextBox ID="TextBox14" runat="server" Width="158px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style10">
                                        County
                                    </td>
                                    <td class="style8">
                                        <asp:TextBox ID="TextBox15" runat="server" Width="158px"></asp:TextBox>
                                    </td>
                                    <td class="style9">
                                        Web Address
                                    </td>
                                    <td class="style5">
                                        <asp:TextBox ID="TextBox16" runat="server" Width="158px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style10">
                                        Nation/ Country
                                    </td>
                                    <td class="style8">
                                        <asp:DropDownList ID="DropDownList1" runat="server" Width="168px" Height="16px">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="style9">
                                        Charity Number
                                    </td>
                                    <td class="style5">
                                        <asp:TextBox ID="TextBox17" runat="server" Width="158px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style10">
                                    </td>
                                    <td class="style8">
                                    </td>
                                    <td class="style9">
                                        Company Number
                                    </td>
                                    <td class="style5">
                                        <asp:TextBox ID="TextBox18" runat="server" Width="158px"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel runat="server" ID="Panel3" HeaderText="Details 2">
                <HeaderTemplate>
                    Details 2
                </HeaderTemplate>
                <ContentTemplate>
                    <table>
                        <tr>
                            <td>
                                Organisation<br />
                                Specicalism
                            </td>
                            <td>
                                <asp:Panel ID="Panel4" runat="server" BorderWidth="1px" Height="80px" ScrollBars="Vertical">
                                    <asp:CheckBoxList ID="CheckBoxList1" runat="server">
                                        <asp:ListItem>Blind/ Partially Sighted</asp:ListItem>
                                        <asp:ListItem>Deaf/ Hard of Hearing</asp:ListItem>
                                        <asp:ListItem>Dyselia</asp:ListItem>
                                        <asp:ListItem>Learning</asp:ListItem>
                                        <asp:ListItem>Mental Health</asp:ListItem>
                                    </asp:CheckBoxList>
                                </asp:Panel>
                            </td>
                            <td class="style5">
                                &#160;&#160; Service Personal<br />
                                &#160; Circumstances<br />
                                &#160; Capilities
                            </td>
                            <td>
                                <asp:Panel ID="Panel8" runat="server" BorderWidth="1px" Height="80px" ScrollBars="Vertical">
                                    <asp:CheckBoxList ID="CheckBoxList5" runat="server">
                                        <asp:ListItem>Deaf/ Hard of Hearing</asp:ListItem>
                                        <asp:ListItem>Learning</asp:ListItem>
                                    </asp:CheckBoxList>
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Service Disabilities<br />
                                Capabilities
                            </td>
                            <td>
                                <asp:Panel ID="Panel5" runat="server" BorderWidth="1px" Height="80px" ScrollBars="Vertical">
                                    <asp:CheckBoxList ID="CheckBoxList2" runat="server">
                                        <asp:ListItem>Blind/ Partially Sighted</asp:ListItem>
                                        <asp:ListItem>Deaf/ Hard of Hearing</asp:ListItem>
                                        <asp:ListItem>Dyselia</asp:ListItem>
                                        <asp:ListItem>Learning</asp:ListItem>
                                    </asp:CheckBoxList>
                                </asp:Panel>
                            </td>
                            <td>
                                &#160;&#160; Service Ethnicity<br />
                                &#160; Caplilities
                            </td>
                            <td>
                                <asp:Panel ID="Panel9" runat="server" BorderWidth="1px" Height="80px" ScrollBars="Vertical">
                                    <asp:CheckBoxList ID="CheckBoxList6" runat="server" Width="180px">
                                        <asp:ListItem>Blind/ Partially Sighted</asp:ListItem>
                                        <asp:ListItem>Deaf/ Hard of Hearing</asp:ListItem>
                                        <asp:ListItem>Dyselia</asp:ListItem>
                                        <asp:ListItem>Learning</asp:ListItem>
                                        <asp:ListItem>Mental Health</asp:ListItem>
                                    </asp:CheckBoxList>
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Service Barries<br />
                                Capalities
                            </td>
                            <td>
                                <asp:Panel ID="Panel6" runat="server" BorderWidth="1px" Height="80px" ScrollBars="Vertical">
                                    <asp:CheckBoxList ID="CheckBoxList3" runat="server">
                                        <asp:ListItem>Blind/ Partially Sighted</asp:ListItem>
                                        <asp:ListItem>Deaf/ Hard of Hearing</asp:ListItem>
                                        <asp:ListItem>Dyselia</asp:ListItem>
                                        <asp:ListItem>Learning</asp:ListItem>
                                    </asp:CheckBoxList>
                                </asp:Panel>
                            </td>
                            <td>
                                &#160;&#160; Service<br />
                                &#160; Acrediation
                            </td>
                            <td>
                                <asp:Panel ID="Panel10" runat="server" BorderWidth="1px" Height="80px" ScrollBars="Vertical">
                                    <asp:CheckBoxList ID="CheckBoxList8" runat="server" Width="181px">
                                        <asp:ListItem>Blind/ Partially Sighted</asp:ListItem>
                                        <asp:ListItem>Deaf/ Hard of Hearing</asp:ListItem>
                                        <asp:ListItem>Dyselia</asp:ListItem>
                                        <asp:ListItem>Learning</asp:ListItem>
                                    </asp:CheckBoxList>
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Service Benefits<br />
                                Capalities
                            </td>
                            <td>
                                <asp:Panel ID="Panel7" runat="server" BorderWidth="1px" Height="80px" ScrollBars="Vertical">
                                    <asp:CheckBoxList ID="CheckBoxList4" runat="server">
                                        <asp:ListItem>Deaf/ Hard of Hearing</asp:ListItem>
                                        <asp:ListItem>Dyselia</asp:ListItem>
                                        <asp:ListItem>Learning</asp:ListItem>
                                        <asp:ListItem>Mental Health</asp:ListItem>
                                    </asp:CheckBoxList>
                                </asp:Panel>
                            </td>
                            <td>
                                &#160;
                            </td>
                            <td class="style6">
                                &#160;
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel runat="server" ID="TabPanel1" HeaderText="Details 3">
                <HeaderTemplate>
                    Details 3
                </HeaderTemplate>
                <ContentTemplate>
                    <table class="style1">
                        <tr>
                            <td class="style9">
                                Organisation<br />
                                Specicalism
                            </td>
                            <td class="style4">
                                <asp:Panel ID="Panel2" runat="server" BorderWidth="1px" ForeColor="Black" Height="80px"
                                    ScrollBars="Vertical" Width="238px">
                                    <asp:CheckBoxList ID="CheckBoxList7" runat="server" Width="238px">
                                        <asp:ListItem>Blind/ Partially Sighted</asp:ListItem>
                                        <asp:ListItem>Deaf/ Hard of Hearing</asp:ListItem>
                                        <asp:ListItem>Dyselia</asp:ListItem>
                                        <asp:ListItem>Learning</asp:ListItem>
                                        <asp:ListItem>Mental Health</asp:ListItem>
                                    </asp:CheckBoxList>
                                </asp:Panel>
                            </td>
                            <td class="style3">
                            </td>
                            <td class="style3">
                            </td>
                        </tr>
                        <tr>
                            <td class="style9">
                                Service Disabilities<br />
                                Capabilities
                            </td>
                            <td class="style8">
                                <asp:Panel ID="Panel11" runat="server" BorderWidth="1px" Height="80px" ScrollBars="Vertical"
                                    Width="240px">
                                    <asp:CheckBoxList ID="CheckBoxList10" runat="server">
                                        <asp:ListItem>Blind/ Partially Sighted</asp:ListItem>
                                        <asp:ListItem>Deaf/ Hard of Hearing</asp:ListItem>
                                        <asp:ListItem>Dyselia</asp:ListItem>
                                        <asp:ListItem>Learning</asp:ListItem>
                                    </asp:CheckBoxList>
                                </asp:Panel>
                            </td>
                            <td>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
        </ajaxToolkit:TabContainer>
        <br />
        <asp:Label runat="server" ID="CurrentTab" /><br />
        <asp:Label runat="server" ID="Messages" />
        <br />
    </div>
</asp:Content>
