using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using Blog.Dao;
using Blog.Entities;


namespace Blog.BU
{
   public static class CommentsBU
    {
       public static bool InsertNewComments(Comments comments)
       {

           

           if (comments.NewsId < 1) return false;
           if (comments.Author.Length < 5) return false;
           if (comments.Email.Length<5) return false;
           if (comments.Content.Length < 10 && comments.Content.Length < 500) return false;
           

           return CommentDao.InsertNewComment(comments);
       }

    }
}
