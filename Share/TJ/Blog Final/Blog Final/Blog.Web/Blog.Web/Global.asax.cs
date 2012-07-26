using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Xml.Linq;

namespace Blog.Web
{
    public class Global : System.Web.HttpApplication
    {

       
        protected void Session_Start()
        {
            Session["Username"] = "";
            Session["URLReferrer"] = Request.Url;
        }

        
    }
}