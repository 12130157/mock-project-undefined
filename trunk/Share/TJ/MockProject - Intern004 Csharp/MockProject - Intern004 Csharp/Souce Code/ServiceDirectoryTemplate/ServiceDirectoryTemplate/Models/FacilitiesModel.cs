using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ServiceDirectoryTemplate.Models
{
	public class FacTypeItem
	{
		public int Id;
		public string Type;
	}
	public class FacilitiesModel
	{
		private ServiceDirectoryDataContext _db = new ServiceDirectoryDataContext();
		public int PageSize = 15;
		public IEnumerable<Facility> GetList(out int totalPage, int PremiseId, int page = 1, string filter = "all", bool include = false)
		{
			var ls = from fac in _db.Facilities
					 where fac.PremiseID == PremiseId
					 select fac;

			switch (filter)
			{
				case "all": break;
				case "0-9": ls = ls.Where(m => m.FacilityType.StartsWith("0") || m.FacilityType.StartsWith("1") || m.FacilityType.StartsWith("2") || m.FacilityType.StartsWith("3") || m.FacilityType.StartsWith("4") || m.FacilityType.StartsWith("5") || m.FacilityType.StartsWith("6") || m.FacilityType.StartsWith("7") || m.FacilityType.StartsWith("8") || m.FacilityType.StartsWith("9")); break;
				case "abcde": ls = ls.Where(m => m.FacilityType.StartsWith("a") || m.FacilityType.StartsWith("b") || m.FacilityType.StartsWith("c") || m.FacilityType.StartsWith("d") || m.FacilityType.StartsWith("e")); break;
				case "fghij": ls = ls.Where(m => m.FacilityType.StartsWith("f") || m.FacilityType.StartsWith("g") || m.FacilityType.StartsWith("h") || m.FacilityType.StartsWith("i") || m.FacilityType.StartsWith("j")); break;
				case "klmn": ls = ls.Where(m => m.FacilityType.StartsWith("k") || m.FacilityType.StartsWith("l") || m.FacilityType.StartsWith("m") || m.FacilityType.StartsWith("n")); break;
				case "opqr": ls = ls.Where(m => m.FacilityType.StartsWith("o") || m.FacilityType.StartsWith("p") || m.FacilityType.StartsWith("q") || m.FacilityType.StartsWith("r")); break;
				case "stuv": ls = ls.Where(m => m.FacilityType.StartsWith("s") || m.FacilityType.StartsWith("t") || m.FacilityType.StartsWith("u") || m.FacilityType.StartsWith("v")); break;
				case "wxyz": ls = ls.Where(m => m.FacilityType.StartsWith("w") || m.FacilityType.StartsWith("x") || m.FacilityType.StartsWith("y") || m.FacilityType.StartsWith("z")); break;
			}
			if (!include)
			{
				ls = ls.Where(m => m.FacilityIsActive == 1);
			}
			totalPage = (int)Math.Ceiling(((double)ls.Count() / PageSize));
			page = (page > totalPage ? totalPage : page);
			page = (page < 1 ? 1 : page);
			return ls.Skip((page - 1) * PageSize).Take(PageSize);
		}
		public Facility GetDetail(int FacilityId)
		{
			var fac = _db.Facilities.Where(m => m.FacilityID == FacilityId).SingleOrDefault();
			return fac;

		}
		//insert
		public void Insert(Facility facility)
		{
			_db.Facilities.InsertOnSubmit(facility);
			_db.SubmitChanges();
		}
		//update
		public void Update()
		{
			_db.SubmitChanges();
		}
		public void MarkActive(int FacilityId, bool IsAvtivate)
		{
			var fac = _db.Facilities.SingleOrDefault(m => m.FacilityID == FacilityId);
			fac.FacilityIsActive = (IsAvtivate ? 1 : 0);
			_db.SubmitChanges();
		}
		public IEnumerable<FacTypeItem> ListFacilityType()
		{
			var ls = from refe in _db.ReferenceDatas
					 where refe.RefFrom == "FacilityDetail1" && refe.RefName == "Facility Type"
					 select new FacTypeItem
					 {
						 Id=refe.RefValue,
						 Type=refe.RefText
					 };
			return ls;
		}
		public IEnumerable<FacTypeItem> ListConnectivityType()
		{
			var ls = from refe in _db.ReferenceDatas
					 where refe.RefFrom == "FacilityDetail1" && refe.RefName == "Connectivity Type"
					 select new FacTypeItem
					 {
						 Id = refe.RefValue,
						 Type = refe.RefText
					 };
			return ls;
		}
	}
}