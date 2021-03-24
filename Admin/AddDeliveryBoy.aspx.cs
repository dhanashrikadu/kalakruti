using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineClothing.Admin
{
    public partial class AddDeliveryBoy : System.Web.UI.Page
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
                             join a in db.mstDeliveryBoyDtls on s.UserID equals a.DeliveryBoyId
                             where s.CategoryId == 4 && a.IsDelete == false
                             select new { a.Email, a.MobNo, a.AreaCode, a.BankAccNo, a.DeliverBoyAddr, a.DeliverBoyName, a.DeliverBoyOwnAdhar, a.DeliverBoyRegNo, a.DeliveryBoyId,
                                 a.IFSCcode, a.image }).ToList();
                if (check != null)
                {
                    gvShop.DataSource = check;
                    gvShop.DataBind();
                }
                else
                {
                    lblnorecordfound.Visible = true;
                }
                //if (check != null)
                //{
                //    txtEmailId.Text = check.Email;
                //    txtMobNo.Text = check.MobNo;
                //    txtSName.Text = check.ShopName;
                //    txtOwnAdhar.Text = check.ShopOwnAdhar;
                //    txtOwnNm.Text = check.ShopOwnAdhar;
                //    txtShopAddr.Text = check.ShopAddr;
                //    txtSRegNo.Text = check.ShopRegNo;
                //    //bindArea();
                //    ddlArea.SelectedIndex = ddlArea.Items.IndexOf(ddlArea.Items.FindByValue(check.AreaCode.ToString()));
                //}
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
                        FileUpload1.SaveAs(Server.MapPath("~/Images/DeliveryBoyImage/" + (imgpath)));
                    }


                    //FileUpload1.SaveAs(imgpath + "/" + FileUpload1.FileName);

                    mstDeliveryBoyDtl g = new mstDeliveryBoyDtl();
                   
                    if (imgpath != "")
                    {
                        g.image = ("/Images/GrocerImage/" + (imgpath));
                    }
                    g.AreaCode = int.Parse(ddlArea.Text);
                    g.DeliverBoyName = txtSName.Text;
                    g.DeliverBoyRegNo = txtSRegNo.Text;
                    g.DeliverBoyAddr = txtShopAddr.Text;
                    //g. = txtOwnNm.Text;
                    g.MobNo = txtMobNo.Text;
                    g.Email = txtEmailId.Text;
                    g.DeliverBoyOwnAdhar = txtOwnAdhar.Text;
                    g.BankAccNo = txtAccountNo.Text;
                    g.IFSCcode = txtIFSCcode.Text;
                    // g.image = ("GrocerImg/" + FileUpload1.FileName);
                    g.IsDelete = false;
                    // g.Lattitude = null;
                    //g.Longitude = null;
                    db.mstDeliveryBoyDtls.InsertOnSubmit(g);
                    db.SubmitChanges();

                    RegistrationInfo d = new RegistrationInfo();
                    d.RegistrationDateTime = DateTime.Now;
                    d.CategoryId = 4;
                    d.MobileNo = txtMobNo.Text;
                    d.Password = txtpass.Text;
                    d.UserID = g.DeliveryBoyId;
                    d.Isdelete = false;
                    db.RegistrationInfos.InsertOnSubmit(d);
                    db.SubmitChanges();
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Registration Successfully')", true);
                    pnlAddShop.Visible = false;
                    pnlgrid.Visible = true;
                    showdata();
                }
            }

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            String Id = ((Label)((Button)sender).Parent.Parent.FindControl("lblDeliveryBoyId")).Text.ToString();

            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                var getinfo = (from s in db.mstDeliveryBoyDtls
                               where s.IsDelete == false &
                                  s.DeliveryBoyId == int.Parse(Id)
                               select s).FirstOrDefault();
                getinfo.IsDelete = true;
                db.SubmitChanges();
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "str",
                "alert('Record Deleted Successfully....' );", true);
                //txtAddCat.Text = "";
                showdata();


            }
        }

        protected void AddNewSh_Click(object sender, EventArgs e)
        {
            pnlgrid.Visible = false;
            pnlAddShop.Visible = true;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            pnlAddShop.Visible = false;
            pnlgrid.Visible = true;

        }
       
    }
}