using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;

namespace ServiceDirectoryTemplate.Models
{
    public class ProgrammeModel
    {
		private ServiceDirectoryDataContext _db = new ServiceDirectoryDataContext();
		private readonly int pageSize = 15;
		public bool CheckUnique(string name, int? id = null)
		{
			var re = _db.Programmes.Where(m => m.ProgrammeName == name);
			if (id != null)
				re = re.Where(m => m.ProgrammeID != id);
			if (re.Count() == 0)
				return true;
			return false;
		}
		public IEnumerable<Programme> ListProgramme(out int totalPage, int page = 1, string filter = "all", bool include = false)
		{

			var ls = (from pro in _db.Programmes select pro);
			switch (filter)
			{
				case "all": break;
				case "0-9": ls = ls.Where(m => m.ProgrammeName.StartsWith("0") || m.ProgrammeName.StartsWith("1") || m.ProgrammeName.StartsWith("2") || m.ProgrammeName.StartsWith("3") || m.ProgrammeName.StartsWith("4") || m.ProgrammeName.StartsWith("5") || m.ProgrammeName.StartsWith("6") || m.ProgrammeName.StartsWith("7") || m.ProgrammeName.StartsWith("8") || m.ProgrammeName.StartsWith("9")); break;
				case "abcde": ls = ls.Where(m => m.ProgrammeName.StartsWith("a") || m.ProgrammeName.StartsWith("b") || m.ProgrammeName.StartsWith("c") || m.ProgrammeName.StartsWith("d") || m.ProgrammeName.StartsWith("e")); break;
				case "fghij": ls = ls.Where(m => m.ProgrammeName.StartsWith("f") || m.ProgrammeName.StartsWith("g") || m.ProgrammeName.StartsWith("h") || m.ProgrammeName.StartsWith("i") || m.ProgrammeName.StartsWith("j")); break;
				case "klmn": ls = ls.Where(m => m.ProgrammeName.StartsWith("k") || m.ProgrammeName.StartsWith("l") || m.ProgrammeName.StartsWith("m") || m.ProgrammeName.StartsWith("n")); break;
				case "opqr": ls = ls.Where(m => m.ProgrammeName.StartsWith("o") || m.ProgrammeName.StartsWith("p") || m.ProgrammeName.StartsWith("q") || m.ProgrammeName.StartsWith("r")); break;
				case "stuv": ls = ls.Where(m => m.ProgrammeName.StartsWith("s") || m.ProgrammeName.StartsWith("t") || m.ProgrammeName.StartsWith("u") || m.ProgrammeName.StartsWith("v")); break;
				case "wxyz": ls = ls.Where(m => m.ProgrammeName.StartsWith("w") || m.ProgrammeName.StartsWith("x") || m.ProgrammeName.StartsWith("y") || m.ProgrammeName.StartsWith("z")); break;
			}
			if (!include)
			{
				ls = ls.Where(m => m.ProgrammeIsActivate == 1);
			}

			totalPage = (int)Math.Ceiling(((double)ls.Count() / pageSize));
			page = (page > totalPage ? totalPage : page);
			page = (page < 1 ? 1 : page);
			return ls.Skip((page - 1) * pageSize).Take(pageSize);
		}
		public Programme GetProgramme(int id)
		{
			var query = _db.Programmes.SingleOrDefault(m => m.ProgrammeID == id);
			return query;
		}
		public void MarkActive(int ProID, bool IsAvtivate)
		{
			var ser = _db.Programmes.SingleOrDefault(m => m.ProgrammeID == ProID);
			ser.ProgrammeIsActivate = (IsAvtivate ? 1 : 0);
			_db.SubmitChanges();
		}
		public bool CreateProgramme(Programme program)
		{
			//try
			{
				_db.Programmes.InsertOnSubmit(program);
				_db.SubmitChanges();
				return true;
			}
			//catch
			{
				//return false;
			}
		}
		public void Update()
		{
			_db.SubmitChanges();
		}
    }
}
