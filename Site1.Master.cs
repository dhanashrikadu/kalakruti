using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;


namespace OnlineClothing
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
      
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
                {
                    if (Request.Cookies["ShoppingCart"] != null)
                    {
                        Session["ShoppingCart"] = Request.Cookies["ShoppingCart"].Value;
                        string gdh = Session["ShoppingCart"].ToString();
                    }
                    var mainhead = (from s in db.tbl_SubCategoryDtls
                                    where s.IsDelete == false
                                    select new { s.SubCatName, s.SubCatId }).ToList();

                    dlMyKirana.DataSource = mainhead;
                    dlMyKirana.DataBind();
                     if( Session["CustId"] != null)
                    {
                        int custid = int.Parse(Session["CustId"].ToString());
                        var name = ( from s in db.mstCustomerDtls where s.CustId==custid select new {s.CustName,s.CustLName}).FirstOrDefault();
                        if (name != null)
                        {
                            lblCustSessionName.Text = name.CustName + "  " + name.CustLName;
                        }
                    }

                    if (Request.QueryString["CustId"] != null)
                    {
                        int custid = int.Parse(Session["CustId"].ToString());

                        var name = (from s in db.mstCustomerDtls where s.CustId == custid select new { s.CustName, s.CustLName }).FirstOrDefault();
                        lblCustSessionName.Text = name.CustName + " " + name.CustLName;

                    }
                }
               
                BindGvCardDtl();
            }
        }
        public void BindGvCardDtl()//string CustId
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
              
                double quantity1 = 0;
                double Subtotal = 0;
                //if (Request.Cookies["ShoppingCart"] != null)
                if (Session["ShoppingCart"] != null)
                {
                    //string objCartListString = Request.Cookies["ShoppingCart"].Value.ToString();
                    string objCartListString = (Session["ShoppingCart"]).ToString();
                    if (objCartListString == "")
                    {
                        lblCartValue.Text = "0";
                        GvCardDtl.DataSource = null;
                        GvCardDtl.DataBind();
                    }
                    else
                    {
                        string[] objCartListStringSplit = objCartListString.Split('|');
                        lblCartValue.Text = objCartListStringSplit.Count().ToString();

                        DataTable dt = new DataTable();
                        DataRow dr = null;
                        dt.Columns.Add(new DataColumn("RowNumber", typeof(string)));
                        dt.Columns.Add(new DataColumn("Image", typeof(string)));
                        dt.Columns.Add(new DataColumn("BrandName", typeof(string)));
                        dt.Columns.Add(new DataColumn("Quantity", typeof(string)));
                        dt.Columns.Add(new DataColumn("OfferRate", typeof(string)));
                        dt.Columns.Add(new DataColumn("Size", typeof(string)));
                      
                        int ri = 0;

                        foreach (string item in objCartListStringSplit)
                        {
                            ArrayList colCookies1 = new ArrayList();

                            string[] ss = item.Split(',');
                            var BrandName = ss[0];
                            var Quantity = int.Parse(ss[1]);
                            var OfferRate = Convert.ToDouble(ss[2]);
                            var Size = ss[3];


                            colCookies1.Add(BrandName);
                            colCookies1.Add(Quantity);
                            colCookies1.Add(OfferRate);
                            colCookies1.Add(Size);



                            var a = (from ssss in
                                         db.tbl_ItemListDtls
                                     join c in db.tbl_ProductListDtls on ssss.ProductId equals c.ProductId
                                     where ssss.ItemId == int.Parse(BrandName.ToString())
                                     select new { ssss.Image, ssss.BrandName, c.ProductName, ssss.ItemId, OfferRate = (Quantity * OfferRate), Quantity = Quantity }).FirstOrDefault();

                            if (a != null)
                            {
                                DataRow drCurrentRow = null;

                                //if (dt.Rows.Count > 0)
                                //{
                                drCurrentRow = dt.NewRow();
                                drCurrentRow["RowNumber"] = dt.Rows.Count + 1;

                                //add new row to DataTable   
                                dt.Rows.Add(drCurrentRow);

                                dt.Rows[ri]["Image"] = a.Image;
                                dt.Rows[ri]["BrandName"] = a.BrandName;
                                dt.Rows[ri]["Quantity"] = a.Quantity;
                                dt.Rows[ri]["OfferRate"] = a.OfferRate;

                                //dt.Rows[ri]["Column5"] = "";
                                //dt.Rows[ri]["Column6"] = DaaieIsDelete.Text;

                                ri = ri + 1;
                                //}
                                quantity1 = double.Parse(Quantity.ToString());
                                double total = double.Parse((quantity1 * OfferRate).ToString());
                                Subtotal = Subtotal + total;
                                lblQunatity.Text = Subtotal.ToString();
                            }
                            //}


                            GvCardDtl.DataSource = dt;
                            GvCardDtl.DataBind();

                           



                        }


                    }

                  
                }
            }
        }

        protected void lbtnViewCart_Click(object sender, EventArgs e)
        {
            if (Request.Cookies["ShoppingCart"] != null)
            {
                Response.Redirect("ShoppingCart.aspx");
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Your Cart is Empty.')", true);
            }
        }

        protected void lbtnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void lbtnAboutUS_Click(object sender, EventArgs e)
        {
            //Response.Redirect("AboutUS.aspx");
        }

        protected void lbtnOurServices_Click(object sender, EventArgs e)
        {
            //Response.Redirect("OurService.aspx");
        }

        protected void lbtnContactUs_Click(object sender, EventArgs e)
        {
            Response.Redirect("ContactUS.aspx");
        }

        protected void lbtnMyAccount_Click(object sender, EventArgs e)
        {
            if (Session["CustId"] == null)
            {
                Session["ButtonName"] = "MyAccount";
                Response.Redirect("Login.aspx");
            }
            else
            {
                Response.Redirect("MyAccount.aspx");
            }
        }

        protected void dlMyKirana_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                Label catId = e.Item.FindControl("lblSubcatId") as Label;
                DataList List2 = e.Item.FindControl("dlprod") as DataList;


                DataTable tbl2 = new DataTable();
                var mainhead = (from sub in db.tbl_ProductListDtls
                                where sub.SubCatId == int.Parse(catId.Text)
                                select new { sub.ProductName, sub.ProductId }).ToList();
                //tbl2= GetCategoryItemBasedonCategoryID(catId.Text)          database call function for fetch data to bind the second datalist
                List2.DataSource = mainhead;
                List2.DataBind();
            }
        }

        protected void lbtnMyProfile_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void lbtncart_Click(object sender, EventArgs e)
        {
            Response.Redirect("ShoppingCart.aspx");
        }

        protected void lbtndCheckout_Click(object sender, EventArgs e)
        {
            Response.Redirect("CheckOut.aspx");
        }

        protected void lbtnWhishlist_Click(object sender, EventArgs e)
        {
            Response.Redirect("ShoppingCart.aspx");
        }

        protected void lbtnShopdetail_Click(object sender, EventArgs e)
        {
            Response.Redirect("ShoppingCart.aspx");
        }

        protected void lbtnProductName_Click(object sender, EventArgs e)
        {
            LinkButton brn = (LinkButton)sender;

            int ProdId = int.Parse(brn.ToolTip.ToString());
            Session["ProductId"] = ProdId;
            Response.Redirect("ProductList.aspx?ProductId=" + Session["ProductId"]);
        }

        protected void lbtnLogOut_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Default.aspx");
        }

        [System.Web.Services.WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public static string[] GetproductName(string prefixText, int count)
        {
            List<tbl_ProductListDtl> clientsList = new List<tbl_ProductListDtl>();
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {

                clientsList = db.tbl_ProductListDtls.Where(c => (c.ProductName.ToString()).Contains(prefixText)).OrderBy(c => c.ProductName).ToList();

            }
            string[] clients = new string[clientsList.Count];
            int co = 0;
            foreach (tbl_ProductListDtl client in clientsList)
            {
                clients[co] = client.ProductName.ToString();
                co++;
            }
            return clients;
        }

        //protected void txtSearch_TextChanged(object sender, EventArgs e)
        //{
        //    using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
        //    {
        //        string search = txtSearch.Text;
        //        var product = (from s in db.SP_SearchProduct(search) select s).ToList();
        //        if (product != null)
        //        {
        //            Session["ProductId"] = int.Parse((product[1].ProductId).ToString());
        //            Response.Redirect("ProductList.aspx?ProductId=" + Session["ProductId"]);
        //        }
        //    }
        //}


        [System.Web.Services.WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public static string[] GetClients(string prefixText, int count)
        {
            List<tbl_ItemListDtl> clientsList = new List<tbl_ItemListDtl>();
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {

                clientsList = db.tbl_ItemListDtls.Where(c => (c.BrandName.ToString() + " ( " + c.Details + ") ").Contains(prefixText)).OrderBy(c => c.BrandName).ToList();

            }
            string[] clients = new string[clientsList.Count];
            int co = 0;
            foreach (tbl_ItemListDtl client in clientsList)
            {
                clients[co] = client.BrandName.ToString() + " ( " + client.Details + ") ";
                co++;
            }
            return clients;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                string search = txtSearch.Text;
                var product = (from s in db.SP_SearchProduct(search) select s).ToList();
                if (product.Count != 0)
                {
                    Session["ProductId"] = int.Parse((product[1].ProductId).ToString());
                    Response.Redirect("ProductList.aspx?ProductId=" + Session["ProductId"]);
                }
            }
        }

        
    }
}