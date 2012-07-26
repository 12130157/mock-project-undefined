using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections.ObjectModel;

namespace ServiceDirectoryTemplate.Models
{
    public class DirectorateModel
    {
		ServiceDirectoryDataContext dataAccess = new ServiceDirectoryDataContext();
		public int PageSize = 15;
        //list
		public bool CheckUnique(string name, int? id = null)
		{
			var re = dataAccess.Directorates.Where(m => m.DirName == name);
			if (id != null)
				re = re.Where(m => m.DirID != id);
			if (re.Count() == 0)
				return true;
			return false;
		}
		public IEnumerable<Directorate> GetList(out int totalPage, int? OrgID=null, int page = 1, string filter = "all", bool include = false)
        {
			var ls = from supportM in dataAccess.Directorates
					 select supportM;
			if (OrgID != null)
				ls = ls.Where(m => m.OrgID == OrgID);
			switch (filter)
			{
				case "all": break;
				case "0-9": ls = ls.Where(m => m.DirName.StartsWith("0") || m.DirName.StartsWith("1") || m.DirName.StartsWith("2") || m.DirName.StartsWith("3") || m.DirName.StartsWith("4") || m.DirName.StartsWith("5") || m.DirName.StartsWith("6") || m.DirName.StartsWith("7") || m.DirName.StartsWith("8") || m.DirName.StartsWith("9")); break;
				case "abcde": ls = ls.Where(m => m.DirName.StartsWith("a") || m.DirName.StartsWith("b") || m.DirName.StartsWith("c") || m.DirName.StartsWith("d") || m.DirName.StartsWith("e")); break;
				case "fghij": ls = ls.Where(m => m.DirName.StartsWith("f") || m.DirName.StartsWith("g") || m.DirName.StartsWith("h") || m.DirName.StartsWith("i") || m.DirName.StartsWith("j")); break;
				case "klmn": ls = ls.Where(m => m.DirName.StartsWith("k") || m.DirName.StartsWith("l") || m.DirName.StartsWith("m") || m.DirName.StartsWith("n")); break;
				case "opqr": ls = ls.Where(m => m.DirName.StartsWith("o") || m.DirName.StartsWith("p") || m.DirName.StartsWith("q") || m.DirName.StartsWith("r")); break;
				case "stuv": ls = ls.Where(m => m.DirName.StartsWith("s") || m.DirName.StartsWith("t") || m.DirName.StartsWith("u") || m.DirName.StartsWith("v")); break;
				case "wxyz": ls = ls.Where(m => m.DirName.StartsWith("w") || m.DirName.StartsWith("x") || m.DirName.StartsWith("y") || m.DirName.StartsWith("z")); break;
			}
			if (!include)
			{
				ls = ls.Where(m => m.DirIsActive == 1);
			}
			totalPage = (int)Math.Ceiling(((double)ls.Count() / PageSize));
			page = (page > totalPage ? totalPage : page);
			page = (page < 1 ? 1 : page);
			return ls.Skip((page - 1) * PageSize).Take(PageSize);
        }

        public Directorate GetDetail(int DirID)
        {
            var org = (from orgList in dataAccess.Directorates
                       where orgList.DirID == DirID
                       select orgList).Single();
            return org;

        }
        //insert
        public void Insert(Directorate newOrg)
        {
            dataAccess.Directorates.InsertOnSubmit(newOrg);
            dataAccess.SubmitChanges();
        }
        //update
        public void Update()
        {
            dataAccess.SubmitChanges();
        }
		public void MarkActive(int DirID, bool IsAvtivate)
		{
			var ser = dataAccess.Directorates.SingleOrDefault(m => m.DirID == DirID);
			ser.DirIsActive = (IsAvtivate ? 1 : 0);
			dataAccess.SubmitChanges();
		}
    }
}