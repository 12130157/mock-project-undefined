using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ServiceDirectoryTemplate.Models;

namespace ServiceDirectoryTemplate.Controllers
{
	[Authorize(Roles = "2")]
    public class TrustDistrictController : Controller
    {
        TrustRegionModel trustRegionModel = new TrustRegionModel();
        TrustDistrictModel trustDistrictModel = new TrustDistrictModel();
        //
        // GET: /TrustDistrict/Add

        public ActionResult Add(int id)
        {
			var region = trustRegionModel.GetDetail(id);
			return View(region);
        }

        //
		// GET: /TrustDistrict/Edit

        public ActionResult Amend(int id)
        {
            var currentDistrict = trustDistrictModel.GetDetail(id);
            return View(currentDistrict);
        }

        //
		// /TrustDistrict/Create
		public ActionResult Create(int TrustRegionId, string Name, string Description)
        {
            TrustDistrict newDistrict = new TrustDistrict();

            newDistrict.TrustDistrictName = Name;
            newDistrict.TrustDistrictDescription = Description;
			newDistrict.TrustRegionID = TrustRegionId;
            newDistrict.TrustDistrictIsActive = 1;

            trustDistrictModel.Insert(newDistrict);
			ViewBag.Alert = "true";
			ViewBag.Message = "Action success!";
			ViewBag.URL = "/TrustRegion/Amend/" + newDistrict.TrustRegionID + "#tabs-2";

			return View("../Shared/Redirect");
            //return RedirectToAction("List", "TrustDistrict");

        }
        //
		// /TrustDistrict/Update
        public ActionResult Update(int TrustDistrictID, string Name, string Description)
        {
            TrustDistrict currentDistrict = trustDistrictModel.GetDetail(TrustDistrictID);

            currentDistrict.TrustDistrictName = Name;
            currentDistrict.TrustDistrictDescription = Description;

            trustDistrictModel.Update();
            //ViewBag.ID = currentDistrict.TrustRegionID;
			ViewBag.Alert = "true";
			ViewBag.Message = "Action success!";
			ViewBag.URL = "/TrustRegion/Amend/" + currentDistrict.TrustRegionID + "#tabs-2";

			return View("../Shared/Redirect");
            //return View("Close");

        }
		//
		// GET: /TrustRegion/MarkActivate/4

		public string MarkActivate(int id)
		{
			try
			{
				trustDistrictModel.MarkActive(id, true);
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
				trustDistrictModel.MarkActive(id, false);
				var district = trustDistrictModel.GetDetail(id);
				return Redirect("/TrustRegion/Amend/" + district.TrustRegionID + "#tabs-2");
				//return "ok";
			}
			catch (Exception)
			{
				return View("../Shared/Error");
			}
		}
		public string CheckUnique(int id, string Name)
		{
			var istrue = trustDistrictModel.CheckUnique(id, Name);
			if (istrue)
				return "true";
			return "false";
		}
		public string CheckUnique1(int id, int TrustRegionID, string Name)
		{
			var istrue = trustDistrictModel.CheckUnique(TrustRegionID, Name, id);
			if (istrue)
				return "true";
			return "false";
		}
    }
}
