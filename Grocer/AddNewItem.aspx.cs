using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace OnlineClothing.Grocer
{
    public partial class AddNewItem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                BindCategory();

            }
        }

        protected void BindCategory()
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                var cat = (from a in db.mstCategories
                           where a.IsDelete == false
                           select new
                           {
                               a.CatId,
                               a.CategoryName
                           }).ToList();

                ddlCategory.DataSource = cat;
                ddlCategory.DataTextField = "CategoryName";
                ddlCategory.DataValueField = "CatId";
                ddlCategory.DataBind();
                db.Dispose();
                ddlCategory.Items.Insert(0, new ListItem("--Select Category--", "0"));
            }
        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                var subcat = (from a in db.tbl_SubCategoryDtls
                              where a.IsDelete == false & a.CatId == int.Parse(ddlCategory.SelectedItem.Value)
                              select new
                              {
                                  a.SubCatId,
                                  a.SubCatName
                              }).ToList();

                ddlSubCategory.DataSource = subcat;
                ddlSubCategory.DataTextField = "SubCatName";
                ddlSubCategory.DataValueField = "SubCatId";
                ddlSubCategory.DataBind();
                db.Dispose();
                ddlSubCategory.Items.Insert(0, new ListItem("--Select Sub Category--", "0"));
            }
        }
        public void ddlSubCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                var pro = (from a in db.tbl_ProductListDtls
                           where a.IsDelete == false & a.SubCatId == int.Parse(ddlSubCategory.SelectedItem.Value)
                           select new
                           {
                               a.ProductId,
                               a.ProductName
                           }).ToList();

                ddlProduct.DataSource = pro;
                ddlProduct.DataTextField = "ProductName";
                ddlProduct.DataValueField = "ProductId";
                ddlProduct.DataBind();
                db.Dispose();
                ddlProduct.Items.Insert(0, new ListItem("--Select Product--", "0"));

                //var value = int.Parse(ddlProduct.SelectedItem.Value);
                //var value = int.Parse(ddlSubCategory.SelectedItem.Value);
                //var getData = (from s in db.stockItemList(value) select s).ToList();
                //gvItemList.DataSource = getData;
                //gvItemList.DataBind();
                //gvItemList.Visible = true;

            }
        }

        protected void ddlproducts_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                var value = int.Parse(ddlProduct.SelectedItem.Value);

                //var getData = (from s in db.stockItemList(value) select s).ToList();

                var getData = (from s in db.stockItemList(value) select s).ToList();

                if (getData.Count != 0)
                {
                    gvItemList.DataSource = getData;
                    gvItemList.DataBind();
                    gvItemList.Visible = true;
                    PnlShowGrid.Visible = true;
                }
                else
                {
                    gvItemList.DataSource = null;
                    gvItemList.DataBind();
                    lblnorecordfound.Visible = true;
                    PnlShowGrid.Visible = false;
                }
                
            }
        }

        protected void btnSave_click(Object sender, EventArgs e)
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                int grocer = int.Parse(Session["GrocId"].ToString());
                if (gvItemList.Rows.Count > 0)
                {
                    for (int i = 0; i < gvItemList.Rows.Count; i++)
                    {
                        CheckBox chk = (CheckBox)gvItemList.Rows[i].FindControl("chk");
                        if ((chk.Checked) == true)
                        {

                            int lblItemId = int.Parse(((Label)gvItemList.Rows[i].FindControl("lblItemID")).Text.ToString());
                            string lblQty = ((Label)gvItemList.Rows[i].FindControl("lblQty")).Text.ToString();

                            //var qry = (from s in db.tbl_ItemQtyDtls where s.ItemId == lblItemId select new {s.MRP}).ToList();

                            var a = (from s in db.tbl_GrocerRateDtls where s.ItemQtyId == lblItemId && s.GrocerId == grocer select s.ItemQtyId).FirstOrDefault();
                            if (a != null)
                            {

                            }
                            else
                            {
                                tbl_GrocerRateDtl tb = new tbl_GrocerRateDtl();
                                tb.ItemQtyId = int.Parse(lblItemId.ToString());
                                tb.GrocerId = int.Parse(grocer.ToString());
                                tb.IsDelete = false;
                                db.tbl_GrocerRateDtls.InsertOnSubmit(tb);
                                db.SubmitChanges();
                            }

                        }
                    }
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "str", "alert('Item Saved Successfully');", true);
                }

            }
        }

        protected void btnFreez_Click(object sender, EventArgs e)
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                Button clickedButton = (Button)sender;
                if (clickedButton.Text == "Freez")
                {
                    clickedButton.BackColor = Color.Red;
                    var lblItemId = ((Label)(((Button)sender).Parent.Parent.FindControl("lblItemID"))).Text;

                    var a = (from s in db.tbl_ItemQtyDtls where s.ItemQtyId == int.Parse(lblItemId.ToString()) select s).FirstOrDefault();
                    a.IsShow = false;
                    db.SubmitChanges();
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "str", "alert('Item Freezed');", true);

                    Button clickedButton1 = (Button)sender;
                    clickedButton1.Text = "Show";
                    clickedButton1.Enabled = true;
                }
                else if (clickedButton.Text == "Show")
                {
                    clickedButton.BackColor = Color.Green;
                    var lblItemId = ((Label)(((Button)sender).Parent.Parent.FindControl("lblItemID"))).Text;

                    var a = (from s in db.tbl_ItemQtyDtls where s.ItemQtyId == int.Parse(lblItemId.ToString()) select s).FirstOrDefault();
                    a.IsShow = true;
                    db.SubmitChanges();
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "str", "alert('Item Shows');", true);

                    Button clickedButton1 = (Button)sender;
                    clickedButton1.Text = "Freez";
                    clickedButton1.Enabled = true;
                }

            }
        }
    }
}