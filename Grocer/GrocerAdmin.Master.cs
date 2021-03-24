using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace OnlineClothing.Grocer
{
    public partial class GrocerAdmin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //Session["CategoryId"] = 2;
            //BindMenu();
        }
        private void lbtnLogin_Click()
        {

            Response.Redirect("Default.aspx");
        }

        protected void lbtnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/Default.aspx");
        }

        //protected void BindMenu()
        //{
        //    using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
        //    {
        //        StringBuilder sb = new StringBuilder();
        //        sb.Append("<ul class=\"nav nav-list\" >");
        //        var menulist = (from s in db.mstMenus
        //                        join p in db.tbl_UserRoleWiseMenus on s.MenuId equals p.MenuId
        //                        orderby s.MenuSequence
        //                        where p.CategoryId == int.Parse(Session["CategoryId"].ToString()) && s.ParentNodeId == 0
        //                        select new { s.NodeName, s.Url, s.MenuId, s.ImageUrl }).ToList();

        //        for (int i = 0; i <= menulist.Count - 1; i++)
        //        {
        //            string url = HttpContext.Current.Request.ApplicationPath;
        //            string MainMenu = menulist[i].Url.Replace("~/", "/");
        //            sb.Append("<li style=\"list-style: none; font-size:18px\">");
        //            var submenu = (from p in db.mstMenus join s in db.tbl_UserRoleWiseMenus on p.MenuId equals s.MenuId orderby p.MenuSequence where s.CategoryId == int.Parse(Session["CategoryId"].ToString()) && p.ParentNodeId == menulist[i].MenuId && p.ParentNodeId != 0 && p.KeyWords != "1" select new { p.NodeName, p.Url, p.ImageUrl }).ToList();
        //            if (submenu.Count != 0)
        //            {
        //                sb.Append("<a href=\"javascript:;\" " + "data-toggle='" + "collapse" + "' " + "data-target='" + "#demo" + menulist[i].MenuId + "'>" + menulist[i].ImageUrl + " " + menulist[i].NodeName + " " + "<i class=\"fa fa-fw fa-caret-down\"></i></a>");
        //            }
        //            else
        //            {
        //                sb.Append("<a href='" + System.Web.VirtualPathUtility.ToAbsolute(menulist[i].Url) + "' >" + menulist[i].ImageUrl + " " + "<span class=\"menu-text\">" + menulist[i].NodeName + "</span>" + " " + "</a>");
        //            }
        //            if (submenu.Count != 0)
        //            {
        //                sb.Append(" <ul style=\"list-style: none; padding-left: 15px; font-size:18px \" id='" + "demo" + menulist[i].MenuId + "' class='" + "collapse" + "'>");
        //                for (int j = 0; j <= submenu.Count - 1; j++)
        //                {
        //                    sb.Append("<li style=\"list-style: none; \">");
        //                    sb.Append("<a href='" + System.Web.VirtualPathUtility.ToAbsolute(submenu[j].Url) + "'>" + "<span class=\"menu-text\">" + submenu[j].NodeName + "</span>" + "</a>");
        //                    sb.Append("</li>");
        //                }
        //                sb.Append("</ul>");
        //            }
        //            sb.Append("</li>");
        //        }
        //        sb.Append("</ul>");
        //        LiteralControl lc1 = new LiteralControl();
        //        lc1.Text = sb.ToString();

        //        divLinks.Controls.Add(lc1);
        //    }
        //}
    }
}