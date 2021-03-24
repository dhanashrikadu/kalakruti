using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineClothing.Admin
{
    public partial class MasterAdmin1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Bindar();
                if (Session["CustId"] != null)
                { 
                    using(dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
                    {
                        int na = int.Parse(Session["CustId"].ToString());
                      var name = (from s in db.mstCustomerDtls where s.CustId == na select new {s.CustName,s.CustLName}).FirstOrDefault();
                      lblname.Text = name.CustName + " " + name.CustLName;
                    }
                }
            }
        }
        protected void lbtnlogout1_Click(object sender, EventArgs e)
        {
            // Response.Write("<script LANGUAGE='JavaScript' >alert('Login Successful')</script>");

            Session.Abandon();
            Response.Redirect("~/Default.aspx");
        }
        protected void lbtnlogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/Default.aspx");
        }
        private void Bindar()
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                var v = (from s in db.tbl_UserRoleWiseMenus
                         join a in db.mstMenus on s.MenuId equals a.MenuId
                         where s.CategoryId == 1
                         orderby a.MenuSequence
                         select new { a.MenuId, a.ImageUrl, a.Description, a.KeyWords, a.NodeName, a.Url }).ToList();
                lvmenu.DataSource = v;
                lvmenu.DataBind();
            }
        }
    }
}