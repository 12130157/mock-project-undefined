using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ServiceDirectoryTemplate.Controllers
{
	public class ErrorController : Controller
	{
		//
		// GET: /Error/

		public ActionResult Message()
		{
			return View();
		}
		public ActionResult NotFound(string aspxerrorpath)
		{
			ViewBag.Path = aspxerrorpath;
			return View();
		}
		public ActionResult Denied()
		{
			return View();
		}

	}
}
