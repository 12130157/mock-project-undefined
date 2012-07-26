using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Globalization;

namespace ServiceDirectoryTemplate.Models
{
	public class ReferenceItem
	{
		public int Id;
		public string Text;
	}
	public class PremiseItem
	{
		public int Id;
		public string Text;
	}
	public class PremiseModel
	{
		ServiceDirectoryDataContext _db = new ServiceDirectoryDataContext();
		public int PageSize = 15;
		public bool CheckUnique(string name, int? id = null, string PremiseAddr1 = "", string PostCode = "")
		{
			var re = _db.Premises.Where(m => m.LocationName == name);
			if (PremiseAddr1 != "")
				re = re.Where(m => m.PremiseAddr1 == PremiseAddr1);
			if (PostCode != "")
				re = re.Where(m => m.PremisePostCode == PostCode);
			if (id != null)
				re = re.Where(m => m.PremiseID != id);
			if (re.Count() == 0)
				return true;
			return false;
		}
		public Premise GetDetail(int PremiseId)
		{
			var pre = _db.Premises.Where(m => m.PremiseID == PremiseId).SingleOrDefault();
			return pre;
		}
		public PremiseDetail GetPremiseDetail(int PremiseId)
		{
			var pre = _db.PremiseDetails.Where(m => m.PremiseID == PremiseId).SingleOrDefault();
			return pre;
		}
		public PermiseDetailForCost GetPermiseDetailForCost(int PremiseId)
		{
			var pre = _db.PermiseDetailForCosts.Where(m => m.PermiseID == PremiseId).SingleOrDefault();
			return pre;
		}
		public PremiseOpenSchedule GetPermiseOpenSchedule (int PremiseId)
		{
			var pre = _db.PremiseOpenSchedules.Where(m => m.PremiseID == PremiseId).SingleOrDefault();
			return pre;
		}
		public IEnumerable<Premise> ListPremise(out int totalPage, int page = 1, string filter = "all", bool include = false)
		{
			var ls = (from pre in _db.Premises select pre);
			switch (filter)
			{
				case "all": break;
				case "0-9": ls = ls.Where(m => m.LocationName.StartsWith("0") || m.LocationName.StartsWith("1") || m.LocationName.StartsWith("2") || m.LocationName.StartsWith("3") || m.LocationName.StartsWith("4") || m.LocationName.StartsWith("5") || m.LocationName.StartsWith("6") || m.LocationName.StartsWith("7") || m.LocationName.StartsWith("8") || m.LocationName.StartsWith("9")); break;
				case "abcde": ls = ls.Where(m => m.LocationName.StartsWith("a") || m.LocationName.StartsWith("b") || m.LocationName.StartsWith("c") || m.LocationName.StartsWith("d") || m.LocationName.StartsWith("e")); break;
				case "fghij": ls = ls.Where(m => m.LocationName.StartsWith("f") || m.LocationName.StartsWith("g") || m.LocationName.StartsWith("h") || m.LocationName.StartsWith("i") || m.LocationName.StartsWith("j")); break;
				case "klmn": ls = ls.Where(m => m.LocationName.StartsWith("k") || m.LocationName.StartsWith("l") || m.LocationName.StartsWith("m") || m.LocationName.StartsWith("n")); break;
				case "opqr": ls = ls.Where(m => m.LocationName.StartsWith("o") || m.LocationName.StartsWith("p") || m.LocationName.StartsWith("q") || m.LocationName.StartsWith("r")); break;
				case "stuv": ls = ls.Where(m => m.LocationName.StartsWith("s") || m.LocationName.StartsWith("t") || m.LocationName.StartsWith("u") || m.LocationName.StartsWith("v")); break;
				case "wxyz": ls = ls.Where(m => m.LocationName.StartsWith("w") || m.LocationName.StartsWith("x") || m.LocationName.StartsWith("y") || m.LocationName.StartsWith("z")); break;
			}
			if (!include)
			{
				ls = ls.Where(m => m.PremiseIsActive == 1);
			}
			totalPage = (int)Math.Ceiling(((double)ls.Count() / PageSize));
			page = (page > totalPage ? totalPage : page);
			page = (page < 1 ? 1 : page);
			return ls.Skip((page - 1) * PageSize).Take(PageSize);
		}
		public void MarkActive(int PreID, bool IsAvtivate)
		{
			var pre = _db.Premises.SingleOrDefault(m => m.PremiseID == PreID);
			pre.PremiseIsActive = (IsAvtivate ? 1 : 0);
			_db.SubmitChanges();
		}
		public bool CreatePremise(Premise pre, PremiseDetail detail, PermiseDetailForCost cost, PremiseOpenSchedule open)
		{
			try
			{
				_db.Premises.InsertOnSubmit(pre);
				_db.SubmitChanges();
				detail.PremiseID = pre.PremiseID;
				cost.PermiseID = pre.PremiseID;
				open.PremiseID = pre.PremiseID;
				_db.PremiseDetails.InsertOnSubmit(detail);
				_db.PermiseDetailForCosts.InsertOnSubmit(cost);
				_db.PremiseOpenSchedules.InsertOnSubmit(open);
				_db.SubmitChanges();
				
				return true;
			}
			catch
			{
				return false;
			}
		}
		
		public IEnumerable<ReferenceItem> ListLocationType()
		{
			var ls = from refe in _db.ReferenceDatas
					 where refe.RefName == "Location Type"
					 select new ReferenceItem
					 {
						 Id = refe.RefValue,
						 Text = refe.RefText
					 };
			return ls;
		}
		public IEnumerable<ReferenceItem> ListAccreditaion()
		{
			var ls = from refe in _db.ReferenceDatas
					 where refe.RefName == "Accreditation" && refe.RefFrom=="PremiseDetail2"
					 select new ReferenceItem
					 {
						 Id = refe.RefValue,
						 Text = refe.RefText
					 };
			return ls;
		}
		public IEnumerable<ReferenceItem> ListDemographic()
		{
			var ls = from refe in _db.ReferenceDatas
					 where refe.RefName == "Local Demographic Issues" && refe.RefFrom == "PremiseDetail2"
					 select new ReferenceItem
					 {
						 Id = refe.RefValue,
						 Text = refe.RefText
					 };
			return ls;
		}
		public IEnumerable<ReferenceItem> ListISNetwork()
		{
			var ls = from refe in _db.ReferenceDatas
					 where refe.RefFrom == "PremiseDetail2" && refe.RefName == "IS/Network" 
					 select new ReferenceItem
					 {
						 Id = refe.RefValue,
						 Text = refe.RefText
					 };
			return ls;
		}
		public void Update()
		{
			_db.SubmitChanges();
		}

		public IEnumerable<PremiseItem> ListPermise(string p)
		{
			var refData = (from refe in _db.ReferenceDatas
					   where refe.RefFrom=="PremiseDetail1" && refe.RefText == p
					   select new ReferenceItem
						   {
							   Id = refe.RefValue,
							   Text = refe.RefText
						   }).SingleOrDefault();
			var ls = from pre in _db.Premises
					 where pre.RefListID.Contains("," + refData.Text + ",")
					 select new PremiseItem
						 {
							 Id=pre.PremiseID,
							 Text=pre.LocationName
						 };
			return ls;
		}
		public IEnumerable<Premise> GetList(out int totalPage, int page = 1, string filter = "all", bool include = false)
		{
			var ls = from pre in _db.Premises
					 select pre;
			switch (filter)
			{
				case "all": break;
				case "0-9": ls = ls.Where(m => m.LocationName.StartsWith("0") || m.LocationName.StartsWith("1") || m.LocationName.StartsWith("2") || m.LocationName.StartsWith("3") || m.LocationName.StartsWith("4") || m.LocationName.StartsWith("5") || m.LocationName.StartsWith("6") || m.LocationName.StartsWith("7") || m.LocationName.StartsWith("8") || m.LocationName.StartsWith("9")); break;
				case "abcde": ls = ls.Where(m => m.LocationName.StartsWith("a") || m.LocationName.StartsWith("b") || m.LocationName.StartsWith("c") || m.LocationName.StartsWith("d") || m.LocationName.StartsWith("e")); break;
				case "fghij": ls = ls.Where(m => m.LocationName.StartsWith("f") || m.LocationName.StartsWith("g") || m.LocationName.StartsWith("h") || m.LocationName.StartsWith("i") || m.LocationName.StartsWith("j")); break;
				case "klmn": ls = ls.Where(m => m.LocationName.StartsWith("k") || m.LocationName.StartsWith("l") || m.LocationName.StartsWith("m") || m.LocationName.StartsWith("n")); break;
				case "opqr": ls = ls.Where(m => m.LocationName.StartsWith("o") || m.LocationName.StartsWith("p") || m.LocationName.StartsWith("q") || m.LocationName.StartsWith("r")); break;
				case "stuv": ls = ls.Where(m => m.LocationName.StartsWith("s") || m.LocationName.StartsWith("t") || m.LocationName.StartsWith("u") || m.LocationName.StartsWith("v")); break;
				case "wxyz": ls = ls.Where(m => m.LocationName.StartsWith("w") || m.LocationName.StartsWith("x") || m.LocationName.StartsWith("y") || m.LocationName.StartsWith("z")); break;
			}
			if (!include)
			{
				ls = ls.Where(m => m.PremiseIsActive == 1);
			}
			totalPage = (int)Math.Ceiling(((double)ls.Count() / PageSize));
			page = (page > totalPage ? totalPage : page);
			page = (page < 1 ? 1 : page);
			return ls.Skip((page - 1) * PageSize).Take(PageSize);
		}
		public DateTime? ConvertDate(string s, string format)
		{
			DateTime temp;
			CultureInfo enUS = new CultureInfo("en-US");
			if (DateTime.TryParseExact(s, format, enUS, DateTimeStyles.None, out temp))
				return temp;
			return null;
		}

		public IEnumerable<PremiseLinkService> ListService(int PremiseID, out int totalPage, int page=1)
		{
			var ls = from link in _db.PremiseLinkServices
					 where link.PremiseID == PremiseID 
					 select link;
			totalPage = (int)Math.Ceiling(((double)ls.Count() / PageSize));
			page = (page > totalPage ? totalPage : page);
			page = (page < 1 ? 1 : page);
			return ls.Skip((page - 1) * PageSize).Take(PageSize);
		}
		public IEnumerable<Service> ListServiceNotLink(int PremiseID, out int totalPage, int page = 1, string filter = "all")
		{
			var list = from link in _db.PremiseLinkServices
					   where link.PremiseID == PremiseID
					   select new
					   {
						   ServiceID = link.ServiceID
					   };
			List<int> lsID = new List<int>();
			foreach (var item in list)
			{
				lsID.Add(item.ServiceID);
			}
			var ls = from ser in _db.Services
					 where !lsID.Contains(ser.SerID) && ser.SerIsActive == 1
					 select ser;
			switch (filter)
			{
				case "all": break;
				case "0-9": ls = ls.Where(m => m.SerName.StartsWith("0") || m.SerName.StartsWith("1") || m.SerName.StartsWith("2") || m.SerName.StartsWith("3") || m.SerName.StartsWith("4") || m.SerName.StartsWith("5") || m.SerName.StartsWith("6") || m.SerName.StartsWith("7") || m.SerName.StartsWith("8") || m.SerName.StartsWith("9")); break;
				case "abcde": ls = ls.Where(m => m.SerName.StartsWith("a") || m.SerName.StartsWith("b") || m.SerName.StartsWith("c") || m.SerName.StartsWith("d") || m.SerName.StartsWith("e")); break;
				case "fghij": ls = ls.Where(m => m.SerName.StartsWith("f") || m.SerName.StartsWith("g") || m.SerName.StartsWith("h") || m.SerName.StartsWith("i") || m.SerName.StartsWith("j")); break;
				case "klmn": ls = ls.Where(m => m.SerName.StartsWith("k") || m.SerName.StartsWith("l") || m.SerName.StartsWith("m") || m.SerName.StartsWith("n")); break;
				case "opqr": ls = ls.Where(m => m.SerName.StartsWith("o") || m.SerName.StartsWith("p") || m.SerName.StartsWith("q") || m.SerName.StartsWith("r")); break;
				case "stuv": ls = ls.Where(m => m.SerName.StartsWith("s") || m.SerName.StartsWith("t") || m.SerName.StartsWith("u") || m.SerName.StartsWith("v")); break;
				case "wxyz": ls = ls.Where(m => m.SerName.StartsWith("w") || m.SerName.StartsWith("x") || m.SerName.StartsWith("y") || m.SerName.StartsWith("z")); break;
			}
			totalPage = (int)Math.Ceiling((double)ls.Count() / PageSize);
			page = (page > totalPage ? totalPage : page);
			page = (page < 1 ? 1 : page);
			return ls.Skip((page - 1) * PageSize).Take(PageSize);
		}
		public void AddServiceLink(int PreID, string lsID)
		{
			var ls = lsID.Split(',');
			foreach (var item in ls)
			{
				var link = _db.PremiseLinkServices.Where(m => m.PremiseID == PreID && m.PremiseID.ToString() == item).SingleOrDefault();
				if (link == null)
				{
					var ser = _db.Services.Where(m => m.SerID.ToString() == item).SingleOrDefault();
					if (ser != null)
					{
						var newLink = new PremiseLinkService();
						newLink.PremiseID = PreID;
						newLink.ServiceID = ser.SerID;
						_db.PremiseLinkServices.InsertOnSubmit(newLink);
						_db.SubmitChanges();
					}
				}
			}
		}
		public void RemoveServiceLink(int LinkID)
		{
			var pre = _db.PremiseLinkServices.Where(m => m.LinkID == LinkID).SingleOrDefault();
			_db.PremiseLinkServices.DeleteOnSubmit(pre);
			_db.SubmitChanges();
		}
	}
}