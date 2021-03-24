using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineClothing
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void lbtnRegisterNew_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
                {
                    //string p = txttest.Text;
                    
                    var z = (from s in db.RegistrationInfos where s.MobileNo == txtRegUserName.Text && s.Password == txtRegPassword.Text select s).ToList();
                    if (z.Count > 0)
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Mobile No Already Registrered')", true);
                    }
                    else
                    {
                        if (txtRegUserName.Text != "")
                        {
                            mstCustomerDtl tb = new mstCustomerDtl();
                            tb.CustName = txtRegFName.Text;
                            tb.CustLName = txtRegLName.Text;
                            tb.MobileNo = txtRegUserName.Text;

                            //tb.EmailId = txtEmailId.Text;
                            tb.isdelete = false;
                            db.mstCustomerDtls.InsertOnSubmit(tb);
                            db.SubmitChanges();



                            //int subareaid = int.Parse(ddlSubArea.SelectedItem.Value);
                            RegistrationInfo reg = new RegistrationInfo();
                            reg.RegistrationDateTime = DateTime.Now;
                            reg.CategoryId = 3;  //ststic                    
                            reg.MobileNo = txtRegUserName.Text;
                            reg.Password = txtRegPassword.Text;
                            reg.UserID = tb.CustId;
                            reg.GrocerId = 9;  //static

                            //reg.SubAreaId = ;

                            reg.Isdelete = false;

                            db.RegistrationInfos.InsertOnSubmit(reg);
                            db.SubmitChanges();
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('User Registered Successfully')", true);

                            //HttpCookie userInfo = new HttpCookie("userInfo");
                            //userInfo["UserName"] = txtRegUserName.Text;
                            //userInfo["Password"] = txtRegPassword.Text;
                            //userInfo.Expires.Add(new TimeSpan(31, 0, 0, 0));
                            //Response.Cookies.Add(userInfo);

                            //Session["RegId"] = reg.RegId;
                            //Session["CustId"] = reg.UserID;
                            //Session["CategoryId"] = reg.CategoryId;
                            //Session["GrocerId"] = int.Parse(ddlShop.SelectedItem.Value);

                            //int custid = int.Parse(Session["CustId"].ToString());

                            //int catId = int.Parse(Session["CategoryId"].ToString());
                            //if (catId == 1)
                            //{
                            //    Response.Redirect("~/m.app/Admin1/HomeAdmin.aspx");
                            //}
                            //else if (catId == 2)
                            //{
                            //    Response.Redirect("~/m.app/Grocer/GrocerHome.aspx");
                            //}
                            //else if (catId == 3)
                            //{

                            //    Response.Redirect("~/CheckOut.aspx?ProdId=" + Session["ProdId"] + "&CustId=" + Session["CustId"]);

                            //}
                            //else if (catId == 4)
                            //{
                            //    Response.Redirect("~/deliveryForms/DeliveryHome.aspx");
                            //}


                        }
                        else
                        {
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please Insert UserName')", true);
                        }
                    }
                }
                
                Response.Redirect("Login.aspx");
            }

        }
    }
}