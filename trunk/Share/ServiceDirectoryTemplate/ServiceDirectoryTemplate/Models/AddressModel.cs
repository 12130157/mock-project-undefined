using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ServiceDirectoryTemplate.Models
{
	public class AddressModel
	{
		private ServiceDirectoryDataContext _db = new ServiceDirectoryDataContext();
		public int PageSize = 15;
		public bool AddressIsNew(string Address1, string PostCode, int? CountryID, string Town, string County)
		{
			var addr = _db.Addresses.Where(m=>m.Address1==Address1&& m.PostCode==PostCode
				&& m.CountryID==CountryID&& m.Town.TownName==Town&& m.County.CountyName==County);
			if (addr.Count() == 0)
				return true;
			return false;
		}
		public bool AddAddress(string Address1, string PostCode, int? CountryID, string Town, string County )
		{
			try
			{
				var addr = new Address();
				// check town exits, if not add town
				if (Town != "")
				{
					var lsTown = _db.Towns.Where(m => m.TownName == Town && m.CountryID == CountryID);
					if (lsTown.Count() != 0)
					{
						addr.TownID = lsTown.First().TownID;
					}
					else
					{
						var town = new Town();
						town.TownName = Town;
						town.CountryID = CountryID;
						var re = CreateTown(town);
						if (re == false)
							return false;
						addr.TownID = town.TownID;
					}
				}
				
				// check county exits, if not add county
				if (County != "")
				{
					var lsCounty = _db.Counties.Where(m => m.CountyName == County && m.CountryID == CountryID);
					if (lsCounty.Count() != 0)
					{
						addr.CountyID = lsCounty.First().CountyID;
					}
					else
					{
						var county = new County();
						county.CountyName = County;
						county.CountryID = CountryID;
						var re = CreateCounty(county);
						if (re == false)
							return false;
						addr.CountyID = county.CountyID;
					}
				}
				addr.CountryID = CountryID;
				addr.PostCode = PostCode;
				addr.Address1 = Address1;
				CreateAddress(addr);
				return true;
			}
			catch
			{
				return false;
			}
		}
		public bool CreateTown(Town town)
		{
			try
			{
				_db.Towns.InsertOnSubmit(town);
				_db.SubmitChanges();
				return true;
			}
			catch
			{
				return false;
			}
		}
		public bool CreateCounty(County county)
		{
			try
			{
				_db.Counties.InsertOnSubmit(county);
				_db.SubmitChanges();
				return true;
			}
			catch
			{
				return false;
			}
		}
		public bool CreateAddress(Address addr)
		{
			try
			{
				_db.Addresses.InsertOnSubmit(addr);
				_db.SubmitChanges();
				return true;
			}
			catch
			{
				return false;
			}
		}
		public IEnumerable<Address> SearchAddress(out int totalPage,string PostCode = "", string Street = "", string Town = "", int page = 1)
		{
			var ls = from addr in _db.Addresses select addr;
			if(PostCode!="")
				ls = ls.Where(m => m.PostCode.Contains(PostCode.Trim()));
			if (Street != "")
				ls = ls.Where(m => m.Address1.Contains(Street.Trim()));
			if (Town != "")
				ls = ls.Where(m => m.Town.TownName.Contains(Town.Trim()));
			totalPage = (int)Math.Ceiling(((double)ls.Count() / PageSize));
			page = (page > totalPage ? totalPage : page);
			page = (page < 1 ? 1 : page);
			return ls.Skip((page - 1) * PageSize).Take(PageSize);
		}
	}
}