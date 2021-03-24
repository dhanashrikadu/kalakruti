using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineClothing.Grocer
{
    public partial class OrderList : System.Web.UI.Page
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
            if (Session["GrocId"] != null)
            {
                //int GrocerID = int.Parse(Session["GrocId"].ToString());
                int GrocerID = int.Parse((Session["GrocId"]).ToString());
                using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
                {
                    var get = (from s in db.SPPendingOdr(GrocerID)
                              
                              
                               select new
                               {
                                   s.CustId,
                                   s.ConfirmOdrID,
                                   s.name,
                                   s.Address,
                                   s.MobileNo,
                                   s.EmailId,
                                   s.Toatal_price
                                   //s.CustOrdId,
                                   //s.CustFullName,
                                   //s.Address,
                                   //s.Delivery_Date,
                                   //s.Odr_status,
                                   //s.Toatal_price,
                                   //s.GrocerId,
                                   //s.CustId,
                                   //s.complt_Odr,
                                   //s.MobileNo,
                                   //s.EmailId
                               }).ToList();

                   

                    if (get.Count != 0)
                    {

                        gvorders.DataSource = get;
                        gvorders.DataBind();
                    }
                    else
                    {
                        gvorders.DataSource = null;
                        gvorders.DataBind();
                        lblnorecordfound.Visible = true;
                    }


                }
            }
        }


        protected void btnDone_click(object sender, EventArgs e)
        {


        }


        protected void btnShowDetail_click(object sender, EventArgs e)
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

            //int OderID = Convert.ToInt32(((Label)((Button)sender).Parent.Parent.FindControl("lblCustOdrID")).Text.ToString());

            //Response.Redirect("~/Grocer/OrderListDtl.aspx?CusterOrderId=" + OderID);
        }
           
        protected void btnBack_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            PanelDetail.Visible = false;
        }
    }
}