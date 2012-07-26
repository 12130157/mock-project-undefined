using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Blog.Entities
{
   public class Comments
    {
        public int CommentId { get; set; }
        public string Content { get; set; }
        public int NewsId { get; set; }
        public string Author { get; set; }
        public string Email { get; set; }
        public DateTime CreateTime { get; set; }
    }
}
