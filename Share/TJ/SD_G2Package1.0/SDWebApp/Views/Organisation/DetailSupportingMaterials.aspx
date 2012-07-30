<%@ Page Language="C#" MasterPageFile="~/Shares/Site1.Master" AutoEventWireup="true"
    CodeBehind="DetailSupportingMaterials.aspx.cs" Inherits="SD.Web.Views.Organisation.DetailSupportingMaterials"
    Title="Detail supporting material" %>

<%@ Register Assembly="msgBox" Namespace="BunnyBear" TagPrefix="cc2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="Dune5.DateTimeUI" Namespace="Dune5.DateTimeUI" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
            Supporting Materials Details</div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnInActive" runat="server" Text="In-Active" Style="margin-left: 0px"
            Width="61px" OnClick="BtnInActiveClick" />
        &nbsp;<asp:Button ID="btnSave" runat="server" Text="Save" Style="margin-left: 0px"
            Width="61px" OnClick="BtnSaveClick" CommandName="Create" />
        &nbsp;<asp:Button ID="btnBack" runat="server" Text="Back" Width="66px" OnClick="BtnBackClick" />
        <ajaxToolkit:TabContainer runat="server" ID="Tabs" Height="448px" OnClientActiveTabChanged="ActiveTabChanged"
            ActiveTabIndex="0" Width="770px">
            <ajaxToolkit:TabPanel runat="server" ID="Panel1" HeaderText="Details">
                <ContentTemplate>
                    <asp:UpdatePanel ID="updatePanel1" runat="server">
                        <ContentTemplate>
                            <table>
                                <tr>
                                    <td class="style7">
                                        URL
                                        <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                    </td>
                                    <td class="style10">
                                        <asp:TextBox ID="txtUrl" runat="server" Width="158px"></asp:TextBox>
                                    </td>
                                    <td class="style12">
                                        &nbsp;
                                        <asp:Label ID="lblAddedBy" runat="server" Text="Added By"></asp:Label>
                                    </td>
                                    <td class="style5">
                                        <asp:TextBox ID="txtAddedBy" runat="server" Enabled="False" Width="158px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style7" rowspan="2">
                                        Description&#160;
                                    </td>
                                    <td class="style2" rowspan="2">
                                        <asp:TextBox ID="txtDesc" runat="server" Height="43px" Width="159px" TextMode="MultiLine"></asp:TextBox>
                                    </td>
                                    <td class="style12">
                                        &nbsp;
                                        <asp:Label ID="lblAddedDate" runat="server" Text="Added Date"></asp:Label>
                                    </td>
                                    <td class="style4">
                                        <asp:TextBox ID="txtAddedDate" runat="server" Enabled="False" Width="158px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style12">
                                        &nbsp;
                                    </td>
                                    <td class="style3" id="ddlUserName">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style7">
                                        Type
                                    </td>
                                    <td class="style10">
                                        <asp:DropDownList ID="ddlType" runat="server" Width="168px" Height="25px">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="style12">
                                        &nbsp;
                                    </td>
                                    <td class="style5">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style7">
                                    </td>
                                    <td class="style10">
                                    </td>
                                    <td class="style12">
                                        &nbsp;
                                    </td>
                                    <td class="style5">
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
        </ajaxToolkit:TabContainer>
        <div class="Error">
            <asp:Label ID="lblError" runat="server"></asp:Label></div>
        <br />
        <asp:Label runat="server" ID="CurrentTab" /><br />
        <br />
        <br />
        <%--  <asp:Label ID="Label7" runat="server"></asp:Label>--%>
    </div>
    <cc2:msgBox ID="msgInActive" runat="server" />
</asp:Content>
