using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using Blog.Entities;

namespace Blog.Dao
{
   public static class NewsDao
    {

       public static DataTable SelectHotNew()
        {
            SqlCommand sqlCmd;
            var sqlAdapter = new SqlDataAdapter();
            SqlConnection sqlConnect = Blog.Common.SqlProvider.SelectGetConnection();
            DataTable dt = new DataTable { Locale = CultureInfo.CurrentCulture };
            try
            {
                sqlConnect.Open();
                sqlCmd = new SqlCommand("sp_newhot", sqlConnect);
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

       public static DataTable SelectAllNews()
        {
            SqlCommand sqlCmd;
            var sqlAdapter = new SqlDataAdapter();
            SqlConnection sqlConnect = Blog.Common.SqlProvider.SelectGetConnection();
            DataTable dt = new DataTable { Locale = CultureInfo.CurrentCulture };
            try
            {
                sqlConnect.Open();
                sqlCmd = new SqlCommand("sp_getallnews", sqlConnect);
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

        // ve nha lam tiep pham bu cho news

       public static DataTable SelectDetailNewById(News newId)
        {

            SqlCommand sqlCmd;
            var sqlAdapter = new SqlDataAdapter();
            SqlConnection sqlConnect = Blog.Common.SqlProvider.SelectGetConnection();
            DataTable dt = new DataTable { Locale = CultureInfo.CurrentCulture };
            try
            {
                sqlConnect.Open();
                sqlCmd = new SqlCommand("sp_getDetailNew", sqlConnect);
                sqlCmd.Parameters.Add("newid", SqlDbType.Int).Value = newId.NewsId;

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

       public static DataTable SelectCommentById(News newId)
        {

            SqlCommand sqlCmd;
            var sqlAdapter = new SqlDataAdapter();
            SqlConnection sqlConnect = Blog.Common.SqlProvider.SelectGetConnection();
            DataTable dt = new DataTable { Locale = CultureInfo.CurrentCulture };
            try
            {
                sqlConnect.Open();
                sqlCmd = new SqlCommand("sp_showcommentbynewid", sqlConnect);
                sqlCmd.Parameters.Add("newid", SqlDbType.Int).Value = newId.NewsId;

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


       public static DataTable InsertANews(News newId)
        {

            SqlCommand sqlCmd;
            var sqlAdapter = new SqlDataAdapter();
            SqlConnection sqlConnect = Blog.Common.SqlProvider.SelectGetConnection();
            DataTable dt = new DataTable { Locale = CultureInfo.CurrentCulture };
            try
            {
                sqlConnect.Open();
                sqlCmd = new SqlCommand("sp_InsertANews", sqlConnect);
                sqlCmd.Parameters.Add("Title", SqlDbType.NVarChar).Value = newId.Title;
                sqlCmd.Parameters.Add("CategoryID", SqlDbType.Int).Value = newId.CategoryId;
                sqlCmd.Parameters.Add("Author", SqlDbType.VarChar).Value = newId.Author;
                sqlCmd.Parameters.Add("Content", SqlDbType.NVarChar).Value = newId.Content;


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

       public static bool UpdateNews(News news)
        {
            SqlCommand sqlcmd;
            SqlConnection sqlconnecnt = Common.SqlProvider.SelectGetConnection();

            try
            {
                sqlconnecnt.Open();
                sqlcmd = new SqlCommand("sp_updateANews", sqlconnecnt);
                sqlcmd.Parameters.Add("ID", SqlDbType.Int).Value = news.NewsId;
                sqlcmd.Parameters.Add("Title", SqlDbType.NVarChar).Value = news.Title;
                sqlcmd.Parameters.Add("CategoryID", SqlDbType.Int).Value = news.CategoryId;
                sqlcmd.Parameters.Add("Author", SqlDbType.NVarChar).Value = news.Author;
                sqlcmd.Parameters.Add("Content", SqlDbType.NVarChar).Value = news.Content;
                sqlcmd.Parameters.Add("views", SqlDbType.Int).Value = news.Views;
                sqlcmd.Parameters.Add("comment", SqlDbType.Int).Value = news.Comments;
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

       public static bool DeleteNews(News news)
        {
            SqlCommand sqlcmd;
            SqlConnection sqlconnecnt = Common.SqlProvider.SelectGetConnection();

            try
            {
                sqlconnecnt.Open();
                sqlcmd = new SqlCommand("sp_DeleteANews", sqlconnecnt);
                sqlcmd.Parameters.Add("id", SqlDbType.Int).Value = news.NewsId;
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

       public static News FillDataById(int newId)
        {
            SqlCommand sqlcmd;
            SqlConnection sqlconnecnt = Common.SqlProvider.SelectGetConnection();

            News news = new News();
            try
            {
                sqlconnecnt.Open();
                sqlcmd = new SqlCommand("sp_GetNewsByID", sqlconnecnt);
                sqlcmd.Parameters.Add("id", SqlDbType.Int).Value = newId;

                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.ExecuteNonQuery();

                SqlDataReader dr = sqlcmd.ExecuteReader();
                if (dr != null)
                    if (dr.Read())
                    {

                        news.Title = (string)dr["Title"];
                        news.Author = (string)dr["Author"];
                        news.Content = (string)dr["Contentnew"];
                        news.Views = (int)dr["numberviews"];
                        news.Comments = (int)dr["numbercomment"];


                    }

                return news;
            }
            catch (SqlException)
            {
                sqlconnecnt.Close();
                return news;
            }
            finally
            {
                sqlconnecnt.Close();
            }
        }
    }
}
