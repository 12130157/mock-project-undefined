using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Globalization;

namespace ServiceDirectoryTemplate.Models
{
	public class DirectorateItem
	{
		public int Id;
		public string Name;
	}
	public class ProjectMinorWorkModel
	{
		private ServiceDirectoryDataContext _db = new ServiceDirectoryDataContext();
		public int PageSize = 15;
		public IEnumerable<ProjectMinorWork> GetList(out int totalPage, int PremiseId, int page = 1, string filter = "all", bool include = false)
		{
			var ls = from pmw in _db.ProjectMinorWorks
					 where pmw.PremiseID == PremiseId
					 select pmw;

			switch (filter)
			{
				case "all": break;
				case "0-9": ls = ls.Where(m => m.PMWDescription.StartsWith("0") || m.PMWDescription.StartsWith("1") || m.PMWDescription.StartsWith("2") || m.PMWDescription.StartsWith("3") || m.PMWDescription.StartsWith("4") || m.PMWDescription.StartsWith("5") || m.PMWDescription.StartsWith("6") || m.PMWDescription.StartsWith("7") || m.PMWDescription.StartsWith("8") || m.PMWDescription.StartsWith("9")); break;
				case "abcde": ls = ls.Where(m => m.PMWDescription.StartsWith("a") || m.PMWDescription.StartsWith("b") || m.PMWDescription.StartsWith("c") || m.PMWDescription.StartsWith("d") || m.PMWDescription.StartsWith("e")); break;
				case "fghij": ls = ls.Where(m => m.PMWDescription.StartsWith("f") || m.PMWDescription.StartsWith("g") || m.PMWDescription.StartsWith("h") || m.PMWDescription.StartsWith("i") || m.PMWDescription.StartsWith("j")); break;
				case "klmn": ls = ls.Where(m => m.PMWDescription.StartsWith("k") || m.PMWDescription.StartsWith("l") || m.PMWDescription.StartsWith("m") || m.PMWDescription.StartsWith("n")); break;
				case "opqr": ls = ls.Where(m => m.PMWDescription.StartsWith("o") || m.PMWDescription.StartsWith("p") || m.PMWDescription.StartsWith("q") || m.PMWDescription.StartsWith("r")); break;
				case "stuv": ls = ls.Where(m => m.PMWDescription.StartsWith("s") || m.PMWDescription.StartsWith("t") || m.PMWDescription.StartsWith("u") || m.PMWDescription.StartsWith("v")); break;
				case "wxyz": ls = ls.Where(m => m.PMWDescription.StartsWith("w") || m.PMWDescription.StartsWith("x") || m.PMWDescription.StartsWith("y") || m.PMWDescription.StartsWith("z")); break;
			}
			if (!include)
			{
				ls = ls.Where(m => m.PMWIsActive == 1);
			}
			totalPage = (int)Math.Ceiling(((double)ls.Count() / PageSize));
			page = (page > totalPage ? totalPage : page);
			page = (page < 1 ? 1 : page);
			return ls.Skip((page - 1) * PageSize).Take(PageSize);
		}
		public ProjectMinorWork GetDetail(int PMWId)
		{
			var pmw = _db.ProjectMinorWorks.Where(m => m.PMWID == PMWId).SingleOrDefault();
			return pmw;

		}
		public IEnumerable<DirectorateItem> ListDirectorate()
		{
			var ls = from dir in _db.Directorates
					 where dir.DirIsActive == 1
					 select new DirectorateItem
					 {
						 Id = dir.DirID,
						 Name = dir.DirName
					 };
			return ls;
		}
		//insert
		public void Insert(ProjectMinorWork pmw)
		{
			_db.ProjectMinorWorks.InsertOnSubmit(pmw);
			_db.SubmitChanges();
		}
		//update
		public void Update()
		{
			_db.SubmitChanges();
		}
		public void MarkActive(int PMWId, bool IsAvtivate)
		{
			var pmw = _db.ProjectMinorWorks.SingleOrDefault(m => m.PMWID == PMWId);
			pmw.PMWIsActive = (IsAvtivate ? 1 : 0);
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