using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ServiceDirectoryTemplate.Models;

namespace ServiceDirectoryTemplate.Controllers
{
	[Authorize(Roles = "2")]
    public class PremiseController : Controller
    {
		private PremiseModel _db = new PremiseModel();
		CountryModel countryModel = new CountryModel();
        //
        // GET: /Premise/

        public ActionResult Index()
        {
            return View();
        }
		//
		// GET: /Premise/Add
		public ActionResult Add()
		{
			ViewBag.LocationType = _db.ListLocationType();
			ViewBag.ListCountry = countryModel.GetList();
			ViewBag.Accreditation = _db.ListAccreditaion(); 
			ViewBag.Demographic = _db.ListDemographic();
			ViewBag.ISNetwork = _db.ListISNetwork();
			ViewBag.JCP = _db.ListPermise("JCP Offices");
			ViewBag.Outreach = _db.ListPermise("Outreach Location");
			ViewBag.Hotel = _db.ListPermise("Hotel");
			return View();
		}
		//
		// POST: /Premise/Add
		[HttpPost]
		public PartialViewResult Add(string LocationName, string LocationStatus, string PremisePhone, int? CountryID,
			int? LocationOrganisation, int? MediaContact, int? CateringContact, int? CateringType, int? VisitorParkingSpace,
			int? HostingContact, int? NoOfMeetingRooms, int? PreferredStatus, int? Codings,
			FormCollection collection)
		{
			Premise pre = new Premise();

			pre.LocationName = LocationName;
			pre.PrimaryLocation = collection["PrimaryLocation"] == "1" ? 1 : 0;
			pre.KnownAS = collection["KnownAS"];
			pre.LocationManaged = collection["LocationManaged"] == "1" ? 1 : 0;
			pre.LocationStatus = LocationStatus;
			pre.RefListID = "," + collection["LocationType[]"] + ",";
			pre.LocationStatusDate = _db.ConvertDate(collection["LocationStatusDate"], "dd/MM/yyyy");
			pre.PremiseAddr1 = collection["PremiseAddr1"];
			pre.PremiseAddr2 = collection["PremiseAddr2"];
			pre.PremiseAddr3 = collection["PremiseAddr3"];
			pre.LocationDescription = collection["LocationDescription"];
			pre.PremisePostCode = collection["PostCode"];
			pre.CityTown = collection["CityTown"];
			pre.PremisePhone = PremisePhone;
			pre.County = collection["County"];
			pre.PremisFax = collection["PremisFax"];
			pre.CountryID = CountryID;
			pre.PremisMinicomn = collection["PremisMinicomn"];
			pre.PremiseIsNew = collection["PremiseIsNew"] == "1" ? 1 : 0;
			pre.PremiseShopFlagDate = _db.ConvertDate(collection["PremiseShopFlagDate"], "dd/MM/yyyy");
			pre.PremiseSpecialistShop = collection["PremiseSpecialistShop"] == "1" ? 1 : 0;
			pre.LocationOrganisation = LocationOrganisation;
			pre.PremiseIsActive = 1;

			var detail = new PremiseDetail();

			detail.RefListID = "," + collection["RefListID[]"] + ",";
			detail.MediaContactCheck = collection["MediaContactCheck"] == "1" ? 1 : 0;
			detail.CateringFacilities = collection["CateringFacilities"] == "1" ? 1 : 0;
			detail.MediaContact = MediaContact;
			detail.CateringContact = CateringContact;
			detail.CateringType = CateringType;
			detail.ClientITFacilities = collection["ClientITFacilities"] == "1" ? 1 : 0;
			detail.LocalDemographicNote = collection["LocalDemographicNote"];
			detail.MediaContactCheck = collection["MediaContactCheck"] == "1" ? 1 : 0;
			detail.ClientITFacilitiesDetail = collection["ClientITFacilitiesDetail"];
			detail.RoomAvailability = collection["RoomAvailability"] == "1" ? 1 : 0;
			detail.VolunteeringOpportunuties = collection["VolunteeringOpportunuties"] == "1" ? 1 : 0;
			detail.PremiseOutreachLocationListID = "," + collection["PremiseOutreachLocationListID[]"] + ",";
			detail.PremiseLocalHotelListID = "," + collection["PremiseLocalHotelListID[]"] + ",";
			detail.TravelDetail = collection["TravelDetail"];
			detail.VisitorParkingOnsite = collection["VisitorParkingOnsite"] == "1" ? 1 : 0;
			detail.TravelNearestBus = collection["TravelNearestBus"];
			detail.VisitorParkingSpace = VisitorParkingSpace;
			detail.TravelNearestRail = collection["TravelNearestRail"];
			detail.VisitorParkingAlternative = collection["VisitorParkingAlternative"];
			detail.TravelNearestAirport = collection["TravelNearestAirport"];
			detail.HostVisits = collection["HostVisits"] == "1" ? 1 : 0;
			detail.HostingContact = HostingContact;
			detail.TravelNearestAirport = collection["TravelNearestAirport"];


			var cost = new PermiseDetailForCost();
			cost.RoomOnlyRate = collection["RoomOnlyRate"];
			cost.NegotiatedRoomonlyRate = collection["NegotiatedRoomonlyRate"];
			cost.BBRate = collection["BBRate"];
			cost.BBNegotiatedRate = collection["BBNegotiatedRate"];
			cost.DBBRate = collection["DBBRate"];
			cost.DBBNegotiatedRate = collection["DBBNegotiatedRate"];
			cost.DDRate = collection["DDRate"];
			cost.DDNegotiatedRate = collection["DDNegotiatedRate"];
			cost.pre24hrRate = collection["pre24hrRate"];
			cost.pre24hrNeotiatedRate = collection["pre24hrNeotiatedRate"];
			cost.TeaAndCoffee = collection["TeaAndCoffee"];
			cost.LastNegotiatedDate = _db.ConvertDate(collection["LastNegotiatedDate"], "dd/MM/yyyy");
			cost.Lunch = collection["Lunch"] == "1" ? 1 : 0;
			cost.RenegotiateOn = _db.ConvertDate(collection["RenegotiateOn"], "dd/MM/yyyy");
			cost.NoOfMeetingRooms = NoOfMeetingRooms;
			cost.PreferredStatus = PreferredStatus;
			cost.MeetingRoomRatePerDay = collection["MeetingRoomRatePerDay"];
			cost.Comments = collection["Comments"];
			cost.Codings = Codings;

			var model = new PremiseOpenSchedule();
			model.StartMonday = collection["StartMonday"];
			model.EndMonday = collection["EndMonday"];
			model.StartTuesday = collection["StartTuesday"];
			model.EndTuesday = collection["EndTuesday"];
			model.StartWednesday = collection["StartWednesday"];
			model.EndWednesday = collection["EndWednesday"];
			model.StartThursday = collection["StartThursday"];
			model.EndThursday = collection["EndThursday"];
			model.StartFriday = collection["StartFriday"];
			model.EndFriday = collection["EndFriday"];
			model.StartSaturday = collection["StartSaturday"];
			model.EndSaturday = collection["EndSaturday"];
			model.StartSunday = collection["StartSunday"];
			model.EndSunday = collection["EndSunday"];

			var isSaved=_db.CreatePremise(pre, detail, cost, model);
			if (isSaved == true)
			{
				ViewBag.Alert = "true";
				ViewBag.Message = "Action success!";
				ViewBag.URL = "/Premise/Amend/" + pre.PremiseID;
			}
			else
			{
				ViewBag.Alert = "false";
				ViewBag.Message = "";
				ViewBag.URL = "";
			}
			return PartialView("../Shared/Redirect");
		}
		//
		// GET: /Premise/List
		public ActionResult List()
		{
			int totalPage;
			var ls = _db.GetList(out totalPage);
			ViewBag.TotalPage = totalPage;
			ViewBag.Page = 1;
			ViewBag.Include = "false";
			ViewBag.Filter = "all";
			return View(ls);
		}
		[HttpPost]
		public PartialViewResult List(int page=1, string filter="all", string include="false")
		{
			int totalPage;
			var ls = _db.GetList(out totalPage, page, filter, Convert.ToBoolean(include));
			ViewBag.TotalPage = totalPage;
			ViewBag.Page = page;
			ViewBag.Include = include;
			ViewBag.Filter = filter;
			return PartialView(ls);
		}
		//
		// GET: /Premise/Amend/1
		public ActionResult Amend(int id)
		{
			var model = _db.GetDetail(id);
			ViewBag.LocationType = _db.ListLocationType();
			ViewBag.ListCountry = countryModel.GetList();
			ViewBag.Accreditation = _db.ListAccreditaion();
			ViewBag.Demographic = _db.ListDemographic();
			ViewBag.ISNetwork = _db.ListISNetwork();
			ViewBag.JCP = _db.ListPermise("JCP Offices");
			ViewBag.Outreach = _db.ListPermise("Outreach Location");
			ViewBag.Hotel = _db.ListPermise("Hotel");
			if (model.LocationStatusDate != null) ViewBag.LocationStatusDate = ((DateTime)model.LocationStatusDate).ToString("dd/MM/yyyy");
			if (model.PremiseShopFlagDate != null) ViewBag.PremiseShopFlagDate = ((DateTime)model.PremiseShopFlagDate).ToString("dd/MM/yyyy");
			if (model.PermiseDetailForCost.LastNegotiatedDate != null) ViewBag.LastNegotiatedDate = ((DateTime)model.PermiseDetailForCost.LastNegotiatedDate).ToString("dd/MM/yyyy");
			if (model.PermiseDetailForCost.RenegotiateOn != null) ViewBag.LocationStatusDate = ((DateTime)model.PermiseDetailForCost.RenegotiateOn).ToString("dd/MM/yyyy");


			return View(model);
		}
		//
		// POST: /Premise/Amend/1
		[HttpPost]
		public ActionResult Amend(int id, string LocationName, string LocationStatus, string PremisePhone, int? CountryID,
			int? LocationOrganisation, int? MediaContact, int? CateringContact, int? CateringType, int? VisitorParkingSpace,
			int? HostingContact, int? NoOfMeetingRooms, int? PreferredStatus, int? Codings,
			FormCollection collection)
		{
			var pre = _db.GetDetail(id);
			pre.LocationName = LocationName;
			pre.PrimaryLocation = collection["PrimaryLocation"] == "1" ? 1 : 0;
			pre.KnownAS = collection["KnownAS"];
			pre.LocationManaged = collection["LocationManaged"] == "1" ? 1 : 0;
			pre.LocationStatus = LocationStatus;
			pre.RefListID = "," + collection["LocationType[]"] + ",";
			pre.LocationStatusDate = _db.ConvertDate(collection["LocationStatusDate"], "dd/MM/yyyy");
			pre.PremiseAddr1 = collection["PremiseAddr1"];
			pre.PremiseAddr2 = collection["PremiseAddr2"];
			pre.PremiseAddr3 = collection["PremiseAddr3"];
			pre.LocationDescription = collection["LocationDescription"];
			pre.PremisePostCode = collection["PostCode"];
			pre.CityTown = collection["CityTown"];
			pre.PremisePhone = PremisePhone;
			pre.County = collection["County"];
			pre.PremisFax = collection["PremisFax"];
			pre.CountryID = CountryID;
			pre.PremisMinicomn = collection["PremisMinicomn"];
			pre.PremiseIsNew = collection["PremiseIsNew"] == "1" ? 1 : 0;
			pre.PremiseShopFlagDate = _db.ConvertDate(collection["PremiseShopFlagDate"], "dd/MM/yyyy");
			pre.PremiseSpecialistShop = collection["PremiseSpecialistShop"] == "1" ? 1 : 0;
			pre.LocationOrganisation = LocationOrganisation;

			var detail = _db.GetPremiseDetail(id);

			detail.RefListID = "," + collection["RefListID[]"] + ",";
			detail.MediaContactCheck = collection["MediaContactCheck"]=="1"?1:0;
			detail.CateringFacilities = collection["CateringFacilities"] == "1" ? 1 : 0;
			detail.MediaContact = MediaContact;
			detail.CateringContact = CateringContact;
			detail.CateringType = CateringType;
			detail.ClientITFacilities = collection["ClientITFacilities"]=="1"?1:0;
			detail.LocalDemographicNote = collection["LocalDemographicNote"];
			detail.MediaContactCheck = collection["MediaContactCheck"]=="1"?1:0;
			detail.ClientITFacilitiesDetail = collection["ClientITFacilitiesDetail"];
			detail.RoomAvailability = collection["RoomAvailability"] == "1" ? 1 : 0;
			detail.VolunteeringOpportunuties = collection["VolunteeringOpportunuties"] == "1" ? 1 : 0;
			detail.PremiseOutreachLocationListID = "," + collection["PremiseOutreachLocationListID[]"] + ",";
			detail.PremiseLocalHotelListID = "," + collection["PremiseLocalHotelListID[]"] + ",";
			detail.TravelDetail = collection["TravelDetail"];
			detail.VisitorParkingOnsite = collection["VisitorParkingOnsite"]=="1"?1:0;
			detail.TravelNearestBus = collection["TravelNearestBus"];
			detail.VisitorParkingSpace = VisitorParkingSpace;
			detail.TravelNearestRail = collection["TravelNearestRail"];
			detail.VisitorParkingAlternative = collection["VisitorParkingAlternative"];
			detail.TravelNearestAirport = collection["TravelNearestAirport"];
			detail.HostVisits = collection["HostVisits"]=="1"?1:0;
			detail.HostingContact = HostingContact;
			detail.TravelNearestAirport = collection["TravelNearestAirport"];


			var cost = _db.GetPermiseDetailForCost(id);
			cost.RoomOnlyRate = collection["RoomOnlyRate"];
			cost.NegotiatedRoomonlyRate = collection["NegotiatedRoomonlyRate"];
			cost.BBRate = collection["BBRate"];
			cost.BBNegotiatedRate = collection["BBNegotiatedRate"];
			cost.DBBRate = collection["DBBRate"];
			cost.DBBNegotiatedRate = collection["DBBNegotiatedRate"];
			cost.DDRate = collection["DDRate"];
			cost.DDNegotiatedRate = collection["DDNegotiatedRate"];
			cost.pre24hrRate = collection["pre24hrRate"];
			cost.pre24hrNeotiatedRate = collection["pre24hrNeotiatedRate"];
			cost.TeaAndCoffee = collection["TeaAndCoffee"];
			cost.LastNegotiatedDate = _db.ConvertDate(collection["LastNegotiatedDate"], "dd/MM/yyyy");
			cost.Lunch = collection["Lunch"]=="1"?1:0;
			cost.RenegotiateOn = _db.ConvertDate(collection["RenegotiateOn"], "dd/MM/yyyy");
			cost.NoOfMeetingRooms = NoOfMeetingRooms;
			cost.PreferredStatus = PreferredStatus;
			cost.MeetingRoomRatePerDay = collection["MeetingRoomRatePerDay"];
			cost.Comments = collection["Comments"];
			cost.Codings = Codings;

			var model = _db.GetPermiseOpenSchedule(pre.PremiseID);
			model.StartMonday = collection["StartMonday"];
			model.EndMonday = collection["EndMonday"];
			model.StartTuesday = collection["StartTuesday"];
			model.EndTuesday = collection["EndTuesday"];
			model.StartWednesday = collection["StartWednesday"];
			model.EndWednesday = collection["EndWednesday"];
			model.StartThursday = collection["StartThursday"];
			model.EndThursday = collection["EndThursday"];
			model.StartFriday = collection["StartFriday"];
			model.EndFriday = collection["EndFriday"];
			model.StartSaturday = collection["StartSaturday"];
			model.EndSaturday = collection["EndSaturday"];
			model.StartSunday = collection["StartSunday"];
			model.EndSunday = collection["EndSunday"];
			_db.Update();

			
			ViewBag.Alert = "true";
			ViewBag.Message = "Action success!";
			ViewBag.URL = "/Premise/Amend/" + pre.PremiseID;
			
				
			return View("../Shared/Redirect");
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
				_db.MarkActive(id, false);
				return RedirectToAction("List");
				//return "ok";
			}
			catch (Exception)
			{
				return View("Error");
			}
		}
		//
		// GET: /Premise/ListServiceLink/PremiseID
		public PartialViewResult ListServiceLink(int id)
		{
			int totalPage;
			var model = _db.ListService(id, out totalPage);
			ViewBag.TotalPage = totalPage;
			ViewBag.PremiseID = id;
			ViewBag.Page = 1;
			ViewBag.Filter = "all";
			return PartialView(model);
		}
		//
		// POST: /Premise/ListServiceLink/PremiseID
		[HttpPost]
		public PartialViewResult ListServiceLink(int id, int page=1, string filter="all")
		{
			int totalPage;
			var model = _db.ListService(id, out totalPage, page);
			ViewBag.TotalPage = totalPage;
			ViewBag.PremiseID = id;
			ViewBag.Page = page;
			ViewBag.Filter = filter;
			return PartialView(model);
		}
		//
		// GET: /Service/NewServiceLink/PremiseID
		public ViewResult NewServiceLink(int id)
		{
			try
			{
				int total;
				ViewBag.PremiseID = id;
				var model = _db.ListServiceNotLink(id, out total);
				ViewBag.TotalPage = total;
				return View(model);
			}
			catch (Exception)
			{
				return View("Error");
			}
		}
		//
		// POST: /Service/NewServiceLink/PremiseID
		[HttpPost]
		public PartialViewResult NewServiceLink(int id, int page = 1, string filter = "all")
		{
			try
			{
				int total;
				ViewBag.PremiseID = id;
				var model = _db.ListServiceNotLink(id, out total, page, filter);
				ViewBag.TotalPage = total;
				ViewBag.Page = page;
				ViewBag.Filter = filter;
				return PartialView(model);
			}
			catch (Exception)
			{
				return PartialView("Error");
			}
		}
		//
		// POST: /Service/AddPremiseLink/PremiseID
		[HttpPost]
		public PartialViewResult AddServiceLink(int id, FormCollection collection)
		{
			try
			{
				ViewBag.SerID = id;
				_db.AddServiceLink(id, collection["id[]"]);
				ViewBag.Mess = "Done";
				return PartialView("../Shared/Close");
			}
			catch (Exception)
			{
				ViewBag.Mess = "Have error while processing";
				return PartialView("../Shared/Close");
			}
		}
		//
		// POST: /Service/RemovePremiseLink
		[HttpPost]
		public string RemoveServiceLink(int LinkID)
		{
			try
			{
				_db.RemoveServiceLink(LinkID);
				//ViewBag.SerID = id;
				return "ok";
			}
			catch (Exception)
			{
				return "Have error while processing your request";
			}
		}
		//
		// GET: /Premise/OpeningTimes/PremiseID
		public ViewResult OpeningTimes(string StartMonday, string EndMonday,
			string StartTuesday, string EndTuesday, string StartWednesday, string EndWednesday,
			string StartThursday, string EndThursday, string StartFriday, string EndFriday,
			string StartSaturday, string EndSaturday, string StartSunday, string EndSunday,
			string CheckMonday, string CheckTuesday, string CheckWednesday, string CheckThursday,
			string CheckFriday, string CheckSaturday, string CheckSunday)
		{
			var model = new PremiseOpenSchedule();
			model.StartMonday = StartMonday; ViewBag.Monday = CheckMonday;
			model.EndMonday = EndMonday;
			model.StartTuesday = StartTuesday; ViewBag.Tuesday = CheckTuesday;
			model.EndTuesday = EndTuesday;
			model.StartWednesday = StartWednesday; ViewBag.Wednesday = CheckWednesday;
			model.EndWednesday = EndWednesday;
			model.StartThursday = StartThursday; ViewBag.Thursday = CheckThursday;
			model.EndThursday = EndThursday;
			model.StartFriday = StartFriday; ViewBag.Friday = CheckFriday;
			model.EndFriday = EndFriday;
			model.StartSaturday = StartSaturday; ViewBag.Saturday = CheckSaturday;
			model.EndSaturday = EndSaturday;
			model.StartSunday = StartSunday; ViewBag.Sunday = CheckSunday;
			model.EndSunday = EndSunday;
			
			return View(model);
		}
		[HttpPost]
		public string CheckUnique(string LocationName, string PremiseAddr1="", string PostCode="")
		{
			var istrue = _db.CheckUnique(LocationName, null,PremiseAddr1, PostCode);
			if (istrue)
				return "true";
			return "false";
		}
		[HttpPost]
		public string CheckUnique1(int id, string LocationName, string PremiseAddr1 = "", string PostCode = "")
		{
			var istrue = _db.CheckUnique(LocationName, id, PremiseAddr1, PostCode);
			if (istrue)
				return "true";
			return "false";
		}
    }
}
