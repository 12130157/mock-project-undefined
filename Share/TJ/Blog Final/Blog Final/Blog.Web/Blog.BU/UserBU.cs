using System.Data;
using Blog.Dao;
using Blog.Entities;

namespace Blog.BU
{
    public static class UserBU
    {
        public static bool CheckUser(Users users)
        {
            


            return UserDao.CheckUserExists(users);

        }
        public static DataTable SelectAllUsers()
        {
           

            return UserDao.SelectFullUser();

        }

        public static bool UpdateUser(Users users)
        {

            return UserDao.UpdateUsers(users);

        }

        public static bool DeleteUser(Users users)
        {


            return UserDao.DeleteUser(users);

        }
        public static bool InsertUser(Users users)
        {

            return UserDao.InsertUser((users));

        }

       
    }
}
