using System;
using System.Data;
using System.Globalization;
using System.Web.UI.WebControls;
using Blog.BU;
using Blog.Dao;
using Blog.Entities;

namespace Blog.Web.UserControls
{
    public partial class ControlManagementCategories : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Display();

        }

        public void Display()
        {
            DataTable dataTable;


            dataTable = CategoryBU.SelectFullCategory();
            DataGetAllCategory.DataSource = dataTable;
            DataGetAllCategory.DataBind();
            panelUpdateCategory.Visible = false;
            panelInsertCategory.Visible = false;
            panelShowAllData.Visible = true;

        }
        protected void EditCommand1(object sender, CommandEventArgs e)
        {


            FillData(Convert.ToInt32(e.CommandArgument, CultureInfo.CurrentCulture));
            panelUpdateCategory.Visible = true;
            panelInsertCategory.Visible = false;
            panelShowAllData.Visible = false;



        }

        public void FillData(int categoryId)
        {

           
            Category category;

            category = CategoryDao.FillDataCategoryById(categoryId);

            txtUpdateCategoryId.Text = categoryId.ToString(CultureInfo.InvariantCulture);
            txtUpdateCategoryName.Text = category.CategoryName;
            txtUpdateCategoryDescription.Text = category.Description;

        }


        protected void DeleteCommand1(object sender, CommandEventArgs e)
        {
            Category category = new Category();
            

            string id = e.CommandArgument.ToString();
            category.CategoryId = (Convert.ToInt32(id, CultureInfo.CurrentCulture));
            CategoryBU.DeleteCategory(category);

            panelUpdateCategory.Visible = false;
            panelInsertCategory.Visible = false;
            panelShowAllData.Visible = true;
            Display();

        }

        

        public bool CheckInputUpdateNews()
        {

            if (txtUpdateCategoryDescription.Text.Length < 10)
            {
                labelUpdateErrorCategoryDescription.Text = "Must be 10 letters";
                return false;
            }
            labelUpdateErrorCategoryDescription.Text = "";

            if (txtUpdateCategoryName.Text.Length < 5)
            {
                labelUpdateErrorCategoryName.Text = "Must be 5 letters";
                return false;
            }
            labelUpdateErrorCategoryName.Text = "";


            return true;


        }

      


        public bool CheckInputInsert()
        {
            if (txtInsertCategoryName.Text.Length < 5)
            {
                labelInsertErrorCategoryName.Text = "Must be 10 letters";
                return false;
            }
            labelInsertErrorCategoryName.Text = "";

            if (txtInsertCategoryDescription.Text.Length < 10)
            {
                labelInsertErrorCategoryDes.Text = "Must be 10 letters";
                return false;
            }
            labelInsertErrorCategoryDes.Text = "";


            return true;


        }

       

        

        protected void ButtonInsertSummitClick(object sender, EventArgs e)
        {
            if (CheckInputInsert())
            {

              

                Category category = new Category();


                category.CategoryName = txtInsertCategoryName.Text;
                category.Description = txtInsertCategoryDescription.Text;

                CategoryBU.InsertCategory(category);

                panelUpdateCategory.Visible = false;
                panelInsertCategory.Visible = false;
                panelShowAllData.Visible = true;
                Display();
            }
        }

        protected void ButtonUpdateSummitClick(object sender, EventArgs e)
        {
            if (CheckInputUpdateNews())
            {
                Category category = new Category();
                category.CategoryId = Convert.ToInt32(txtUpdateCategoryId.Text, CultureInfo.CurrentCulture);
                category.CategoryName = txtUpdateCategoryName.Text;
                category.Description = txtUpdateCategoryDescription.Text;

                CategoryBU.UpdateCategory(category);

                panelUpdateCategory.Visible = false;
                panelInsertCategory.Visible = false;
                panelShowAllData.Visible = true;
                Display();
            }
        }

        protected void LinkInsertCategoryClick(object sender, EventArgs e)
        {
            panelUpdateCategory.Visible = false;
            panelInsertCategory.Visible = true;
            panelShowAllData.Visible = false;
        }
    }
}