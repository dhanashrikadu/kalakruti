using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineClothing
{
    public partial class AddToCart : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Label lbl_UserName = this.Master.FindControl("lblCartValue") as Label;
                string ProdId = Request.QueryString["ItemId"];
               int grocer = int.Parse(Session["groserid"].ToString());
                 Session["groserid"] = null;
                if (ProdId != null)
                {
                    using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
                    {

                        var a = (from s in db.tbl_ItemListDtls
                                 join p in db.tbl_ItemQtyDtls on s.ItemId equals p.ItemId
                                 join q in db.tbl_GrocerRateDtls on p.ItemQtyId equals q.ItemQtyId
                                 join r in db.tbl_ProductListDtls on s.ProductId equals r.ProductId
                                 where s.ItemId == int.Parse(ProdId) && q.GrocerId == grocer
                                 select new { s.Image, s.BrandName, s.Details, q.OfferRate, p.MRP, r.ProductName, s.ItemId, q.GrocerId}).FirstOrDefault();
                        //where s.ItemId == int.Parse(ProdId)
                        Image1.ImageUrl = a.Image;
                        lblItemName.Text = a.BrandName;
                        lblMRP.Text = a.MRP.ToString();
                        lblOfferate.Text = a.OfferRate.ToString();
                        lblDescription.Text = a.Details;
                        hdnGRateId.Value = a.OfferRate.ToString();
                        hdnlblGID.Value = a.ItemId.ToString();
                        lblgrocerid.Text = a.GrocerId.ToString();
                        // Session["cartID"] = ProdId;



                        //lblItemName.Text = a.BrandName;
                        //lblMrp.Text = a.OfferRate.ToString();
                        //// Pdtl.Text = a.Details;

                        //var aa = (from so in db.tbl_ItemListDtls
                        //          where so.ItemId == int.Parse(ProdId)
                        //          select new { so.ProductId }).FirstOrDefault();

                        //var rp = (from ss in db.tbl_ItemListDtls
                        //          where ss.ProductId == aa.ProductId
                        //          select new { ss.Image, ss.BrandName, ss.ItemId }).Distinct();
                        //Repeater1.DataSource = rp;
                        //Repeater1.DataBind();

                        //dlItemDtl.DataSource = rp;
                        //dlItemDtl.DataBind();
                    }

                }

            }
        }

        protected void lbtnBuyNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        //protected void lbtnAddTOCart_Click(object sender, EventArgs e)
        //{

        public void lbtnAddTOCart_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                if (Request.Cookies["ShoppingCart"] == null)
                {
                   Session["ShoppingCart"] = Request.QueryString["ItemId"].ToString() + "," + txtcount.Text.ToString() + "," + lblOfferate.Text.ToString() + "," + ddlSize.SelectedItem.Text + "," + lblgrocerid.Text;
                
                    Response.Cookies["ShoppingCart"].Value = Request.QueryString["ItemId"].ToString() + "," + txtcount.Text.ToString() + "," + lblOfferate.Text.ToString() + "," + ddlSize.SelectedItem.Text + "," + lblgrocerid.Text ;
                    //Response.Cookies["ShoppingCart"].Value = Session["ShoppingCart"].ToString();
                }
                else
                {
                    Session["ShoppingCart"] = Session["ShoppingCart"] + "|" + Request.QueryString["ItemId"].ToString() + "," + txtcount.Text.ToString() + "," + lblOfferate.Text.ToString() + "," + ddlSize.SelectedItem.Text + "," + lblgrocerid.Text;
                 
                    Response.Cookies["ShoppingCart"].Value = Request.Cookies["ShoppingCart"].Value + "|" + Request.QueryString["ItemId"].ToString() + "," + txtcount.Text.ToString() + "," + lblOfferate.Text.ToString() + "," + ddlSize.SelectedItem.Text + "," + lblgrocerid.Text;
                    //Response.Cookies["ShoppingCart"].Value = Session["ShoppingCart"].ToString();
                }
                ((Site1)Master).BindGvCardDtl();
                Response.Cookies["ShoppingCart"].Expires = DateTime.Now.AddYears(30);
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "str", "alert('Item Is Added To Card Succesfully');", true);
             
            }
        }
            //using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            //{
            //    int FinalCount = int.Parse(txtcount.Text.ToString());
            //    int grocerrate = int.Parse(lblOfferate.Text.ToString());
            //    //int grocerrate = int.Parse(lblOfferate.Text.ToString());
            //    if (FinalCount != 0)
            //    {
            //        //var check = (from s in db.tbl_CartDtls where s.GrocerRateID == grocerrate && s.ItemId == int.Parse(Request.QueryString["ProdId"].ToString()) && s.CustomerId == int.Parse(Session["CustID"].ToString()) && s.PaymentStatus == false select s).FirstOrDefault();

            //        //if (check == null)
            //        //{
            //            tbl_CartDtl tb = new tbl_CartDtl();
            //            //tb.CustomerId = int.Parse(Session["CustID"].ToString());
            //            tb.GrocerRateID = int.Parse(grocerrate.ToString());
            //            tb.Quantity = int.Parse(FinalCount.ToString());
            //            tb.ItemId = int.Parse(Request.QueryString["ItemId"].ToString());
            //            tb.PaymentStatus = false;
            //            tb.IsDelete = false;
            //            db.tbl_CartDtls.InsertOnSubmit(tb);
            //            db.SubmitChanges();

            //            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "str", "alert('Item Is Added To Card Succesfully');", true);
            //        //}
            //        //else
            //        //{
            //            //check.CustomerId = int.Parse(Session["CustID"].ToString());
            //            //check.GrocerRateID = int.Parse(grocerrate.ToString());
            //            //check.Quantity = int.Parse(FinalCount.ToString());
            //            //check.ItemId = int.Parse(abc.ToString());


            //        //---------- needed
            //            //int a = int.Parse(check.Quantity.ToString());
            //            //check.Quantity = a + FinalCount;
            //            //check.PaymentStatus = false;
            //            //check.IsDelete = false;
            //            db.SubmitChanges();
            //            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "str", "alert('Item Is Added To Card Succesfully');", true);
            //        }
            //    }
      //  }
        protected void lbtnBuyNow_Click1(object sender, EventArgs e)
        {
            Response.Redirect("ShoppingCart.aspx");
        }
    }
}
       
