using System;
using System.Data;
using Blog.BU;
using Blog.Entities;

namespace Blog.Web.UserControls
{
    public partial class ControlDetailNews : System.Web.UI.UserControl
    {
        

        //public int Newid{ set; get;}
        public int NewId;
        protected void Page_Load(object sender, EventArgs e)
        {


        }
        public void SelectNewsById(News newId)
        {
            
            DataTable dt;
            dt = NewsBU.SelectNewDetailById((newId));
            NewId = newId.NewsId;

            labelTitle.Text = dt.Rows[0]["Title"].ToString();
            labelAuthors.Text = dt.Rows[0]["author"].ToString();
            labelContentNew.Text = dt.Rows[0]["contentnew"].ToString();
            labelCreateTime.Text = dt.Rows[0]["createtime"].ToString();
            labelViewNumber.Text = dt.Rows[0]["numberviews"].ToString();


            DataTable objdt;

            objdt = NewsBU.SelectCommentById((newId));
            LvViewComments.DataSource = objdt;
            LvViewComments.DataBind();



        }

        protected void ButtonComments_Click(object sender, EventArgs e)
        {
            if (CheckError())
            {
                Comments cm = new Comments();


                cm.Author = txtYourName.Text;
                cm.NewsId = NewId;
                cm.Email = txtEmail.Text;
                cm.Content = txtComment.Text;

                CommentsBU.InsertNewComments(cm);

            }


        }
        public bool CheckError()
        {
            if (txtYourName.Text.Length < 5)
            {
                labelErrorName.Text = "Must be 5 letters";
                return false;
            }
            labelErrorName.Text = "";

            if (txtEmail.Text.Length < 5)
            {
                labelErrorEmail.Text = "Must be 5 letters";
                return false;
            }
            labelErrorEmail.Text = "";

            if (txtComment.Text.Length < 10 && txtComment.Text.Length < 500)
            {
                labelErrorComment.Text = "greater than 10 and less than 500";
                return false;
            }
            labelErrorComment.Text = "";

            return true;

        }
    }
}