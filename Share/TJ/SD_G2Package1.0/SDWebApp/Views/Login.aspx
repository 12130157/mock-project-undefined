<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SD.Web.Views.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Administrator Login</title>
    <link rel="stylesheet" href="~/Css/Stylesheet1.css" type="text/css" media="screen" title="default" />
</head>
<body id="login-bg">
 
<!-- Start: login-holder -->
<div id="login-holder">

	<!-- start logo -->
	<div id="logo-login">
		
	</div>
	<!-- end logo -->
	
	<div class="clear"></div>
	
	<!--  start loginbox ................................................................................. -->
	<div id="loginbox">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"/>

    <asp:UpdatePanel runat="server" id="UpdatePanel1" updatemode="Conditional">           
            <ContentTemplate>
            <!--  start login-inner -->
               <div id="login-inner">
		            <table border="0" cellpadding="0" cellspacing="0">
		            <tr>
			            <th>Username</th>
			            <td><asp:TextBox ID="Username" CssClass="login-inp" runat="server"></asp:TextBox></td>
		            </tr>
		            <tr>
			            <th>Password</th>
			            <td><asp:TextBox ID="Password" CssClass="login-inp" onfocus="this.value=''" runat="server" TextMode="Password"></asp:TextBox>
                        </td>
		            </tr>
		            <tr>
			            <th></th>
			            <td valign="top"><asp:CheckBox ID="login_check" Text="Remember me" runat="server" /></td>
		            </tr>
		            <tr>
			            <th></th>
			            <td><asp:Button ID="SubmitLogin" runat="server" Text="" 
                                CssClass="submit-login" onclick="SubmitLogin_Click"  />
                        </td>
		            </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <asp:Label runat="server" id="lblerror" CssClass="ErrorLogin" />
                        </td>
                    </tr>
		            </table>
	            </div>
                <!--  end login-inner -->
            </ContentTemplate>
        </asp:UpdatePanel>

	</form>
    
 	
	<div class="clear"></div>
	<a href="ForgotPass.aspx" class="forgot-pwd">Forgot Password?</a>
 </div>
</div>

<!-- End: login-holder -->
</body>
</html>

