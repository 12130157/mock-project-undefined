using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ServiceDirectoryTemplate.Models
{
	public class RefItem
	{
		public int RefValue;
		public string RefText;
		public int RefType;
		public string RefChecked;
		public RefItem(int refValue, string refText, int refType, string refChecked)
		{
			RefValue = refValue;
			RefText = refText;
			RefType = refType;
			RefChecked = refChecked;
		}
	}
	public class AddressLookUp
	{
		public int ContactID;
		public string FirstName;
		public string Surname;
		public string ContactType;
		public string BestContactMethod;
		public string JobTitle;
		public int ContactIsActive;
	}
	public class RefDataModel
	{
		private ServiceDirectoryDataContext _db = new ServiceDirectoryDataContext();
		private readonly int pageSize = 15;
		public IEnumerable<ReferenceData> ListRefData(string str)
		{
			return _db.ReferenceDatas.Where(s => s.RefFrom.Equals(str)).ToList();
		}
		public IEnumerable<AddressLookUp> ListContact(out int totalPage, int page = 1, string filter = "all", bool include = false)
		{
			var ls = from contact in _db.Contacts					 
					 select new AddressLookUp {
						ContactID=contact.ContactID,
						//ContactType= contact.ReferenceData.RefText,
						ContactType = contact.ContactType,
						JobTitle=contact.JobTitle,
						//BestContactMethod = contact.ReferenceData1.RefText,
						BestContactMethod = contact.BestContactMethod,
						FirstName=contact.FirstName,
						Surname=contact.Surname,
						ContactIsActive = contact.ContactIsActive
					 };
			switch (filter)
			{
				case "all": break;
				case "0-9": ls = ls.Where(m => m.FirstName.StartsWith("0") || m.FirstName.StartsWith("1") || m.FirstName.StartsWith("2") || m.FirstName.StartsWith("3") || m.FirstName.StartsWith("4") || m.FirstName.StartsWith("5") || m.FirstName.StartsWith("6") || m.FirstName.StartsWith("7") || m.FirstName.StartsWith("8") || m.FirstName.StartsWith("9")); break;
				case "abcde": ls = ls.Where(m => m.FirstName.StartsWith("a") || m.FirstName.StartsWith("b") || m.FirstName.StartsWith("c") || m.FirstName.StartsWith("d") || m.FirstName.StartsWith("e")); break;
				case "fghij": ls = ls.Where(m => m.FirstName.StartsWith("f") || m.FirstName.StartsWith("g") || m.FirstName.StartsWith("h") || m.FirstName.StartsWith("i") || m.FirstName.StartsWith("j")); break;
				case "klmn": ls = ls.Where(m => m.FirstName.StartsWith("k") || m.FirstName.StartsWith("l") || m.FirstName.StartsWith("m") || m.FirstName.StartsWith("n")); break;
				case "opqr": ls = ls.Where(m => m.FirstName.StartsWith("o") || m.FirstName.StartsWith("p") || m.FirstName.StartsWith("q") || m.FirstName.StartsWith("r")); break;
				case "stuv": ls = ls.Where(m => m.FirstName.StartsWith("s") || m.FirstName.StartsWith("t") || m.FirstName.StartsWith("u") || m.FirstName.StartsWith("v")); break;
				case "wxyz": ls = ls.Where(m => m.FirstName.StartsWith("w") || m.FirstName.StartsWith("x") || m.FirstName.StartsWith("y") || m.FirstName.StartsWith("z")); break;
			}
			if (!include)
			{
				ls = ls.Where(m => m.ContactIsActive == 1);
			}
			totalPage = (int)Math.Ceiling(((double)ls.Count() / pageSize));
			page = (page > totalPage ? totalPage : page);
			page = (page < 1 ? 1 : page);
			return ls.Skip((page - 1) * pageSize).Take(pageSize);
		}
	}
}