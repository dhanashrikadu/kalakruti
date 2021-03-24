using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineClothing.deliveryForms
{
    public partial class DeliveryHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ClientScript.RegisterStartupScript(GetType(), "Javascript", "javascript:getLocation(); ", true);
               // SaveLOngitude_click(0, e);
            }
            
        }

        protected void btnsave_click(object sender, EventArgs e)
        {
            int RegID = int.Parse(Session["DeliBoyID"].ToString());
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                var z = (from s in db.mstDeliveryBoyDtls where s.DeliveryBoyId ==RegID select s).FirstOrDefault();
                if (z != null)
                {
                    z.Lattitude = Convert.ToDouble(txtlatitude.Text);
                    z.Longitude = Convert.ToDouble(txtlongitude.Text);
                    db.SubmitChanges();
                }
            }
           
        }
    }
}