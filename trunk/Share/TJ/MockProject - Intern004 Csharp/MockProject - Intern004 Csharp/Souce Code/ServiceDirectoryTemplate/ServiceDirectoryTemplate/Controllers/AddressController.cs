using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ServiceDirectoryTemplate.Models;

namespace ServiceDirectoryTemplate.Controllers
{
	[Authorize]
    public class AddressController : Controller
    {
        //
        // GET: /Address/
		private AddressModel _db = new AddressModel();
        public ActionResult Index()
        {
			//_db.GeneralData();
            return View();
        }
		[HttpPost]
		public string AddressIsNew(string Address1, string PostCode, int? CountryID, FormCollection collection)
		{
			var re = _db.AddressIsNew(Address1, PostCode, CountryID, collection["Town"], collection["County"]);
			return re == true ? "true" : "false";
		}
		[HttpPost]
		public string AddAddress(string Address1, string PostCode, int? CountryID, FormCollection collection)
		{
			var re = _db.AddAddress(Address1, PostCode, CountryID, collection["Town"], collection["County"]);
			return re == true ? "true" : "false";
		}
		public ActionResult List(string TagCode = "", string TagAddr1 = "", string TagTown = "", 
			string TagCounty = "", string TagCountry = "",
			string PostCode = "", string Street = "", string Town = "")
		{
			int totalPage;
			var ListCont = _db.SearchAddress(out totalPage, PostCode, Street, Town);
			//ViewBag.TagName = TagName;
			//ViewBag.TagId = TagId;
			ViewBag.TotalPage = totalPage;
			ViewBag.Page = 1;
			ViewBag.Include = "false";
			ViewBag.Filter = "all";
			ViewBag.PostCode = PostCode;
			ViewBag.Street = Street;
			ViewBag.Town = Town;

			ViewBag.TagCode = TagCode;
			ViewBag.TagAddr1 = TagAddr1;
			ViewBag.TagTown = TagTown;
			ViewBag.TagCounty = TagCounty;
			ViewBag.TagCountry = TagCountry;

			return View(ListCont);
		}
		public PartialViewResult SearchAddress(string TagCode = "", string TagAddr1 = "", string TagTown = "",
			string TagCounty = "", string TagCountry = "", 
			string PostCode = "", string Street = "", string Town = "", int page = 1)
		{
			int totalPage;
			var list = _db.SearchAddress(out totalPage, PostCode, Street, Town,  page);

			//ViewBag.TagName = TagName;
			//ViewBag.TagId = TagId;
			ViewBag.PostCode = PostCode;
			ViewBag.Street = Street;
			ViewBag.Town = Town;

			ViewBag.TotalPage = totalPage;
			ViewBag.Page = page;

			ViewBag.TagCode = TagCode;
			ViewBag.TagAddr1 = TagAddr1;
			ViewBag.TagTown = TagTown;
			ViewBag.TagCounty = TagCounty;
			ViewBag.TagCountry = TagCountry;

			return PartialView(list);
		}
    }
}
