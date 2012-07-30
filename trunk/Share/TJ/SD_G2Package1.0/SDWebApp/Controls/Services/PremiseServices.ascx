<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PremiseServices.ascx.cs" Inherits="SD.Web.Controls.PremiseServices" %>


<%@ Register src="ServiceAddPremise.ascx" tagname="ServiceAddPremise" tagprefix="uc1" %>


<link href="../../Css/Stylesheet1.css" rel="stylesheet" type="text/css" />
<asp:Panel ID="pnlGridViewRegion" runat="server">
    <div class="Gridview">
        <div>
            <asp:GridView ID="grdListPremises" runat="server" CellPadding="4" ForeColor="#333333"
                Width="100%" AutoGenerateColumns="False">
                <RowStyle BackColor="#EFF3FB" />
                <Columns>
                    <asp:TemplateField Visible="False">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblId" Text='<%#Eval("ID") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:HyperLinkField DataTextField="Name" HeaderText="Premise Name" />
                    <asp:BoundField DataField="AddressLine1" HeaderText="Address" />
                    <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" />
                    <asp:BoundField DataField="ProjectCode" HeaderText="ProjectCode" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="lbtnRemove" Text="Remove" OnClick="lbtnRemove_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                <EditRowStyle BackColor="#2461BF" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
        </div>
    </div>
    <div align="center">
        <table align="center">
            <tr>
                <td>
                    &nbsp;<asp:LinkButton ID="lbtnFirstPage" runat="server" OnClick="lbtnFirstPage_Click"><<</asp:LinkButton>&nbsp;
                    <asp:LinkButton ID="lbtnPreviousPage" runat="server" OnClick="lbtnPreviousPage_Click"><</asp:LinkButton>
                    &nbsp;&nbsp;<asp:TextBox ID="txtCurrentPage" runat="server" Columns="2" Text="3"
                        Font-Bold="True" Width="20px" OnTextChanged="txtCurrentPage_TextChanged"></asp:TextBox><asp:Label ID="lblSeperate" runat="server" Font-Size="X-Small" Enabled="False">/</asp:Label><asp:Label ID="lblTotalPages" runat="server" Font-Bold="True">1</asp:Label>&nbsp;
                    <asp:LinkButton ID="lbtnNextPage" runat="server" OnClick="lbtnNextPage_Click">></asp:LinkButton>
                    &nbsp;
                    <asp:LinkButton ID="lbtnLastPage" runat="server" OnClick="lbtnLastPage_Click">>></asp:LinkButton>
                    &nbsp;
                </td>
            </tr>
        </table>  
        <table>
          <tr>
                <td style="width:80%"></td>   
                <td> <asp:Button ID="btnAdd" runat="server" Text="Associate new service" OnClick="btnAdd_Click" /> </td>
            </tr> 
        </table>    
    </div>
</asp:Panel>
<asp:Label ID="lblNoData" runat="server" Text="No record has been found" Visible="false"></asp:Label>

<div id="MaskedDiv" runat="server" visible="false">
</div>
<div id="SelectPremiseRegion" runat="server" visible="false">
    <uc1:ServiceAddPremise ID="ServiceAddPremise1" runat="server" OnButtonBackClick="ClosePopup"
        OnButtonSelectClick="SelectService"/>
</div>
