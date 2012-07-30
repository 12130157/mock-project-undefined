using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections.ObjectModel;

namespace ServiceDirectoryTemplate.Models
{
    public class TeamModel
    {
		ServiceDirectoryDataContext dataAccess = new ServiceDirectoryDataContext();
		public int PageSize = 15;
        //list
		public bool CheckUnique(string name, int? id = null)
		{
			var re = dataAccess.Teams.Where(m => m.TeamName == name);
			if (id != null)
				re = re.Where(m => m.TeamID != id);
			if (re.Count() == 0)
				return true;
			return false;
		}
		public IEnumerable<Team> GetList(out int totalPage, int? depID = null, int page = 1, string filter = "all", bool include = false)
        {
			var ls = from supportM in dataAccess.Teams
					 select supportM;
			if(depID!=null)
				ls = ls.Where(m => m.DepID == depID);

			switch (filter)
			{
				case "all": break;
				case "0-9": ls = ls.Where(m => m.TeamName.StartsWith("0") || m.TeamName.StartsWith("1") || m.TeamName.StartsWith("2") || m.TeamName.StartsWith("3") || m.TeamName.StartsWith("4") || m.TeamName.StartsWith("5") || m.TeamName.StartsWith("6") || m.TeamName.StartsWith("7") || m.TeamName.StartsWith("8") || m.TeamName.StartsWith("9")); break;
				case "abcde": ls = ls.Where(m => m.TeamName.StartsWith("a") || m.TeamName.StartsWith("b") || m.TeamName.StartsWith("c") || m.TeamName.StartsWith("d") || m.TeamName.StartsWith("e")); break;
				case "fghij": ls = ls.Where(m => m.TeamName.StartsWith("f") || m.TeamName.StartsWith("g") || m.TeamName.StartsWith("h") || m.TeamName.StartsWith("i") || m.TeamName.StartsWith("j")); break;
				case "klmn": ls = ls.Where(m => m.TeamName.StartsWith("k") || m.TeamName.StartsWith("l") || m.TeamName.StartsWith("m") || m.TeamName.StartsWith("n")); break;
				case "opqr": ls = ls.Where(m => m.TeamName.StartsWith("o") || m.TeamName.StartsWith("p") || m.TeamName.StartsWith("q") || m.TeamName.StartsWith("r")); break;
				case "stuv": ls = ls.Where(m => m.TeamName.StartsWith("s") || m.TeamName.StartsWith("t") || m.TeamName.StartsWith("u") || m.TeamName.StartsWith("v")); break;
				case "wxyz": ls = ls.Where(m => m.TeamName.StartsWith("w") || m.TeamName.StartsWith("x") || m.TeamName.StartsWith("y") || m.TeamName.StartsWith("z")); break;
			}
			if (!include)
			{
				ls = ls.Where(m => m.TeamIsActive == 1);
			}
			totalPage = (int)Math.Ceiling(((double)ls.Count() / PageSize));
			page = (page > totalPage ? totalPage : page);
			page = (page < 1 ? 1 : page);
			return ls.Skip((page - 1) * PageSize).Take(PageSize);
        }

        public Team GetDetail(int TeamID)
        {
            var org = (from orgList in dataAccess.Teams
                       where orgList.TeamID == TeamID
                       select orgList).Single();
            return org;

        }
        //insert
        public void Insert(Team newOrg)
        {
            dataAccess.Teams.InsertOnSubmit(newOrg);
            dataAccess.SubmitChanges();
        }
        //update
        public void Update()
        {
            dataAccess.SubmitChanges();
        }
		public void MarkActive(int TeamID, bool IsAvtivate)
		{
			var ser = dataAccess.Teams.SingleOrDefault(m => m.TeamID == TeamID);
			ser.TeamIsActive = (IsAvtivate ? 1 : 0);
			dataAccess.SubmitChanges();
		}
    }
}