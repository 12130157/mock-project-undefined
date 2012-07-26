using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ServiceDirectoryTemplate.Models
{
    public class ContactModel
    {
        ServiceDirectoryDataContext dataAccess = new ServiceDirectoryDataContext();
		private readonly int PageSize = 15;
        public List<Contact> GetList()
        {
            List<Contact> list;

            list = new List<Contact>();
            var listContact = from org in dataAccess.Contacts
                                   select org;
            foreach (var org in listContact)
            {
                list.Add(org);
            }

            return list;
        }
		public IEnumerable<ReferenceData> GetContactType()
		{
			var ls = from refData in dataAccess.ReferenceDatas where refData.RefName == "Contact Type" select refData;
			return ls;
		}
		public IEnumerable<ReferenceData> GetBestContactMethod()
		{
			var ls = from refData in dataAccess.ReferenceDatas where refData.RefName == "Best Contact Method" select refData;
			return ls;
		}
		public IEnumerable<Contact> SearchName(out int totalPage, string firstName = "", string surName = "",  int page = 1, bool include = false)
        {
            
            var listContact = from contact in dataAccess.Contacts
                              select contact;

			if (firstName != "")
				listContact = listContact.Where(m => m.FirstName.Contains(firstName));
			if (surName != "")
				listContact = listContact.Where(m => m.Surname.Contains(surName));
			if (!include)
			{
				listContact = listContact.Where(m => m.ContactIsActive == 1);
			}
			totalPage = (int)Math.Ceiling(((double)listContact.Count() / PageSize));
			page = (page > totalPage ? totalPage : page);
			page = (page < 1 ? 1 : page);
			return listContact.Skip((page - 1) * PageSize).Take(PageSize);
			//return listContact;
        }
		public void MarkActive(int ConID, bool IsAvtivate)
		{
			var ser = dataAccess.Contacts.SingleOrDefault(m => m.ContactID == ConID);
			ser.ContactIsActive = (IsAvtivate ? 1 : 0);
			dataAccess.SubmitChanges();
		}
        public Contact GetDetail(int contId)
        {
            var org = (from orgList in dataAccess.Contacts
                       where orgList.ContactID == contId
                       select orgList).Single();
            return org;

        }
        public void Update()
        {
            dataAccess.SubmitChanges();
        }


        public void Insert(Contact newcont)
        {
            dataAccess.Contacts.InsertOnSubmit(newcont);
            dataAccess.SubmitChanges();
        }

    }
}