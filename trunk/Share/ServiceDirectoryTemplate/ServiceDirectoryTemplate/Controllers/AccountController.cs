using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ServiceDirectoryTemplate.Models;
using System.Web.Security;
using System.Security.Cryptography;
using System.Text;

namespace ServiceDirectoryTemplate.Controllers
{
    public class AccountController : Controller
    {
		AccountModel accountModel = new AccountModel();
        //
        // GET: /Account/

		public ActionResult LogOn(string ReturnUrl="")
        {
			ViewBag.ReturnUrl = ReturnUrl;
			//var sha = new SHA1CryptoServiceProvider();
			//byte[] inputBytes = System.Text.Encoding.ASCII.GetBytes("HuongLT");
			//byte[] hash = sha.ComputeHash(inputBytes);

			// step 2, convert byte array to hex string
			//var sb = new StringBuilder();
			//for (int i = 0; i < hash.Length; i++)
			//{
			//    sb.Append(hash[i].ToString("x2"));
			//}
			//ViewBag.Test = sb.ToString();
            return View("Index");
        }
		//
		// /Team/Create/DepID
		public ActionResult LoginProcess(string Account="", string Password="", string ReturnUrl="/")
		{
			var sha = new SHA1CryptoServiceProvider();
			byte[] inputBytes = System.Text.Encoding.ASCII.GetBytes(Password);
			byte[] hash = sha.ComputeHash(inputBytes);

			// step 2, convert byte array to hex string
			var sb = new StringBuilder();
			for (int i = 0; i < hash.Length; i++)
			{
				sb.Append(hash[i].ToString("x2"));
			}
			User user = accountModel.GetDetail(Account, sb.ToString());
			
			if (user == null)
			{
				ViewBag.Account = Account;
				ViewBag.ReturnUrl = ReturnUrl;
				ViewBag.Error = "Incorrect user name or password";
				return View("Index");
			}
			//http://stackoverflow.com/questions/4237394/asp-net-mvc-3-using-authentication
			//string userData = user.Account;
			var ticket = new FormsAuthenticationTicket(1, user.Account,
				DateTime.Now, DateTime.Now.AddMinutes(20/*FormsAuthentication.Timeout.TotalMinutes*/),
				true, user.Role.ToString());
			string hashedTicket = FormsAuthentication.Encrypt(ticket);

			HttpCookie cookie = new HttpCookie(FormsAuthentication.FormsCookieName, hashedTicket);
			HttpContext.Response.Cookies.Add(cookie);
			Session.Timeout = 20;
			Session["Account"] = user.Account;
			if (ReturnUrl == "")
				ReturnUrl = "/";
			return Redirect(ReturnUrl);
		}
		public ActionResult Logout()
		{
			FormsAuthentication.SignOut();
			Session["Account"] = null;
			return RedirectToAction("LogOn", "Account");
		}
    }
}
