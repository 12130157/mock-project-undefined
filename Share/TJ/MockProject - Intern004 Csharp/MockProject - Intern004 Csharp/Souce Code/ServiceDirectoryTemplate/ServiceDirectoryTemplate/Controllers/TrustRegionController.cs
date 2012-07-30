using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ServiceDirectoryTemplate.Models;

namespace ServiceDirectoryTemplate.Controllers
{
	[Authorize(Roles = "2")]
    public class TrustRegionController : Controller
    {
        TrustRegionModel trustRegionModel = new TrustRegionModel();
        CountryModel countryModel = new CountryModel();
        TrustDistrictModel trustDistrictModel = new TrustDistrictModel();

        //
        // GET: /Organisation/List

        public ActionResult List()
        {
			int totalPage;
			var listTrustRegion = trustRegionModel.GetList(out totalPage);
			ViewBag.TotalPage = totalPage;
			ViewBag.Page = 1;
			ViewBag.Include = "false";
			ViewBag.Filter = "all";
            return View(listTrustRegion);
        }
		[HttpPost]
		//public PartialViewResult List(int page, string filter, bool? include)
		public PartialViewResult List(int page=1, string filter="all", string include="false")
		{
			int totalPage;
			var listOrg = trustRegionModel.GetList(out totalPage, page, filter, Convert.ToBoolean(include));
			ViewBag.TotalPage = totalPage;
			ViewBag.Page = page;
			ViewBag.Include = include;
			ViewBag.Filter = filter;
			return PartialView(listOrg);
		}
		/*
		 * URL          : Organisation/ListMaterials/OrgID
		 * Output       : edit a organisation
		 * */
		public PartialViewResult ListDistrict(int id)
		{
			int totalPage;
			var ls = trustDistrictModel.GetList(id, out totalPage);
			ViewBag.TotalPage = totalPage;
			ViewBag.Page = 1;
			ViewBag.Include = "fasle";
			ViewBag.Filter = "all";
			ViewBag.RegionId = id;
			return PartialView(ls);
		}
		/*
		 * URL          : Organisation/ListMaterials/OrgID
		 * Output       : edit a organisation
		 * */
		[HttpPost]
		public PartialViewResult ListDistrict(int id, int page = 1, string filter = "all", string include = "false")
		{
			int totalPage;
			var ls = trustDistrictModel.GetList(id, out totalPage, page, filter, Convert.ToBoolean(include));
			ViewBag.TotalPage = totalPage;
			ViewBag.Page = page;
			ViewBag.Include = include;
			ViewBag.Filter = filter;
			ViewBag.RegionId = id;
			return PartialView(ls);
		}
        //
        // GET: /Organisation/Add

        public ActionResult Add()
        {
            var listCountry = countryModel.GetList();
            return View(listCountry);
        }

        //
        // GET: /Organisation/Edit

        public ActionResult Amend(int id)
        {
            TrustRegion currentRegion = trustRegionModel.GetDetail(id);

            ViewBag.ListCountry = countryModel.GetList();
            //ViewBag.ListTrustDistrict = trustDistrictModel.GetList(id);

            return View(currentRegion);
        }

        //
        // /TrustRegion/Create
        public ActionResult Create(string TrustRegionName, string Description, int CountryID)
        {
            TrustRegion newRegion = new TrustRegion();

            newRegion.TrustRegionName = TrustRegionName;
            newRegion.TrustRegionDescription = Description;
            newRegion.CountryID = CountryID;
            newRegion.TrustRegionIsActive = 1;

            trustRegionModel.Insert(newRegion);
			ViewBag.Alert = "true";
			ViewBag.Message = "Action success!";
			ViewBag.URL = "/TrustRegion/List";

			return View("../Shared/Redirect");
            //return RedirectToAction("List", "TrustRegion");

        }
        //
        // /TrustRegion/Update
        public ActionResult Update(int TrustRegionID, string TrustRegionName, string Description, int CountryID)
        {
            TrustRegion currentRegion = trustRegionModel.GetDetail(TrustRegionID);

            currentRegion.TrustRegionName = TrustRegionName;
            currentRegion.TrustRegionDescription = Description;
            currentRegion.CountryID = CountryID;

            trustRegionModel.Update();
			ViewBag.Alert = "true";
			ViewBag.Message = "Action success!";
			ViewBag.URL = "/TrustRegion/List";

			return View("../Shared/Redirect");
            //return RedirectToAction("List", "TrustRegion");

        }
		//
		// GET: /TrustRegion/MarkActivate/4

		public string MarkActivate(int id)
		{
			try
			{
				trustRegionModel.MarkActive(id, true);
				return "ok";
			}
			catch (Exception ex)
			{
				return ex.Message;
			}
		}
		//
		// GET: /TrustRegion/MarkInactivate/4

		public ActionResult MarkInactivate(int id)
		{
			try
			{
				trustRegionModel.MarkActive(id, false);
				return Redirect("/TrustRegion/List");
				//return "ok";
			}
			catch (Exception)
			{
				return View("../Shared/Error");
			}
		}
		public string CheckUnique(string TrustRegionName)
		{
			var istrue = trustRegionModel.CheckUnique(TrustRegionName);
			if (istrue)
				return "true";
			return "false";
		}
		public string CheckUnique1(int id, string TrustRegionName)
		{
			var istrue = trustRegionModel.CheckUnique(TrustRegionName, id);
			if (istrue)
				return "true";
			return "false";
		}
    }
}
