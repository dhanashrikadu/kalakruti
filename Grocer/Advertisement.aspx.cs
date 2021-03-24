using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineClothing.Grocer
{
    public partial class Advertisement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindAdvertisement();
            }
        }
        protected void AddImg_click(object sender, EventArgs e)
        {
            string imgpath = System.IO.Path.GetFileName(FileUpload1.PostedFile.FileName);
            FileUpload1.SaveAs("D:/SuperBazar/Mobile View/GrocerApplication/GrocerApplication/Adds/" + (imgpath));
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                mst_Advertisement a = new mst_Advertisement();
                a.Category_ID = Convert.ToInt32(ddlcat.SelectedItem.Value);
                a.imgurl = ("../Adds/" + (imgpath));
                a.IsDelete = false;
                db.mst_Advertisements.InsertOnSubmit(a);
                db.SubmitChanges();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Advertisement Added Successfully.....!')", true);
                BindAdvertisement();
            }
        }
        protected void BindAdvertisement()
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                var z = (from s in db.mst_Advertisements where s.IsDelete == false select s).ToList();
               
                if (z.Count != 0)
                {
                    GvAdds.DataSource = z;
                    GvAdds.DataBind();

                }
                else
                {
                    lblnorecordfound.Visible = true;
                }
            }
        }
    }
}