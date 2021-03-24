using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineClothing.Admin
{
    public partial class AddSubCategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
                {
                    if (!Page.IsPostBack)
                    {


                        var cat = (from s in db.mstCategories where s.IsDelete == false select new { s.CatId, s.CategoryName, }).ToList();
                        ddlCate.DataSource = cat;
                        ddlCate.DataTextField = "CategoryName";
                        ddlCate.DataValueField = "CatId";
                        ddlCate.DataBind();
                        ddlCate.Items.Insert(0, new ListItem("--Select-Category-", " "));
                    }
                }
            }
        }


        protected void ddlCate_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindGrid();

        }

        protected void BindGrid()
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                var Subcat = (from s in db.tbl_SubCategoryDtls
                              where s.IsDelete == false & s.CatId == int.Parse(ddlCate.SelectedItem.Value)
                              select new
                              {
                                  s.SubCatId,
                                  s.SubCatName,
                                  s.Image
                              }).ToList();

              
                   if (Subcat.Count != 0)
                    {
                          Gvsubcategory.DataSource = Subcat;
                            Gvsubcategory.DataBind();
                            Gvsubcategory.Visible = true;
                    }
                    else 
                    {
                        lblnorecordfound.Visible = true;
                    }

              
            }
        }

        protected void btnAddSubcat_Click(Object sender, EventArgs e)
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                string imgpath = System.IO.Path.GetFileName(FileUploadSubcat.PostedFile.FileName);
                // FileUploadSubcat.SaveAs("D:/Project/GrocerApplication/GrocerApplication/Images/Sub_catimg/" + (imgpath));
                // FileUploadSubcat.SaveAs("D:/WIUMS PROJECT/GrocerApplication_Vesion2012/Images/Sub_catimg/" + (imgpath));
                if (imgpath != "")
                {
                    FileUploadSubcat.SaveAs(Server.MapPath("~/Images/Sub_catimg/" + (imgpath)));
                }

                tbl_SubCategoryDtl a = new tbl_SubCategoryDtl();
                a.SubCatName = txtSubcate.Text;
                if (imgpath != "")
                {

                    a.Image = ("/Images/Sub_catimg/" + (imgpath));
                }
                a.CatId = Convert.ToInt32(ddlCate.Text);
                a.IsDelete = false;
                if (chkRegular.Checked == true)
                {
                    a.RegularItems = true;
                }
                else
                {
                    a.RegularItems = false;
                }
                db.tbl_SubCategoryDtls.InsertOnSubmit(a);
                db.SubmitChanges();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Sub-Category Added Successfully.....!')", true);
                BindGrid();
                chkRegular.Checked = false;
            }

        }
        protected void DeletrSubcat_Click(object sender, EventArgs e)
        {
            String _RegId =
            ((Label)((Button)sender).Parent.Parent.FindControl("lblcatId")).Text.ToString();

            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                var getinfo = (from s in db.tbl_SubCategoryDtls
                               where s.IsDelete == false &
                                   s.SubCatId == int.Parse(_RegId)
                               select s).FirstOrDefault();
                getinfo.IsDelete = true;
                db.SubmitChanges();
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "str",
                "alert('Record Deleted Successfully....' );", true);
                txtSubcate.Text = "";
                BindGrid();
            }

        }
    }
}