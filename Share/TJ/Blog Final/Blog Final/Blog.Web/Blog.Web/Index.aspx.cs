using System;
using System.Globalization;
using Blog.Entities;
using Blog.Web.UserControls;

namespace Blog.Web
{
    public partial class Index : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {

           
            
        
            if ( Session["Username"] == "")
            {

                ControlLogOn controlLogOn = (ControlLogOn)Page.LoadControl("~/UserControls/ControlLogOn.ascx");

                placeLogOn.Controls.Add(controlLogOn);

            }
            else
            {
                placeLogOn.Controls.Clear();
                ControlLogOnUser controlLogOnUser = (ControlLogOnUser)Page.LoadControl("~/UserControls/ControlLogOnUser.ascx");
                placeLogOn.Controls.Add(controlLogOnUser);
               
            }


            if (Request.QueryString["wuc"] != null)
            {
                switch (Request.QueryString["wuc"])
                {
                    case "pd":
                        if (Request.QueryString["chitiet"] != null)
                        {
                            News ns = new News();
                            ns.NewsId = Convert.ToInt32(Request.QueryString["chitiet"], CultureInfo.CurrentCulture);


                            ControlDetailNews controlDetailNews = (ControlDetailNews)Page.LoadControl("~/UserControls/ControlDetailNews.ascx");
                            controlDetailNews.SelectNewsById(ns);
                            placeCenter.Controls.Add(controlDetailNews);
                            Session["URLReferrer"] = Request.Url;
                        }
                        break;

                    case "menu":
                        if (Request.QueryString["item"] != null)
                        {
                            ControlNews controlNews = (ControlNews)Page.LoadControl("~/UserControls/ControlNews.ascx");
                            placeCenter.Controls.Add(controlNews);
                            Session["URLReferrer"] = Request.Url;
                        }
                        break;

                    case "mn":
                        if (Request.QueryString["link"] == "MNews")
                        {


                            if ( Session["Username"] == "")
                            {

                            }
                            else
                            {
                                ControlManagementNews controlManagementNews = (ControlManagementNews)Page.LoadControl("~/UserControls/ControlManagementNews.ascx");
                                placeCenter.Controls.Add(controlManagementNews);
                                Session["URLReferrer"] = Request.Url;
                            }


                        }

                        if (Request.QueryString["link"] == "MCategory")
                        {


                            if (Session["Username"] == "")
                            {

                            }
                            else
                            {


                                ControlManagementCategories controlManagementCategories = (ControlManagementCategories)Page.LoadControl("~/UserControls/ControlManagementCategories.ascx");
                                placeCenter.Controls.Add(controlManagementCategories);
                                Session["URLReferrer"] = Request.Url;
                            }


                        }
                        if (Request.QueryString["link"] == "MUsers")
                        {


                            if (Session["Username"] == "")
                            {

                            }
                            else
                            {

                                ControlManagementUser controlManagementUser = (ControlManagementUser)Page.LoadControl("~/UserControls/ControlManagementUser.ascx");
                                placeCenter.Controls.Add(controlManagementUser);
                                Session["URLReferrer"] = Request.Url;
                            }


                        }

                        break;

                }
            }
            else
            {
                ControlNews controlNews = (ControlNews)Page.LoadControl("~/UserControls/ControlNews.ascx");
                placeCenter.Controls.Add(controlNews);
                Session["URLReferrer"] = Request.Url;
            }
        }
    }
}
