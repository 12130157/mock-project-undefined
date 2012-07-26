using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using Blog.Dao;
using Blog.Entities;

namespace Blog.BU
{
    public static class NewsBU
    {
        public static DataTable SelectHotNew()
        {

            return NewsDao.SelectHotNew();

        }

        public static DataTable SelectAllNews()
        {

            return NewsDao.SelectAllNews();

        }
        public static DataTable SelectNewDetailById(News newId)
        {

            return NewsDao.SelectDetailNewById((newId));

        }

        public static DataTable SelectCommentById(News newId)
        {

            return NewsDao.SelectCommentById((newId));

        }
        public static DataTable InsertANews(News newId)
        {

            return NewsDao.InsertANews(newId);

        }

        public static bool UpdateNews(News news)
        {

            return NewsDao.UpdateNews(news);

        }

        public static bool DeleteNews(News news)
        {

            return NewsDao.DeleteNews(news);

        }








        

    }
}
