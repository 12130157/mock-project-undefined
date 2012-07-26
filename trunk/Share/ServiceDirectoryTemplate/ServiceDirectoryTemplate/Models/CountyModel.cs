using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ServiceDirectoryTemplate.Models
{
    public class CountyModel
    {
        ServiceDirectoryDataContext dataAccess = new ServiceDirectoryDataContext();
        //list
        public List<County> GetList(int GovOfficeRegionID)
        {
            List<County> list;

            list = new List<County>();
            var listCountry = from org in dataAccess.GovCounties
                              where org.GovOfficeRegionID == GovOfficeRegionID
                              select org;
            foreach (var org in listCountry)
            {
                var x = (from orm in dataAccess.Counties
                         where orm.CountyID == org.CountyID
                         select orm).Single();
                list.Add(x);
            }

            return list;
        }

        public List<County> GetList1()
        {
            List<County> list;

            list = new List<County>();
            var listCountry = from org in dataAccess.Counties
                              select org;
            foreach (var org in listCountry)
            {
                list.Add(org);
            }

            return list;
        }
    }
}