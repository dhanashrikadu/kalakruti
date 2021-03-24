using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineClothing
{
    public partial class MyAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lbtnYourOrder_Click(object sender, EventArgs e)
        {
            Response.Redirect("MyOrders.aspx");
        }

        protected void lbtnLoginEdit_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditLogin.aspx");
        }

        protected void lbtAddressEdit_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditAddress.aspx");
        }
    }
}