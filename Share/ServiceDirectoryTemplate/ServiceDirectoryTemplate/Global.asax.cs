using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.Security;
using System.Security.Principal;
using System.Data.Common;

namespace ServiceDirectoryTemplate
{
	// Note: For instructions on enabling IIS6 or IIS7 classic mode, 
	// visit http://go.microsoft.com/?LinkId=9394801

	public class MvcApplication : System.Web.HttpApplication
	{
		public static void RegisterGlobalFilters(GlobalFilterCollection filters)
		{
			
			filters.Add(new HandleErrorAttribute());
		}

		public static void RegisterRoutes(RouteCollection routes, string UrlRouter)
		{
			routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
			//HttpApplication.Session;
				routes.MapRoute(
					"Default", // Route name
					"{controller}/{action}/{id}", // URL with parameters
					new { controller = "Organisation", action = "List", id = UrlParameter.Optional } // Parameter defaults
				);
		}
		protected void Application_OnAuthenticateRequest(Object src, EventArgs e)
		{
			HttpContext currentContext = HttpContext.Current;
			if (HttpContext.Current.User != null)
			{
				if (HttpContext.Current.User.Identity.IsAuthenticated)
				{
					if (HttpContext.Current.User.Identity is FormsIdentity)
					{
						FormsIdentity id = HttpContext.Current.User.Identity as FormsIdentity;
						FormsAuthenticationTicket ticket = id.Ticket;
						string userData = ticket.UserData;
						// Roles is a helper class which places the roles of the
						// currently logged on user into a string array
						// accessable via the value property.

						string[] userRoles = userData.Split(',');
						HttpContext.Current.User = new GenericPrincipal(id, userRoles);
					}
				}
			}
		}
		protected void Application_Start()
		{
			AreaRegistration.RegisterAllAreas();
			string URLRouter="";
			//if (Session["Account"] != null)
				//URLRouter = "{controller}/{action}/{id}";
			//else URLRouter="Account/Index";
			RegisterGlobalFilters(GlobalFilters.Filters);
			RegisterRoutes(RouteTable.Routes, URLRouter);
		}
	}
}