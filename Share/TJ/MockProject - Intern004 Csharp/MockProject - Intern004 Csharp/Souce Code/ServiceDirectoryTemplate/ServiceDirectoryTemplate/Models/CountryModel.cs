using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace ServiceDirectoryTemplate.Models
{
    public class CountryModel
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
    }
}