using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineClothing.deliveryForms
{
    public partial class masterDeliveryBoy : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Bindar();
                if (Session["DeliBoyID"] != null)
                {
                    using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
                    {

                        int na = int.Parse(Session["DeliBoyID"].ToString());
                        var name = (from s in db.mstDeliveryBoyDtls where s.DeliveryBoyId == na select new { s.DeliverBoyName }).FirstOrDefault();
                        if (name != null)
                        {
                            lblname.Text = name.DeliverBoyName;
                        }

                    }
                }
            }
        }
        protected void lbtnlogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/Default.aspx");
        }
        protected void lbtnlogout1_Click(object sender, EventArgs e)
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
                         where s.CategoryId == 4
                         orderby a.MenuSequence
                         select new { a.MenuId, a.ImageUrl, a.Description, a.KeyWords, a.NodeName, a.Url }).ToList();
                lvmenu.DataSource = v;
                lvmenu.DataBind();
            }
        }
    }
}