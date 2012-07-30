using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ServiceDirectoryTemplate.Models;

namespace ServiceDirectoryTemplate.Controllers
{
	[Authorize]
	public class DirectorateController : Controller
	{
		CountryModel countryModel = new CountryModel();
		DirectorateModel directorateModel = new DirectorateModel();
		DepartmentModel departmentModel = new DepartmentModel();
		OrganisationModel orgModel = new OrganisationModel();
		//
		// GET: /Directorate/List

		public ActionResult List()
		{
			int totalPage;
			var model = directorateModel.GetList(out totalPage);
			ViewBag.TotalPage = totalPage;
			ViewBag.Page = 1;
			ViewBag.Include = false;
			ViewBag.Filter = "all";
			return View(model);
		}
		
		//
		// POST:  /Directorate/List/
		[HttpPost]
		public PartialViewResult List(int page = 1, string filter = "all", bool include = false)
		{
			
			int totalPage;
			var model = directorateModel.GetList(out totalPage, null, page, filter, include);
			ViewBag.TotalPage = totalPage;
			ViewBag.Page = page;
			ViewBag.Include = include;
			ViewBag.Filter = filter;

			return PartialView(model);
		}

		//
		// GET: /Directorate/Add/id

		public ActionResult Add(int id)
		{
			var listCountry = countryModel.GetList();
			var org = orgModel.GetDetail(id);

			ViewBag.OrgID = id;
			ViewBag.OrgAddr1 = org.OrgAddr1;
			ViewBag.OrgAddr2 = org.OrgAddr2;
			ViewBag.OrgAddr3 = org.OrgAddr3;
			ViewBag.OrgCode = org.OrgPostCode;
			ViewBag.OrgTown = org.CityTown;
			ViewBag.OrgCounty = org.County;
			ViewBag.OrgCountry = org.CountryID;

			return View(listCountry);
		}

		//edit
		public ActionResult Amend(int id)
		{
			Directorate directorate = directorateModel.GetDetail(id);
			ViewBag.ListCountry = countryModel.GetList();
			
			ViewBag.test = directorate.DirID;
			return View(directorate);
		}
		//
		// GET: /Directorate/MarkActivate/4

		public string MarkActivate(int id)
		{
			try
			{
				directorateModel.MarkActive(id, true);
				return "ok";
			}
			catch (Exception ex)
			{
				return ex.Message;
			}
		}
		//
		// GET: /Directorate/MarkInactivate/4

		public ActionResult MarkInactivate(int id)
		{
			try
			{
				directorateModel.MarkActive(id, false);
				var dir = directorateModel.GetDetail(id);
				return Redirect("/Directorate/Amend/" + dir.DirID);
				//return "ok";
			}
			catch (Exception)
			{
				return View("Error");
			}
		}
		/*
		 * URL         GET : Directorate/ListDepartment/DirID
		 
		 * */
		public PartialViewResult ListDepartment(int id)
		{
			int totalPage;
			var ls = departmentModel.GetList(out totalPage, id);
			ViewBag.TotalPage = totalPage;
			ViewBag.Page = 1;
			ViewBag.Include = "fasle";
			ViewBag.Filter = "all";
			ViewBag.DirID = id;
			return PartialView(ls);
		}
		/*
		 * URL       POST   : Directorate/ListDepartment/DirID

		 * */
		[HttpPost]
		public PartialViewResult ListDepartment(int id, FormCollection collection)
		{
			int totalPage;
			var ls = departmentModel.GetList(out totalPage, id, Convert.ToInt32(collection["page"]), collection["filter"], Convert.ToBoolean(collection["include"]));
			ViewBag.TotalPage = totalPage;
			ViewBag.Page = collection["page"];
			ViewBag.Include = collection["include"];
			ViewBag.Filter = collection["filter"];
			ViewBag.DirID = id;
			return PartialView(ls);
		}
		//
		// /Directorate/Create/1
		public ActionResult Create(int id,string DirName, string DirShortDescription, string TypeOfBusinessID, int? ContactID,
			string AddressLine1, string AddressLine2, string AddressLine3, string DirFullDescription, string PhoneNumber,
			string PostCode, string Fax, string CityTown, string Email, string County, string WebAddress,
			int CountryID, int? CharityNumber, int? CompanyNumber)
		{
			Directorate newDir = new Directorate();

			newDir.DirName = DirName;
			newDir.DirShortDescription = DirShortDescription;
			newDir.TypeOfBusiness = TypeOfBusinessID;
			newDir.LeadContactID = ContactID;
			newDir.DirAddr1 = AddressLine1;
			newDir.DirAddr2 = AddressLine2;
			newDir.DirAddr3 = AddressLine3;
			newDir.DirFullDescription = DirFullDescription;
			newDir.DirPhone = PhoneNumber;
			newDir.DirPostCode = PostCode;
			newDir.DirFax = Fax;
			newDir.CityTown = CityTown;
			newDir.DirEmail = Email;
			newDir.County = County;
			newDir.DirWebAddr = WebAddress;
			newDir.CountryID = CountryID;
			newDir.DirCharNumb = CharityNumber;
			newDir.DirCompNumb = CompanyNumber;

			newDir.OrgID = id;
			newDir.DirIsActive = 1;

			directorateModel.Insert(newDir);
			ViewBag.Alert = "true";
			ViewBag.Message = "Action success!";
			ViewBag.URL = "/Directorate/Amend/" + newDir.DirID;

			return View("../Shared/Redirect");
			//return RedirectToAction("Amend", "Directorate", new { id = newDir.DirID});
		}
		//
		// /Diranisation/Update/1
		public ActionResult Update(int id,int OrgID, string DirName, string DirShortDescription, string TypeOfBusinessID, int? ContactID,
			string AddressLine1, string AddressLine2, string AddressLine3, string DirFullDescription, string PhoneNumber,
			string PostCode, string Fax, string CityTown, string Email, string County, string WebAddress,
			int CountryID, int? CharityNumber, int? CompanyNumber)
		{
			Directorate currentDir = directorateModel.GetDetail(id);

			currentDir.DirName = DirName;
			currentDir.DirShortDescription = DirShortDescription;
			currentDir.TypeOfBusiness = TypeOfBusinessID;
			currentDir.LeadContactID = ContactID;
			currentDir.DirAddr1 = AddressLine1;
			currentDir.DirAddr2 = AddressLine2;
			currentDir.DirAddr3 = AddressLine3;
			currentDir.DirFullDescription = DirFullDescription;
			currentDir.DirPhone = PhoneNumber;
			currentDir.DirPostCode = PostCode;
			currentDir.DirFax = Fax;
			currentDir.CityTown = CityTown;
			currentDir.DirEmail = Email;
			currentDir.County = County;
			currentDir.DirWebAddr = WebAddress;
			currentDir.CountryID = CountryID;
			currentDir.DirCharNumb = CharityNumber;
			currentDir.DirCompNumb = CompanyNumber;

			currentDir.OrgID = OrgID;
			currentDir.DirIsActive = 1;

			directorateModel.Update();
			ViewBag.Alert = "true";
			ViewBag.Message = "Action success!";
			ViewBag.URL = "/Directorate/Amend/" + currentDir.DirID;

			return View("../Shared/Redirect");
			//return Redirect("/Directorate/Amend/" + currentDir.DirID );
		}
		public string CheckUnique(string DirName)
		{
			var istrue = directorateModel.CheckUnique(DirName);
			if (istrue)
				return "true";
			return "false";
		}
		public string CheckUnique1(int id, string DirName)
		{
			var istrue = directorateModel.CheckUnique(DirName, id);
			if (istrue)
				return "true";
			return "false";
		}
	}
}
