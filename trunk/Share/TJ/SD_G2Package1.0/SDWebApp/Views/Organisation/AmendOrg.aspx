<%@ Page Language="C#" MasterPageFile="~/Shares/Site1.Master" AutoEventWireup="true"
    CodeBehind="AmendOrg.aspx.cs" Inherits="SD.Web.AmendOrg" Title="Amend Organisation" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script type="text/javascript">
        function PanelClick() {
            var messages = $get('<%=Messages.ClientID%>');
            Highlight(messages);
        }

        function ActiveTabChanged(sender) {
            var CurrentTab = $get('<%=CurrentTab.ClientID%>');
         /*   CurrentTab.innerHTML = sender.get_activeTab().get_headerText();*/
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
        <div class="TitleContent">
            Organisation Details<br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button
                ID="Button3" runat="server" Text="In-active" Width="68px" OnClick="Button3_Click" />&nbsp;
            <asp:Button ID="Button1" runat="server" Text="Save" Width="68px" />&nbsp;<asp:Button ID="Button2" runat="server" Text="Back" Width="73px" />
        </div>
        <ajaxToolkit:TabContainer runat="server" ID="Tabs" Height="500px" OnClientActiveTabChanged="ActiveTabChanged"
            ActiveTabIndex="0" Width="770px">
            <ajaxToolkit:TabPanel runat="server" ID="Panel1" HeaderText="Details 1">
                <ContentTemplate>
                    <asp:UpdatePanel ID="updatePanel1" runat="server">
                        <ContentTemplate>
                            <table>
                                <tr>
                                    <td class="style7">
                                        Organisation Name
                                        <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                    </td>
                                    <td class="style10">
                                        <asp:TextBox ID="TextBox1" runat="server" Width="158px"></asp:TextBox>
                                    </td>
                                    <td class="style12">
                                        Preferred Organisation
                                    </td>
                                    <td class="style5">
                                        <asp:CheckBox ID="CheckBox1" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style7" rowspan="2">
                                        Organisation Short<br />
                                        Description&#160;
                                        <asp:Label ID="Label2" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                    </td>
                                    <td class="style2" rowspan="2">
                                        <asp:TextBox ID="TextBox2" runat="server" Height="43px" Width="159px"></asp:TextBox>
                                    </td>
                                    <td class="style12">
                                        Expression of Interest
                                    </td>
                                    <td class="style4">
                                        <asp:CheckBox ID="CheckBox2" runat="server" AutoPostBack="True" OnCheckedChanged="CheckBox2_CheckedChanged"
                                            Checked="True" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style12">
                                        Type of business
                                        <asp:Label ID="Label3" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                    </td>
                                    <td class="style3">
                                        <asp:TextBox ID="TextBox3" runat="server" Enabled="False" Width="103px"></asp:TextBox>&#160;&nbsp;<asp:Button
                                            ID="Button6" runat="server" Font-Bold="True" Text="..." />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style7">
                                        Lead Contact
                                    </td>
                                    <td class="style11">
                                        <asp:TextBox ID="TextBox4" runat="server" Width="97px"></asp:TextBox>&#160;&nbsp;<asp:Button
                                            ID="Button7" runat="server" Font-Bold="True" Text="..." />
                                    </td>
                                    <td class="style12">
                                        SIC Code
                                    </td>
                                    <td class="style6">
                                        <asp:TextBox ID="TextBox5" runat="server" Enabled="False" Width="158px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style7">
                                        Address Line 1
                                        <asp:Label ID="Label4" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                    </td>
                                    <td class="style10">
                                        <asp:TextBox ID="TextBox6" runat="server" Width="158px"></asp:TextBox>
                                    </td>
                                    <td rowspan="2" class="style12">
                                        Organisation Full
                                        <br />
                                        Description
                                    </td>
                                    <td rowspan="2">
                                        <asp:TextBox ID="TextBox8" runat="server" Height="43px" Width="159px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style7">
                                        Address Line 2
                                    </td>
                                    <td class="style10">
                                        <asp:TextBox ID="TextBox7" runat="server" Width="158px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style7">
                                        Address Line 3
                                    </td>
                                    <td class="style10">
                                        <asp:TextBox ID="TextBox9" runat="server" Width="158px"></asp:TextBox>
                                    </td>
                                    <td class="style12">
                                        Phone number
                                        <asp:Label ID="Label5" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                    </td>
                                    <td class="style5">
                                        <asp:TextBox ID="TextBox10" runat="server" Width="158px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style7">
                                        Postcode
                                        <asp:Label ID="Label6" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                    </td>
                                    <td class="style10">
                                        <asp:TextBox ID="TextBox11" runat="server" Width="97px"></asp:TextBox>&#160;&nbsp;<asp:Button
                                            ID="Button8" runat="server" Font-Bold="True" Text="..." />
                                    </td>
                                    <td class="style12">
                                        Fax
                                    </td>
                                    <td class="style5">
                                        <asp:TextBox ID="TextBox12" runat="server" Width="158px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style7">
                                        City/ Town
                                    </td>
                                    <td class="style10">
                                        <asp:TextBox ID="TextBox13" runat="server" Width="158px"></asp:TextBox>
                                    </td>
                                    <td class="style12">
                                        Email
                                    </td>
                                    <td class="style5">
                                        <asp:TextBox ID="TextBox14" runat="server" Width="158px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style7">
                                        County
                                    </td>
                                    <td class="style10">
                                        <asp:TextBox ID="TextBox15" runat="server" Width="158px"></asp:TextBox>
                                    </td>
                                    <td class="style12">
                                        Web Address
                                    </td>
                                    <td class="style5">
                                        <asp:TextBox ID="TextBox16" runat="server" Width="158px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style7">
                                        Nation/ Country
                                    </td>
                                    <td class="style10">
                                        <asp:DropDownList ID="DropDownList1" runat="server" Width="168px" Height="16px">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="style12">
                                        Charity Number
                                    </td>
                                    <td class="style5">
                                        <asp:TextBox ID="TextBox17" runat="server" Width="158px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style7">
                                    </td>
                                    <td class="style10">
                                    </td>
                                    <td class="style12">
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
                            <td class="style4">
                                Organisation<br />
                                Specicalism
                            </td>
                            <td class="style2">
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
                            <td class="style4">
                                Service Disabilities<br />
                                Capabilities
                            </td>
                            <td class="style2">
                                <asp:Panel ID="Panel5" runat="server" BorderWidth="1px" Height="80px" ScrollBars="Vertical">
                                    <asp:CheckBoxList ID="CheckBoxList2" runat="server">
                                        <asp:ListItem>Blind/ Partially Sighted</asp:ListItem>
                                        <asp:ListItem>Deaf/ Hard of Hearing</asp:ListItem>
                                        <asp:ListItem>Dyselia</asp:ListItem>
                                        <asp:ListItem>Learning</asp:ListItem>
                                    </asp:CheckBoxList>
                                </asp:Panel>
                            </td>
                            <td class="style5">
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
                            <td class="style4">
                                Service Barries<br />
                                Capalities
                            </td>
                            <td class="style2">
                                <asp:Panel ID="Panel6" runat="server" BorderWidth="1px" Height="80px" ScrollBars="Vertical">
                                    <asp:CheckBoxList ID="CheckBoxList3" runat="server">
                                        <asp:ListItem>Blind/ Partially Sighted</asp:ListItem>
                                        <asp:ListItem>Deaf/ Hard of Hearing</asp:ListItem>
                                        <asp:ListItem>Dyselia</asp:ListItem>
                                        <asp:ListItem>Learning</asp:ListItem>
                                    </asp:CheckBoxList>
                                </asp:Panel>
                            </td>
                            <td class="style5">
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
                            <td class="style4">
                                Service Benefits<br />
                                Capalities
                            </td>
                            <td class="style2">
                                <asp:Panel ID="Panel7" runat="server" BorderWidth="1px" Height="80px" ScrollBars="Vertical">
                                    <asp:CheckBoxList ID="CheckBoxList4" runat="server">
                                        <asp:ListItem>Deaf/ Hard of Hearing</asp:ListItem>
                                        <asp:ListItem>Dyselia</asp:ListItem>
                                        <asp:ListItem>Learning</asp:ListItem>
                                        <asp:ListItem>Mental Health</asp:ListItem>
                                    </asp:CheckBoxList>
                                </asp:Panel>
                            </td>
                            <td class="style5">
                                &#160;
                            </td>
                            <td>
                                &#160;
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel runat="server" ID="TabPanel2" HeaderText="Details 4">
                <ContentTemplate>
                    <fieldset style="width: 727px">
                        <legend>Premise</legend>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                            ForeColor="#333333" Width="712px">
                            <RowStyle BackColor="#EFF3FB" />
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:HyperLinkField DataTextField="PreName" HeaderText="Premise Name" />
                                <asp:BoundField DataField="Addr" HeaderText="Address" />
                                <asp:BoundField DataField="PriLoc" HeaderText="Primary Location" />
                                <asp:BoundField DataField="No" HeaderText="Phone Number" />
                            </Columns>
                            <EditRowStyle BackColor="#2461BF" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        </asp:GridView>
                    </fieldset>
                    &nbsp;<br />
                    <br />
                    <fieldset style="width: 731px">
                        <legend>Located In</legend>
                        <table class="style1">
                            <tr>
                                <td class="style2">
                                    Ward:
                                </td>
                                <td class="style2">
                                    <asp:TextBox ID="TextBox19" runat="server" Width="161px"></asp:TextBox>
                                </td>
                                <td class="style2">
                                    NHS Authority:
                                </td>
                                <td class="style2">
                                    <asp:TextBox ID="TextBox23" runat="server" Width="160px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    Borough:
                                </td>
                                <td class="style2">
                                    <asp:TextBox ID="TextBox20" runat="server" Width="159px"></asp:TextBox>
                                </td>
                                <td class="style2">
                                    Gov office:
                                </td>
                                <td class="style2">
                                    <asp:DropDownList ID="DropDownList2" runat="server" Height="21px" Width="174px">
                                        <asp:ListItem>Gov office</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    Local Authority:
                                </td>
                                <td class="style2">
                                    <asp:TextBox ID="TextBox21" runat="server" Width="158px"></asp:TextBox>
                                </td>
                                <td class="style2">
                                    Trust Region:
                                </td>
                                <td class="style2">
                                    <asp:DropDownList ID="DropDownList3" runat="server" Height="21px" Width="174px">
                                        <asp:ListItem>Scotland</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    Unitory:
                                </td>
                                <td class="style2">
                                    <asp:TextBox ID="TextBox22" runat="server" Width="155px"></asp:TextBox>
                                </td>
                                <td class="style2">
                                    Trust District:
                                </td>
                                <td class="style2">
                                    <asp:DropDownList ID="DropDownList4" runat="server" Height="21px" Width="174px">
                                        <asp:ListItem>Lancaside</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel runat="server" ID="TabPanel3" HeaderText="Details 5">
                <HeaderTemplate>
                    &nbsp;Details 5
                </HeaderTemplate>
                <ContentTemplate>
                    <fieldset style="width: 726px">
                        <legend></legend>
                        <div style="font-weight: bold">
                            Current List of Supporting Materials&nbsp;&nbsp;
                        </div>
                        <table style="width: 733px">
                            <tr>
                                <td class="style2">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="Button4" runat="server" Text="Create" onclick="Button4_Click" />
                                    <asp:CheckBox ID="CheckBox3" runat="server" Text="Include In-active" />
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    <asp:GridView ID="Grvdt5" runat="server" CellPadding="4" ForeColor="#333333"
                                        AutoGenerateColumns="False" Width="700px">
                                        <RowStyle BackColor="#EFF3FB" />
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:HyperLinkField DataTextField="url" HeaderText="URL" NavigateUrl="AmendSP.aspx" />
                                            <asp:BoundField DataField="Des" HeaderText="Description" />
                                            <asp:BoundField DataField="Type" HeaderText="Type" />
                                            <asp:BoundField DataField="Added" HeaderText="Added By" />
                                            <asp:BoundField DataField="AddDate" HeaderText="Added Date" />
                                        </Columns>
                                        <EditRowStyle BackColor="#2461BF" />
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    </asp:GridView>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel runat="server" ID="TabPanel4" HeaderText="BU/Directorates">
                <ContentTemplate>
                    <fieldset style="width: 729px">
                        <legend></legend>
                        <table style="width: 728px">
                            <tr>
                                <td align="left" class="style4">
                                    <asp:LinkButton ID="LinkButton4" runat="server">All</asp:LinkButton>
                                    |
                                    <asp:LinkButton ID="LinkButton5" runat="server">0 - 9</asp:LinkButton>
                                    |
                                    <asp:LinkButton ID="LinkButton6" runat="server">A B C D E</asp:LinkButton>
                                    |
                                    <asp:LinkButton ID="LinkButton7" runat="server">F G H I J</asp:LinkButton>
                                    |
                                    <asp:LinkButton ID="LinkButton8" runat="server">K L M N</asp:LinkButton>
                                    |
                                    <asp:LinkButton ID="LinkButton9" runat="server">O P Q R</asp:LinkButton>
                                    |
                                    <asp:LinkButton ID="LinkButton10" runat="server">S T U V</asp:LinkButton>
                                    |
                                    <asp:LinkButton ID="LinkButton11" runat="server">W X Y Z</asp:LinkButton>
                                   
                                </td>
                                <td align="left" class="style3">
                                    &nbsp;&nbsp;&nbsp; <asp:Button ID="Button5" runat="server" Text="Create" OnClick="Button5_Click" />
                                    <asp:CheckBox ID="CheckBox4" runat="server" Text="Include In-active" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:GridView ID="GrvBu" runat="server" CellPadding="4" ForeColor="#333333"
                                        AutoGenerateColumns="False" Width="719px">
                                        <RowStyle BackColor="#EFF3FB" />
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:HyperLinkField DataTextField="bu" HeaderText="BU/Directorate Name" />
                                            <asp:BoundField DataField="off" HeaderText="Office Address Line 1" />
                                            <asp:BoundField DataField="pos" HeaderText="Postcode" />
                                            <asp:BoundField DataField="con" HeaderText="Contact" />
                                            <asp:BoundField DataField="isa" HeaderText="Is Active" />
                                        </Columns>
                                        <EditRowStyle BackColor="#2461BF" />
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    </asp:GridView>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
        </ajaxToolkit:TabContainer>
        <br />
        <asp:Label runat="server" ID="CurrentTab" /><br />
        <asp:Label runat="server" ID="Messages" />
        <br />
    </div>
</asp:Content>
