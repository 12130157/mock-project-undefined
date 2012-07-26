using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections.ObjectModel;

namespace ServiceDirectoryTemplate.Models
{
	public class ServiceItem
	{
		public int SerID;
		public string SerName;
	}
	public class ProgrammeItem
	{
		public int ProID;
		public string ProName;
	}
    public class OrganisationModel
    {
		private ServiceDirectoryDataContext _db = new ServiceDirectoryDataContext();
		public int PageSize = 15;
        //list
		public bool CheckUnique(string name, int? id=null)
		{
			var re = _db.Organisations.Where(m => m.OrgName == name);
			if (id != null)
				re = re.Where(m => m.OrgID != id);
			if (re.Count() == 0)
				return true;
			return false;
		}
		public IEnumerable<Organisation> GetList(out int totalPage, int page = 1, string filter = "all", bool include = false)
        {
            var ls = from org in _db.Organisations
                                   select org;
			switch (filter)
			{
				case "all": break;
				case "0-9": ls = ls.Where(m => m.OrgName.StartsWith("0") || m.OrgName.StartsWith("1") || m.OrgName.StartsWith("2") || m.OrgName.StartsWith("3") || m.OrgName.StartsWith("4") || m.OrgName.StartsWith("5") || m.OrgName.StartsWith("6") || m.OrgName.StartsWith("7") || m.OrgName.StartsWith("8") || m.OrgName.StartsWith("9")); break;
				case "abcde": ls = ls.Where(m => m.OrgName.StartsWith("a") || m.OrgName.StartsWith("b") || m.OrgName.StartsWith("c") || m.OrgName.StartsWith("d") || m.OrgName.StartsWith("e")); break;
				case "fghij": ls = ls.Where(m => m.OrgName.StartsWith("f") || m.OrgName.StartsWith("g") || m.OrgName.StartsWith("h") || m.OrgName.StartsWith("i") || m.OrgName.StartsWith("j")); break;
				case "klmn": ls = ls.Where(m => m.OrgName.StartsWith("k") || m.OrgName.StartsWith("l") || m.OrgName.StartsWith("m") || m.OrgName.StartsWith("n")); break;
				case "opqr": ls = ls.Where(m => m.OrgName.StartsWith("o") || m.OrgName.StartsWith("p") || m.OrgName.StartsWith("q") || m.OrgName.StartsWith("r")); break;
				case "stuv": ls = ls.Where(m => m.OrgName.StartsWith("s") || m.OrgName.StartsWith("t") || m.OrgName.StartsWith("u") || m.OrgName.StartsWith("v")); break;
				case "wxyz": ls = ls.Where(m => m.OrgName.StartsWith("w") || m.OrgName.StartsWith("x") || m.OrgName.StartsWith("y") || m.OrgName.StartsWith("z")); break;
			}
			if (!include)
			{
				ls = ls.Where(m => m.OrgIsActive == 1);
			}
			totalPage = (int)Math.Ceiling(((double)ls.Count() / PageSize));
			page = (page > totalPage ? totalPage : page);
			page = (page < 1 ? 1 : page);
			return ls.Skip((page - 1) * PageSize).Take(PageSize);
        }
        
        public Organisation GetDetail(int orgID)
        {
            var org = (from orgList in _db.Organisations
                       where orgList.OrgID == orgID
                       select orgList).Single();
            return org;

        }
		public IEnumerable<ServiceItem> ListService()
		{
			var ls = from ser in _db.Services
					 where ser.SerIsActive==1
					 select new ServiceItem
						 {
							 SerID=ser.SerID,
							 SerName=ser.SerName
						 };
			return ls;
		}
		public IEnumerable<ProgrammeItem> ListProgramme()
		{
			var ls = from pro in _db.Programmes
					 where pro.ProgrammeIsActivate==1
					 select new ProgrammeItem
						 {
							 ProID=pro.ProgrammeID,
							 ProName=pro.ProgrammeName
						 };
			return ls;
		}
		//insert
        public void Insert(Organisation newOrg)
        {
            _db.Organisations.InsertOnSubmit(newOrg);
            _db.SubmitChanges();
        }
        //update
        public void Update()
        {
            _db.SubmitChanges();
        }
		public void MarkActive(int OrgID, bool IsAvtivate)
		{
			var ser = _db.Organisations.SingleOrDefault(m => m.OrgID == OrgID);
			ser.OrgIsActive = (IsAvtivate ? 1 : 0);
			_db.SubmitChanges();
		}
		public void AddLinkService(int OrgID, string lsID)
		{
			if(lsID==""||lsID==null)
				return;
			var ls = lsID.Split(',');
			var listSerID = new List<string>();
			// Get old link list aready have in system
			var ls1=from m in _db.OrganisationLinkServices where m.OrgID==OrgID select m;
			var delList = new Dictionary<int,int>();
			// push this list in oldList
			foreach (var item in ls1)
			{
				delList.Add(item.LinkID, item.SerID);
			}
			foreach (var id in ls)
			{
				// if not have, add the new link
				// else remove from the delete link
				var ser = _db.Services.Where(m => m.SerID.ToString() == id).SingleOrDefault();
				if (ser != null)
				{
					// if this link don't exist yet, Add new
					var link = _db.OrganisationLinkServices.Where(m => m.SerID.ToString() == id && m.OrgID == OrgID).SingleOrDefault();
					if (link == null)
					{
						var newLink = new OrganisationLinkService();
						newLink.OrgID = OrgID;
						newLink.SerID = ser.SerID;
						newLink.Role = "";
						_db.OrganisationLinkServices.InsertOnSubmit(newLink);
						_db.SubmitChanges();
					}
					else
						delList.Remove(link.LinkID);
				}
			}
			
			// all old rest must delete
			foreach (var del in delList)
			{
				var oldLink = _db.OrganisationLinkServices.Where(m => m.LinkID == del.Key).SingleOrDefault();
				_db.OrganisationLinkServices.DeleteOnSubmit(oldLink);
			}
			_db.SubmitChanges();
		}
    }
}