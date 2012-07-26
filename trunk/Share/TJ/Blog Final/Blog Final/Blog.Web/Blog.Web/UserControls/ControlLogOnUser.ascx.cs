using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

namespace Blog.Web.UserControls
{
    public partial class ControlLogOnUser : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

                labelOwner.Text = Session["Username"].ToString();
            
            
        }

       

        protected void ButtonLogOnClick(object sender, EventArgs e)
        {

            Session.Abandon();
            Response.Redirect("~/Index.aspx");
        }
    }
}