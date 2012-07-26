using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ServiceDirectoryTemplate.Models;

namespace ServiceDirectoryTemplate.Controllers
{
	[Authorize]
	public class TeamController : Controller
	{
		CountryModel countryModel = new CountryModel();
		TeamModel teamModel = new TeamModel();
		DepartmentModel depModel = new DepartmentModel();
		//
		// GET: /Team/List
		
		public ActionResult List(int id)
		{
			return View();
		}

		//
		// GET: /Team/Add/DepartmentID

		public ActionResult Add(int id)
		{
			var listCountry = countryModel.GetList();
			ViewBag.DepID = id;
			var dep = depModel.GetDetail(id);

			ViewBag.OrgAddr1 = dep.Directorate.Organisation.OrgAddr1;
			ViewBag.OrgAddr2 = dep.Directorate.Organisation.OrgAddr2;
			ViewBag.OrgAddr3 = dep.Directorate.Organisation.OrgAddr3;
			ViewBag.OrgCode = dep.Directorate.Organisation.OrgPostCode;
			ViewBag.OrgTown = dep.Directorate.Organisation.CityTown;
			ViewBag.OrgCounty = dep.Directorate.Organisation.County;
			ViewBag.OrgCountry = dep.Directorate.Organisation.CountryID;

			ViewBag.ParAddr1 = dep.DepAddr1;
			ViewBag.ParAddr2 = dep.DepAddr2;
			ViewBag.ParAddr3 = dep.DepAddr3;
			ViewBag.ParCode = dep.DepPostCode;
			ViewBag.ParTown = dep.CityTown;
			ViewBag.ParCounty = dep.County;
			ViewBag.ParCountry = dep.CountryID;
			return View(listCountry);
		}
		//
		// GET: /Team/Edit/TeamID
		public ActionResult Amend(int id)
		{
			Team team = teamModel.GetDetail(id);
			ViewBag.ListCountry = countryModel.GetList();
			var dep = depModel.GetDetail(team.DepID);

			ViewBag.OrgAddr1 = dep.Directorate.Organisation.OrgAddr1;
			ViewBag.OrgAddr2 = dep.Directorate.Organisation.OrgAddr2;
			ViewBag.OrgAddr3 = dep.Directorate.Organisation.OrgAddr3;
			ViewBag.OrgCode = dep.Directorate.Organisation.OrgPostCode;
			ViewBag.OrgTown = dep.Directorate.Organisation.CityTown;
			ViewBag.OrgCounty = dep.Directorate.Organisation.County;
			ViewBag.OrgCountry = dep.Directorate.Organisation.CountryID;

			ViewBag.ParAddr1 = dep.DepAddr1;
			ViewBag.ParAddr2 = dep.DepAddr2;
			ViewBag.ParAddr3 = dep.DepAddr3;
			ViewBag.ParCode = dep.DepPostCode;
			ViewBag.ParTown = dep.CityTown;
			ViewBag.ParCounty = dep.County;
			ViewBag.ParCountry = dep.CountryID;
			return View(team);
		}

		//
		// /Team/Create/DepID
		public ActionResult Create(int id, string TeamName, string TeamShortDescription, string TypeOfBusinessID, int? ContactID,
			string AddressLine1, string AddressLine2, string AddressLine3, string TeamFullDescription, string PhoneNumber,
			string PostCode, string Fax, string CityTown, string Email, string County, string WebAddress,
			int? CountryID)
		{
			Team newTeam = new Team();

			newTeam.TeamName = TeamName;
			newTeam.TeamShortDescription = TeamShortDescription;
			newTeam.TypeOfBusiness = TypeOfBusinessID;
			newTeam.LeadContactID = ContactID;
			newTeam.TeamAddr1 = AddressLine1;
			newTeam.TeamAddr2 = AddressLine2;
			newTeam.TeamAddr3 = AddressLine3;
			newTeam.TeamFullDescription = TeamFullDescription;
			newTeam.TeamPhone = PhoneNumber;
			newTeam.TeamPostCode = PostCode;
			newTeam.TeamFax = Fax;
			newTeam.CityTown = CityTown;
			newTeam.TeamEmail = Email;
			newTeam.County = County;
			newTeam.TeamWebAddr = WebAddress;
			newTeam.CountryID = CountryID;

			newTeam.DepID = id;
			newTeam.TeamIsActive = 1;

			teamModel.Insert(newTeam);
			ViewBag.Alert = "true";
			ViewBag.Message = "Action success!";
			ViewBag.URL = "/Department/Amend/" + newTeam.DepID + "#tabs-2";

			return View("../Shared/Redirect");
			//return Redirect("/Department/Amend/" + newTeam.DepID + "#tabs-2");
		}
		//
		// /Team/Update/TeamID
		public ActionResult Update(int TeamID, string TeamName, string TeamShortDescription, string TypeOfBusinessID, int? ContactID,
			string AddressLine1, string AddressLine2, string AddressLine3, string TeamFullDescription, string PhoneNumber,
			string PostCode, string Fax, string CityTown, string Email, string County, string WebAddress,
			int? CountryID)
		{
			Team currentTeam = teamModel.GetDetail(TeamID);

			currentTeam.TeamName = TeamName;
			currentTeam.TeamShortDescription = TeamShortDescription;
			currentTeam.TypeOfBusiness = TypeOfBusinessID;
			currentTeam.LeadContactID = ContactID;
			currentTeam.TeamAddr1 = AddressLine1;
			currentTeam.TeamAddr2 = AddressLine2;
			currentTeam.TeamAddr3 = AddressLine3;
			currentTeam.TeamFullDescription = TeamFullDescription;
			currentTeam.TeamPhone = PhoneNumber;
			currentTeam.TeamPostCode = PostCode;
			currentTeam.TeamFax = Fax;
			currentTeam.CityTown = CityTown;
			currentTeam.TeamEmail = Email;
			currentTeam.County = County;
			currentTeam.TeamWebAddr = WebAddress;
			currentTeam.CountryID = CountryID;

			currentTeam.DepID = 1;
			currentTeam.TeamIsActive = 1;

			teamModel.Update();
			ViewBag.Alert = "true";
			ViewBag.Message = "Action success!";
			ViewBag.URL = "/Department/Amend/" + currentTeam.DepID + "#tabs-2";

			return View("../Shared/Redirect");
			//return Redirect("/Department/Amend/" + currentTeam.DepID + "#tabs-2");
		}
		//
		// GET: /Team/MarkActivate/4

		public string MarkActivate(int id)
		{
			try
			{
				teamModel.MarkActive(id, true);
				return "ok";
			}
			catch (Exception ex)
			{
				return ex.Message;
			}
		}
		//
		// GET: /Team/MarkInactivate/4

		public ActionResult MarkInactivate(int id)
		{
			try
			{
				teamModel.MarkActive(id, false);
				var team = teamModel.GetDetail(id);
				return Redirect("/Department/Amend/" + team.DepID + "#tabs-2");
				//return "ok";
			}
			catch (Exception)
			{
				return View("Error");
			}
		}
		public string CheckUnique(string TeamName)
		{
			var istrue = teamModel.CheckUnique(TeamName);
			if (istrue)
				return "true";
			return "false";
		}
		public string CheckUnique1(int id, string TeamName)
		{
			var istrue = teamModel.CheckUnique(TeamName, id);
			if (istrue)
				return "true";
			return "false";
		}
	}
}
