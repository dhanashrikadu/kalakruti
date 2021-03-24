using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineClothing.deliveryForms
{
    public partial class DeliBoyPickUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindData();
            }
        }
        protected void BindData()
        {
            if (Session["DeliBoyID"] != null)
            {
                int DeliBoyID = int.Parse((Session["DeliBoyID"]).ToString());
                using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
                {
                    //var get = (from s in db.SPPendingOdr(DeliBoyID)
                    //           join p in db.Tbl_DeliveryActions on s.ConfirmOdrID equals p.OrderId
                    //           where p.ActFlag == "A" && p.Status == "P" && p.GrocerId == DeliBoyID && p.Type == "D"
                    //           select new
                    //           {
                    //               s.CustId,
                    //               s.ConfirmOdrID,
                    //               s.name,
                    //               s.Address,
                    //               s.MobileNo,
                    //               s.EmailId,
                    //               s.Toatal_price,
                    //               s.GrocerId

                    //           }).ToList();


                    //if (get.Count != 0)
                    //{

                    //    gvPendingorders.DataSource = get;
                    //    gvPendingorders.DataBind();
                    //}
                    //else
                    //{
                    //    gvPendingorders.DataSource = null;
                    //    gvPendingorders.DataBind();
                    //    lblnorecordfound.Visible = true;
                    //}

                    var gtf = (from s in db.tbl_DeliveryBoy_Odrs
                               where s.Flag == "A" && s.Deli_BoyID == DeliBoyID
                               select new { s.ConfirmOdrID, s.Cust_Address, s.Cust_Mob, s.Cust_Name, s.CustOdr_ID, s.Deli_ID, s.GrocerId, s.Paymet_Method, s.Total_Amount }).ToList();



                    if (gtf.Count != 0)
                    {

                        gvPendingorders.DataSource = gtf;
                        gvPendingorders.DataBind();
                    }
                    else
                    {
                        gvPendingorders.DataSource = null;
                        gvPendingorders.DataBind();
                        lblnorecordfound.Visible = true;
                    }

                }

            }
        }
        protected void btnPickUp_click(object sender, EventArgs e)
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                int DeliBoyID = int.Parse((Session["DeliBoyID"]).ToString());
                string OderID = ((Label)((Button)sender).Parent.Parent.FindControl("lblConfirmorderId")).Text.ToString();
                int lblGrocerId = Convert.ToInt32(((Label)((Button)sender).Parent.Parent.FindControl("lblGrocerId")).Text.ToString());
                //int lblCustID = Convert.ToInt32(((Label)((Button)sender).Parent.Parent.FindControl("lblCustID")).Text.ToString());

                var so = (from s in db.tbl_DeliveryBoy_Odrs where s.ConfirmOdrID == OderID && s.GrocerId == lblGrocerId && s.Flag == "A" select s).FirstOrDefault();
                if (so != null)
                {
                    so.Flag = "P";
                   
                    db.SubmitChanges();
                }


                Tbl_DeliveryAction t = new Tbl_DeliveryAction();

                var ft = (from d in db.Tbl_DeliveryActions where d.OrderId == OderID && d.ActFlag == "A" && d.Status == "A" && d.Type == "D" && d.GrocerId == DeliBoyID select d).FirstOrDefault();
                if (ft != null)
                {

                    ft.Status = "P";

                    db.SubmitChanges();
                }

                t.OrderId = OderID;
                t.GrocerId = DeliBoyID;
                //t.CustId = lblCustID;
                t.ActFlag = "P";
                t.Status = "P";
                t.ActByCategory = int.Parse(Session["CategoryId"].ToString());
                t.ActDate = DateTime.Now;
                t.Isdelete = false;
                t.Type = "D";
                db.Tbl_DeliveryActions.InsertOnSubmit(t);
                db.SubmitChanges();


                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "str", "alert('Order is Pickup......');", true);
                BindData();


            }
        }
    }
}