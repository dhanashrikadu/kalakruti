using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineClothing.Admin
{
    public partial class AddItems : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                bindData();
            }
        }

        protected void bindData()
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {

                var cat = (from s in db.mstCategories where s.IsDelete == false select new { s.CatId, s.CategoryName, }).ToList();
                ddlCat.DataSource = cat;
                ddlCat.DataTextField = "CategoryName";
                ddlCat.DataValueField = "CatId";
                ddlCat.DataBind();
                ddlCat.Items.Insert(0, new ListItem("--Select-Category---", " "));
            }
        }



        protected void ddlCat_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                var subcat = (from a in db.tbl_SubCategoryDtls
                              where a.IsDelete == false && a.CatId == int.Parse(ddlCat.SelectedItem.Value)
                              select new
                              {
                                  a.SubCatId,
                                  a.SubCatName
                              }).ToList();

                ddlSubCat.DataSource = subcat;
                ddlSubCat.DataTextField = "SubCatName";
                ddlSubCat.DataValueField = "SubCatId";
                ddlSubCat.DataBind();
                db.Dispose();
                ddlSubCat.Items.Insert(0, new ListItem("--Select Sub-Category--", "0"));
            }
        }
        protected void ddlSubCat_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {

                var product = (from a in db.tbl_ProductListDtls
                               where a.IsDelete == false & a.SubCatId == int.Parse(ddlSubCat.SelectedItem.Value)
                               select new
                               {
                                   a.ProductId,
                                   a.ProductName
                               }).ToList();
                ddlProduct.DataSource = product;
                ddlProduct.DataTextField = "ProductName";
                ddlProduct.DataValueField = "ProductId";
                ddlProduct.DataBind();
                db.Dispose();
                ddlProduct.Items.Insert(0, new ListItem("--Select Sub-Product--", "0"));
            }
        }
        protected void ddlproducts_SelectIndexChange(object sender, EventArgs e)
        {
            Bindgrid();
        }

        protected void Bindgrid()
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                var item = (from a in db.tbl_ItemListDtls
                            where a.ProductId == int.Parse(ddlProduct.SelectedItem.Value)
                            select new { a.ItemId, a.BrandName, a.Details, a.Image }).ToList();


                if (item.Count != 0)
                    {
                        GvAddItem.DataSource = item;
                        GvAddItem.DataBind();
                        GvAddItem.Visible = true;
                    }
                    else 
                    {
                        lblnorecordfound.Visible = true;
                    }

                

            }

        }
        protected void btnAddItem_Click(Object sender, EventArgs e)
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                string imgpath = System.IO.Path.GetFileName(FileUploaditem.PostedFile.FileName);
                //FileUploaditem.SaveAs("D:/Project/GrocerApplication/GrocerApplication/Images/Itemimg/" + (imgpath));
                //FileUploaditem.SaveAs("D:/WIUMS PROJECT/GrocerApplication_Vesion2012/Images/Itemimg/" + (imgpath));
                FileUploaditem.SaveAs(Server.MapPath("~/Images/Itemimg/" + (imgpath)));

                tbl_ItemListDtl z = new tbl_ItemListDtl();

                z.BrandName = txtbrandNm.Text;
                z.Details = txtDetails.Text;
                z.Image = ("/Images/Itemimg/" + (imgpath));
                z.ProductId = Convert.ToInt32(ddlProduct.Text);
                z.IsDelete =  false;
                z.RegularItems = true;
                db.tbl_ItemListDtls.InsertOnSubmit(z);
                db.SubmitChanges();

                //ScriptManager.(Page, Page.GetType(), "str", "alert(Items Added Successfully!);", true);
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Items Added Successfully.....!')", true);
                Bindgrid();
            }
        }
        protected void Deleteitem_Click(object sender, EventArgs e)
        {
            String _RegId = ((Label)((Button)sender).Parent.Parent.FindControl("lblItemId")).Text.ToString();

            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                var getinfo = (from s in db.tbl_ItemListDtls
                               where s.IsDelete == false &
                                   s.ItemId == int.Parse(_RegId)
                               select s).FirstOrDefault();
                getinfo.IsDelete = true;
                db.SubmitChanges();
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "str",
                "alert('Record Deleted Successfully....' );", true);
                txtbrandNm.Text = "";
                txtDetails.Text = "";
                Bindgrid();
            }

        }
    }
}