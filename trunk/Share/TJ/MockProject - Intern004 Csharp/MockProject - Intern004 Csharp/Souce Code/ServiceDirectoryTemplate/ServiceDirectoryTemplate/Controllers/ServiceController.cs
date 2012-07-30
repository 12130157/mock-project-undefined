using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ServiceDirectoryTemplate.Models;
using System.Globalization;

namespace ServiceDirectoryTemplate.Controllers
{
	[Authorize]
	public class ServiceController : Controller
	{
		private ServiceModel _db = new ServiceModel();
		// 
		// GET: /Service/List

		public ActionResult List()
		{
			int totalPage;
			var ls = _db.ListService(out totalPage);
			ViewBag.TotalPage = totalPage;
			ViewBag.Page = 1;
			ViewBag.Include = "false";
			ViewBag.Filter = "all";
			return View(ls);
		}

		//
		// POST: /Service/List
		[HttpPost]
		public PartialViewResult List(FormCollection collection)
		{
			int totalPage;
			var ls = _db.ListService(out totalPage, Convert.ToInt32(collection["page"]), collection["filter"], Convert.ToBoolean(collection["include"]));
			ViewBag.TotalPage = totalPage;
			ViewBag.Page = collection["page"];
			ViewBag.Include = collection["include"];
			ViewBag.Filter = collection["filter"];

			return PartialView(ls);
		}

		//
		// GET: /Service/Add

		public ActionResult Add()
		{
			ViewBag.Service = _db.ListOtherService(null);
			ViewBag.Programme = _db.ListProgramme();
			return View();
		}

		//
		// GET: /Service/Copy/1

		public ActionResult Copy(int id)
		{
			//ViewBag.RefFrom = "ServiceDetail2";
			ViewBag.ID = id;
			var model = _db.GetService(id);
			if (model == null)
				return View("Error");
			if (model.SerStartExpected != null) ViewBag.StartExpected = ((DateTime)model.SerStartExpected).ToString("dd/MM/yyyy");
			if (model.SerStartDate != null) ViewBag.StartDate = ((DateTime)model.SerStartDate).ToString("dd/MM/yyyy");
			if (model.SerEndDate != null) ViewBag.EndDate = ((DateTime)model.SerEndDate).ToString("dd/MM/yyyy");

			ViewBag.Service = _db.ListOtherService(null);
			ViewBag.Programme = _db.ListProgramme();
			return View("AddCopy", model);
		}

		//
		// GET: /Service/GetFunding/1

		public PartialViewResult GetFunding(int id)
		{
			var model = _db.GetFunding(id);

			if (model != null)
			{
				ViewBag.FundingSource = model.FundingSource;

				ViewBag.FundingContactID = model.FundingContractDetail;
				var con = _db.GetContact(model.FundingContractDetail);
				if (con != null)
				{
					ViewBag.FundingContractDetail = con.FirstName;
				}

				ViewBag.FundingNeeds = model.FundingNeeds;
				ViewBag.FundingContinuationNeeded = model.FundingContinuationNeeded;
				ViewBag.FundingAmount = model.FundingAmount;
				ViewBag.FundingContinuationAmount = model.FundingContinuationAmount;
				if (model.FundingStart != null) ViewBag.FundingStart = ((DateTime)model.FundingStart).ToString("dd/MM/yyyy");
				if (model.FundingEnd != null) ViewBag.FundingEnd = ((DateTime)model.FundingEnd).ToString("dd/MM/yyyy");
				if (model.FundraisingDonationDate != null) ViewBag.DonationDate = ((DateTime)model.FundraisingDonationDate).ToString("dd/MM/yyyy");
				if (model.FundraisingRequiredBy != null) ViewBag.RequiredByDate = ((DateTime)model.FundraisingRequiredBy).ToString("dd/MM/yyyy");
				if (model.FundraisingCompletedDate != null) ViewBag.FundraisingCompletedDate = ((DateTime)model.FundraisingCompletedDate).ToString("dd/MM/yyyy");

				ViewBag.FundingContinuationDetail = model.FundingContinuationDetail;
				ViewBag.FundraisingForText = model.FundraisingForText;
				ViewBag.FundraisingWhy = model.FundraisingWhy;
				ViewBag.FundraisingNeeds = model.FundraisingNeeds;
				ViewBag.FundraisingComplete = model.FundraisingComplete;
				ViewBag.FundraisingDonorAnonymous = model.FundraisingDonorAnonymous;
				ViewBag.FundraisingDonorAmount = model.FundraisingDonorAmount;
				ViewBag.FundraisingDonationIncremental = model.FundraisingDonationIncremental;


			}
			return PartialView(model);
		}

		//
		// GET: /Service/GetFunding/1

		public PartialViewResult OrganisationsList(int id)
		{
			int totalPage;
			var model = _db.ListOrganisation(id, out totalPage);
			ViewBag.TotalPage = totalPage;
			ViewBag.Filter = "all";
			ViewBag.SerID = id;
			return PartialView(model);
		}
		//
		// POST: /Service/OrganisationsList/1
		[HttpPost]
		public PartialViewResult OrganisationsList(int id, int page=1, string filter="all")
		{
			int totalPage;
			var model = _db.ListOrganisation(id, out totalPage, page);
			ViewBag.TotalPage = totalPage;
			ViewBag.SerID = id;
			ViewBag.Page = page;
			ViewBag.Filter = filter;
			return PartialView(model);
		}


		//
		// GET: /Service/PremisesList/1

		public PartialViewResult PremisesList(int id)
		{
			int totalPage;
			var model = _db.ListPremiseLink(id, out totalPage);
			ViewBag.TotalPage = totalPage;
			ViewBag.SerID = id;
			ViewBag.Filter = "all";
			return PartialView(model);
		}
		//
		// POST: /Service/PremisesList/1
		[HttpPost]
		public PartialViewResult PremisesList(int id, int page=1, string filter="all")
		{
			int totalPage;
			var model = _db.ListPremiseLink(id, out totalPage, page);
			ViewBag.TotalPage = totalPage;
			ViewBag.SerID = id;
			ViewBag.Page = page;
			ViewBag.Filter = filter;
			return PartialView(model);
		}

		//
		// POST: /Service/RemovePremiseLink
		[HttpPost]
		public string RemovePremiseLink(int LinkID)
		{
			try
			{
				_db.RemovePremiseLink(LinkID);
				//ViewBag.SerID = id;
				return "ok";
			}
			catch (Exception)
			{
				return "Have error while processing your request";
			}
		}

		//
		// GET: /Service/NewPremiseLink/1

		public ViewResult NewPremiseLink(int id)
		{
			try
			{
				int total;
				ViewBag.SerID = id;
				var model = _db.ListPremiseNotLink(id, out total);
				ViewBag.TotalPage = total;
				return View(model);
			}
			catch (Exception)
			{
				return View("Error");
			}
		}
		//
		// POST: /Service/NewPremiseLink/1
		[HttpPost]
		public PartialViewResult NewPremiseLink(int id, int page=1, string filter="all")
		{
			try
			{
				int total;
				ViewBag.SerID = id;
				var model = _db.ListPremiseNotLink(id, out total, page, filter);
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
		// POST: /Service/AddPremiseLink/1
		[HttpPost]
		public PartialViewResult AddPremiseLink(int id, FormCollection collection)
		{
			try
			{
				ViewBag.SerID = id;
				_db.AddPremiseLink(id, collection["id[]"]);
				ViewBag.Mess = "Done";
				return PartialView("Close");
			}
			catch (Exception)
			{
				ViewBag.Mess = "Have error while processing";
				return PartialView("Close");
			}
		}
		//
		// GET: /Service/EnterProjectCode/LinkID

		public PartialViewResult EnterProjectCode(int id)
		{
			//var model = _db.ListPremis(SerID);
			ViewBag.LinkID = id;
			ViewBag.Code = _db.GetProjectCode(id);
			return PartialView();
		}
		//
		// POST: /Service/EnterProjectCode/?SerID=1&PremiseID=2
		[HttpPost]
		public PartialViewResult EnterProjectCode(int id, string projectcode)
		{
			try
			{
				//var model = _db.ListPremis(SerID);
				//ViewBag.SerID = SerID;
				//ViewBag.PremiseID = PremiseID;
				_db.SetProjectCode(id, projectcode);
				ViewBag.Mess = "Done";
				return PartialView("Close");
			}
			catch
			{
				ViewBag.Mess = "Have error while processing";
				return PartialView("Close");
			}
		}

		//
		// GET: /Service/EditRole/LinkID

		public PartialViewResult EditRole(int id)
		{
			var role = _db.GetRole(id);
			ViewBag.Funder = role.Contains("Funder") ? "checked=checked" : null;
			ViewBag.Lead = role.Contains("Lead") ? "checked=checked" : null;
			ViewBag.Delivery = role.Contains("Delivery") ? "checked=checked" : null;
			ViewBag.Auditor = role.Contains("Auditor") ? "checked=checked" : null;
			ViewBag.LinkID = id;
			return PartialView();
		}
		//
		// POST: /Service//EditRole/LinkID
		[HttpPost]
		public PartialViewResult EditRole(int id, FormCollection collection)
		{
			try
			{
				_db.EditRole(id, collection["role[]"]);
				//ViewBag.role = collection["role[]"];
				//ViewBag.SerID = SerID;
				//ViewBag.OrgID = OrgID;
				//return PartialView();
				ViewBag.Mess = "Done";
				return PartialView("Close");
			}
			catch (Exception)
			{
				ViewBag.Mess = "Have error while processing";
				return PartialView("Close");
			}

		}

		//
		// GET: /Service/MarkActivate/4

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
		//
		// GET: /Service/MarkInactivate/4

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
		// GET: /Service/Amend/1

		public ActionResult Amend(int id)
		{
			ViewBag.ID = id;
			var model = _db.GetService(id);
			if (model == null)
				return View("Error");
			if (model.SerStartExpected != null) ViewBag.StartExpected = ((DateTime)model.SerStartExpected).ToString("dd/MM/yyyy");
			if (model.SerStartDate != null) ViewBag.StartDate = ((DateTime)model.SerStartDate).ToString("dd/MM/yyyy");
			if (model.SerEndDate != null) ViewBag.EndDate = ((DateTime)model.SerEndDate).ToString("dd/MM/yyyy");

			ViewBag.Service = _db.ListOtherService(id);
			ViewBag.Programme = _db.ListProgramme();
			return View(model);
		}
		//
		// POST: /Service/Amend/1
		[HttpPost]
		public ActionResult Amend(int id, int? LeadContactID, int? StagedPayment, int? ProgrammeID, int? ExtendYear, 
			int? ExtendMonth, int? LimitedYear, int? LimitedMonth, FormCollection collection)
		{
			CultureInfo enUS = new CultureInfo("en-US");
			var ser = _db.GetService(id);
			ser.SerName = collection["ServiceName"];
			ser.SerIsActive = 1;
			ser.SerShortDescription = collection["ShortDescription"];
			ser.SerFullDescription = collection["FullDescription"];
			ser.SerSubType = collection["SubType"];
			ser.SerDeptCode = collection["DeptCode"];
			ser.LeadContactID = LeadContactID;
			ser.SerType = collection["SerType"];
			ser.ClientDescription = collection["ClientDescription"];
			ser.SerDescriptionDelivery = collection["DescriptionDelivery"];
			ser.SerAttendance = collection["Attendance"];
			ser.SerContractCode = collection["ContractCode"];
			ser.SerStartExpected = _db.ConvertDate(collection["StartExpected"], "dd/MM/yyyy");
			ser.SerContractValue = collection["ContractValue"];
			ser.SerStartDate = _db.ConvertDate(collection["StartDate"], "dd/MM/yyyy");
			ser.SerEndDate = _db.ConvertDate(collection["EndDate"], "dd/MM/yyyy");
			ser.SerReferralProcess = collection["ReferralProcess"];

			ser.SerStagedPayment = StagedPayment;
			ser.SerExtendable = (collection["Extendable"] == "1" ? 1 : 0);
			ser.SerTimeLimited = (collection["TimeLimited"] == "1" ? 1 : 0);
			ser.SerExtendYear = ser.SerExtendable == 1 ? ExtendYear : 0;
			ser.SerExtendMonth = ser.SerExtendable == 1 ? ExtendMonth : 0;
			ser.SerTimeLimitedYear = ser.SerTimeLimited == 1 ? LimitedYear : 0;
			ser.SerTimeLimitedMonth = ser.SerTimeLimited == 1 ? LimitedMonth : 0;
			ser.ProgrammeID = ProgrammeID;
			ser.OtherService = "," + collection["OtherService[]"] + ",";
			ser.SerDetail3RefList = "," + collection["SerDetail3RefList[]"] + ",";
			ser.SerDetail2RefList = ","+collection["ServiceDetail2[]"]+",";

			if (ser.SerSubType == "Contract")
			{
				ser.SerContractRefList = "," + collection["ServiceContract[]"]+",";
			}
			
			if (ser.SerSubType == "Funded")
			{
				var fund = _db.GetFunding(id);
				var isNewFunding = false;
				if (fund == null)
				{
					fund = new FundingDetail();
					isNewFunding = true;
				}
				fund.FundingSource = collection["fundingsource"];
				fund.FundingNeeds = collection["fundingneeds"];
				fund.FundingContractDetail = Convert.ToInt32(collection["FundingContactID"]);
				fund.FundingContinuationNeeded = collection["fundingcontinuation"] == "1" ? 1 : 0;
				if (fund.FundingContinuationNeeded == 1)
				{
					fund.FundingContinuationAmount = Convert.ToDecimal(collection["continuationamount"]);
					fund.FundingContinuationDetail = collection["continuationdetail"];
				}

				fund.FundingAmount = Convert.ToDecimal(collection["fundingamount"]);
				fund.FundingStart = _db.ConvertDate(collection["fundingstart"], "dd/MM/yyyy");
				fund.FundingEnd = _db.ConvertDate(collection["fundingend"], "dd/MM/yyyy");
				fund.FundraisingForText = collection["fundraisingtext"];
				fund.FundraisingNeeds = collection["fundraisingneeds"];
				fund.FundraisingRequiredBy = _db.ConvertDate(collection["fundingrequiredby"], "dd/MM/yyyy");
				fund.FundraisingWhy = collection["fundingfundraisingwhy"];
				fund.FundraisingComplete = collection["fundingcomplete"] == "1" ? 1 : 0;
				fund.FundraisingCompletedDate = fund.FundraisingComplete == 1 ? _db.ConvertDate(collection["fundingcompletedate"], "dd/MM/yyyy") : null;
				fund.FundraisingDonorAnonymous = collection["donoranonymous"] == "1" ? 1 : 0;
				fund.FundraisingDonationDate = _db.ConvertDate(collection["donationdate"], "dd/MM/yyyy");
				fund.FundraisingDonorAmount = collection["donoramount"]==""? new decimal?():Convert.ToDecimal(collection["donoramount"]);
				fund.FundraisingDonationIncremental = collection["fundingincremental"]=="1"? 1:0;
				fund.SerID = ser.SerID;
				if (isNewFunding == true)
					_db.CreateFunding(fund);
			}
			_db.Update();
			//ViewBag.testCheckList = collection["ServiceContract[]"];
			//ViewBag.testCheck = collection["fundingcomplete"];
			//ViewBag.testDate = collection["StartExpected"];
			//ViewBag.testMoney = collection["fundingamount"];

			//ViewBag.RefFrom = "ServiceDetail2";
			//ViewBag.RefChecked = ",44,45,47";
			//ViewBag.RefFrom = "ServiceContract";
			//ViewBag.RefChecked = ",31,32,40";
			//RedirectToAction("Add","Service");
			ViewBag.Alert = "true";
			ViewBag.Message = "Action success!";
			ViewBag.URL = "/Service/List";

			return View("../Shared/Redirect");
			//return RedirectToAction("List");
		}


		[HttpPost]
		public ActionResult Save(int? ProgrammeID, int? LeadContactID, int? StagedPayment, int? ExtendYear,
			int? ExtendMonth, int? LimitedYear, int? LimitedMonth, decimal? continuationamount, FormCollection collection)
		{
			CultureInfo enUS = new CultureInfo("en-US");
			Service ser = new Service();
			ser.SerName = collection["ServiceName"];
			ser.SerIsActive = 1;
			ser.SerShortDescription = collection["ShortDescription"];
			ser.SerFullDescription = collection["FullDescription"];
			ser.SerSubType = collection["SubType"];
			ser.SerDeptCode = collection["DeptCode"];
			ser.LeadContactID = LeadContactID;
			ser.SerType = collection["SerType"];
			ser.ClientDescription = collection["ClientDescription"];
			ser.SerDescriptionDelivery = collection["DescriptionDelivery"];
			ser.SerAttendance = collection["Attendance"];
			ser.SerContractCode = collection["ContractCode"];
			ser.SerStartExpected = _db.ConvertDate(collection["StartExpected"], "dd/MM/yyyy");
			ser.SerContractValue = collection["ContractValue"];
			ser.SerStartDate = _db.ConvertDate(collection["StartDate"], "dd/MM/yyyy");
			ser.SerEndDate = _db.ConvertDate(collection["EndDate"], "dd/MM/yyyy");
			ser.SerReferralProcess = collection["ReferralProcess"];

			ser.SerStagedPayment = StagedPayment;
			ser.SerExtendable = (collection["Extendable"] == "1" ? 1 : 0);
			ser.SerTimeLimited = (collection["TimeLimited"] == "1" ? 1 : 0);
			ser.SerExtendYear = ser.SerExtendable == 1 ? ExtendYear : 0;
			ser.SerExtendMonth = ser.SerExtendable == 1 ? ExtendMonth : 0;
			ser.SerTimeLimitedYear = ser.SerTimeLimited == 1 ? LimitedYear : 0;
			ser.SerTimeLimitedMonth = ser.SerTimeLimited == 1 ? LimitedMonth : 0;
			ser.ProgrammeID = ProgrammeID;
			ser.OtherService = "," + collection["OtherService[]"] + ",";
			ser.SerDetail3RefList = "," + collection["SerDetail3RefList[]"] + ",";
			ser.SerDetail2RefList = ","+collection["ServiceDetail2[]"]+",";

			if (ser.SerSubType == "Contract")
			{
				ser.SerContractRefList = "," + collection["ServiceContract[]"]+",";
			}
			var re = _db.CreateService(ser);
			if (ser.SerSubType == "Funded" && re == true)
			{

				FundingDetail fund = new FundingDetail();
				fund.FundingSource = collection["fundingsource"];
				fund.FundingNeeds = collection["fundingneeds"];
				fund.FundingContractDetail = Convert.ToInt32(collection["FundingContactID"]);
				fund.FundingContinuationNeeded = collection["fundingcontinuation"] == "1" ? 1 : 0;
				if (fund.FundingContinuationNeeded == 1)
				{
					fund.FundingContinuationAmount = continuationamount;
					fund.FundingContinuationDetail = collection["continuationdetail"];
				}

				fund.FundingAmount = Convert.ToDecimal(collection["fundingamount"]);
				fund.FundingStart = _db.ConvertDate(collection["fundingstart"], "dd/MM/yyyy");
				fund.FundingEnd = _db.ConvertDate(collection["fundingend"], "dd/MM/yyyy");
				fund.FundraisingForText = collection["fundraisingtext"];
				fund.FundraisingNeeds = collection["fundraisingneeds"];
				fund.FundraisingRequiredBy = _db.ConvertDate(collection["fundingrequiredby"], "dd/MM/yyyy");
				fund.FundraisingWhy = collection["fundingfundraisingwhy"];
				fund.FundraisingComplete = collection["fundingcomplete"] == "1" ? 1 : 0;
				fund.FundraisingCompletedDate = fund.FundraisingComplete == 1 ? _db.ConvertDate(collection["fundingcompletedate"], "dd/MM/yyyy") : null;
				fund.FundraisingDonorAnonymous = collection["donoranonymous"] == "1" ? 1 : 0;
				fund.FundraisingDonationDate = _db.ConvertDate(collection["donationdate"], "dd/MM/yyyy");
				fund.FundraisingDonorAmount = collection["donoramount"]=="" ? new decimal?(): Convert.ToDecimal(collection["donoramount"]);
				fund.FundraisingDonationIncremental = collection["fundingincremental"] == "1" ? 1 : 0;
				fund.SerID = ser.SerID;
				
				_db.CreateFunding(fund);
			}


			//ViewBag.testCheckList = collection["ServiceContract[]"];
			//ViewBag.testCheck = collection["fundingcomplete"];
			//ViewBag.testDate = collection["StartExpected"];
			//ViewBag.testMoney = collection["fundingamount"];

			//ViewBag.RefFrom = "ServiceDetail2";
			//ViewBag.RefChecked = ",44,45,47";
			//ViewBag.RefFrom = "ServiceContract";
			//ViewBag.RefChecked = ",31,32,40";
			//RedirectToAction("Add","Service");
			ViewBag.Alert = "true";
			ViewBag.Message = "Action success!";
			ViewBag.URL = "/Service/List";

			return View("../Shared/Redirect");
			//return RedirectToAction("List");
		}
		public string CheckUnique(string ServiceName)
		{
			var istrue = _db.CheckUnique(ServiceName);
			if (istrue)
				return "true";
			return "false";
		}
		public string CheckUnique1(int id, string ServiceName)
		{
			var istrue = _db.CheckUnique(ServiceName, id);
			if (istrue)
				return "true";
			return "false";
		}
	}
}
