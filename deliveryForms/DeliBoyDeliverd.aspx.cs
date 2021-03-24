using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineClothing.deliveryForms
{
    public partial class DeliBoyDeliverd : System.Web.UI.Page
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
                    //           where p.ActFlag == "P" && p.Status == "P" && p.GrocerId == DeliBoyID && p.Type == "D"
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

                    //    gvCordersList.DataSource = get;
                    //    gvCordersList.DataBind();
                    //}
                    //else
                    //{
                    //    gvCordersList.DataSource = null;
                    //    gvCordersList.DataBind();
                    //    lblnorecordfound.Visible = true;
                    //}

                    var gtf = (from s in db.tbl_DeliveryBoy_Odrs
                               where s.Flag == "P" && s.Deli_BoyID == DeliBoyID
                               select new { s.ConfirmOdrID, s.Cust_Address, s.Cust_Mob, s.Cust_Name, s.CustOdr_ID, s.Deli_ID, s.GrocerId, s.Paymet_Method, s.Total_Amount }).ToList();



                    if (gtf.Count != 0)
                    {

                        gvAcceptordersList.DataSource = gtf;
                        gvAcceptordersList.DataBind();
                    }
                    else
                    {
                        gvAcceptordersList.DataSource = null;
                        gvAcceptordersList.DataBind();
                        lblnorecordfound.Visible = true;
                    }

                }
            }
        }
        protected void btnDelivered_Click(object sender, EventArgs e)
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                

                int DeliBoyID = int.Parse((Session["DeliBoyID"]).ToString());
                string OderID = ((Label)((Button)sender).Parent.Parent.FindControl("lblConfirmorderId")).Text.ToString();
                int lblGrocerId = Convert.ToInt32(((Label)((Button)sender).Parent.Parent.FindControl("lblGrocerId")).Text.ToString());
                //int lblCustID = Convert.ToInt32(((Label)((Button)sender).Parent.Parent.FindControl("lblCustID")).Text.ToString());

                var so = (from s in db.tbl_DeliveryBoy_Odrs where s.ConfirmOdrID == OderID && s.GrocerId == lblGrocerId  && s.Flag == "P" select s).FirstOrDefault();
                if (so != null)
                {
                    so.Flag = "C";

                    db.SubmitChanges();
                }


                var ft = (from d in db.Tbl_DeliveryActions where d.OrderId == OderID && d.ActFlag == "A" && d.Status == "P" && d.GrocerId == DeliBoyID select d).FirstOrDefault();
                        if (ft != null)
                        {

                            ft.Status = "C";

                            db.SubmitChanges();
                        }
                        var tb = (from d in db.Tbl_DeliveryActions where d.OrderId == OderID && d.ActFlag == "P" && d.Status == "P" && d.GrocerId == DeliBoyID select d).FirstOrDefault();
                        if (tb != null)
                        {
                            tb.Status = "C";
                            db.SubmitChanges();
                        }
                        var charges = (from s in db.mst_DeliveryBoyCharges where s.IsDelete == false orderby s.Date descending select s).FirstOrDefault();
                        var tbt = (from d in db.Tbl_DeliveryActions where d.OrderId == OderID && d.ActFlag == "C" && d.Status == "C" && d.GrocerId == DeliBoyID select d).FirstOrDefault();
                        //if (tbt == null)
                        //{
                            Tbl_DeliveryAction t = new Tbl_DeliveryAction();
                            t.OrderId = OderID;
                            t.GrocerId = DeliBoyID;
                            //t.CustId = lblCustID;
                            t.ActFlag = "C";
                            t.Status = "C";
                            t.ActByCategory = int.Parse(Session["CategoryId"].ToString());
                            t.ActDate = DateTime.Now;
                            t.Type = "D                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ";
                            t.Isdelete = false;
                            if (charges != null)
                            {
                                t.drDeliCharges = charges.Rate;
                            }
                            db.Tbl_DeliveryActions.InsertOnSubmit(t);
                            db.SubmitChanges();
                        //}


                  
                     PanelDetail.Visible = false;
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "str", "alert('Order Accept.);", true);
                        BindData();
            }

        }
               
           
        protected void btnshowdetail_click(object sender, EventArgs e)
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                PanelDetail.Visible = true;
                string OderID = ((Label)((Button)sender).Parent.Parent.FindControl("lblConfirmorderId")).Text.ToString();
                var cart = (from s in db.tbl_CartDtls
                            join t in db.tbl_ItemListDtls on s.ItemId equals t.ItemId
                            where s.CustmerOdrId == OderID
                            select new { s.cartID, s.CustmerOdrId, s.CustomerId, s.GrocerRateID, s.ItemId, s.Quantity, s.Size, t.BrandName, t.Image }).ToList();
                gvDetail.DataSource = cart;
                gvDetail.DataBind();





            }
        }
        protected void btnBack_Click(object sender, EventArgs e)
        {
            PanelDetail.Visible = false;
        }
    }
}