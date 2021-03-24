using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineClothing
{
    public partial class MyOrders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
                BindGvCardDtl();

            }
        }
        private void BindGvCardDtl()//string CustId
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                int CustId = int.Parse(Session["CustId"].ToString());
                var a = (from s in db.tbl_ItemListDtls
                         join q in db.tbl_ItemQtyDtls on s.ItemId equals q.ItemId
                         join p in db.tbl_CartDtls on s.ItemId equals p.ItemId
                         join r in db.tbl_GrocerRateDtls on q.ItemQtyId equals r.ItemQtyId
                         //join h in db.tbl_HomeDelChrgs on r.GrocerRateId equals h.GrocerId
                         where p.CustomerId == CustId && p.PaymentStatus == false
                         select new { s.Image, s.BrandName, r.OfferRate, p.Quantity, p.cartID, r.GrocerId }).ToList();

                //var a = (from s in db.ShopCart(int.Parse(CustId)) select s).ToList();

                GvCardDtl.DataSource = a;
                GvCardDtl.DataBind();
                //int quantity1 = 0;
                //int Subtotal = 0;


                //for (int i = 0; i < a.Count; i++)
                //{
                //    quantity1 = quantity1 + int.Parse(a[i].Quantity.ToString());
                //    int total = int.Parse((a[i].Quantity * a[i].OfferRate).ToString());
                //    Subtotal = Subtotal + total;
                //}


               
            }
        }
    }
}