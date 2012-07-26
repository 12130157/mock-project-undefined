using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Text;
using Blog.Entities;

namespace Blog.Dao
{
    public static class UserDao
    {

        public static bool CheckUserExists(Users users)
        {
            SqlCommand sqlcmd;
            SqlConnection sqlconnecnt = Common.SqlProvider.SelectGetConnection();

            try
            {
                sqlconnecnt.Open();
                sqlcmd = new SqlCommand("sp_checkIdAndPass", sqlconnecnt);
                sqlcmd.Parameters.Add("id", SqlDbType.VarChar).Value = users.UserId;
                sqlcmd.Parameters.Add("pass", SqlDbType.VarChar).Value = users.Pass;

                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.ExecuteNonQuery();
                var dr = sqlcmd.ExecuteReader();

                if (dr.HasRows)
                    while (dr.Read())
                    {
                        return true;
                    }
                else
                {
                    return false;
                }

                return true;

            }
            catch(SqlException)
            {
                sqlconnecnt.Close();
                return false;
            }
            finally
            {
                sqlconnecnt.Close();
            }
        }


        public static bool CheckUserIdExists(Users users)
        {
            SqlCommand sqlcmd;
            SqlConnection sqlconnecnt = Common.SqlProvider.SelectGetConnection();

            try
            {
                sqlconnecnt.Open();
                sqlcmd = new SqlCommand("sp_checkuserexists", sqlconnecnt);
                sqlcmd.Parameters.Add("id", SqlDbType.VarChar).Value = users.UserId;


                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.ExecuteNonQuery();
                var dr = sqlcmd.ExecuteReader();

                if (dr.HasRows)
                    while (dr.Read())
                    {
                        return true;
                    }
                else
                {
                    return false;
                }

                return true;

            }
            catch(SqlException)
            {
                sqlconnecnt.Close();
                return false;
            }
            finally
            {
                sqlconnecnt.Close();
            }
        }

        public static bool UpdateUsers(Users users)
        {
            SqlCommand sqlcmd;
            SqlConnection sqlconnecnt = Common.SqlProvider.SelectGetConnection();

            try
            {
                sqlconnecnt.Open();
                sqlcmd = new SqlCommand("sp_updateUser", sqlconnecnt);
                sqlcmd.Parameters.Add("Userid", SqlDbType.VarChar).Value = users.UserId;
                sqlcmd.Parameters.Add("pass", SqlDbType.VarChar).Value = users.Pass;
                sqlcmd.Parameters.Add("fullname", SqlDbType.NVarChar).Value = users.FullName;
                sqlcmd.Parameters.Add("birthday", SqlDbType.VarChar).Value = users.Birthday;
                sqlcmd.Parameters.Add("email", SqlDbType.VarChar).Value = users.Email;
                sqlcmd.Parameters.Add("phone", SqlDbType.VarChar).Value = users.Phone;
                sqlcmd.Parameters.Add("address", SqlDbType.NVarChar).Value = users.Address;

                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.ExecuteNonQuery();

                return true;
            }
            catch(SqlException)
            {
                sqlconnecnt.Close();
                return false;
            }
            finally
            {
                sqlconnecnt.Close();
            }
        }

        public static bool InsertUser(Users users)
        {

            SqlCommand sqlcmd;
            SqlConnection sqlconnecnt = Common.SqlProvider.SelectGetConnection();

            try
            {
                sqlconnecnt.Open();
                sqlcmd = new SqlCommand("sp_InsertUser", sqlconnecnt);
                sqlcmd.Parameters.Add("Userid", SqlDbType.VarChar).Value = users.UserId;
                sqlcmd.Parameters.Add("pass", SqlDbType.VarChar).Value = users.Pass;
                sqlcmd.Parameters.Add("fullname", SqlDbType.NVarChar).Value = users.FullName;
                sqlcmd.Parameters.Add("birthday", SqlDbType.VarChar).Value = users.Birthday;
                sqlcmd.Parameters.Add("email", SqlDbType.VarChar).Value = users.Email;
                sqlcmd.Parameters.Add("phone", SqlDbType.VarChar).Value = users.Phone;
                sqlcmd.Parameters.Add("address", SqlDbType.NVarChar).Value = users.Address;

                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.ExecuteNonQuery();

                return true;
            }
            catch (SqlException)
            {
                sqlconnecnt.Close();
                return false;
            }
            finally
            {
                sqlconnecnt.Close();
            }
        }


        public static bool DeleteUser(Users users)
        {
            SqlCommand sqlcmd;
            SqlConnection sqlconnecnt = Common.SqlProvider.SelectGetConnection();

            try
            {
                sqlconnecnt.Open();
                sqlcmd = new SqlCommand("sp_DeleteUser", sqlconnecnt);
                sqlcmd.Parameters.Add("userid", SqlDbType.VarChar).Value = users.UserId;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.ExecuteNonQuery();

                return true;
            }
            catch(SqlException)
            {
                sqlconnecnt.Close();
                return false;
            }
            finally
            {
                sqlconnecnt.Close();
            }
        }

        public static DataTable SelectFullUser()
        {
            SqlCommand sqlCmd = new SqlCommand();
            SqlDataAdapter sqlAdapter = new SqlDataAdapter();
            SqlConnection sqlConnect = Blog.Common.SqlProvider.SelectGetConnection();
            DataTable dt = new DataTable{Locale = CultureInfo.CurrentCulture};
            try
            {
                sqlConnect.Open();
                sqlCmd = new SqlCommand("sp_getFullUser", sqlConnect);
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlAdapter.SelectCommand = sqlCmd;
                sqlAdapter.Fill(dt);
                return dt;
            }
            catch (SqlException)
            {
                sqlConnect.Close();
                return null;
            }
            finally
            {
                sqlConnect.Close();
            }

        }


        public static Users SelectUserById(string user)
        {
            SqlCommand sqlcmd;
            SqlConnection sqlconnecnt = Common.SqlProvider.SelectGetConnection();

            Users users = new Users();
            try
            {
                sqlconnecnt.Open();

                sqlcmd = new SqlCommand("sp_getUserByID", sqlconnecnt);
                sqlcmd.Parameters.Add("id", SqlDbType.VarChar).Value = user;

                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.ExecuteNonQuery();

                SqlDataReader dr = sqlcmd.ExecuteReader();
                if (dr.Read())
                {

                    users.UserId = (string)dr["UserID"];
                    users.Pass = (string)dr["password"];
                    users.FullName = (string)dr["fullname"];
                    users.Birthday = (string)dr["birthday"];
                    users.Email = (string)dr["email"];
                    users.Phone = (string)dr["phone"];
                    users.Address = (string)dr["address"];




                }

                return users;
            }
            catch(SqlException)
            {
                sqlconnecnt.Close();
                return users;
            }
            finally
            {
                sqlconnecnt.Close();
            }
        }

    }
}
