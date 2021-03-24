using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineClothing.Grocer
{
    public partial class BestSellingItem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!this.IsPostBack)
            {
                BindProducts();

            }
        }

        public void BindProducts()
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                var pro = (from a in db.tbl_ProductListDtls
                           join b in db.tbl_ItemListDtls on a.ProductId equals b.ProductId
                           join c in db.tbl_ItemQtyDtls on b.ItemId equals c.ItemId
                           join d in db.tbl_GrocerRateDtls on c.ItemQtyId equals d.ItemQtyId
                           where a.IsDelete == false && d.OfferRate != null
                           select new
                           {
                               a.ProductId,
                               a.ProductName
                           }).ToList().Distinct();

                ddlProduct.DataSource = pro;
                ddlProduct.DataTextField = "ProductName";
                ddlProduct.DataValueField = "ProductId";
                ddlProduct.DataBind();
                ddlProduct.Items.Insert(0, new ListItem("--Select Product--", "0"));

            }
        }

        protected void ddlproducts_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                var value = int.Parse(ddlProduct.SelectedItem.Value);

                var get = (from s in db.tbl_GrocerRateDtls
                           join a in db.tbl_ItemQtyDtls on s.ItemQtyId equals a.ItemQtyId
                           join b in db.tbl_ItemListDtls on a.ItemId equals b.ItemId
                           join c in db.tbl_ProductListDtls on b.ProductId equals c.ProductId
                           where  b.ProductId == int.Parse(value.ToString()) && s.GrocerId == int.Parse(Session["GrocId"].ToString())
                           select new  // s.OfferRate != null && s.Discount == null
                           {
                               ItemName = (b.BrandName + " " + c.ProductName),
                               a.MRP,
                               s.GrocerRateId,
                               b.Image,
                               //Qty = (a.Quantity + " " + a.Unit),
                               a.Quantity,
                               s.OfferRate
                           }).ToList();
                if (get.Count != 0)
                {

                    gvItemRate.DataSource = get;
                    gvItemRate.DataBind();
                    PnlShowGrid.Visible = true;
                }
                else
                {
                    gvItemRate.DataSource = null;
                    gvItemRate.DataBind();
                    lblnorecordfound.Visible = true; 
                }
            }
        }
        protected void txtDiscount_click(object sender, EventArgs e)
        {
            //string OfferRate, Discount;

            for (int i = 0; i < gvItemRate.Rows.Count; i++)
            {
                string OfferRate = (((Label)gvItemRate.Rows[i].FindControl("lblOfferare")).Text.ToString());
                string Discount = (((TextBox)gvItemRate.Rows[i].FindControl("txtDiscount")).Text.ToString());

                if (Discount != "")
                {
                    int Offer = Convert.ToInt32(OfferRate);
                    int Dis = Convert.ToInt32(Discount);

                    int Rate = Offer * Dis;

                    int DisRate = Convert.ToInt32(Rate / 100);

                    int FinalRate = (Offer - DisRate);

                    ((TextBox)gvItemRate.Rows[i].FindControl("txtFinalOfferRate")).Text = FinalRate.ToString();

                }

            }
        }
        protected void Discount_click(object sender, EventArgs e)
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                if (gvItemRate.Rows.Count > 0)
                {
                    for (int i = 0; i < gvItemRate.Rows.Count; i++)
                    {
                        string OfferRate = (((TextBox)gvItemRate.Rows[i].FindControl("txtFinalOfferRate")).Text.ToString());

                        if (OfferRate != "")
                        {
                            string Discount = (((TextBox)gvItemRate.Rows[i].FindControl("txtDiscount")).Text.ToString());

                            if (Discount != "")
                            {
                                int grocerRateID = int.Parse(((Label)gvItemRate.Rows[i].FindControl("lblGrocerId")).Text.ToString());


                                var check = (from s in db.tbl_GrocerRateDtls where s.GrocerRateId == int.Parse(grocerRateID.ToString()) select s).FirstOrDefault();


                                check.OfferRate = Convert.ToInt32(OfferRate.ToString());
                                check.Discount = Convert.ToInt32(Discount.ToString());
                                check.IsDelete = false;
                                db.SubmitChanges();

                            }
                        }
                    }
                }

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Item Rate Added Successfully.....!')", true);
            }
        }

    }
}