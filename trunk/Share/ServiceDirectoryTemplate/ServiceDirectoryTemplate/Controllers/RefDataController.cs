using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ServiceDirectoryTemplate.Models;

namespace ServiceDirectoryTemplate.Controllers
{
	[Authorize]
    public class RefDataController : Controller
    {
		private RefDataModel _db = new RefDataModel();
        			
		//
		// GET: /Ref/GetGetHtml?strFrom=ServiceDetail2&refChecked=,12,51

		public PartialViewResult GetHtml(string strFrom, string refChecked="")
		{
			//ViewData["abc"] = new List<RefItem>() { new RefItem(12, "def", 1), new RefItem(10, "ghj", 1) };
			var refData = _db.ListRefData(strFrom);
			var refDic = new Dictionary<string, List<RefItem>>();
			foreach (var data in refData)
			{
				string str = null;
				if(refChecked.Contains(","+data.RefValue.ToString()+","))
				{
					str=(data.RefType==1?"checked=checked":"selected=selected");
				}
				var refItem = new RefItem(data.RefValue, data.RefText, data.RefType
					, str);
				if (refDic.ContainsKey(data.RefName))
				{
					refDic[data.RefName].Add(refItem);
				}
				else
				{
					refDic.Add(data.RefName, new List<RefItem> { refItem });
				}
			}
			TempData.Clear();
			foreach (var data in refDic)
			{
				TempData[data.Key] = data.Value;
			}
			ViewBag.ListName = strFrom+"[]";
			return PartialView();
		}
		
		//
		// GET: /Ref/PagingHtml?strFrom=ServiceDetail2&refChecked=,12,51
		
		public PartialViewResult PagingHtml(string urlRequest, string tagContainer, string formName,
			int page = 1, int totalPage = 1, string filter = "all", bool include = false)
		{
			page=(page > totalPage ? totalPage: page);
			page = (page < 1 ? 1 : page);

			ViewBag.Page = page;
			ViewBag.TotalPage = totalPage;
			ViewBag.Filter = filter;
			ViewBag.Include = include;
			ViewBag.UrlRequest = urlRequest;
			ViewBag.TagContainer = tagContainer;
			ViewBag.TagLoading = tagContainer.Replace("#","").Replace(".","");
			ViewBag.Prev=(page<=1? 1:page-1);
			ViewBag.Next = (page >= totalPage? page:page + 1);
			ViewBag.FormName = formName;
			return PartialView();
		}

		//
		// GET: /Ref/LookupAddr?IdTag=document.AddService.ContactID&NameTag=document.AddService.CantactName

		public ViewResult LookupAddr(string FormName, string IdTag, string NameTag)
		{
			ViewBag.FormName = FormName;
			ViewBag.IdTag = IdTag;
			ViewBag.NameTag = NameTag;
			int total;
			var model = _db.ListContact(out total);
			ViewBag.TotalPage = total;
			ViewBag.Page = (total <= 1 ? total : 1);
			ViewBag.Include = "false";
			return View(model);
		}
		//
		// POST: /Ref/LookupAddr?IdTag=document.AddService.ContactID&NameTag=document.AddService.CantactName
		[HttpPost]
		public PartialViewResult LookupAddr(string FormName, string IdTag, string NameTag, FormCollection collection)
		{
			ViewBag.FormName = FormName;
			ViewBag.IdTag = IdTag;
			ViewBag.NameTag = NameTag;
			int total;
			var model = _db.ListContact(out total, Convert.ToInt32(collection["page"]), collection["filter"], Convert.ToBoolean(collection["include"]));
			ViewBag.TotalPage = total;
			ViewBag.Page = (total <= 1 ? total : Convert.ToInt32(collection["page"]));
			ViewBag.Filter =  collection["filter"];
			ViewBag.Include = collection["include"];
			return PartialView(model);
		}
    }
}
