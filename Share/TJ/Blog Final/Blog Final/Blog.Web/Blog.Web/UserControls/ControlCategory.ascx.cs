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
using Blog.BU;

namespace Blog.Web.UserControls
{
    public partial class ControlCategory : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            DataTable objdt;

            objdt = CategoryBU.SelectAllCategory();
            rptCategory.DataSource = objdt;
            rptCategory.DataBind();
        }
    }
}