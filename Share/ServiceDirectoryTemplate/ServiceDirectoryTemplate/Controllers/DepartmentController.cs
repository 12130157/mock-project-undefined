using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ServiceDirectoryTemplate.Models;

namespace ServiceDirectoryTemplate.Controllers
{
	[Authorize]
	public class DepartmentController : Controller
	{
		CountryModel countryModel = new CountryModel();
		DepartmentModel departmentModel = new DepartmentModel();
		DirectorateModel dirModel = new DirectorateModel();
		TeamModel teamModel = new TeamModel();

		//
		// GET: /Department/List
		public ActionResult List(int id)
		{
			return View();
		}

		//
		// GET: /Department/Add/DirectorateID

		public ActionResult Add(int id)
		{
			var listCountry = countryModel.GetList();
			var dir = dirModel.GetDetail(id);
			ViewBag.DirID = id;
			ViewBag.OrgAddr1 = dir.Organisation.OrgAddr1;
			ViewBag.OrgAddr2 = dir.Organisation.OrgAddr2;
			ViewBag.OrgAddr3 = dir.Organisation.OrgAddr3;
			ViewBag.OrgCode = dir.Organisation.OrgPostCode;
			ViewBag.OrgTown = dir.Organisation.CityTown;
			ViewBag.OrgCounty = dir.Organisation.County;
			ViewBag.OrgCountry = dir.Organisation.CountryID;

			ViewBag.ParAddr1 = dir.DirAddr1;
			ViewBag.ParAddr2 = dir.DirAddr2;
			ViewBag.ParAddr3 = dir.DirAddr3;
			ViewBag.ParCode = dir.DirPostCode;
			ViewBag.ParTown = dir.CityTown;
			ViewBag.ParCounty = dir.County;
			ViewBag.ParCountry = dir.CountryID;

			return View(listCountry);
		}
		//
		// GET: /Department/Edit/DepartmentID

		//edit
		public ActionResult Amend(int id)
		{
			Department department = departmentModel.GetDetail(id);
			
			ViewBag.ListCountry = countryModel.GetList();
			//ViewBag.ListDepartment = departmentModel.GetList(department.DepID);
			//ViewBag.ListTeam = teamModel.GetList(department.DepID);
			var dir = dirModel.GetDetail(department.DirID);
			ViewBag.DirID = id;
			ViewBag.OrgAddr1 = dir.Organisation.OrgAddr1;
			ViewBag.OrgAddr2 = dir.Organisation.OrgAddr2;
			ViewBag.OrgAddr3 = dir.Organisation.OrgAddr3;
			ViewBag.OrgCode = dir.Organisation.OrgPostCode;
			ViewBag.OrgTown = dir.Organisation.CityTown;
			ViewBag.OrgCounty = dir.Organisation.County;
			ViewBag.OrgCountry = dir.Organisation.CountryID;

			ViewBag.ParAddr1 = dir.DirAddr1;
			ViewBag.ParAddr2 = dir.DirAddr2;
			ViewBag.ParAddr3 = dir.DirAddr3;
			ViewBag.ParCode = dir.DirPostCode;
			ViewBag.ParTown = dir.CityTown;
			ViewBag.ParCounty = dir.County;
			ViewBag.ParCountry = dir.CountryID;

			return View(department);
		}
		//
		// GET: /Department/MarkActivate/4

		public string MarkActivate(int id)
		{
			try
			{
				departmentModel.MarkActive(id, true);
				return "ok";
			}
			catch (Exception ex)
			{
				return ex.Message;
			}
		}
		//
		// GET: /Department/MarkInactivate/4

		public ActionResult MarkInactivate(int id)
		{
			try
			{
				departmentModel.MarkActive(id, false);
				var dep = departmentModel.GetDetail(id);
				return Redirect("/Department/Amend/" + dep.DepID);
				//return "ok";
			}
			catch (Exception)
			{
				return View("Error");
			}
		}
		/*
		 * URL         GET : /Department/ListTeam/DepID
		 * */
		public PartialViewResult ListTeam(int id)
		{
			int totalPage;
			var ls = teamModel.GetList(out totalPage, id);
			ViewBag.TotalPage = totalPage;
			ViewBag.Page = 1;
			ViewBag.Include = "fasle";
			ViewBag.Filter = "all";
			ViewBag.DepID = id;
			return PartialView(ls);
		}
		/*
		 * URL       POST   : /Department/ListTeam/DepID
		 * */
		[HttpPost]
		public PartialViewResult ListTeam(int id, FormCollection collection)
		{
			int totalPage;
			var ls = teamModel.GetList(out totalPage, id, Convert.ToInt32(collection["page"]), collection["filter"], Convert.ToBoolean(collection["include"]));
			ViewBag.TotalPage = totalPage;
			ViewBag.Page = collection["page"];
			ViewBag.Include = collection["include"];
			ViewBag.Filter = collection["filter"];
			ViewBag.DepID = id;
			return PartialView(ls);
		}
		//
		// /Department/Create/id
		public ActionResult Create(int id,string DepName, string DepShortDescription, string TypeOfBusinessID, int? ContactID,
			string AddressLine1, string AddressLine2, string AddressLine3, string DepFullDescription, string PhoneNumber,
			string PostCode, string Fax, string CityTown, string Email, string County, string WebAddress,
			int CountryID)
		{
			Department newDep = new Department();

			newDep.DepName = DepName;
			newDep.DepShortDescription = DepShortDescription;
			newDep.TypeOfBusiness = TypeOfBusinessID;
			newDep.LeadContactID = ContactID;
			newDep.DepAddr1 = AddressLine1;
			newDep.DepAddr2 = AddressLine2;
			newDep.DepAddr3 = AddressLine3;
			newDep.DepFullDescription = DepFullDescription;
			newDep.DepPhone = PhoneNumber;
			newDep.DepPostCode = PostCode;
			newDep.DepFax = Fax;
			newDep.CityTown = CityTown;
			newDep.DepEmail = Email;
			newDep.County = County;
			newDep.DepWebAddr = WebAddress;
			newDep.CountryID = CountryID;

			newDep.DirID = id;
			newDep.DepIsActive = 1;

			departmentModel.Insert(newDep);
			ViewBag.Alert = "true";
			ViewBag.Message = "Action success!";
			ViewBag.URL = "/Department/Amend/" + newDep.DepID;

			return View("../Shared/Redirect");
			//return RedirectToAction("Amend", "Department", new { id=newDep.DepID});
		}

		//
		// /Department/Update/1
		public ActionResult Update(int id, int DirID, string DepName, string DepShortDescription, string TypeOfBusinessID, int? ContactID,
			string AddressLine1, string AddressLine2, string AddressLine3, string DepFullDescription, string PhoneNumber,
			string PostCode, string Fax, string CityTown, string Email, string County, string WebAddress,
			int CountryID)
		{
			Department currentDep = departmentModel.GetDetail(id);

			currentDep.DepName = DepName;
			currentDep.DepShortDescription = DepShortDescription;
			currentDep.TypeOfBusiness = TypeOfBusinessID;
			currentDep.LeadContactID = ContactID;
			currentDep.DepAddr1 = AddressLine1;
			currentDep.DepAddr2 = AddressLine2;
			currentDep.DepAddr3 = AddressLine3;
			currentDep.DepFullDescription = DepFullDescription;
			currentDep.DepPhone = PhoneNumber;
			currentDep.DepPostCode = PostCode;
			currentDep.DepFax = Fax;
			currentDep.CityTown = CityTown;
			currentDep.DepEmail = Email;
			currentDep.County = County;
			currentDep.DepWebAddr = WebAddress;
			currentDep.CountryID = CountryID;

			currentDep.DirID = DirID;
			currentDep.DepIsActive = 1;

			departmentModel.Update();
			ViewBag.Alert = "true";
			ViewBag.Message = "Action success!";
			ViewBag.URL = "/Department/Amend/" + currentDep.DepID;

			return View("../Shared/Redirect");
			//return Redirect("/Department/Amend/" + currentDep.DepID);
		}
		public string CheckUnique(string DepName)
		{
			var istrue = departmentModel.CheckUnique(DepName);
			if (istrue)
				return "true";
			return "false";
		}
		public string CheckUnique1(int id, string DepName)
		{
			var istrue = departmentModel.CheckUnique(DepName, id);
			if (istrue)
				return "true";
			return "false";
		}
	}
}
