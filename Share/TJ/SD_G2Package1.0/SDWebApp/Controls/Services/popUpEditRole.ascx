<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="popUpEditRole.ascx.cs"
    Inherits="SD.Web.Controls.Services.popUpEditRole" %>
<script src="../../Scripts/script.js" type="text/javascript"></script>
<link href="../../Css/Stylesheet1.css" rel="stylesheet" type="text/css" />
<asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="form_template2">
                <div class="rectan">
                    <table style="width: 100%;">
                        <tr>
                            <td>
                                <div class="title_template1" style="margin-top: 0px;">
                                    Change Roles of Organisation
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="listcheckbox" style="float: left; width: 100%; margin-left: -1px;">
                                    <asp:CheckBoxList ID="ChkSerDis" runat="server" Width="228px"  AutoPostBack="true"
                                        OnSelectedIndexChanged="ChkSerDisSelectedIndexChanged">
                                    </asp:CheckBoxList>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div style="float: right; margin-top: 5px;">
                                    <asp:HiddenField ID="hdfServiceOrganisationId" runat="server" />
                                    <asp:HiddenField ID="hdfRole" runat="server" />
                                    <asp:Button ID="btnOk" runat="server" Text="Ok" />
                                    <asp:Button ID="btbCancel" runat="server" Text="Cancel" OnClientClick="ClosePopUp1()" />
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>