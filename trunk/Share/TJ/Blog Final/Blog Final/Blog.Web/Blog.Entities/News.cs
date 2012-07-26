using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Blog.Entities
{
   public class News
    {
        public int NewsId { get; set; }
        public string Title { get; set; }
        public string Content { get; set; }
        public string Author { get; set; }
        public int CategoryId { get; set; }
        public DateTime CreateTime { get; set; }
        public string CategoryName { get; set; }
        public int Views { get; set; }
        public int Comments { get; set; }

    }
}
