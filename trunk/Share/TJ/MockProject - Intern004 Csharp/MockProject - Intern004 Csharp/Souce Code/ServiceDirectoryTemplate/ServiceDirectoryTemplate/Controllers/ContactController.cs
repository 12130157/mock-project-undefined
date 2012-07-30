using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ServiceDirectoryTemplate.Models;

namespace ServiceDirectoryTemplate.Controllers
{
	[Authorize]
    public class ContactController : Controller
    {
        //
        // GET: /Contact/
        ServiceDirectoryDataContext db = new ServiceDirectoryDataContext();

        ContactModel ctModel = new ContactModel();
        Contact ct = new Contact();
		//ActionResult lst = List("ContactID", "ContactName");
		//string str = MarkActivate(2);

        public ActionResult Index()
        {
            return View("Add");
        }
        // /Contact/List?TagNAme=ContactID
		public ActionResult List(string TagId, string TagName, string FirstName = "", string SurName = "")
        {
			int totalPage;
			var ListCont = ctModel.SearchName(out totalPage, FirstName, SurName);
            ViewBag.TagName = TagName;
            ViewBag.TagId = TagId;
			ViewBag.TotalPage = totalPage;
			ViewBag.Page = 1;
			ViewBag.Include = "false";
			ViewBag.Filter = "all";
			ViewBag.FirstName = FirstName;
			ViewBag.SurName = SurName;
            return View(ListCont);
        }
		public ActionResult Add(string TagId, string TagName)
        {
            ViewBag.ContactType = ctModel.GetContactType();
			ViewBag.BestContactMethod = ctModel.GetBestContactMethod();
			ViewBag.TagName = TagName;
			ViewBag.TagId = TagId;
            return View();
        }
        public ActionResult Create(string TagId, string TagName, string firstname, string surname, int? managerId, string ContactType, string bestContactMethod,
                               string KnowAs, string JobRole, string OfficePhone, string MobilePhone, string STHomePhone,
                               string EmailAddress, string Workbase, string JobTitle, string ContactIsActive="0")
        {

            if (firstname == "")
            {
                ViewBag.ErrorMessage = "Please input the contact name";
                return RedirectToAction("Add", "Contact");
            }
            if (surname == "")
            {
                ViewBag.ErrorMessage = "Please input the contact surname";
                return RedirectToAction("Add", "Contact");
            }
            if (ContactType == "")
            {
                ViewBag.ErrorMessage = "Please input the contact type";
                return RedirectToAction("Add", "Contact");
            }
            Contact contact = new Contact();

            contact.FirstName = firstname;
            contact.Surname = surname;
			contact.ManagerID = managerId;
            contact.ContactType = ContactType;
            contact.BestContactMethod = bestContactMethod;
            contact.KnownAs = KnowAs;
            contact.JobRole = JobRole;
            contact.OfficePhone = OfficePhone;
            contact.MobilePhone = MobilePhone;
            contact.STHomePhone = STHomePhone;
            contact.EmailAddress = EmailAddress;
            contact.Workbase = Workbase;
            contact.JobTitle = JobTitle;
            contact.ContactIsActive = ContactIsActive=="0"?0:1;

            db.Contacts.InsertOnSubmit(contact);
            db.SubmitChanges();

			ViewBag.TagName = TagName;
			ViewBag.TagId = TagId;

			ViewBag.Alert = "true";
			ViewBag.Message = "Action success!";
			ViewBag.URL = "/Contact/List?TagId=" + TagId + "&TagName=" + TagName;

			return View("../Shared/Redirect");
			//return Redirect("/Contact/List?TagId=" + TagId + "&TagName=" + TagName);
        }

		public PartialViewResult SearchContact(string TagId, string TagName, string FirstName = "", string SurName = "", int page = 1, string include = "false")
		{
			int totalPage;
			var list = ctModel.SearchName(out totalPage, FirstName, SurName, page, Convert.ToBoolean(include));

			ViewBag.TagName = TagName;
			ViewBag.TagId = TagId;
			ViewBag.FirstName = FirstName;
			ViewBag.SurName = SurName;

			ViewBag.TotalPage = totalPage;
			ViewBag.Page = page;
			ViewBag.Include = include;
			return PartialView(list);
		}
        public ActionResult Update(string TagId, string TagName, int contId, string firstname, string surname, string ContactType, string bestContactMethod,
                               string KnowAs, string JobRole, string OfficePhone, string MobilePhone, string STHomePhone,
                               string EmailAddress, string Workbase, string JobTitle, int? managerId, int ContactIsActive=0)
        {
           
            Contact cont = ctModel.GetDetail(contId);

            cont.FirstName = firstname;
            cont.Surname = surname;
            cont.ManagerID = managerId;
            cont.ContactType = ContactType;
            cont.BestContactMethod = bestContactMethod;
            cont.KnownAs = KnowAs;
            cont.JobRole = JobRole;
            cont.OfficePhone = OfficePhone;
            cont.MobilePhone = MobilePhone;
            cont.STHomePhone = STHomePhone;
            cont.EmailAddress = EmailAddress;
            cont.Workbase = Workbase;
            cont.JobTitle = JobTitle;
            cont.ContactIsActive = Convert.ToInt32(ContactIsActive);

            ctModel.Update();
			ViewBag.Alert = "true";
			ViewBag.Message = "Action success!";
			ViewBag.URL = "/Contact/List?TagId=" + TagId + "&TagName=" + TagName;

			return View("../Shared/Redirect");
			//return Redirect("/Contact/List?TagId=" + TagId + "&TagName=" + TagName);

        }
		public ActionResult Edit(int id, string TagId, string TagName)
		{//4?TagId=ContactID&TagName=ContactName
            Contact currentCont = ctModel.GetDetail(id);
			ViewBag.ContactType = ctModel.GetContactType();
			ViewBag.BestContactMethod = ctModel.GetBestContactMethod();
			ViewBag.TagName = TagName;
			ViewBag.TagId = TagId;
            return View(currentCont);
        }
		//
		// GET: /Contact/MarkActivate/2

		public string MarkActivate(int id)
		{
			try
			{
				ctModel.MarkActive(id, true);
				return "ok";
			}
			catch (Exception ex)
			{
				return ex.Message;
			}
		}
		//
		// GET: /Contact/MarkInactivate/2

		public ActionResult MarkInactivate(int id, string TagId, string TagName)
		{
			try
			{
				ctModel.MarkActive(id, false);
				var con = ctModel.GetDetail(id);
				return Redirect("/Contact/List?TagId=" + TagId + "&TagName=" + TagName);
				//return "ok";
			}
			catch (Exception)
			{
				return View("Error");
			}
		}

    }
}
