using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ServiceDirectoryTemplate.Models
{
    public class SICCodeModel
    {
        ServiceDirectoryDataContext db = new ServiceDirectoryDataContext();
		public int PageSize=15;
        //Models.SICCode sic = new Models.SICCode();
        public List<SICCode> GetList()
        {
            List<SICCode> list = new List<SICCode>();
            var listsic = from x in db.SICCodes
                          select x;
            foreach (var x in listsic)
            {
                list.Add(x);
            }
            return list;
        }
        //public List<SICCode> SearchName(SICCode sic, string busName, int siccode)
		public IEnumerable<SICCode> SearchName(out int totalPage, string busName = "", string siccode = "", int page = 1)
		{
			var ls = from sic1 in db.SICCodes
					 select sic1;
			if (busName != "")
				ls = ls.Where(m => m.TypeOfBusiness.Contains(busName));
			if (siccode != "")
				ls = ls.Where(m => m.SICCode1.Contains(siccode));

			totalPage = (int)Math.Ceiling(((double)ls.Count() / PageSize));
			page = (page > totalPage ? totalPage : page);
			page = (page < 1 ? 1 : page);
			return ls.Skip((page - 1) * PageSize).Take(PageSize);
		}

      
    }
}