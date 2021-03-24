using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineClothing.Admin
{
    public partial class AddBanner : System.Web.UI.Page
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
                    FileUploadCat.SaveAs(Server.MapPath("~/Images/HeaderImage/" + (imgpath)));
                }
                tbl_HeaderImage s = new tbl_HeaderImage();
                //s.CategoryName = txtAddCat.Text;
                if (imgpath != "")
                {
                    s.HeaderImage = ("/Images/HeaderImage/" + (imgpath));
                }
                s.IsDelete = false;
                //s.MarathiCatagory = txtMarathicat.Text;
                db.tbl_HeaderImages.InsertOnSubmit(s);
                db.SubmitChanges();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Header Image Added Successfully.....!')", true);
                BindCategory();
            }

        }
        protected void BindCategory()
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                var getData = (from s in db.tbl_HeaderImages
                               where s.IsDelete == false
                               select new
                               {
                                   s.HeaderId,
                                   s.HeaderImage,

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
            String Id = ((Label)((Button)sender).Parent.Parent.FindControl("lblhederid")).Text.ToString();

            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                var getinfo = (from s in db.tbl_HeaderImages
                               where s.IsDelete == false &
                                  s.HeaderId == int.Parse(Id)
                               select s).FirstOrDefault();
                getinfo.IsDelete = true;
                db.SubmitChanges();
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "str",
                "alert('Record Deleted Successfully....' );", true);
                //txtAddCat.Text = "";
                BindCategory();
            }
        }
       
    }
}