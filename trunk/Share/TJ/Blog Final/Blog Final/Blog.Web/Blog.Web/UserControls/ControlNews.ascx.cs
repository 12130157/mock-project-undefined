using System;
using System.Data;
using System.Globalization;
using Blog.BU;

namespace Blog.Web.UserControls
{
    public partial class ControlNews : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
            var dt = new DataTable { Locale = CultureInfo.CurrentCulture };

            dt = NewsBU.SelectHotNew();
            listNews.DataSource = dt;
            listNews.DataBind();
        }
    }
}