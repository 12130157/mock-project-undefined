<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MockProject.Web.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link rel="stylesheet" href="skins/css/screen.css" type="text/css" media="screen"
        title="default" />
    <!--  jquery core -->

    <script src="skins/js/jquery/jquery-1.4.1.min.js" type="text/javascript"></script>

    <!-- Custom jquery scripts -->

    <script src="skins/js/jquery/custom_jquery.js" type="text/javascript"></script>

    <!-- MUST BE THE LAST SCRIPT IN <HEAD></HEAD></HEAD> png fix -->

    <script src="skins/js/jquery/jquery.pngFix.pack.js" type="text/javascript"></script>

    <script type="text/javascript">
$(document).ready(function(){
$(document).pngFix( );
});
    </script>

    <style type="text/css">
        .style1
        {
            width: 84px;
        }
        .style2
        {
            width: 218px;
        }
    </style>

</head>
<body id="login-bg">
    <form id="form1" runat="server">
    <div id="login-holder">
        <!-- start logo -->
        <div id="logo-login">
            <!-- <a href="#">
                <img src="" width="156" height="40" alt="" /></a> -->
        </div>
        <!-- end logo -->
        <div class="clear">
        </div>
        <!--  start loginbox ................................................................................. -->
        <div id="loginbox">
            <!--  start login-inner -->
            <div id="login-inner">
                <table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <th class="style1">
                            Username
                        </th>
                        <td class="style2">
                            <asp:TextBox ID="txtUsername" CssClass="login-inp" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvUsername" runat="server" 
                                ErrorMessage="*" ControlToValidate="txtUsername"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <th class="style1">
                            Password
                        </th>
                        <td class="style2">
                            <asp:TextBox ID="txtPassword" CssClass="login-inp" runat="server" Text="************" TextMode=Password></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="txtPassword" ErrorMessage="*"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <th class="style1">
                        </th>
                        <td valign="top" class="style2">
                            <asp:CheckBox ID="CheckBox1" runat="server" CssClass="checkbox-size" Text="Remember me" />
                            <!-- <input type="checkbox" class="checkbox-size" id="login-check" />
                            <label for="login-check">Remember
                                me</label>
                                 -->
                        </td>
                    </tr>
                    <tr>
                        <th class="style1">
                            &nbsp;</th>
                        <td class="style2">
                            <asp:Button ID="btnLogin" runat="server" Text="" CssClass="submit-login"/>
                            <!-- <input type="button" class="submit-login" /> -->
                        </td>
                    </tr>
                </table>
            </div>
            <!--  end login-inner -->
            <div class="clear">
            </div>
            <a href="" class="forgot-pwd">Forgot Password?</a>
        </div>
        <!--  end loginbox -->
        <!--  start forgotbox ....................... -->
        <div id="forgotbox">
            <div id="forgotbox-text">
                Please send us your email and we'll reset your password.</div>
            <!--  start forgot-inner -->
            <div id="forgot-inner">
                <table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <th>
                            Email address:
                        </th>
                        <td>
                            <input type="text" value="" class="login-inp" />
                        </td>
                    </tr>
                    <tr>
                        <th>
                        </th>
                        <td>
                            <input type="button" class="submit-login" />
                        </td>
                    </tr>
                </table>
            </div>
            <!--  end forgot-inner -->
            <div class="clear">
            </div>
            <a href="" class="back-login">Back to login</a>
        </div>
        <!--  end forgotbox -->
    </div>
    <!-- End: login-holder -->
    </form>
</body>
</html>
