using System;
using System.Data;
using System.Web.UI.WebControls;
using Blog.BU;
using Blog.Dao;
using Blog.Entities;

namespace Blog.Web.UserControls
{
    public partial class ControlManagementUser : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Display();
        }

        public void Display()
        {
            DataTable dataTable;



            dataTable = UserBU.SelectAllUsers();
            DataGetAllUsers.DataSource = dataTable;
            DataGetAllUsers.DataBind();

            panelUpdateUser.Visible = false;
            panelInsertUser.Visible = false;
            panelShowAllData.Visible = true;

        }
        protected void EditCommand1(object sender, CommandEventArgs e)
        {


            FillData(e.CommandArgument.ToString());
            panelUpdateUser.Visible = true;
            panelInsertUser.Visible = false;
            panelShowAllData.Visible = false;



        }

        public void FillData(string userId)
        {
           


            Users users;

            users = UserDao.SelectUserById(userId);
            txtUpdateAddress.Text = users.Address;
            txtUpdateBirthday.Text = users.Birthday;
            txtUpdateEmail.Text = users.Email;
            txtUpdateFullName.Text = users.FullName;
            txtUpdatePassword.Text = users.Pass;
            txtUpdatePhone.Text = users.Phone;
            txtUpdateUserId.Text = users.UserId;


        }

        protected void DeleteCommand1(object sender, CommandEventArgs e)
        {
           

            Users users = new Users();

            string id = e.CommandArgument.ToString();
            users.UserId = id;
            UserBU.DeleteUser(users);

            panelUpdateUser.Visible = false;
            panelInsertUser.Visible = false;
            panelShowAllData.Visible = true;
            Display();

        }

       


        public bool CheckInputInsert()
        {
            if (txtInsertPassword.Text.Length < 5)
            {
                labelInsertErrorPassword.Text = "Must be 5 letters";
                return false;
            }
            labelInsertErrorPassword.Text = "";

            if (txtInsertAgainPassword.Text != txtInsertPassword.Text)
            {
                labelInsertErrorAgainPassword.Text = "Not same Password";
                return false;
            }
            labelInsertErrorAgainPassword.Text = "";

            return true;


        }

        

        public bool CheckInputUpdateNews()
        {

            if (txtUpdatePassword.Text.Length < 5)
            {
                labelUpdateErrorPassword.Text = "Must be 5 letters";
                return false;
            }
            labelUpdateErrorPassword.Text = "";

            if (txtUpdateFullName.Text.Length < 5)
            {
                labelUpdateErrorFullName.Text = "Must be 5 letters";
                return false;
            }
            labelUpdateErrorFullName.Text = "";


            return true;


        }

        protected void LinkNewUsersClick(object sender, EventArgs e)
        {
            panelUpdateUser.Visible = false;
            panelInsertUser.Visible = true;
            panelShowAllData.Visible = false;
        }

        protected void ButtonInsertSummitClick(object sender, EventArgs e)
        {
            if (CheckInputInsert())
            {

                
                Users users = new Users();

               
                users.UserId = txtInsertUserNames.Text;


                if (!UserDao.CheckUserIdExists(users))
                {



                    users.UserId = txtInsertUserNames.Text;
                    users.Pass = txtInsertPassword.Text;
                    users.Address = txtInsertAddress.Text;
                    users.Birthday = txtInsertBirthday.Text;
                    users.Email = txtInsertEmail.Text;
                    users.FullName = txtInsertFullName.Text;
                    users.Phone = txtInsertPhone.Text;
                    UserBU.InsertUser(users);
                    labelInsertErrorUserName.Text = "";

                    Display();
                }
                else
                {
                    labelInsertErrorUserName.Text = "User is exists";
                }



            }
        }

        protected void ButtonUpdateSummitClick(object sender, EventArgs e)
        {
            if (CheckInputUpdateNews())
            {
                Users users = new Users();


                users.UserId = txtUpdateUserId.Text;
                users.Pass = txtUpdatePassword.Text;
                users.Address = txtUpdateAddress.Text;
                users.Birthday = txtUpdateBirthday.Text;
                users.Email = txtUpdateEmail.Text;
                users.FullName = txtUpdateFullName.Text;
                users.Phone = txtUpdatePhone.Text;


                UserBU.UpdateUser((users));

                Display();
            }
        }
    }
}