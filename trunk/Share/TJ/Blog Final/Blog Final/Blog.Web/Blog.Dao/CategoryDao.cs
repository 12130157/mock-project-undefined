using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using Blog.Entities;

namespace Blog.Dao
{
    public static class CategoryDao
    {
        public static DataTable SelectAllCategory()
        {
            SqlCommand sqlCmd;
            var sqlAdapter = new SqlDataAdapter();
            SqlConnection sqlConnect = Blog.Common.SqlProvider.SelectGetConnection();
            DataTable dt = new DataTable { Locale = CultureInfo.CurrentCulture };
            try
            {
                sqlConnect.Open();
                sqlCmd = new SqlCommand("sp_getAllCategory", sqlConnect);
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlAdapter.SelectCommand = sqlCmd;
                sqlAdapter.Fill(dt);
                return dt;
            }
            catch(SqlException)
            {
                sqlConnect.Close();
                return null;
            }
            finally
            {
                sqlConnect.Close();
            }
        }

        public static DataTable SelectCategoryIdAndName()
        {
            SqlCommand sqlCmd;
            var sqlAdapter = new SqlDataAdapter();
            SqlConnection sqlConnect = Blog.Common.SqlProvider.SelectGetConnection();
            DataTable dt = new DataTable { Locale = CultureInfo.CurrentCulture };
            try
            {
                sqlConnect.Open();
                sqlCmd = new SqlCommand("sp_getCategoryByID", sqlConnect);
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

        public static bool UpdateCategory(Category category)
        {
            SqlCommand sqlcmd;
            SqlConnection sqlconnecnt = Common.SqlProvider.SelectGetConnection();

            try
            {
                sqlconnecnt.Open();
                sqlcmd = new SqlCommand("sp_updateCategory", sqlconnecnt);
                sqlcmd.Parameters.Add("ID", SqlDbType.Int).Value = category.CategoryId;
                sqlcmd.Parameters.Add("categoryname", SqlDbType.NVarChar).Value = category.CategoryName;
                sqlcmd.Parameters.Add("description", SqlDbType.NVarChar).Value = category.Description;

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

        public static bool InsertCategory(Category category)
        {
            SqlCommand sqlcmd;
            SqlConnection sqlconnecnt = Common.SqlProvider.SelectGetConnection();

            try
            {
                sqlconnecnt.Open();
                sqlcmd = new SqlCommand("sp_InsertCategory", sqlconnecnt);
                sqlcmd.Parameters.Add("categoryname", SqlDbType.NVarChar).Value = category.CategoryName;
                sqlcmd.Parameters.Add("description", SqlDbType.NVarChar).Value = category.Description;

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


        public static bool DeleteCategory(Category category)
        {
            SqlCommand sqlcmd;
            SqlConnection sqlconnecnt = Common.SqlProvider.SelectGetConnection();

            try
            {
                sqlconnecnt.Open();
                sqlcmd = new SqlCommand("sp_DeleteCategory", sqlconnecnt);
                sqlcmd.Parameters.Add("id", SqlDbType.Int).Value = category.CategoryId;
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

        public static DataTable SelectFullCategory()
        {
            SqlCommand sqlCmd;
            var sqlAdapter = new SqlDataAdapter();
            SqlConnection sqlConnect = Common.SqlProvider.SelectGetConnection();
            var dt = new DataTable { Locale = CultureInfo.CurrentCulture };
            try
            {
                sqlConnect.Open();
                sqlCmd = new SqlCommand("sp_getFullCategory", sqlConnect);
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

        public static DataTable GetFullCategoryById(Category category)
        {
            SqlCommand sqlCmd;
            var sqlAdapter = new SqlDataAdapter();
            SqlConnection sqlConnect = Blog.Common.SqlProvider.SelectGetConnection();
            DataTable dt = new DataTable { Locale = CultureInfo.CurrentCulture };
            try
            {
                sqlConnect.Open();
                sqlCmd = new SqlCommand("sp_getFullCategory", sqlConnect);
                sqlCmd.Parameters.Add("id", SqlDbType.Int).Value = category.CategoryId;
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


        public static Category FillDataCategoryById(int categoryId)
        {
            SqlCommand sqlcmd;
            SqlConnection sqlconnecnt = Common.SqlProvider.SelectGetConnection();

            Category category = new Category();
            try
            {
                sqlconnecnt.Open();
                sqlcmd = new SqlCommand("sp_GetFullCategoryByID", sqlconnecnt);
                sqlcmd.Parameters.Add("id", SqlDbType.Int).Value = categoryId;

                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.ExecuteNonQuery();

                SqlDataReader dr = sqlcmd.ExecuteReader();
                if (dr != null)
                    if (dr.Read())
                    {

                        category.CategoryName = (string)dr["CategoryName"];
                        category.Description = (string)dr["Description"];



                    }

                return category;
            }
            catch (SqlException)
            {
                sqlconnecnt.Close();
                return category;
            }
            finally
            {
                sqlconnecnt.Close();
            }
        }
    }
}
