using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Globalization;

namespace ServiceDirectoryTemplate.Models
{
	public class VolunteeringModel
	{
		private ServiceDirectoryDataContext _db = new ServiceDirectoryDataContext();
		public int PageSize = 15;
		public IEnumerable<Volunteering> GetList(out int totalPage, int PremiseId, int page = 1, string filter = "all", bool include = false)
		{
			var ls = from vol in _db.Volunteerings
					 where vol.PremiseID == PremiseId
					 select vol;

			switch (filter)
			{
				case "all": break;
				case "0-9": ls = ls.Where(m => m.Contact.FirstName.StartsWith("0") || m.Contact.FirstName.StartsWith("1") || m.Contact.FirstName.StartsWith("2") || m.Contact.FirstName.StartsWith("3") || m.Contact.FirstName.StartsWith("4") || m.Contact.FirstName.StartsWith("5") || m.Contact.FirstName.StartsWith("6") || m.Contact.FirstName.StartsWith("7") || m.Contact.FirstName.StartsWith("8") || m.Contact.FirstName.StartsWith("9")); break;
				case "abcde": ls = ls.Where(m => m.Contact.FirstName.StartsWith("a") || m.Contact.FirstName.StartsWith("b") || m.Contact.FirstName.StartsWith("c") || m.Contact.FirstName.StartsWith("d") || m.Contact.FirstName.StartsWith("e")); break;
				case "fghij": ls = ls.Where(m => m.Contact.FirstName.StartsWith("f") || m.Contact.FirstName.StartsWith("g") || m.Contact.FirstName.StartsWith("h") || m.Contact.FirstName.StartsWith("i") || m.Contact.FirstName.StartsWith("j")); break;
				case "klmn": ls = ls.Where(m => m.Contact.FirstName.StartsWith("k") || m.Contact.FirstName.StartsWith("l") || m.Contact.FirstName.StartsWith("m") || m.Contact.FirstName.StartsWith("n")); break;
				case "opqr": ls = ls.Where(m => m.Contact.FirstName.StartsWith("o") || m.Contact.FirstName.StartsWith("p") || m.Contact.FirstName.StartsWith("q") || m.Contact.FirstName.StartsWith("r")); break;
				case "stuv": ls = ls.Where(m => m.Contact.FirstName.StartsWith("s") || m.Contact.FirstName.StartsWith("t") || m.Contact.FirstName.StartsWith("u") || m.Contact.FirstName.StartsWith("v")); break;
				case "wxyz": ls = ls.Where(m => m.Contact.FirstName.StartsWith("w") || m.Contact.FirstName.StartsWith("x") || m.Contact.FirstName.StartsWith("y") || m.Contact.FirstName.StartsWith("z")); break;
			}
			if (!include)
			{
				ls = ls.Where(m => m.VolunteeringIsActive == 1);
			}
			totalPage = (int)Math.Ceiling(((double)ls.Count() / PageSize));
			page = (page > totalPage ? totalPage : page);
			page = (page < 1 ? 1 : page);
			return ls.Skip((page - 1) * PageSize).Take(PageSize);
		}
		public Volunteering GetDetail(int VolId)
		{
			var vol = _db.Volunteerings.Where(m => m.VolunteeringID == VolId).SingleOrDefault();
			return vol;

		}
		//insert
		public void Insert(Volunteering volunteering)
		{
			_db.Volunteerings.InsertOnSubmit(volunteering);
			_db.SubmitChanges();
		}
		//update
		public void Update()
		{
			_db.SubmitChanges();
		}
		public void MarkActive(int VolId, bool IsAvtivate)
		{
			var pmw = _db.Volunteerings.SingleOrDefault(m => m.VolunteeringID == VolId);
			pmw.VolunteeringIsActive = (IsAvtivate ? 1 : 0);
			_db.SubmitChanges();
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