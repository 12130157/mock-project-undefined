using System;
using System.Data;
using System.Globalization;
using System.Web.UI.WebControls;
using Blog.BU;
using Blog.Dao;
using Blog.Entities;

namespace Blog.Web.UserControls
{
    public partial class ControlManagementNews : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            DataTable dataTable2;

            Display();

            dataTable2 = CategoryBU.SelectCategoryIdAndName();
            dropInsertCategory.DataSource = dataTable2;
            dropInsertCategory.DataBind();
            dropUpdateCategoryName.DataSource = dataTable2;
            dropUpdateCategoryName.DataBind();
            panelInsertNews.Visible = false;
            panelUpdateNew.Visible = false;

        }
        public void Display()
        {
            DataTable dataTable;


            dataTable = NewsBU.SelectAllNews();
            DataGetAllNews.DataSource = dataTable;
            DataGetAllNews.DataBind();
        }



        public void FillData(int newId)
        {
            News news;


            news = NewsDao.FillDataById(newId);

            txtUpdateTitle.Text = news.Title;
            txtUpdateAuthor.Text = news.Author;
            txtUpdateNewsId.Text = newId.ToString(CultureInfo.InvariantCulture);
            txtUpdateContent.Text = news.Content;
            txtUpdateViews.Text = news.Views.ToString(CultureInfo.InvariantCulture);
            txtUpdateComment.Text = news.Comments.ToString(CultureInfo.InvariantCulture);

        }

        protected void EditCommand1(object sender, CommandEventArgs e)
        {

            //pnUpdateBook.Visible = true;
            //dtgGetAllBook.Visible = false;
            FillData(Convert.ToInt32(e.CommandArgument, CultureInfo.CurrentCulture));
            panelInsertNews.Visible = false;
            panelUpdateNew.Visible = true;
            panelShowAllData.Visible = false;


        }
        protected void DeleteCommand1(object sender, CommandEventArgs e)
        {
            News news = new News();

           
            string id = e.CommandArgument.ToString();
            news.NewsId = (Convert.ToInt32(id, CultureInfo.CurrentCulture));
            NewsBU.DeleteNews(news);
            panelInsertNews.Visible = false;
            panelUpdateNew.Visible = false;
            panelShowAllData.Visible = true;


        }

       
        public bool CheckInputInsert()
        {
            if (txtInsertTitle.Text.Length < 10)
            {
                labelInsertErrorTitle.Text = "Must be 10 letters";
                return false;
            }
            labelInsertErrorTitle.Text = "";

            if (txtInsertContent.Text.Length < 10)
            {
                labelInsertErrorContent.Text = "Must be 10 letters";
                return false;
            }
            labelInsertErrorContent.Text = "";

            if (txtInsertAuthor.Text.Length < 2)
            {
                labelInsertErrorAuthor.Text = "Must be 2 letters";
                return false;
            }
            labelInsertErrorAuthor.Text = "";


            return true;


        }

        

        public bool CheckInputUpdateNews()
        {
            if (txtUpdateAuthor.Text.Length < 2)
            {
                labelUpdateErrorAuthor.Text = "Must be 2 letters";
                return false;
            }
            labelUpdateErrorAuthor.Text = "";
            //2
            if (Convert.ToInt32(txtUpdateComment.Text, CultureInfo.CurrentCulture) < 1)
            {
                labelUpdateErrorComment.Text = "Great than 1";
                return false;
            }
            labelUpdateErrorComment.Text = "";
            //3
            if (txtUpdateTitle.Text.Length < 5)
            {
                labelUpdateErrorTitle.Text = "Must be 5 letters";
                return false;
            }
            labelUpdateErrorTitle.Text = "";
            //4
            if (txtUpdateContent.Text.Length < 10)
            {
                labelUpdateErrorContent.Text = "Must be 10 letters";
                return false;
            }
            labelUpdateErrorContent.Text = "";
            //5
            if (Convert.ToInt32(txtUpdateViews.Text, CultureInfo.CurrentCulture) < 1)
            {
                labelUpdateErrorViews.Text = "Great than 1";
                return false;
            }
            labelUpdateErrorViews.Text = "";


            return true;


        }

        

        protected void ButtonInsertSummitClick(object sender, EventArgs e)
        {
            if (CheckInputInsert())
            {

                
                var news = new News();

                news.Author = txtInsertAuthor.Text;
                news.Content = txtInsertContent.Text;
                news.Title = txtInsertTitle.Text;
                news.CategoryId = Convert.ToInt32(dropInsertCategory.SelectedValue, CultureInfo.CurrentCulture);
                NewsBU.InsertANews(news);

                panelInsertNews.Visible = false;
                panelUpdateNew.Visible = false;
                panelShowAllData.Visible = true;
                Display();
            }
        }

        protected void ButtonUpdateSummitClick(object sender, EventArgs e)
        {
            if (CheckInputUpdateNews())
            {


                News news = new News();
                news.NewsId = Int32.Parse(txtUpdateNewsId.Text, CultureInfo.CurrentCulture);
                news.Title = txtUpdateTitle.Text;
                news.CategoryId = Int32.Parse(dropUpdateCategoryName.SelectedValue,CultureInfo.CurrentCulture);
                news.Author = txtUpdateAuthor.Text;
                news.Content = txtUpdateContent.Text;
                news.Views = Convert.ToInt32(txtUpdateViews.Text,CultureInfo.CurrentCulture);
                news.Comments = Convert.ToInt32(txtUpdateComment.Text, CultureInfo.CurrentCulture);



                NewsBU.UpdateNews(news);

                panelInsertNews.Visible = false;
                panelUpdateNew.Visible = false;
                panelShowAllData.Visible = true;
                Display();
            }
        }

        protected void LinkAddNewsClick(object sender, EventArgs e)
        {
            panelInsertNews.Visible = true;
            panelUpdateNew.Visible = false;
            panelShowAllData.Visible = false;
        }
    }
}