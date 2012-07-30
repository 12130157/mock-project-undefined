using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ServiceDirectoryTemplate.Models;

namespace ServiceTeamentoryTemplate.Controllers
{
	[Authorize]
    public class GovermentController : Controller
    {
        GovermentModel governmentModel = new GovermentModel();
        CountyModel countyModel = new CountyModel();
        //
        // GET: /Team/List

        public ActionResult List()
        {
			int totalPage;
			var ls = governmentModel.GetList(out totalPage);
			ViewBag.TotalPage = totalPage;
			ViewBag.Page = 1;
			ViewBag.Include = "false";
			ViewBag.Filter = "all";
            return View(ls);
        }
		[HttpPost]
		//public PartialViewResult List(int page, string filter, bool? include)
		public PartialViewResult List(int page = 1, string filter = "all", string include = "false")
		{
			int totalPage;
			var ls = governmentModel.GetList(out totalPage, page, filter, Convert.ToBoolean(include));
			ViewBag.TotalPage = totalPage;
			ViewBag.Page = page;
			ViewBag.Include = include;
			ViewBag.Filter = filter;
			return PartialView(ls);
		}
        //
        // GET: /Organisation/Edit

        public ActionResult Edit(int id)
        {
            GovOfficeRegion currentGov = governmentModel.GetDetail(id);
            ViewBag.ListCounty = countyModel.GetList(id);
            return View(currentGov);
        }


    }
}
