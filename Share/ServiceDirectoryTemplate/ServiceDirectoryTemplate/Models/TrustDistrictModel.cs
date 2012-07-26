using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections.ObjectModel;

namespace ServiceDirectoryTemplate.Models
{
    public class TrustDistrictModel
    {
        ServiceDirectoryDataContext dataAccess = new ServiceDirectoryDataContext();
		public int PageSize = 15;
        //list
		public bool CheckUnique(int regionId, string name, int? id = null)
		{
			var re = dataAccess.TrustDistricts.Where(m => m.TrustDistrictName == name && m.TrustRegionID == regionId);
			if (id != null)
				re = re.Where(m => m.TrustDistrictID != id);
			if (re.Count() == 0)
				return true;
			return false;
		}
		public IEnumerable<TrustDistrict> GetList(int TrustRegionID, out int totalPage, int page = 1, string filter = "all", bool include = false)
        {
            var ls = from supportM in dataAccess.TrustDistricts
                                  where supportM.TrustRegionID == TrustRegionID
                                  select supportM;

			switch (filter)
			{
				case "all": break;
				case "0-9": ls = ls.Where(m => m.TrustDistrictName.StartsWith("0") || m.TrustDistrictName.StartsWith("1") || m.TrustDistrictName.StartsWith("2") || m.TrustDistrictName.StartsWith("3") || m.TrustDistrictName.StartsWith("4") || m.TrustDistrictName.StartsWith("5") || m.TrustDistrictName.StartsWith("6") || m.TrustDistrictName.StartsWith("7") || m.TrustDistrictName.StartsWith("8") || m.TrustDistrictName.StartsWith("9")); break;
				case "abcde": ls = ls.Where(m => m.TrustDistrictName.StartsWith("a") || m.TrustDistrictName.StartsWith("b") || m.TrustDistrictName.StartsWith("c") || m.TrustDistrictName.StartsWith("d") || m.TrustDistrictName.StartsWith("e")); break;
				case "fghij": ls = ls.Where(m => m.TrustDistrictName.StartsWith("f") || m.TrustDistrictName.StartsWith("g") || m.TrustDistrictName.StartsWith("h") || m.TrustDistrictName.StartsWith("i") || m.TrustDistrictName.StartsWith("j")); break;
				case "klmn": ls = ls.Where(m => m.TrustDistrictName.StartsWith("k") || m.TrustDistrictName.StartsWith("l") || m.TrustDistrictName.StartsWith("m") || m.TrustDistrictName.StartsWith("n")); break;
				case "opqr": ls = ls.Where(m => m.TrustDistrictName.StartsWith("o") || m.TrustDistrictName.StartsWith("p") || m.TrustDistrictName.StartsWith("q") || m.TrustDistrictName.StartsWith("r")); break;
				case "stuv": ls = ls.Where(m => m.TrustDistrictName.StartsWith("s") || m.TrustDistrictName.StartsWith("t") || m.TrustDistrictName.StartsWith("u") || m.TrustDistrictName.StartsWith("v")); break;
				case "wxyz": ls = ls.Where(m => m.TrustDistrictName.StartsWith("w") || m.TrustDistrictName.StartsWith("x") || m.TrustDistrictName.StartsWith("y") || m.TrustDistrictName.StartsWith("z")); break;
			}
			if (!include)
			{
				ls = ls.Where(m => m.TrustDistrictIsActive == 1);
			}
			totalPage = (int)Math.Ceiling(((double)ls.Count() / PageSize));
			page = (page > totalPage ? totalPage : page);
			page = (page < 1 ? 1 : page);
			return ls.Skip((page - 1) * PageSize).Take(PageSize);
        }

        public TrustDistrict GetDetail(int TrustDistrictID)
        {
            var org = (from orgList in dataAccess.TrustDistricts
                       where orgList.TrustDistrictID == TrustDistrictID
                       select orgList).Single();
            return org;

        }
        //insert
        public void Insert(TrustDistrict newOrg)
        {
            dataAccess.TrustDistricts.InsertOnSubmit(newOrg);
            dataAccess.SubmitChanges();
        }
        //update
        public void Update()
        {
            dataAccess.SubmitChanges();
        }
		public void MarkActive(int TrustDistrictID, bool IsAvtivate)
		{
			var ser = dataAccess.TrustDistricts.SingleOrDefault(m => m.TrustDistrictID == TrustDistrictID);
			ser.TrustDistrictIsActive = (IsAvtivate ? 1 : 0);
			dataAccess.SubmitChanges();
		}
    }
}