/*
    * File name    : Controllers/OrganisationController.cs
    * Description  : controller work with organisation, contains list, add new, update.
    * Author       : Thinhnx004 - Intern04 Fsoft
    * Date         : 03/03/2012
* */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ServiceDirectoryTemplate.Models;
using System.Web.Security;

namespace ServiceDirectoryTemplate.Controllers
{
	[Authorize]
	public class OrganisationController : Controller
	{
		OrganisationModel orgModel = new OrganisationModel();
		CountryModel countryModel = new CountryModel();
		SupportingMaterialModel supportingMaterialModel = new SupportingMaterialModel();
		DirectorateModel directorateModel = new DirectorateModel();

		/*
		 * URL          : Organisation/List
		 * Output       : list all organisation in system
		 * */
		public ActionResult List()
		{
			int totalPage;
			var listOrg = orgModel.GetList(out totalPage);
			ViewBag.TotalPage = totalPage;
			ViewBag.Page = 1;
			ViewBag.Include = "false";
			ViewBag.Filter = "all";
			return View(listOrg);
		}

		/*
		 * URL      POST: Organisation/List?page=1&filter=all&include=true
		 * Output       : list all organisation in system
		 * */
		[HttpPost]
		//public PartialViewResult List(int page, string filter, bool? include)
		public PartialViewResult List(FormCollection collection)
		{
			int totalPage;
			var listOrg = orgModel.GetList(out totalPage, Convert.ToInt32(collection["page"]), collection["filter"], Convert.ToBoolean(collection["include"]));
			ViewBag.TotalPage = totalPage;
			ViewBag.Page = collection["page"];
			ViewBag.Include = collection["include"];
			ViewBag.Filter = collection["filter"];
			return PartialView(listOrg);
		}
		/*
		 * URL          : Organisation/Add
		 * Output       : add new a organisation
		 * */
		public ActionResult Add()
		{
			ViewBag.ListService = orgModel.ListService();
			ViewBag.ListProgramme = orgModel.ListProgramme();
			ViewBag.ListCountry = countryModel.GetList();
			return View();
		}

		/*
		 * URL          : Organisation/Edit
		 * Output       : edit a organisation
		 * */
		public ActionResult Amend(int id)
		{
			Organisation currentOrg = orgModel.GetDetail(id);
			
			ViewBag.ListService = orgModel.ListService();
			ViewBag.ListProgramme = orgModel.ListProgramme();
			
			ViewBag.ListCountry = countryModel.GetList();
			//currentOrg = null; Roles.GetUsersInRole();
			return View(currentOrg);
		}
		/*
		 * URL          : Organisation/ListMaterials/OrgID
		 * Output       : edit a organisation
		 * */
		public PartialViewResult ListMaterial(int id)
		{
			int totalPage;
			var ls = supportingMaterialModel.GetList(out totalPage, id);
			ViewBag.TotalPage = totalPage;
			ViewBag.Page = 1;
			ViewBag.Include = "fasle";
			ViewBag.Filter = "all";
			ViewBag.OrgID = id;
			return PartialView(ls);
		}
		/*
		 * URL          : Organisation/ListMaterials/OrgID
		 * Output       : edit a organisation
		 * */
		[HttpPost]
		public PartialViewResult ListMaterial(int id, FormCollection collection)
		{
			int totalPage;
			var ls = supportingMaterialModel.GetList(out totalPage, id, Convert.ToInt32(collection["page"]), Convert.ToBoolean(collection["include"]));
			ViewBag.TotalPage = totalPage;
			ViewBag.Page = collection["page"];
			ViewBag.Include = collection["include"];
			ViewBag.Filter = collection["filter"];
			ViewBag.OrgID = id;
			return PartialView(ls);
		}
		/*
		 * URL          : Organisation/ListDirectorate/OrgID
		 * Output       : edit a organisation
		 * */
		public PartialViewResult ListDirectorate(int id)
		{
			int totalPage;
			var ls = directorateModel.GetList(out totalPage, id);
			ViewBag.TotalPage = totalPage;
			ViewBag.Page = 1;
			ViewBag.Include = "fasle";
			ViewBag.Filter = "all";
			ViewBag.OrgID = id;
			return PartialView(ls);
		}
		/*
		 * URL          : Organisation/ListDirectorate/OrgID
		 * Output       : edit a organisation
		 * */
		[HttpPost]
		public PartialViewResult ListDirectorate(int id, FormCollection collection)
		{
			int totalPage;
			var ls = directorateModel.GetList(out totalPage, id, Convert.ToInt32(collection["page"]), collection["filter"], Convert.ToBoolean(collection["include"]));
			ViewBag.TotalPage = totalPage;
			ViewBag.Page = collection["page"];
			ViewBag.Include = collection["include"];
			ViewBag.Filter = collection["filter"];
			ViewBag.OrgID = id;
			return PartialView(ls);
		}
		/*
		 * URL          : Organisation/Create
		 * Output       : process when click to add new a organisation
		 * */
		[HttpPost]
		public ActionResult Create(string OrgName, string OrgShortDescription, string TypeOfBusinessID, int? ContactID,
			string AddressLine1, string PhoneNumber, string PostCode,
			int CountryID, decimal? CharityNumber, decimal? CompanyNumber, FormCollection collection)
		{

			if (OrgName == "")
			{
				ViewBag.ErrorMessage = "Please input the organisation name";
				return RedirectToAction("Add", "Organisation");
			}
			else
			{

				Organisation newOrg = new Organisation();

				newOrg.OrgName = OrgName;
				newOrg.OrgShortDescription = OrgShortDescription;
				newOrg.TypeOfBusiness = TypeOfBusinessID;
				newOrg.LeadContactID = ContactID;
				newOrg.OrgAddr1 = AddressLine1;
				newOrg.OrgAddr2 = collection["AddressLine2"];
				newOrg.OrgAddr3 = collection["AddressLine3"];
				newOrg.OrgFullDescription = collection["OrgFullDescription"];
				newOrg.OrgPhone = PhoneNumber;
				newOrg.OrgPostCode = PostCode;
				newOrg.OrgFax = collection["Fax"];
				newOrg.CityTown = collection["CityTown"];
				newOrg.OrgEmail = collection["Email"];
				newOrg.County = collection["County"];
				newOrg.OrgWebAddr = collection["WebAddress"];
				newOrg.CountryID = CountryID;
				newOrg.OrgCharNumb = CharityNumber;
				newOrg.OrgCompNumb = CompanyNumber;
				newOrg.OrgProgrammeList = "," + collection["EOIProgramme[]"] + ",";
				newOrg.OrgServiceList = "," + collection["EOIService[]"] + ",";
				newOrg.OrgIsActive = 1;
				newOrg.RefListID = "," + collection["OrganisationDetail2[]"] + ",";
				orgModel.Insert(newOrg);
				
				orgModel.AddLinkService(newOrg.OrgID, collection["EOIService[]"]);
				ViewBag.Alert = "true";
				ViewBag.Message = "Action success!";
				ViewBag.URL = "/Organisation/Amend/" + newOrg.OrgID;

				return View("../Shared/Redirect");
				//return RedirectToAction("Amend", "Organisation", new { id=newOrg.OrgID});
			}
		}
		/*
		 * URL          : /Organisation/Update
		 * Output       : process when update data organisation
		 * */
		[HttpPost]
		public ActionResult Update(int OrgID, string OrgName, string OrgShortDescription, string TypeOfBusinessID, int? ContactID,
			string AddressLine1, string PhoneNumber, string PostCode,
			int? CountryID, decimal? CharityNumber, decimal? CompanyNumber, FormCollection collection)
		{
			Organisation currentOrg = orgModel.GetDetail(OrgID);

			currentOrg.OrgName = OrgName;
			currentOrg.OrgShortDescription = OrgShortDescription;
			currentOrg.TypeOfBusiness = TypeOfBusinessID;
			currentOrg.LeadContactID = ContactID;
			currentOrg.OrgAddr1 = AddressLine1;
			currentOrg.OrgAddr2 = collection["AddressLine2"];
			currentOrg.OrgAddr3 = collection["AddressLine3"];
			currentOrg.OrgFullDescription = collection["OrgFullDescription"];
			currentOrg.OrgPhone = PhoneNumber;
			currentOrg.OrgPostCode = PostCode;
			currentOrg.OrgFax = collection["Fax"];
			currentOrg.CityTown = collection["CityTown"];
			currentOrg.OrgEmail = collection["Email"];
			currentOrg.County = collection["County"];
			currentOrg.OrgWebAddr = collection["WebAddress"];
			currentOrg.CountryID = CountryID;
			currentOrg.OrgCharNumb = CharityNumber;
			currentOrg.OrgCompNumb = CompanyNumber;
			currentOrg.OrgProgrammeList = "," + collection["EOIProgramme[]"] + ",";
			currentOrg.OrgServiceList = "," + collection["EOIService[]"] + ",";
			currentOrg.RefListID = "," + collection["OrganisationDetail2[]"] + ",";
			orgModel.Update();

			orgModel.AddLinkService(currentOrg.OrgID, collection["EOIService[]"]);
			ViewBag.Alert = "true";
			ViewBag.Message = "Action success!";
			ViewBag.URL = "/Organisation/Amend/" + currentOrg.OrgID;

			return View("../Shared/Redirect");
			//return RedirectToAction("Amend", "Organisation", new { id = currentOrg.OrgID });

		}
		//
		// GET: /Organisation/MarkActivate/4

		public string MarkActivate(int id)
		{
			try
			{
				orgModel.MarkActive(id, true);
				return "ok";
			}
			catch (Exception ex)
			{
				return ex.Message;
			}
		}
		//
		// GET: /Organisation/MarkInactivate/4

		public ActionResult MarkInactivate(int id)
		{
			try
			{
				orgModel.MarkActive(id, false);
				return RedirectToAction("List");
				//return "ok";
			}
			catch (Exception)
			{
				return View("Error");
			}
		}
		public string CheckUnique(string OrgName)
		{
			var istrue = orgModel.CheckUnique(OrgName);
			if (istrue)
				return "true";
			return "false";
		}
		public string CheckUnique1(int id, string OrgName)
		{
			var istrue = orgModel.CheckUnique(OrgName, id);
			if (istrue)
				return "true";
			return "false";
		}
	}
}
