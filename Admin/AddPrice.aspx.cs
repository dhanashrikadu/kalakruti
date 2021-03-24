using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineClothing.Admin
{
    public partial class AddPrice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
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
        protected void ddlSubCategory_SelectedIndexChanged(object sender, EventArgs e)
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

            }
        }
        protected void ddlproducts_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                var item = (from c in db.mstCategories
                            join d in db.tbl_SubCategoryDtls on c.CatId equals d.CatId
                            join p in db.tbl_ProductListDtls on d.SubCatId equals p.SubCatId
                            join a in db.tbl_ItemListDtls on p.ProductId equals a.ProductId
                            where a.IsDelete == false & p.ProductId == int.Parse(ddlProduct.SelectedItem.Value)
                            select new { ProductId = (a.ItemId), ItemName = (a.BrandName + " " + p.ProductName), a.Details, a.Image, a.ItemId }).ToList();


                if (item.Count != 0)
                    {
                        gvItemRate.DataSource = item;
                        gvItemRate.DataBind();
                    }
                    else 
                    {
                        lblnorecordfound.Visible = true;
                    }


            }
        }
       

        protected void chkAll_CheckedChanged(object sender, EventArgs e)
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                CheckBox chckheader = (CheckBox)gvItemRate.HeaderRow.FindControl("chkAll");
                foreach (GridViewRow gvrow in gvItemRate.Rows)
                {
                    CheckBox chckrw = (CheckBox)gvrow.FindControl("ChkChild");
                    if (chckheader.Checked == true)
                    {

                        chckrw.Checked = true;

                    }
                    else
                    {

                        chckrw.Checked = false;
                    }
                }
            }
        }

        protected void btnUpdateRates_click(object semder, EventArgs e)
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {

                foreach (GridViewRow row in gvItemRate.Rows) //Running all lines of grid
                {
                    CheckBox chkRow = (CheckBox)(row.FindControl("ChkChild"));
                    if (chkRow.Checked)
                    {
                        // Label ItemId = (Label)gvItemRate.HeaderRow.FindControl("lblItemId");
                        int ItemId = int.Parse(((Label)row.FindControl("lblItemId")).Text.ToString());

                        var ChkData = (from s in db.tbl_ItemQtyDtls where s.ItemId == int.Parse(ItemId.ToString()) select s).FirstOrDefault();
                        if (ChkData == null)
                        {
                            int temitemId = int.Parse(((Label)row.FindControl("lbllblItemId")).Text.ToString());
                            int tempMRP = int.Parse(((TextBox)row.FindControl("txtMRP")).Text.ToString());
                            int Quantity = int.Parse(((TextBox)row.FindControl("txtOty")).Text.ToString());
                            string unit = (((DropDownList)row.FindControl("ddlunit")).Text.ToString());

                            tbl_ItemQtyDtl s = new tbl_ItemQtyDtl();
                            s.ItemId = temitemId;
                            s.Quantity = Quantity;
                            s.Unit = unit;
                            s.MRP = tempMRP;
                            s.IsDelete = false;
                            s.IsShow = true;
                            db.tbl_ItemQtyDtls.InsertOnSubmit(s);
                            db.SubmitChanges();
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Price Added Successfully.....!')", true);

                        }
                        else
                        {
                            int tempMRP = int.Parse(((TextBox)row.FindControl("txtMRP")).Text.ToString());
                            ChkData.MRP = tempMRP;
                            db.SubmitChanges();
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Price Added Successfully.....!')", true);
                        }
                    }
                }


            }
        }
    }
}