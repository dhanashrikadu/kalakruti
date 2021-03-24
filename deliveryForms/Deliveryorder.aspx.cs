using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace OnlineClothing.deliveryForms
{
    public partial class Deliveryorder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindData();
            }
        }

        protected void BindData()
        {
            //int GrocerID = 8 ;
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                var get = (from s in db.tbl_DeliveryBoy_Odrs where s.IsDelete==false && s.IsPick==null select new 
                { s.Cust_Address,s.Cust_Mob,s.Paymet_Method,s.Total_Amount,s.Cust_Name,s.Deli_ID,s.ConfirmOdrID}).ToList();
                DlDeliveryBoy.DataSource = get;
                DlDeliveryBoy.DataBind();

            }
         }
             protected void btn_PickupConfirmed(Object sender, EventArgs e)
             {
                 using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
                 {
                     int RegID = Convert.ToInt32(Session["RegId"]);

                     var z = (from s in db.RegistrationInfos where s.RegId == RegID select s).FirstOrDefault();

                     Button brn = (Button)sender;
                     int DeliveryID = Convert.ToInt32(brn.ToolTip.ToString());

                     var a = (from s in db.tbl_DeliveryBoy_Odrs where s.Deli_ID == DeliveryID select s).FirstOrDefault();

                     a.IsPick = true;
                     a.Deli_BoyID = z.UserID;
                     db.SubmitChanges();
                     //ScriptManager.RegisterStartupScript(Page, Page.GetType(), "str","alert('Order Pick Successfully....' );", true);
                     Response.Redirect("~/deliveryForms/Placeorder.aspx");
                 }
                 
             }
        }
    }
