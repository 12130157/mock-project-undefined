using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ServiceDirectoryTemplate.Models;

namespace ServiceDirectoryTemplate.Controllers
{
	[Authorize]
    public class SICCodeController : Controller
    {
        Models.SICCodeModel sic = new Models.SICCodeModel();
        SICCode code = new SICCode();
        //
        // GET: /SICCode/

        public ActionResult Index()
        {
            return View();
        }
		public ActionResult List(string TagName, string TagCode, string BusinessName = "", string SICCode = "")
        {
            int totalPage;
			var list = sic.SearchName(out totalPage, BusinessName, SICCode);
			ViewBag.TagName = TagName;
			ViewBag.TagCode = TagCode;
			ViewBag.TotalPage = totalPage;
			ViewBag.Page = 1;
			ViewBag.Include = "false";
			ViewBag.Filter = "all";
			ViewBag.BusinessName = BusinessName;
			ViewBag.SICCode = SICCode;
            return View(list);
        }
        // GET: /SICCode/SearchSICCode?cont
        
        //public ActionResult SearchSICCode(SICCode cont, string BusinessName, int SICCode)
		public PartialViewResult SearchSICCode(string TagName, string TagCode, string BusinessName = "", string SICCode = "", int page = 1)
		{
			//    var str = collection["BusinessName"];
			//    str = collection["SICCode"];
			int totalPage;
			var list = sic.SearchName(out totalPage, BusinessName, SICCode, page);
			ViewBag.TagName = TagName;
			ViewBag.TagCode = TagCode;
			ViewBag.BusinessName = BusinessName;
			ViewBag.SICCode = SICCode;

			ViewBag.TotalPage = totalPage;
			ViewBag.Page = page;
			return PartialView(list);
		}
        //public ActionResult SearchContact(Contact1 cont, string firstName, string surName)
        //{
        //    var list = ctModel.SearchName(cont, firstName, surName);
        //    return View(list);
        //}
    }
}
