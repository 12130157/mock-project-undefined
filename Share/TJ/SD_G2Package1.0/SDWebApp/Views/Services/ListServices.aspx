<%@ Page Language="C#" MasterPageFile="~/Shares/Site1.Master" AutoEventWireup="true"
    CodeBehind="ListServices.aspx.cs" Inherits="SD.Web.Views.ListServices" Title="List Services" %>

<%@ Register Assembly="msgBox" Namespace="BunnyBear" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="border: 1px solid #9e9f9f;">
        <tr>
            <td>
                <div class="TitleContent">
                    List Service
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="filter">
                    <asp:LinkButton ID="lbtnALl" runat="server" onclick="FilterChanged">All</asp:LinkButton>
                    &nbsp;|
                    <asp:LinkButton ID="lbtnDigit" runat="server" onclick="FilterChanged">0-9</asp:LinkButton>
                    &nbsp;|
                    <asp:LinkButton ID="lbtnABCDE" runat="server" onclick="FilterChanged">ABCDE</asp:LinkButton>
                    &nbsp;|
                    <asp:LinkButton ID="lbtnFGHIJ" runat="server" onclick="FilterChanged">FGHIJ</asp:LinkButton>
                    &nbsp;|
                    <asp:LinkButton ID="lbtnKLMN" runat="server" onclick="FilterChanged">KLMN</asp:LinkButton>
                    &nbsp;|
                    <asp:LinkButton ID="lbtnOPQR" runat="server" onclick="FilterChanged">OPQR</asp:LinkButton>
                    &nbsp;|
                    <asp:LinkButton ID="lbtnSTUV" runat="server" onclick="FilterChanged" >STUV</asp:LinkButton>
                    &nbsp;|
                    <asp:LinkButton ID="lbtnWXYZ" runat="server" onclick="FilterChanged" >WXYZ</asp:LinkButton>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="BtnCopy" runat="server" Text="Copy" onclick="BtnCopy_Click" 
                        style="margin-bottom: 0px" Width="46px" />
                    &nbsp;
                    <asp:Button ID="btnCreate" runat="server" Text="Create" OnClick="BtnCreate_Click" />
                    &nbsp;
                    <asp:CheckBox ID="chkIncludeInactive" runat="server" Text="Include In-active" AutoPostBack="True"
                        OnCheckedChanged="FilterChanged" />
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="Gridview">
                    <asp:GridView ID="grdServices" runat="server"  CellPadding="4"
                        ForeColor="#333333" AllowSorting="True" Width="775px" AutoGenerateColumns="False"
                         DataKeyNames ="ID" 
                        OnSelectedIndexChanged = "SelectService">
                        <RowStyle BackColor="#EFF3FB" />
                        <Columns>
                        <asp:TemplateField Visible="false">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblid" Text='<%#Eval("ID") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="ID" HeaderText="ID"  Visible="false" />
                                                     
                             <asp:TemplateField HeaderText="Service Name">
                              <ItemTemplate>
                        
                               <asp:LinkButton runat="server"  ID="lbtnName" Text='<%#Eval("Name")%>' HeaderText="Service Name" onclick="LbtnNameClick" ></asp:LinkButton>
                              </ItemTemplate>
                             </asp:TemplateField>   
                            <asp:BoundField DataField="Description" HeaderText="Description" />
                            <asp:BoundField DataField="ServiceType" HeaderText="Service Type" />
                            <asp:BoundField DataField="Contact" HeaderText="Contact" />
                           <asp:TemplateField HeaderText="Is Active?" SortExpression="IsActive">
                            <ItemTemplate>
                                <asp:Label ID="lblIsActive" runat="server" Text='<%# Boolean.Parse(Eval("IsActive").ToString()) ? "Yes" : "No" %>'/></ItemTemplate>
                            <ItemStyle Width="10%"></ItemStyle>
                        </asp:TemplateField>

                             <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnSelect" runat="server" CommandName="select">Select</asp:LinkButton>
                            </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <EmptyDataTemplate>
                            <asp:Label ID="lblmes" runat="server" Text="Label" CssClass="NoData"> No data</asp:Label>
                        </EmptyDataTemplate>
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#2461BF" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
        <div align="center">
						<table align="center">
							<tr>
								<td>
									&nbsp;<asp:LinkButton ID="lbtnBegin" runat="server" 
                                        onclick="FilterChanged"> << </asp:LinkButton>&nbsp; 
                                    <asp:LinkButton ID="lbtnPrevious" runat="server" 
                                        onclick="FilterChanged"><</asp:LinkButton>
                                    &nbsp;<asp:textbox id="PageSizeTxt" Runat="server" Columns="2" Text="3" Font-Bold="True"></asp:textbox><asp:label id="SepLbl" runat="server" Font-Size="X-Small" Enabled="False">/</asp:label>&nbsp;<asp:Label ID="TotalPages" runat="server" Font-Bold="True">1</asp:Label><asp:LinkButton 
                                        ID="lbtnNext" runat="server" onclick="FilterChanged">></asp:LinkButton>&nbsp;
                                    <asp:LinkButton ID="lbtnLast" runat="server" onclick="FilterChanged">>></asp:LinkButton>
                                    &nbsp;</td>
							</tr>
						</table>
					</div>
                </div>
            </td>
        </tr>
    </table>
    <cc1:msgBox ID="msgActive" runat="server" />
    
</asp:Content>
