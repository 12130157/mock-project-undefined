using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ServiceDirectoryTemplate.Models;

namespace ServiceDirectoryTemplate.Controllers
{
	[Authorize]
    public class ProjectMinorWorkController : Controller
    {
		private ProjectMinorWorkModel _db = new ProjectMinorWorkModel();
        //
		// GET: /ProjectMinorWork/List/5
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
		// GET: /ProjectMinorWork/Add/PremiseIds

        public ActionResult Add(int id)
        {
			ViewBag.PremiseId = id;
			ViewBag.DirectorateList=_db.ListDirectorate();
            return View();
        } 

        //
		// POST: /ProjectMinorWork/Add/PremiseId

        [HttpPost]
        public ActionResult Add(int id, int ProjectOrMinorWork, string PMWEnquiryReceivedDate, int? DirectorateID,
			int? PMWContact, int? AuthorisedByName,
			string PMWDescription, FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here
				var pmw = new ProjectMinorWork();
				pmw.PremiseID = id;
				pmw.PMWDescription = PMWDescription;
				pmw.ProjectOrMinorWork = ProjectOrMinorWork;
				pmw.PMWContact = PMWContact;
				pmw.AuthorisedByName = AuthorisedByName;
				if (collection["PMWIsTBA"] == "1")
				{
					pmw.PMWIsTBA = 1;
				}
				else
				{
					pmw.PMWIsTBA = 0;
					pmw.NotesActions = collection["NotesActions"];
					pmw.EstimatedCost = collection["EstimatedCost"];
				}
				pmw.PMWStatus = collection["PMWStatus"];
				pmw.PMWEnquiryReceivedDate =(DateTime)_db.ConvertDate(PMWEnquiryReceivedDate,"dd/MM/yyyy");
				pmw.AuthorisedDate = _db.ConvertDate(collection["AuthorisedDate"], "dd/MM/yyyy");
				pmw.ActualStartDate = _db.ConvertDate(collection["ActualStartDate"], "dd/MM/yyyy");
				pmw.AnticipatedCompletion = _db.ConvertDate(collection["AnticipatedCompletion"], "dd/MM/yyyy");
				pmw.ActualCompletionDate = _db.ConvertDate(collection["ActualCompletionDate"], "dd/MM/yyyy");
				pmw.ActualCost = collection["ActualCost"];
				pmw.Directorate = DirectorateID;
				pmw.PMWIsActive = 1;
				_db.Insert(pmw);

				ViewBag.Alert = "true";
				ViewBag.Message = "Action success!";
				ViewBag.URL = "/Premise/Amend/" + id + "#tabs-7";

				return View("../Shared/Redirect");
            }
            catch
            {
				return View("../Shared/Error");
            }
        }
        
        //
		// GET: /ProjectMinorWork/Amend/PremiseIds
 
        public ActionResult Amend(int id)
        {
			var pmw = _db.GetDetail(id);
			ViewBag.AnticipatedCompletion = pmw.AnticipatedCompletion == null ? "" : ((DateTime)pmw.AnticipatedCompletion).ToString("dd/MM/yyyy");
			ViewBag.ActualStartDate = pmw.ActualStartDate == null ? "" : ((DateTime)pmw.ActualStartDate).ToString("dd/MM/yyyy");
			ViewBag.ActualCompletionDate = pmw.ActualCompletionDate == null ? "" : ((DateTime)pmw.ActualCompletionDate).ToString("dd/MM/yyyy");
			ViewBag.AuthorisedDate = pmw.AuthorisedDate == null ? "" : ((DateTime)pmw.AuthorisedDate).ToString("dd/MM/yyyy");
			ViewBag.DirectorateList = _db.ListDirectorate();
			ViewBag.PremiseId = pmw.PremiseID;
			return View(pmw);
        }

        //
		// POST: /ProjectMinorWork/Amend/PMWId

        [HttpPost]
		public ActionResult Amend(int id, int ProjectOrMinorWork, string PMWEnquiryReceivedDate, int? DirectorateID,
			int? PMWContact, int? AuthorisedByName,
			string PMWDescription, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
				var pmw = _db.GetDetail(id);
				pmw.PMWDescription = PMWDescription;
				pmw.ProjectOrMinorWork = ProjectOrMinorWork;
				pmw.PMWContact = PMWContact;
				pmw.AuthorisedByName = AuthorisedByName;
				if (collection["PMWIsTBA"] == "1")
				{
					pmw.PMWIsTBA = 1;
					pmw.NotesActions = null;
					pmw.EstimatedCost = null;
				}
				else
				{
					pmw.PMWIsTBA = 0;
					pmw.NotesActions = collection["NotesActions"];
					pmw.EstimatedCost = collection["EstimatedCost"];
				}
				pmw.PMWStatus = collection["PMWStatus"];
				pmw.PMWEnquiryReceivedDate = (DateTime)_db.ConvertDate(PMWEnquiryReceivedDate, "dd/MM/yyyy");
				pmw.AuthorisedDate = _db.ConvertDate(collection["AuthorisedDate"], "dd/MM/yyyy");
				pmw.ActualStartDate = _db.ConvertDate(collection["ActualStartDate"], "dd/MM/yyyy");
				pmw.AnticipatedCompletion = _db.ConvertDate(collection["AnticipatedCompletion"], "dd/MM/yyyy");
				pmw.ActualCompletionDate = _db.ConvertDate(collection["ActualCompletionDate"], "dd/MM/yyyy");
				pmw.ActualCost = collection["ActualCost"];
				pmw.Directorate = DirectorateID;
				_db.Update();
				ViewBag.Alert = "true";
				ViewBag.Message = "Action success!";
				ViewBag.URL = "/Premise/Amend/" + pmw.PremiseID + "#tabs-7";

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
				var pmw = _db.GetDetail(id);
				pmw.PMWIsActive = 0;
				_db.Update();
				return Redirect("/Premise/Amend/" + pmw.PremiseID + "#tabs-7");
				//return "ok";
			}
			catch (Exception)
			{
				return View("../Shared/Error");
			}
		}
    }
}
