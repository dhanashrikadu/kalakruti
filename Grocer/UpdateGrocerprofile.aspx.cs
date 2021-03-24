using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineClothing.Grocer
{
    public partial class UpdateGrocerprofile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                showdata();
                bindArea();
            }
        }
        protected void showdata()
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                var check = (from s in db.RegistrationInfos
                             join a in db.mstGrocerDtls on s.UserID equals a.GrocerId
                             where s.CategoryId == 2 && a.IsDelete == false && a.GrocerId == int.Parse(Session["GrocId"].ToString())
                             select new { a.Email, a.MobNo, a.ShopName, a.ShopOwnAdhar, a.ShopOwnName, a.ShopRegNo, a.ShopAddr, a.AreaCode, a.GrocerId, a.image }).FirstOrDefault();

                if (check != null)
                {
                    txtEmailId.Text = check.Email;
                    txtMobNo.Text = check.MobNo;
                    txtSName.Text = check.ShopName;
                    txtOwnAdhar.Text = check.ShopOwnAdhar;
                    txtOwnNm.Text = check.ShopOwnAdhar;
                    txtShopAddr.Text = check.ShopAddr;
                    txtSRegNo.Text = check.ShopRegNo;
                    bindArea();
                    ddlArea.SelectedIndex = ddlArea.Items.IndexOf(ddlArea.Items.FindByValue(check.AreaCode.ToString()));
                }
            }
        }
        protected void bindArea()
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                var area = (from s in db.mstAreas where s.IsDelete == false select new { s.AreaId, s.NagarName, }).ToList();
                ddlArea.DataSource = area;
                ddlArea.DataTextField = "NagarName";
                ddlArea.DataValueField = "AreaId";
                ddlArea.DataBind();
                ddlArea.Items.Insert(0, new ListItem("--Select--", " "));
            }
        }
        protected void btnRegister_click(Object sender, EventArgs e)
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                if (FileUpload1.PostedFile != null)
                {
                    string imgpath = System.IO.Path.GetFileName(FileUpload1.PostedFile.FileName);
                    //string imgpath = Server.MapPath("/rImg");
                    if (imgpath != "")
                    {
                        FileUpload1.SaveAs(Server.MapPath("~/Images/GrocerImage/" + (imgpath)));
                    }


                    //FileUpload1.SaveAs(imgpath + "/" + FileUpload1.FileName);

                    mstGrocerDtl g = new mstGrocerDtl();
                    //var g = (from s in db.mstGrocerDtls where s.GrocerId == int.Parse(Session["GrocId"].ToString()) select s).FirstOrDefault();
                    if (imgpath != "")
                    {
                        g.image = ("/Images/GrocerImage/" + (imgpath));
                    }
                    g.AreaCode = int.Parse(ddlArea.Text);
                    g.ShopName = txtSName.Text;
                    g.ShopRegNo = txtSRegNo.Text;
                    g.ShopAddr = txtShopAddr.Text;
                    g.ShopOwnName = txtOwnNm.Text;
                    g.MobNo = txtMobNo.Text;
                    g.Email = txtEmailId.Text;
                    g.ShopOwnAdhar = txtOwnAdhar.Text;

                    // g.image = ("GrocerImg/" + FileUpload1.FileName);
                    g.IsDelete = false;
                    // g.Lattitude = null;
                    //g.Longitude = null;
                    //db.mstGrocerDtls.InsertOnSubmit(g);
                    db.SubmitChanges();

                    RegistrationInfo d = new RegistrationInfo();
                    d.RegistrationDateTime = DateTime.Now;
                    d.CategoryId = 2;
                    d.MobileNo = txtMobNo.Text;
                    d.Password = txtpass.Text;
                    d.UserID = g.GrocerId;
                    d.Isdelete = false;
                    //db.RegistrationInfos.InsertOnSubmit(d);
                    db.SubmitChanges();
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Registration Successfully')", true);
                    Response.Redirect("GrocerProfile.aspx");
                    showdata();
                }
            }

        }

        protected void btnCancel_click(Object sender, EventArgs e)
        {
            Response.Redirect("GrocerProfile.aspx");
        }

    }
}