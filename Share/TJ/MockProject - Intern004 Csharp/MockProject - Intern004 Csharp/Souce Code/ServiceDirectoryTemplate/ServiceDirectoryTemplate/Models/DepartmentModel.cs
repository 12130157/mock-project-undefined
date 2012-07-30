using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections.ObjectModel;

namespace ServiceDirectoryTemplate.Models
{
    public class DepartmentModel
    {
		ServiceDirectoryDataContext dataAccess = new ServiceDirectoryDataContext();
		public int PageSize = 15;
        //list
		public bool CheckUnique(string name, int? id = null)
		{
			var re = dataAccess.Departments.Where(m => m.DepName == name);
			if (id != null)
				re = re.Where(m => m.DepID != id);
			if (re.Count() == 0)
				return true;
			return false;
		}
		public IEnumerable<Department> GetList(out int totalPage, int? dirID = null, int page = 1, string filter = "all", bool include = false)
        {
            List<Department> list = new List<Department>();
            var ls = from dep in dataAccess.Departments
					select dep;

			if (dirID!=null)
				ls=ls.Where(m=>m.DirID==dirID);
            
            switch (filter)
			{
				case "all": break;
				case "0-9": ls = ls.Where(m => m.DepName.StartsWith("0") || m.DepName.StartsWith("1") || m.DepName.StartsWith("2") || m.DepName.StartsWith("3") || m.DepName.StartsWith("4") || m.DepName.StartsWith("5") || m.DepName.StartsWith("6") || m.DepName.StartsWith("7") || m.DepName.StartsWith("8") || m.DepName.StartsWith("9")); break;
				case "abcde": ls = ls.Where(m => m.DepName.StartsWith("a") || m.DepName.StartsWith("b") || m.DepName.StartsWith("c") || m.DepName.StartsWith("d") || m.DepName.StartsWith("e")); break;
				case "fghij": ls = ls.Where(m => m.DepName.StartsWith("f") || m.DepName.StartsWith("g") || m.DepName.StartsWith("h") || m.DepName.StartsWith("i") || m.DepName.StartsWith("j")); break;
				case "klmn": ls = ls.Where(m => m.DepName.StartsWith("k") || m.DepName.StartsWith("l") || m.DepName.StartsWith("m") || m.DepName.StartsWith("n")); break;
				case "opqr": ls = ls.Where(m => m.DepName.StartsWith("o") || m.DepName.StartsWith("p") || m.DepName.StartsWith("q") || m.DepName.StartsWith("r")); break;
				case "stuv": ls = ls.Where(m => m.DepName.StartsWith("s") || m.DepName.StartsWith("t") || m.DepName.StartsWith("u") || m.DepName.StartsWith("v")); break;
				case "wxyz": ls = ls.Where(m => m.DepName.StartsWith("w") || m.DepName.StartsWith("x") || m.DepName.StartsWith("y") || m.DepName.StartsWith("z")); break;
			}
			if (!include)
			{
				ls = ls.Where(m => m.DepIsActive == 1);
			}
			totalPage = (int)Math.Ceiling(((double)ls.Count() / PageSize));
			page = (page > totalPage ? totalPage : page);
			page = (page < 1 ? 1 : page);
			return ls.Skip((page - 1) * PageSize).Take(PageSize);
        }

        public Department GetDetail(int DepID)
        {
            var org = (from orgList in dataAccess.Departments
                       where orgList.DepID == DepID
                       select orgList).Single();
            return org;

        }
        //insert
        public void Insert(Department newOrg)
        {
            dataAccess.Departments.InsertOnSubmit(newOrg);
            dataAccess.SubmitChanges();
        }
        //update
        public void Update()
        {
            dataAccess.SubmitChanges();
        }
		public void MarkActive(int DepID, bool IsAvtivate)
		{
			var ser = dataAccess.Departments.SingleOrDefault(m => m.DepID == DepID);
			ser.DepIsActive = (IsAvtivate ? 1 : 0);
			dataAccess.SubmitChanges();
		}
    }
}