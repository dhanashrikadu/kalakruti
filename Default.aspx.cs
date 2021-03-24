using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



namespace OnlineClothing
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindMyKirana();
                BindProctList();
               BindBanner();
              
            }
        }

        private void BindBanner()
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                var z = (from a in db.tbl_HeaderImages
                         where a.IsDelete == false
                         select new { a.HeaderId, a.HeaderImage }).ToList();
                if (z.Count != 0)
                {

                    //dlBanner.DataSource = z;
                    //dlBanner.DataBind();
                    RBanner.DataSource = z;
                    RBanner.DataBind();
                   
                }

            }
        }

        private void BindProctList()
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                var z = (from a in db.tbl_ProductListDtls
                         where a.RegularItems == 1
                         select new {a.ProductId,a.ProductName,a.Image}).ToList();
                if (z.Count != 0)
                {

                    dtlProduct.DataSource = z;
                    dtlProduct.DataBind();
                }

            }
        }
        private void BindMyKirana()
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                var z = (from a in db.sp_RegularItemsMarathi()
                         where a.RegularItems == 1
                         select new { a.Image, a.OfferRate, a.SubCatName, a.ProductId, a.ItemId,a.GrocerId }).ToList();
                if (z.Count != 0)
                {

                    dlMyKirana.DataSource = z;
                    dlMyKirana.DataBind();
                }

            }
        }


        protected void LKAddtoCart_Click2(object sender, EventArgs e)
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                LinkButton brn = (LinkButton)sender;
                int ItemId = int.Parse(brn.ToolTip.ToString());
                DataListItem item = (DataListItem)brn.NamingContainer;
                //Label lblId = (Label)item.FindControl("lblgrocer");
               int P= int.Parse(((Label)item.FindControl("lblgrocer")).Text.ToString());
               Session["groserid"] = P;

                if (Request.Cookies["ItemDetailsCookies"] != null)
                {
                    if (Request.Cookies["ItemDetailsCookies"].Value != "")
                    {

                        HttpCookie reqCookies = Request.Cookies["ItemDetailsCookies"];
                        HttpCookie userCookie = new HttpCookie("ItemDetailsCookies");
                        DateTime now = DateTime.Now;
                        // Set the cookie value.
                        userCookie["ItemId"] = reqCookies["ItemId"].ToString();
                        userCookie.Expires = DateTime.Now.AddDays(Convert.ToInt32(10));
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

        protected void imgitem_Click(object sender, ImageClickEventArgs e)
        {
            //LinkButton brn = (LinkButton)sender;
            

            ImageButton brn = (ImageButton)sender;
            int ProdId = int.Parse(brn.ToolTip.ToString());
            Session["ProductId"] = ProdId;
            Response.Redirect("ProductList.aspx?ProductId=" + Session["ProductId"]);

        }

    }
}
