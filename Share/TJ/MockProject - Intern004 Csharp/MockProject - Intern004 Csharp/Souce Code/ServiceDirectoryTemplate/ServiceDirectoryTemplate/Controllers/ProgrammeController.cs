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
    public class ProgrammeController : Controller
    {
		private ProgrammeModel _db = new ProgrammeModel();
        //
		// GET: /Programme/Add

		public ActionResult Add()
		{			
			return View();
		}
		//
		// POST: /Programme/Add
		[HttpPost]
		public ActionResult Save(int? ContactID, FormCollection collection)
		{
			try
			{
				var pro = new Programme();
				pro.ProgrammeName = collection["ProgrammeName"];
				pro.Description = collection["Description"];
				pro.ContactID = ContactID;
				pro.ProgrammeIsActivate = 1;
				_db.CreateProgramme(pro);
				ViewBag.Alert = "true";
				ViewBag.Message = "Action success!";
				ViewBag.URL = "/Programme/List";

				return View("../Shared/Redirect");
				//return RedirectToAction("List");
			}
			catch (Exception ex)
			{
				ViewBag.Mess = ex.Message;
				return View("../Shared/Error");
			}
		}

		//
		// GET: /Programme/MarkActivate/1

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
		// GET: /Programme/MarkInactivate/1

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
		// GET: /Programme/Amend/1

		public ActionResult Amend(int id)
		{
			var model=_db.GetProgramme(id);
			if (model == null)
				return View("../Shared/Error");

			return View(model);
		}

		//
		// POST: /Programme/Amend/1
		[HttpPost]
		public ActionResult Amend(int id, int? ContactID, FormCollection collection)
		{
			try
			{
				var pro = _db.GetProgramme(id);
				if (pro == null)
					return View("../Shared/Error");
				pro.ProgrammeName = collection["ProgrammeName"];
				pro.Description = collection["Description"];
				pro.ContactID = ContactID;
				pro.ProgrammeIsActivate = 1;
				_db.Update();
				ViewBag.Alert = "true";
				ViewBag.Message = "Action success!";
				ViewBag.URL = "/Programme/List";

				return View("../Shared/Redirect");
				//return RedirectToAction("List");
			}
			catch (Exception)
			{
				return View("Error");
			}
		}
		public ActionResult Error()
		{
			return View("../Shared/Error");
		}
		//
		// GET: /Programme/List

		public ActionResult List()
		{
			int totalPage;
			var model = _db.ListProgramme(out totalPage);
			ViewBag.TotalPage = totalPage;
			//ViewBag.Layout=null;
			return View(model);
		}
		//
		// POST: /Programme/List
		[HttpPost]
		//[AcceptVerbs(HttpVerbs.Get | HttpVerbs.Post)]
		public PartialViewResult List(FormCollection collection)
		//public PartialViewResult List(int page, string filter, bool include)
		{
			try
			{
				int totalPage;
				var ls = _db.ListProgramme(out totalPage, Convert.ToInt32(collection["page"]), collection["filter"], Convert.ToBoolean(collection["include"]));
				//var ls = _db.ListProgramme(out totalPage, page, filter, include);
				ViewBag.TotalPage = totalPage;
				ViewBag.Page = collection["page"];
				ViewBag.Include = collection["include"];
				ViewBag.Filter = collection["filter"];
				//ViewBag.Page = page;
				//ViewBag.Include = include;
				//ViewBag.Filter = filter;
				return PartialView(ls);
			}
			catch (Exception ex)
			{
				ViewBag.Mess=ex.Message;
				return PartialView("../Shared/Error");
			}
		}

		public string CheckUnique(string ProgrammeName)
		{
			var istrue = _db.CheckUnique(ProgrammeName);
			if (istrue)
				return "true";
			return "false";
		}
		public string CheckUnique1(int id, string ProgrammeName)
		{
			var istrue = _db.CheckUnique(ProgrammeName, id);
			if (istrue)
				return "true";
			return "false";
		}

    }
}
