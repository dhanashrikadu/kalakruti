using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineClothing.Admin
{
    public partial class AddCategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindCategory();

            }
        }

        protected void btnAddcat_Click(Object sender, EventArgs e)
        {

            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                string imgpath = System.IO.Path.GetFileName(FileUploadCat.PostedFile.FileName);
                //FileUploadCat.SaveAs("D:/Project/GrocerApplication/GrocerApplication/Images/Categoryimg/" + (imgpath));
                // FileUploadCat.SaveAs("D:/WIUMS PROJECT/GrocerApplication_Vesion2012/Images/Categoryimg/" + (imgpath));
                if (imgpath != "")
                {
                    FileUploadCat.SaveAs(Server.MapPath("~/Images/Categoryimg/" + (imgpath)));
                }
                mstCategory s = new mstCategory();
                s.CategoryName = txtAddCat.Text;
                if (imgpath != "")
                {
                    s.Image = ("/Images/Categoryimg/" + (imgpath));
                }
                s.IsDelete = false;
                s.MarathiCatagory = txtMarathicat.Text;
                db.mstCategories.InsertOnSubmit(s);
                db.SubmitChanges();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Category Added Successfully.....!')", true);
                BindCategory();
            }

        }
        protected void BindCategory()
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                var getData = (from s in db.mstCategories
                               where s.IsDelete == false
                               select new
                               {
                                   s.CatId,
                                   CategoryName = s.CategoryName,
                                   s.Image,
                                   s.MarathiCatagory
                               }).ToList();

               
                   if (getData.Count != 0)
                    {
                        Gvcategory.DataSource = getData;
                        Gvcategory.DataBind();
                        Gvcategory.Visible = true;
                    }
                    else 
                    {
                        lblnorecordfound.Visible = true;
                    }

                }
            }
        
        protected void Deletecat_Click(object sender, EventArgs e)
        {
            String _RegId =
            ((Label)((Button)sender).Parent.Parent.FindControl("lblcatId")).Text.ToString();

            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                var getinfo = (from s in db.mstCategories
                               where s.IsDelete == false &
                                  s.CatId == int.Parse(_RegId)
                               select s).FirstOrDefault();
                getinfo.IsDelete = true;
                db.SubmitChanges();
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "str",
                "alert('Record Deleted Successfully....' );", true);
                txtAddCat.Text = "";
                BindCategory();
            }
        }
       
    }
}