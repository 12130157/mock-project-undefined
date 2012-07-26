using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ServiceDirectoryTemplate.Models;

namespace ServiceDirectoryTemplate.Controllers
{
	[Authorize]
    public class FacilitiesController : Controller
    {
		private FacilitiesModel _db = new FacilitiesModel();

        //
        // GET: /Facilities/List/PremiseId
		public PartialViewResult List(int id)
		{
			int totalPage;
			var ls = _db.GetList(out totalPage, id);
			ViewBag.TotalPage = totalPage;
			ViewBag.Page = 1;
			ViewBag.Include = "false";
			ViewBag.Filter = "all";
			ViewBag.PremiseId = id;
			return PartialView(ls);
		}
		[HttpPost]
		public PartialViewResult List(int id, int page = 1, string filter = "all", string include = "false")
        {
			int totalPage;
			var ls = _db.GetList(out totalPage, id, page, filter, Convert.ToBoolean(include));
			ViewBag.TotalPage = totalPage;
			ViewBag.Page = page;
			ViewBag.Include = include;
			ViewBag.Filter = filter;
			ViewBag.PremiseId = id;
			return PartialView(ls);
        }

        //
		// GET: /Facilities/Add/PremiseId

        public ActionResult Add(int id)
        {
			ViewBag.PremiseId = id;
			ViewBag.FacilityType = _db.ListFacilityType();
			ViewBag.ConnectivityType = _db.ListConnectivityType();
            return View();
        } 

        //
		// POST: /Facilities/Add/PremiseId

        [HttpPost]
        public ActionResult Add(int id, string FacilityType, string FacilityDescription,
			int? LeadContact, int? RoomHost, decimal? RoomCapacity, decimal? RoomSize,
			FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here
				var facility = new Facility();
				facility.PremiseID = id;
				facility.FacilityType = FacilityType;
				facility.FacilityDescription = FacilityDescription;
				facility.LeadContact = LeadContact;
				facility.RoomHost = RoomHost;
				if (facility.FacilityType == "Room")
				{
					facility.RoomCapacity = RoomCapacity;
					facility.RoomSize = RoomSize;
					facility.RoomConnectivity = collection["RoomConnectivity"] == "1" ? 1 : 0;
					facility.EquipmentAvailable = collection["EquipmentAvailable"] == "1" ? 1 : 0;
					if (facility.EquipmentAvailable==1)
						facility.EquipmentName = collection["EquipmentName"];
					if (facility.RoomConnectivity == 1)
					{
						facility.ConnectivityType = collection["ConnectivityType"];
						if (facility.ConnectivityType == "Wireless")
							facility.WirelessAccessInfor = collection["WirelessAccessInfor"];
					}
					facility.RoomEquipmentNotes = collection["RoomEquipmentNotes"];
				}
				else if (facility.FacilityType == "Internet Access")
				{
					facility.ConnectivityType = collection["ConnectivityType"];
					if (facility.ConnectivityType == "Wireless")
						facility.WirelessAccessInfor = collection["WirelessAccessInfor"];
				}
				facility.FacilityIsActive = 1;
				_db.Insert(facility);
				ViewBag.Alert = "true";
				ViewBag.Message = "Action success!";
				ViewBag.URL = "/Premise/Amend/" + id + "#tabs-5";

				return View("../Shared/Redirect");
            }
            catch
            {
				return View("../Shared/Error");
            }
        }
        
        //
		// GET: /Facilities/Amend/5
 
        public ActionResult Amend(int id)
        {
			var fac = _db.GetDetail(id);
			ViewBag.PremiseId = fac.PremiseID;
			ViewBag.FacilityType = _db.ListFacilityType();
			ViewBag.ConnectivityType = _db.ListConnectivityType();
            return View(fac);
        }

        //
        // POST: /Facilities/Edit/5

        [HttpPost]
		public ActionResult Amend(int id, string FacilityType, string FacilityDescription,
			int? LeadContact, int? RoomHost, decimal? RoomCapacity, decimal? RoomSize, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
				var facility = _db.GetDetail(id);
				facility.FacilityType = FacilityType;
				facility.FacilityDescription = FacilityDescription;
				facility.LeadContact = LeadContact;
				facility.RoomHost = RoomHost;
				if (facility.FacilityType == "Room")
				{
					facility.RoomCapacity = RoomCapacity;
					facility.RoomSize = RoomSize;
					facility.RoomConnectivity = collection["RoomConnectivity"] == "1" ? 1 : 0;
					facility.EquipmentAvailable = collection["EquipmentAvailable"] == "1" ? 1 : 0;
					if (facility.EquipmentAvailable == 1)
						facility.EquipmentName = collection["EquipmentName"];
					else
						facility.EquipmentName = null;
					if (facility.RoomConnectivity == 1)
					{
						facility.ConnectivityType = collection["ConnectivityType"];
						if (facility.ConnectivityType == "Wireless")
							facility.WirelessAccessInfor = collection["WirelessAccessInfor"];
						else
							facility.WirelessAccessInfor = null;
					}
					else
					{
						facility.ConnectivityType = null;
						facility.WirelessAccessInfor = null;
					}
					facility.RoomEquipmentNotes = collection["RoomEquipmentNotes"];
				}
				else if (facility.FacilityType == "Internet Access")
				{
					facility.ConnectivityType = collection["ConnectivityType"];
					if (facility.ConnectivityType == "Wireless")
						facility.WirelessAccessInfor = collection["WirelessAccessInfor"];
					else
						facility.WirelessAccessInfor = null;
					facility.RoomCapacity = null;
					facility.RoomSize = null;
					facility.RoomConnectivity = 0;
					facility.EquipmentAvailable = 0;
					facility.EquipmentName = null;
					facility.RoomEquipmentNotes = null;
				}
				else
				{
					facility.RoomCapacity = null;
					facility.RoomSize = null;
					facility.RoomConnectivity = 0;
					facility.EquipmentAvailable = 0;
					facility.EquipmentName = null;
					facility.ConnectivityType = null;
					facility.WirelessAccessInfor = null;
					facility.RoomEquipmentNotes = null;
				}
				facility.FacilityIsActive = 1;

				_db.Update();
				ViewBag.Alert = "true";
				ViewBag.Message = "Action success!";
				ViewBag.URL = "/Premise/Amend/" + facility.PremiseID + "#tabs-5";

				return View("../Shared/Redirect");
            }
            catch
            {
                return View("../Shared/Error");
            }
        }

		public string MarkActivate(int id)
		{
			try
			{
				_db.MarkActive(id, true);
				return "ok";
			}
			catch (Exception ex)
			{
				return ex.Message;
			}
		}
		public ActionResult MarkInactivate(int id)
		{
			try
			{
				var fac=_db.GetDetail(id);
				fac.FacilityIsActive = 0;
				_db.Update();
				return Redirect("/Premise/Amend/" + fac.PremiseID + "#tabs-5");
				//return "ok";
			}
			catch (Exception)
			{
				return View("../Shared/Error");
			}
		}
    }
}
