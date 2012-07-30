using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections.ObjectModel;

namespace ServiceDirectoryTemplate.Models
{
    public class GovermentModel
    {
        ServiceDirectoryDataContext dataAccess = new ServiceDirectoryDataContext();
		public int PageSize = 15;
        //list
		public IEnumerable<GovOfficeRegion> GetList(out int totalPage, int page = 1, string filter = "all", bool include = false)
        {
            var ls = from org in dataAccess.GovOfficeRegions
                                   select org;
			switch (filter)
			{
				case "all": break;
				case "0-9": ls = ls.Where(m => m.GovOfficeRegionName.StartsWith("0") || m.GovOfficeRegionName.StartsWith("1") || m.GovOfficeRegionName.StartsWith("2") || m.GovOfficeRegionName.StartsWith("3") || m.GovOfficeRegionName.StartsWith("4") || m.GovOfficeRegionName.StartsWith("5") || m.GovOfficeRegionName.StartsWith("6") || m.GovOfficeRegionName.StartsWith("7") || m.GovOfficeRegionName.StartsWith("8") || m.GovOfficeRegionName.StartsWith("9")); break;
				case "abcde": ls = ls.Where(m => m.GovOfficeRegionName.StartsWith("a") || m.GovOfficeRegionName.StartsWith("b") || m.GovOfficeRegionName.StartsWith("c") || m.GovOfficeRegionName.StartsWith("d") || m.GovOfficeRegionName.StartsWith("e")); break;
				case "fghij": ls = ls.Where(m => m.GovOfficeRegionName.StartsWith("f") || m.GovOfficeRegionName.StartsWith("g") || m.GovOfficeRegionName.StartsWith("h") || m.GovOfficeRegionName.StartsWith("i") || m.GovOfficeRegionName.StartsWith("j")); break;
				case "klmn": ls = ls.Where(m => m.GovOfficeRegionName.StartsWith("k") || m.GovOfficeRegionName.StartsWith("l") || m.GovOfficeRegionName.StartsWith("m") || m.GovOfficeRegionName.StartsWith("n")); break;
				case "opqr": ls = ls.Where(m => m.GovOfficeRegionName.StartsWith("o") || m.GovOfficeRegionName.StartsWith("p") || m.GovOfficeRegionName.StartsWith("q") || m.GovOfficeRegionName.StartsWith("r")); break;
				case "stuv": ls = ls.Where(m => m.GovOfficeRegionName.StartsWith("s") || m.GovOfficeRegionName.StartsWith("t") || m.GovOfficeRegionName.StartsWith("u") || m.GovOfficeRegionName.StartsWith("v")); break;
				case "wxyz": ls = ls.Where(m => m.GovOfficeRegionName.StartsWith("w") || m.GovOfficeRegionName.StartsWith("x") || m.GovOfficeRegionName.StartsWith("y") || m.GovOfficeRegionName.StartsWith("z")); break;
			}
			if (!include)
			{
				ls = ls.Where(m => m.GovIsActivate == 1);
			}
			totalPage = (int)Math.Ceiling(((double)ls.Count() / PageSize));
			page = (page > totalPage ? totalPage : page);
			page = (page < 1 ? 1 : page);
			return ls.Skip((page - 1) * PageSize).Take(PageSize);
        }

        public GovOfficeRegion GetDetail(int orgID)
        {
            var org = (from orgList in dataAccess.GovOfficeRegions
                       where orgList.GovOfficeRegionID == orgID
                       select orgList).Single();
            return org;

        }
        //insert
        public void Insert(Organisation newOrg)
        {
            dataAccess.Organisations.InsertOnSubmit(newOrg);
            dataAccess.SubmitChanges();
        }
        //update
        public void Update()
        {
            dataAccess.SubmitChanges();
        }
    }
}