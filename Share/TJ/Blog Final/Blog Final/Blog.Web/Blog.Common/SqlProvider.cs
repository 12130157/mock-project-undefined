using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace Blog.Common
{
    public static class SqlProvider
    {

        public static string SelectGetConnectionString()
        {
            return "Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\MyBlogLow.mdf;Integrated Security=True;User Instance=True";
        }

        public static SqlConnection SelectGetConnection()
        {
            SqlConnection sqlConnect = new SqlConnection(SelectGetConnectionString());
            return sqlConnect;
        }
    }
}
