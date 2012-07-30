using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ServiceDirectoryTemplate.Models;

namespace ServiceDirectoryTemplate.Models
{
    public class PostCodeModel
    {
        ServiceDirectoryDataContext db = new ServiceDirectoryDataContext();
        public List<Address> GetList()
        {
            List<Address> list = new List<Address>();
            var listad = from x in db.Addresses
                         select x;
            foreach (var x in listad)
            {
                list.Add(x);
            }
            return list;
        }
    }
}