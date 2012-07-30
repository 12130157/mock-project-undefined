using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ServiceDirectoryTemplate.Models;

namespace ServiceDirectoryTemplate.Controllers
{
	[Authorize]
    public class VolunteeringController : Controller
    {
		private VolunteeringModel _db = new VolunteeringModel();

        //
        // GET: /Volunteering/Details/5
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
        // GET: /Volunteering/Add/PremiseId

        public ActionResult Add(int id)
        {
			ViewBag.PremiseId = id;
            return View();
        } 

        //
		// POST: /Volunteering/Add/PremiseId

        [HttpPost]
        public ActionResult Add(int id, int VolunteeringContact, decimal? VolunteerNos, FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here
				var vol = new Volunteering();
				vol.PremiseID = id;
				vol.VolunteeringContact = VolunteeringContact;
				vol.VolunteerNos = VolunteerNos;
				vol.VolunteeringPurpose = collection["VolunteeringPurpose"];
				vol.VolunteeringDetail = collection["VolunteeringDetail"];
				vol.StartDate = _db.ConvertDate(collection["StartDate"], "dd/MM/yyyy");
				vol.EndDate = _db.ConvertDate(collection["EndDate"], "dd/MM/yyyy");
				vol.VolunteeringIsActive = 1;
				_db.Insert(vol);
				ViewBag.Alert = "true";
				ViewBag.Message = "Action success!";
				ViewBag.URL = "/Premise/Amend/" + id + "#tabs-6";

				return View("../Shared/Redirect");
                //return Redirect("/Premise/Amend"+id+"#tabs-2");
            }
            catch
            {
                return View("../Shared/Error");
            }
        }
        
        //
		// GET: /Volunteering/Amend/5
 
        public ActionResult Amend(int id)
        {
			var vol = _db.GetDetail(id);
			ViewBag.StartDate = vol.StartDate == null ? "" : ((DateTime)vol.StartDate).ToString("dd/MM/yyyy");
			ViewBag.EndDate = vol.EndDate == null ? "" : ((DateTime)vol.EndDate).ToString("dd/MM/yyyy");
            return View(vol);
        }

        //
		// POST: /Volunteering/Amend/5

        [HttpPost]
		public ActionResult Amend(int id, int VolunteeringContact, decimal? VolunteerNos, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
				var vol = _db.GetDetail(id);
				vol.VolunteeringContact = VolunteeringContact;
				vol.VolunteerNos = VolunteerNos;
				vol.VolunteeringPurpose = collection["VolunteeringPurpose"];
				vol.VolunteeringDetail = collection["VolunteeringDetail"];
				vol.StartDate = _db.ConvertDate(collection["StartDate"], "dd/MM/yyyy");
				vol.EndDate = _db.ConvertDate(collection["EndDate"], "dd/MM/yyyy");
				vol.VolunteeringIsActive = 1;
				_db.Update();
				ViewBag.Alert = "true";
				ViewBag.Message = "Action success!";
				ViewBag.URL = "/Premise/Amend/" + vol.PremiseID + "#tabs-6";

				return View("../Shared/Redirect");
            }
            catch(Exception ex)
            {
				ViewBag.Mess = ex.Message;
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
				var vol = _db.GetDetail(id);
				vol.VolunteeringIsActive = 0;
				_db.Update();
				return Redirect("/Premise/Amend/" + vol.PremiseID + "#tabs-6");
				//return "ok";
			}
			catch (Exception)
			{
				return View("../Shared/Error");
			}
		}
    }
}
