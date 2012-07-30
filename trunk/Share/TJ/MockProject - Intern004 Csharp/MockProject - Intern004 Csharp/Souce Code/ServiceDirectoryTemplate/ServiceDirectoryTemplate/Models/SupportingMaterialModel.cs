using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections.ObjectModel;

namespace ServiceDirectoryTemplate.Models
{
    public class SupportingMaterialModel
    {
		ServiceDirectoryDataContext dataAccess = new ServiceDirectoryDataContext();
		public int PageSize = 15;
		public User GetId(string Account)
		{
			var user = (from userList in dataAccess.Users
						where userList.Account == Account//String.Compare(userList.Account, Account, false) == 0 
						select userList).SingleOrDefault();
			return user;
		}
		public IEnumerable<SupportingMaterial> GetList(out int totalPage, int? OrgID = null, int page = 1, bool include = false)
        {
			var ls = from supportM in dataAccess.SupportingMaterials
										 where supportM.OrgID == OrgID
										 select supportM;

			if (OrgID != null)
				ls = ls.Where(m => m.OrgID == OrgID);

			
			if (!include)
			{
				ls = ls.Where(m => m.MatIsActive == 1);
			}
			totalPage = (int)Math.Ceiling(((double)ls.Count() / PageSize));
			page = (page > totalPage ? totalPage : page);
			page = (page < 1 ? 1 : page);
			return ls.Skip((page - 1) * PageSize).Take(PageSize);
        }

        public SupportingMaterial GetDetail(int supID)
        {
            var org = (from orgList in dataAccess.SupportingMaterials
                       where orgList.MatID == supID
                       select orgList).Single();
            return org;
        }

        public void Insert(SupportingMaterial subMe)
        {
            dataAccess.SupportingMaterials.InsertOnSubmit(subMe);
            dataAccess.SubmitChanges();
        }

        public void Update()
        {
            dataAccess.SubmitChanges();
        }
		public void MarkActive(int MatID, bool IsAvtivate)
		{
			var ser = dataAccess.SupportingMaterials.SingleOrDefault(m => m.MatID == MatID);
			ser.MatIsActive = (IsAvtivate ? 1 : 0);
			dataAccess.SubmitChanges();
		}
    }
}