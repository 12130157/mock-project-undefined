using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections.ObjectModel;

namespace ServiceDirectoryTemplate.Models
{
    public class TrustRegionModel
    {
        ServiceDirectoryDataContext dataAccess = new ServiceDirectoryDataContext();
		public int PageSize = 15;
        //list
		public bool CheckUnique(string name, int? id = null)
		{
			var re = dataAccess.TrustRegions.Where(m => m.TrustRegionName == name);
			if (id != null)
				re = re.Where(m => m.TrustRegionID != id);
			if (re.Count() == 0)
				return true;
			return false;
		}
		public IEnumerable<TrustRegion> GetList(out int totalPage, int page = 1, string filter = "all", bool include = false)
        {
            var ls = from trustRegion in dataAccess.TrustRegions
                                  select trustRegion;
			switch (filter)
			{
				case "all": break;
				case "0-9": ls = ls.Where(m => m.TrustRegionName.StartsWith("0") || m.TrustRegionName.StartsWith("1") || m.TrustRegionName.StartsWith("2") || m.TrustRegionName.StartsWith("3") || m.TrustRegionName.StartsWith("4") || m.TrustRegionName.StartsWith("5") || m.TrustRegionName.StartsWith("6") || m.TrustRegionName.StartsWith("7") || m.TrustRegionName.StartsWith("8") || m.TrustRegionName.StartsWith("9")); break;
				case "abcde": ls = ls.Where(m => m.TrustRegionName.StartsWith("a") || m.TrustRegionName.StartsWith("b") || m.TrustRegionName.StartsWith("c") || m.TrustRegionName.StartsWith("d") || m.TrustRegionName.StartsWith("e")); break;
				case "fghij": ls = ls.Where(m => m.TrustRegionName.StartsWith("f") || m.TrustRegionName.StartsWith("g") || m.TrustRegionName.StartsWith("h") || m.TrustRegionName.StartsWith("i") || m.TrustRegionName.StartsWith("j")); break;
				case "klmn": ls = ls.Where(m => m.TrustRegionName.StartsWith("k") || m.TrustRegionName.StartsWith("l") || m.TrustRegionName.StartsWith("m") || m.TrustRegionName.StartsWith("n")); break;
				case "opqr": ls = ls.Where(m => m.TrustRegionName.StartsWith("o") || m.TrustRegionName.StartsWith("p") || m.TrustRegionName.StartsWith("q") || m.TrustRegionName.StartsWith("r")); break;
				case "stuv": ls = ls.Where(m => m.TrustRegionName.StartsWith("s") || m.TrustRegionName.StartsWith("t") || m.TrustRegionName.StartsWith("u") || m.TrustRegionName.StartsWith("v")); break;
				case "wxyz": ls = ls.Where(m => m.TrustRegionName.StartsWith("w") || m.TrustRegionName.StartsWith("x") || m.TrustRegionName.StartsWith("y") || m.TrustRegionName.StartsWith("z")); break;
			}
			if (!include)
			{
				ls = ls.Where(m => m.TrustRegionIsActive == 1);
			}
			totalPage = (int)Math.Ceiling(((double)ls.Count() / PageSize));
			page = (page > totalPage ? totalPage : page);
			page = (page < 1 ? 1 : page);
			return ls.Skip((page - 1) * PageSize).Take(PageSize);
        }

        public TrustRegion GetDetail(int TrustRegionID)
        {
			var org = dataAccess.TrustRegions.Where(m => m.TrustRegionID == TrustRegionID).SingleOrDefault();
            return org;

        }
        //insert
        public void Insert(TrustRegion newOrg)
        {
            dataAccess.TrustRegions.InsertOnSubmit(newOrg);
            dataAccess.SubmitChanges();
        }
        //update
        public void Update()
        {
            dataAccess.SubmitChanges();
        }
		public void MarkActive(int TrustRegionID, bool IsAvtivate)
		{
			var ser = dataAccess.TrustRegions.SingleOrDefault(m => m.TrustRegionID == TrustRegionID);
			ser.TrustRegionIsActive = (IsAvtivate ? 1 : 0);
			dataAccess.SubmitChanges();
		}
    }
}