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
using Blog.Entities;

namespace Blog.Web.UserControls
{
    public partial class ControlLogOn : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
         
        }

        protected void ButtonLogOnClick(object sender, EventArgs e)
        {
            Users users = new Users();

            if (CheckInput())
            {
                if (CheckLogOn(users))
                {

                    Session["Username"] = txtId.Text;
                    Response.Redirect(Session["URLReferrer"].ToString());

                }
                else
                {
                    labelCheckId.Text = "Wrong ID or Pass";
                }


            }
        }
        public bool CheckLogOn(Users user)
        {
    
            user.UserId = txtId.Text;
            user.Pass = txtPassword.Text;
            return UserBU.CheckUser((user));
        }
        public bool CheckInput()
        {
            if (txtId.Text.Length < 5)
            {
                labelCheckId.Text = "Must be 5 letters";
                return false;
            }
            labelCheckId.Text = "";

            if (txtPassword.Text.Length < 5)
            {
                labelCheckPassword.Text = "Must be 5 letters";
                return false;
            }
            labelCheckPassword.Text = "";
            return true;


        }
    }
}