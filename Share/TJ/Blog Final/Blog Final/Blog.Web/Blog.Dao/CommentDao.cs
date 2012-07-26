using System.Data;
using System.Data.SqlClient;
using Blog.Entities;

namespace Blog.Dao
{
    public static class CommentDao
    {
        public static bool InsertNewComment(Comments comments)
        {
            SqlCommand sqlcmd;
            SqlConnection sqlconnecnt = Common.SqlProvider.SelectGetConnection();

            try
            {
                sqlconnecnt.Open();
                sqlcmd = new SqlCommand("sp_insertnewcomment", sqlconnecnt);
                sqlcmd.Parameters.Add("newsid", SqlDbType.Int).Value = comments.NewsId;
                sqlcmd.Parameters.Add("author", SqlDbType.NVarChar).Value = comments.Author;
                sqlcmd.Parameters.Add("email", SqlDbType.NVarChar).Value = comments.Email;

                sqlcmd.Parameters.Add("content", SqlDbType.NVarChar).Value = comments.Content;

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
       
    }
}
