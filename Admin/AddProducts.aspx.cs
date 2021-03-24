using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineClothing.Admin
{
    public partial class AddProducts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (dbDatabaseDataDataContext bd = new dbDatabaseDataDataContext())
            {
                if (!Page.IsPostBack)
                {
                    var cat = (from s in bd.mstCategories where s.IsDelete == false select new { s.CatId, s.CategoryName, }).ToList();
                    ddlAddCategory.DataSource = cat;
                    ddlAddCategory.DataTextField = "CategoryName";
                    ddlAddCategory.DataValueField = "CatId";
                    ddlAddCategory.DataBind();
                    ddlAddCategory.Items.Insert(0, new ListItem("--Select-Category-", " "));
                }
            }
        }

        protected void btnAddProduct_Click(Object sender, EventArgs e)
        {

            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                string imgpath = System.IO.Path.GetFileName(FileUploadProducts.PostedFile.FileName);
                // FileUploadProducts.SaveAs("D:/Project/GrocerApplication/GrocerApplication/Images/Productsimg/" + (imgpath));
                // FileUploadProducts.SaveAs("D:/WIUMS PROJECT/GrocerApplication_Vesion2012/Images/Productsimg/" + (imgpath));
                FileUploadProducts.SaveAs(Server.MapPath("~/Images/Productsimg/" + (imgpath)));
                //fileUploader.SaveAs(Server.MapPath("~/Images/") + "file.jpg");
                tbl_ProductListDtl a = new tbl_ProductListDtl();
                a.ProductName = txtAddproducts.Text;
                a.Image = ("/Images/Productsimg/" + (imgpath));
                a.SubCatId = Convert.ToInt32(ddlSubCategoryPnlProd.Text);
                a.IsDelete = false;
                a.RegularItems = 1;
                db.tbl_ProductListDtls.InsertOnSubmit(a);
                db.SubmitChanges();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Products Added Successfully.....!')", true);
                txtAddproducts.Text = "";
                BindGrid();
            }
        }

        protected void ddlAddCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                var Subcat = (from a in db.tbl_SubCategoryDtls
                              where a.IsDelete == false & a.CatId == int.Parse(ddlAddCategory.SelectedItem.Value)
                              select new { a.SubCatId, a.SubCatName, }).ToList();


                ddlSubCategoryPnlProd.DataSource = Subcat;
                ddlSubCategoryPnlProd.DataTextField = "SubCatName";
                ddlSubCategoryPnlProd.DataValueField = "SubCatId";
                ddlSubCategoryPnlProd.DataBind();
                db.Dispose();
                ddlSubCategoryPnlProd.Items.Insert(0, new ListItem("--Select Sub-Category--", "0"));

            }
        }
        protected void ddlSubCategoryPnlProd_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindGrid();
        }
        protected void BindGrid()
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                var prod = (from a in db.tbl_ProductListDtls
                            where a.IsDelete == false & a.SubCatId == int.Parse(ddlSubCategoryPnlProd.SelectedItem.Value)
                            select new { a.ProductId, a.ProductName, a.Image }).ToList();

                    if (prod.Count != 0)
                    {

                        Gvproduct.DataSource = prod;
                        Gvproduct.DataBind();
                        Gvproduct.Visible = true;
                    }
                    else 
                    {
                        lblnorecordfound.Visible = true;
                    }

               

            }

        }
        protected void Deletrprod_Click(object sender, EventArgs e)
        {
            String _RegId =
            ((Label)((Button)sender).Parent.Parent.FindControl("lblProductId")).Text.ToString();

            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                var getinfo = (from s in db.tbl_ProductListDtls
                               where s.ProductId
                                   == int.Parse(_RegId)
                               select s).FirstOrDefault();
                getinfo.IsDelete = true;
                db.SubmitChanges();
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "str",
                "alert('Record Deleted Successfully....' );", true);
                BindGrid();
            }

        }
    }
}