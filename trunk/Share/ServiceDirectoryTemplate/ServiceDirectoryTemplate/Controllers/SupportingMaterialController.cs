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
	public class SupportingMaterialController : Controller
	{
		SupportingMaterialModel supportingMaterialModel = new SupportingMaterialModel();
		//
		// GET: /SupportingMaterial/Add/OrgID
		public ActionResult Add(int id)
		{
			ViewBag.OrgID = id;
			//FormsIdentity formId = HttpContext.Current.User.Identity as FormsIdentity;
			//FormsAuthenticationTicket ticket = formId.Ticket;
			string name = User.Identity.Name;
			var model = supportingMaterialModel.GetId(name);
			return View(model);
		}
		//edit
		public ActionResult Amend(int id)
		{
			SupportingMaterial supportingMaterial = supportingMaterialModel.GetDetail(id);
			return View(supportingMaterial);
		}
		//GET: /SupportingMaterial/Create/OrgID
		public ActionResult Create(int id, string URL, string Description, int AddedBy, string AddedDate, string Type)
		{
			SupportingMaterial newSupport = new SupportingMaterial();

			newSupport.MatURL = URL;
			newSupport.MatDescription = Description;
			newSupport.MatAddDate = DateTime.Now;
			newSupport.MatType = Type;
			newSupport.MatIsActive = 1;
			newSupport.OrgID = id;
			string name = User.Identity.Name;
			var model = supportingMaterialModel.GetId(name);
			newSupport.UserID = model.UserID;

			supportingMaterialModel.Insert(newSupport);

			//ViewBag.Text = "Create successful";
			ViewBag.Alert = "true";
			ViewBag.Message = "Action success!";
			ViewBag.URL = "/Organisation/Amend/" + newSupport.OrgID+"#tabs-5";

			return View("../Shared/Redirect");
			//return View("Close");

		}
		//update
		public ActionResult Update(int id, string URL, string Description, string Type)
		{
			SupportingMaterial currentSupport = supportingMaterialModel.GetDetail(id);

			currentSupport.MatURL = URL;
			currentSupport.MatDescription = Description;
			currentSupport.MatType = Type;
			string name = User.Identity.Name;
			var model = supportingMaterialModel.GetId(name);
			currentSupport.UserID = model.UserID;
			currentSupport.MatAddDate = DateTime.Now;
			supportingMaterialModel.Update();
			//ViewBag.Text = "Update successful";
			ViewBag.Alert = "true";
			ViewBag.Message = "Action success!";
			ViewBag.URL = "/Organisation/Amend/" + currentSupport.OrgID + "#tabs-5";

			return View("../Shared/Redirect");
			//return Redirect("/Organisation/Amend/" + currentSupport.OrgID + "#tabs-5");

		}
		//
		// GET: /SupportingMaterial/MarkActivate/4

		public string MarkActivate(int id)
		{
			try
			{
				supportingMaterialModel.MarkActive(id, true);
				return "ok";
			}
			catch (Exception ex)
			{
				return ex.Message;
			}
		}
		//
		// GET: /SupportingMaterial/MarkInactivate/4

		public ActionResult MarkInactivate(int id)
		{
			try
			{
				supportingMaterialModel.MarkActive(id, false);
				var mat = supportingMaterialModel.GetDetail(id);
				return Redirect("/Organisation/Amend/" + mat.OrgID + "#tabs-5");
				//return "ok";
			}
			catch (Exception)
			{
				return View("Error");
			}
		}
	}
}
