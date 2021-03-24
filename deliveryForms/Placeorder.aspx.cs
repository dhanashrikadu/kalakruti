using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineClothing.deliveryForms
{
    public partial class Placeorder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Bind();
            }
        }
        protected void Bind()
        {
            //int RegID = Convert.ToInt32(Session["RegId"]);

            int RegID = Convert.ToInt32(Session["DeliBoyID"]);


            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                //var z = (from s in db.RegistrationInfos where s.RegId == RegID select s).FirstOrDefault();

                //int DeliveryBoyID = Convert.ToInt32(z.UserID);

                var get = (from s in db.tbl_DeliveryBoy_Odrs
                           where s.IsDelete == false && s.IsPick == true && s.Deli_BoyID == RegID
                           select new 
                           { s.Cust_Address, s.Cust_Mob, s.Paymet_Method, 
                             s.Total_Amount, s.Cust_Name, s.Deli_ID,s.ConfirmOdrID }).ToList();

              
                if (get.Count != 0)
                {
                    DlDeliveryBoy.DataSource = get;
                    DlDeliveryBoy.DataBind();
                }
                else
                {
                    lblnorecordfound.Visible = true;
                    Label4.Visible = false;
                }

            }
        }
    }
}