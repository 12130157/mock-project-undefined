<%@ Page Language="C#" MasterPageFile="~/MainTemplate.Master" AutoEventWireup="true" CodeBehind="CreateProgramme.aspx.cs" Inherits="MockProject.Web.CreateProgramme" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    Create Programme
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="top-list-programme">
        <div class="button-container">
            <asp:Button ID="ButtonDeactivate" runat="server" Text="Deactivate" />
            <asp:Button ID="ButtonSave" runat="server" Text="Save" />
            <asp:Button ID="ButtonBack" runat="server" Text="Back" />
        </div>
    </div>
    <div class="content-list-programme">
        <div class="left-clp">
            <div class="label-llclp">
                <asp:Label ID="Label1" CssClass="LabelListProgramme" runat="server" Text="Programme name"></asp:Label>
            </div>
            <div class="textbox-llclp">
                <asp:TextBox ID="TextBoxProgrammeName" CssClass="TextBoxListProgramme" runat="server"></asp:TextBox>
            </div>
            <div class="distance-each-left-ctp"></div>
        </div>
        
        <div class="right-clp">
            <div class="label-llclp">
                <asp:Label ID="Label3" CssClass="LabelListProgramme" runat="server" Text="Contact"></asp:Label>
            </div>
            <div class="textbox-llclp">
                <asp:TextBox ID="TextBoxContact" CssClass="TextBoxListProgramme" runat="server"></asp:TextBox>
            </div>
            
        </div>
        <div class="clear"></div>
        <div class="left-clp">
            <div class="label-llclp">
                <asp:Label ID="Label2" CssClass="LabelListProgramme" runat="server" Text="Description"></asp:Label>
            </div>
            <div class="textbox-llclp">
                <asp:TextBox ID="TextBoxDescription" CssClass="TextBoxListProgramme" runat="server" TextMode="MultiLine"></asp:TextBox>
            </div>
        </div>
        <div class="right-clp"></div>
        
        
    </>
    
</asp:Content>
