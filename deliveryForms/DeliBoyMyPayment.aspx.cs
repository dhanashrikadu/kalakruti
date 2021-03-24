using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineClothing.deliveryForms
{
    public partial class DeliBoyMyPayment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Binddata();

            }
        }

        private void Binddata()
        {
            if (Session["DeliBoyID"] != null)
            {
                int DeliBoyID = int.Parse((Session["DeliBoyID"]).ToString());
                using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
                {
                    var get = (from s in db.Tbl_DeliveryActions where s.ActFlag == "C" && s.Status=="C" && s.GrocerId == DeliBoyID && s.Type=="D"
                               select new { s.drDeliCharges,s.OrderId }).ToList();
                    if (get != null)
                    {
                        gvPendingorders.DataSource = get;
                        gvPendingorders.DataBind();
                    }
                    int total=0;
                    foreach (GridViewRow gr in gvPendingorders.Rows)
                  {
                      Label charge = gr.FindControl("lblTprice") as Label;
                      total = total + int.Parse((charge.Text).ToString());
                  }
                  lblTotal.Text = total.ToString();
                }
            }
        }

    }
}