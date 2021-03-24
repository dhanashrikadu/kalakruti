using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineClothing
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
            }
        }

       

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                var check = (from s in db.RegistrationInfos where s.MobileNo == txtLoginUserName.Text & s.Password == txtLoginPassword.Text select s).FirstOrDefault();


                // var new1 = txtRegFName.Text;

                if (check != null)
                {
                    var getData = (from s in db.RegistrationInfos
                                   where s.MobileNo == txtLoginUserName.Text && s.Password == txtLoginPassword.Text
                                   select s).FirstOrDefault();

                    if (getData == null)
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "str", "alert('Invalid UserName Or Password');", true);
                    }
                    else
                    {
                        HttpCookie userInfo = new HttpCookie("userInfo");
                        userInfo["UserName"] = txtLoginUserName.Text;
                        userInfo["Password"] = txtLoginPassword.Text;
                        userInfo.Expires.Add(new TimeSpan(31, 0, 0, 0));
                        Response.Cookies.Add(userInfo);

                        Session["GrocerId"] = getData.GrocerId;
                        Session["RegId"] = getData.RegId;
                        Session["GrocId"] = getData.UserID;
                        Session["CustId"] = getData.UserID;
                        Session["DeliBoyID"] = getData.UserID;
                        Session["CategoryId"] = getData.CategoryId;
                        Session["ProdId"] = Request.QueryString["ProdId"];
                        int custid = int.Parse(Session["CustId"].ToString());

                        int catId = int.Parse(Session["CategoryId"].ToString());
                        if (catId == 1)
                        {
                            Response.Redirect("~/Admin/Dashboard1.aspx");
                            //Response.Redirect("HomeAdmin.aspx");
                        }
                        else if (catId == 2)
                        {
                            //Response.Redirect("~/m.app/Grocer/GrocerHome.aspx");D:\Dhanashri\OnlineClothing\OnlineClothing\
                            Response.Redirect("~/Grocer/DashboardGrocer.aspx");
                        }
                        else if (catId == 3)
                        {
                            if (Session["ButtonName"] == "MyAccount")
                            {
                                Session.Remove("ButtonName");
                                Response.Redirect("~/MyAccount.aspx?ProdId=" + Session["ProdId"] + "&CustId=" + Session["CustId"]);
                            }
                            else if (Session["ButtonName"] == "Checkout")
                            {
                                Session.Remove("ButtonName");
                                Response.Redirect("~/CheckOut.aspx?ProdId=" + Session["ProdId"] + "&CustId=" + Session["CustId"]);
                            }

                        }
                        else if (catId == 4)
                        {
                            Response.Redirect("~/deliveryForms/DashboardDelivryBoy.aspx");
                        }
                    }


                }
                else if (check == null)
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "str", "alert('Invalid UserName Or Password');", true);
                }

            }
        }

      

        protected void lbtnNewUser_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registration.aspx");
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {

            Response.Redirect("Default.aspx");
        }
    }
}