using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace ServiceDirectoryTemplate.Models
{
    public class AccountModel
    {
		private ServiceDirectoryDataContext dataAccess = new ServiceDirectoryDataContext();
        //list
        public List<Country> GetList()
        {
            List<Country> list;

            list = new List<Country>();
            var listCountry = from org in dataAccess.Countries
                                   select org;
            foreach (var org in listCountry)
            {
                list.Add(org);
            }

            return list;
        }
		
        public User GetDetail(string Account,string Password)
        {
            var user = (from userList in dataAccess.Users
						where userList.Account==Account//String.Compare(userList.Account, Account, false) == 0 
							&& userList.Password == Password//String.Compare(userList.Password, Password, false) == 0
                        select userList).SingleOrDefault();
            return user;

        }
        
    }
}