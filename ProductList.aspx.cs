using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineClothing
{
    public partial class ProductList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindMyKirana();
        }

        private void BindMyKirana()
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                //var z = (from a in db.sp_RegularItemsMarathi()
                //         where a.RegularItems == 1
                //         select new { a.Image, a.MRP, a.SubCatName, a.ProductId, a.ItemId }).ToList();

                if (Session["ProductId"] != null )
                {
                    int prodid = int.Parse(Session["ProductId"].ToString());
                    var z = (from s in db.tbl_ItemListDtls
                             join a in db.tbl_ItemQtyDtls on s.ItemId equals a.ItemId
                             where s.ProductId == prodid
                             select new { s.Image, a.MRP, s.ProductId,s.BrandName, a.ItemId }).ToList();
                    if (z.Count != 0)
                    {

                        dlMyKirana.DataSource = z;
                        dlMyKirana.DataBind();
                    }
                
                }
               

            }
        }

        protected void LKAddtoCart_Click(object sender, EventArgs e)
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                LinkButton brn = (LinkButton)sender;
                int ItemId = int.Parse(brn.ToolTip.ToString());
                if (Request.Cookies["ItemDetailsCookies"] != null)
                {
                    if (Request.Cookies["ItemDetailsCookies"].Value != "")
                    {

                        HttpCookie reqCookies = Request.Cookies["ItemDetailsCookies"];
                        HttpCookie userCookie = new HttpCookie("ItemDetailsCookies");
                        DateTime now = DateTime.Now;
                        // Set the cookie value.
                        userCookie["ItemId"] = reqCookies["ItemId"].ToString();
                        //userCookie["Username"] = reqCookies["Username"].ToString();
                        //userCookie["OfficeId"] = reqCookies["OfficeId"].ToString();
                        //userCookie["OfficeTypeId"] = reqCookies["OfficeTypeId"].ToString();
                        //userCookie["DistrictId"] = reqCookies["DistrictId"].ToString();
                        //userCookie["DivisionId"] = reqCookies["DivisionId"].ToString();
                        Session["ItemId"] = reqCookies["ItemId"].ToString();
                        //Session["Username"] = reqCookies["Username"].ToString();
                        //Session["OfficeId"] = reqCookies["OfficeId"].ToString();
                        //Session["OfficeTypeId"] = reqCookies["OfficeTypeId"].ToString();
                        //Session["DistrictId"] = reqCookies["DistrictId"].ToString();
                        //Session["DivisionId"] = reqCookies["DivisionId"].ToString();

                        Response.Cookies.Add(userCookie);
                    }



                }



                Response.Redirect("~/AddToCart.aspx?ItemId=" + ItemId);
                // Response.Redirect("AddToCart.aspx=" + ProdId);



            }
        }
    }

}