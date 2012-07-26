using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ServiceDirectoryTemplate.Models;

namespace ServiceDirectoryTemplate.Controllers
{
    public class PostCodeController : Controller
    {
        PostCodeModel post = new PostCodeModel();
        //
        // GET: /PostCode/

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult List()
        {
            var list = post.GetList();
            return View(list);
        }

    }
}
