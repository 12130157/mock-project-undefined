using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;

namespace ServiceDirectoryTemplate.Models
{
	public class SerItem
	{
		public int ServiceID;
		public string ServiceName;
	}
	public class ProItem
	{
		public int ProgrammeID;
		public string ProgrammeName;
	}
	public class ServiceModel
	{
		private ServiceDirectoryDataContext _db=new ServiceDirectoryDataContext();
		private readonly int PageSize = 15;
		public bool CheckUnique(string name, int? id = null)
		{
			var re = _db.Services.Where(m => m.SerName == name);
			if (id != null)
				re = re.Where(m => m.SerID != id);
			if (re.Count() == 0)
				return true;
			return false;
		}
		public Service GetService(int id)
		{
			var ser = _db.Services.SingleOrDefault(m=>m.SerID==id);
			
			return ser;
		}
		public IEnumerable<Service> ListService(out int totalPage, int page = 1, string filter = "all", bool include = false)
		{
			
			var ls = (from ser in _db.Services select ser);
			switch (filter)
			{
				case "all": break;
				case "0-9": ls=ls.Where(m => m.SerName.StartsWith("0") || m.SerName.StartsWith("1") || m.SerName.StartsWith("2") || m.SerName.StartsWith("3") || m.SerName.StartsWith("4") || m.SerName.StartsWith("5") || m.SerName.StartsWith("6") || m.SerName.StartsWith("7") || m.SerName.StartsWith("8") || m.SerName.StartsWith("9")); break;
				case "abcde": ls=ls.Where(m => m.SerName.StartsWith("a") || m.SerName.StartsWith("b") || m.SerName.StartsWith("c") || m.SerName.StartsWith("d") || m.SerName.StartsWith("e")); break;
				case "fghij": ls=ls.Where(m => m.SerName.StartsWith("f") || m.SerName.StartsWith("g") || m.SerName.StartsWith("h") || m.SerName.StartsWith("i") || m.SerName.StartsWith("j")); break;
				case "klmn": ls=ls.Where(m => m.SerName.StartsWith("k") || m.SerName.StartsWith("l") || m.SerName.StartsWith("m") || m.SerName.StartsWith("n")); break;
				case "opqr": ls=ls.Where(m => m.SerName.StartsWith("o") || m.SerName.StartsWith("p") || m.SerName.StartsWith("q") || m.SerName.StartsWith("r")); break;
				case "stuv": ls=ls.Where(m => m.SerName.StartsWith("s") || m.SerName.StartsWith("t") || m.SerName.StartsWith("u") || m.SerName.StartsWith("v")); break;
				case "wxyz": ls=ls.Where(m => m.SerName.StartsWith("w") || m.SerName.StartsWith("x") || m.SerName.StartsWith("y") || m.SerName.StartsWith("z")); break;
			}
			if (!include) 
			{
				ls = ls.Where(m => m.SerIsActive == 1);
			}
			totalPage = (int)Math.Ceiling(((double)ls.Count()/PageSize));
			page = (page > totalPage ? totalPage : page);
			page = (page < 1 ? 1 : page);
			return ls.Skip((page - 1) * PageSize).Take(PageSize);
		}
		public IEnumerable<OrganisationLinkService> ListOrganisation(int ServiceID,out int totalPage, int page = 1)
		{
			var ls = from link in _db.OrganisationLinkServices
					 where link.SerID == ServiceID && link.Organisation.OrgIsActive==1
					 select link;
			//var query = _db.Organisations.Join(_db.OrganisationLinkServices, org => org.OrgID, link => link.OrgID,
			//    (org, link) => new ServiceLinkOrganisation { 
			//        OrgID = org.OrgID, 
			//        SerID = link.SerID,
			//        OrgName = org.OrgName,
			//        OrgShortDescription = org.OrgShortDescription, 
			//        Role = link.Role,
			//        IsActivate=org.OrgIsActive
			//    });
			
			totalPage = (int)Math.Ceiling((double)ls.Count() / PageSize);
			page = (page > totalPage ? totalPage : page);
			page = (page < 1 ? 1 : page);
			return ls.Skip((page - 1) * PageSize).Take(PageSize);
		}
		public IEnumerable<PremiseLinkService> ListPremiseLink(int SerID, out int totalPage, int page = 1)
		{
			var ls = from link in _db.PremiseLinkServices
					 where link.ServiceID == SerID && link.Premise.PremiseIsActive == 1
					 select link;
			totalPage = (int)Math.Ceiling((double)ls.Count() / PageSize);
			page = (page > totalPage ? totalPage : page);
			page = (page < 1 ? 1 : page);
			return ls.Skip((page - 1) * PageSize).Take(PageSize);
		}
		public IEnumerable<Premise> ListPremiseNotLink(int SerID, out int totalPage, int page = 1, string filter = "all")
		{
			var list = from link in _db.PremiseLinkServices
					   where link.ServiceID == SerID
					   select new 
						   {
							   PremiseID = link.PremiseID
						   };
			List<int> lsID = new List<int>();
			foreach (var item in list)
			{
				lsID.Add(item.PremiseID);
			}
			var ls = from pre in _db.Premises
					 where !lsID.Contains(pre.PremiseID) && pre.PremiseIsActive == 1
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
			totalPage = (int)Math.Ceiling((double)ls.Count() / PageSize);
			page = (page > totalPage ? totalPage : page);
			page = (page < 1 ? 1 : page);
			return ls.Skip((page - 1) * PageSize).Take(PageSize);
		}
		public void AddPremiseLink(int SerID, string lsID) 
		{
			var ls=lsID.Split(',');
			foreach (var item in ls)
			{
				var link = _db.PremiseLinkServices.Where(m=>m.ServiceID==SerID&& m.PremiseID.ToString()==item).SingleOrDefault();
				if (link == null)
				{
					var pre = _db.Premises.Where(m=>m.PremiseID.ToString()==item).SingleOrDefault();
					if(pre!=null)
					{
						var newLink=new PremiseLinkService();
						newLink.PremiseID = pre.PremiseID;
						newLink.ServiceID = SerID;
						_db.PremiseLinkServices.InsertOnSubmit(newLink);
						_db.SubmitChanges();
					}
				}
			}
		}
		public bool ValidService(Service ser)
		{
			return true;
		}
		public bool CreateService(Service ser)
		{
			try
			{
				_db.Services.InsertOnSubmit(ser);
				_db.SubmitChanges();
				return true;
			}
			catch 
			{
				return false;
			}
		}
		public void Update()
		{
			_db.SubmitChanges();
		}
		public bool CreateFunding(FundingDetail fund)
		{
			try
			{
				_db.FundingDetails.InsertOnSubmit(fund);
				_db.SubmitChanges();
				return true;
			}
			catch
			{
				return false;
			}
		}
		public void MarkActive(int SerID, bool IsAvtivate) 
		{
			var ser = _db.Services.SingleOrDefault(m => m.SerID == SerID);
			ser.SerIsActive = (IsAvtivate ? 1 : 0);
			_db.SubmitChanges();
		}
		public void EditRole(int LinkID, string role = null)
		{
			var link = _db.OrganisationLinkServices.SingleOrDefault(m => m.LinkID==LinkID);
			if(role!=null)
			{
				if (link != null)
				{
					link.Role = role;
				}
			}
			_db.SubmitChanges();
		}
		public void SetProjectCode(int LinkID, string code)
		{
			var link = _db.PremiseLinkServices.SingleOrDefault(m => m.LinkID == LinkID);
			if (link == null)
				return;
			else
				link.ProjectCode = code;

			_db.SubmitChanges();
		}
		public void NewPremiseLink(int SerID, int PremiseID)
		{
			_db.ExecuteQuery<PremiseLinkService>(String.Format("Insert into PremiseLinkService (ServiceID,PremiseID,ProjectCode) values ({0},{1},'')", SerID, PremiseID));
			_db.SubmitChanges();
		}
		public void RemovePremiseLink(int LinkID)
		{
			var pre=_db.PremiseLinkServices.Where(m=>m.LinkID==LinkID).SingleOrDefault();
			_db.PremiseLinkServices.DeleteOnSubmit(pre);
			_db.SubmitChanges();
		}
		public string GetProjectCode(int LinkID)
		{
			var link = _db.PremiseLinkServices.SingleOrDefault(m => m.LinkID == LinkID);
			return (link == null ? "" : link.ProjectCode);
		}
		public string GetRole(int LinkID)
		{
			var link = _db.OrganisationLinkServices.SingleOrDefault(m => m.LinkID == LinkID);
			return (link==null?"":link.Role);
		}
		public Contact GetContact(int id)
		{
			var con = _db.Contacts.SingleOrDefault(m => m.ContactID == id);

			return con;
		}
		public FundingDetail GetFunding(int id)
		{
			var fun = _db.FundingDetails.SingleOrDefault(m=> m.SerID==id);
			return fun;
		}
		public IEnumerable<SerItem> ListOtherService(int? ServiceID)
		{
			var ls = from ser in _db.Services
					 select new SerItem
					 {
						 ServiceID=ser.SerID,
						 ServiceName=ser.SerName
					 };
			if (ServiceID != null)
				ls = ls.Where(m => m.ServiceID != ServiceID);
			return ls;
		}
		public IEnumerable<ProItem> ListProgramme()
		{
			var ls = from pro in _db.Programmes
					 select new ProItem
					 {
						 ProgrammeID = pro.ProgrammeID,
						 ProgrammeName = pro.ProgrammeName
					 };
			return ls;
		}
		// ConvertDate to oldFormat (e.g. dd/MM/yyyy) to newFormat (e.g. yyyy-MM-dd)
		// return null if error
		public string ConvertDate(string s, string oldFormat, string newFormat)
		{
			DateTime temp;
			CultureInfo enUS = new CultureInfo("en-US");
			if (DateTime.TryParseExact(s, oldFormat, enUS, DateTimeStyles.None, out temp))
				return temp.ToString(newFormat);
			return null;
		}
		public DateTime? ConvertDate(string s, string format)
		{
			DateTime temp;
			CultureInfo enUS = new CultureInfo("en-US");
			if (DateTime.TryParseExact(s, format, enUS, DateTimeStyles.None, out temp))
				return temp;
			return null;
		}

	}
}