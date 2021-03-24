using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineClothing.Grocer
{
    public partial class AddHomeDeliveryChrg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindHomeDelChages();
                //Session["GrocId"] = 9;
            }
        }

        private void BindHomeDelChages()
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {

                var a = (from s in db.tbl_HomeDelChrgs
                         where s.GrocerId == int.Parse(Session["GrocId"].ToString()) && s.IsDelete == false
                         select new { s.Id, s.HomeDelCrhg }).ToList();
              
                if (a.Count != 0)
                {
                    gvHomeDel.DataSource = a;
                    gvHomeDel.DataBind();
                }
                else
                {
                    lblnorecordfound.Visible = true;
                }
            }
        }

        protected void btnHomeDelivery_click(object sender, EventArgs e)
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                var chkd = (from s in db.tbl_HomeDelChrgs
                            where s.GrocerId == int.Parse(Session["GrocId"].ToString()) && s.IsDelete == false
                            select s).FirstOrDefault();
                if (chkd != null)
                {
                    chkd.HomeDelCrhg = txtHomedelChrg.Text;
                    chkd.GrocerId = int.Parse(Session["GrocId"].ToString());
                    chkd.IsDelete = false;
                    db.SubmitChanges();
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "str", "alert('Home Delivery Charges Updated');", true);
                    BindHomeDelChages();
                }
                else
                {
                    tbl_HomeDelChrg tb = new tbl_HomeDelChrg();
                    //tb.HomeDelCrhg = Convert.ToInt16(txtHomedelChrg.Text);
                    tb.HomeDelCrhg = txtHomedelChrg.Text;
                    tb.GrocerId = int.Parse(Session["GrocId"].ToString());
                    tb.IsDelete = false;
                    db.tbl_HomeDelChrgs.InsertOnSubmit(tb);
                    db.SubmitChanges();
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "str", "alert('Home Delivery Charges Saved Successfully');", true);
                    BindHomeDelChages();

                }
            }
        }
    }
}