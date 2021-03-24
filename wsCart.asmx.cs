using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace OnlineClothing
{
    /// <summary>
    /// Summary description for wsCart
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class wsCart : System.Web.Services.WebService
    {

       // [WebMethod]
        [WebMethod(EnableSession = true)]
        public void getitemcount(int productid, int quantity, string grateid, string itemid)
        {
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.AddHeader("Content-Type", "text/html");
            // HttpContext.Current.Response.Write("bhushan");



            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                if (quantity != 0)
                {
                    // int custid = int.Parse(HttpContext.Current.Session["CustId"].ToString());
                    // int? regid = (int?)HttpContext.Current.Session["RegId"];
                    int? custid = (int?)HttpContext.Current.Session["CustId"];
                    int? id = (int?)HttpContext.Current.Session["ProdId"];
                    var check = (from s in db.tbl_CartDtls where s.GrocerRateID == int.Parse(grateid.ToString()) && s.ItemId == int.Parse(itemid.ToString()) && s.CustomerId == custid && s.PaymentStatus == false select s).FirstOrDefault();
                    if (check == null)
                    {
                        tbl_CartDtl tb = new tbl_CartDtl();
                        tb.CustomerId = custid;
                        tb.GrocerRateID = int.Parse(grateid.ToString());
                        tb.Quantity = int.Parse(quantity.ToString());
                        tb.ItemId = int.Parse(itemid.ToString());
                        tb.PaymentStatus = false;
                        tb.IsDelete = false;
                        db.tbl_CartDtls.InsertOnSubmit(tb);
                        db.SubmitChanges();
                        // Response.Redirect("~/frmAddContentToCart.aspx?ProdId=" + id);
                        //  string  message = "";
                        // return message;
                        Console.Write("Item added to cart Successfully");
                        //Server.Transfer("~/frmAddContentToCart.aspx");


                        //   HttpContext.Current.Response.Redirect("~/frmAddContentToCart.aspx");
                    }
                    else
                    {
                        //check.CustomerId = int.Parse(Session["CustID"].ToString());
                        //check.GrocerRateID = int.Parse(grocerrate.ToString());
                        //check.Quantity = int.Parse(FinalCount.ToString());
                        //check.ItemId = int.Parse(abc.ToString());
                        int a = int.Parse(check.Quantity.ToString());
                        check.Quantity = a + quantity;
                        check.PaymentStatus = false;
                        check.IsDelete = false;
                        db.SubmitChanges();
                        Console.Write("Item added to cart Successfully");
                        //   System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully')", true);
                        //Server.Transfer("~/frmAddContentToCart.aspx");
                        //   HttpContext.Current.Response.Redirect("~/frmAddContentToCart.aspx");
                    }
                }
                else
                {
                    HttpContext.Current.Response.Write("Please Select Quantity of Product");
                    //return (" ");
                    //count++;
                }
            }
        }
    }
}
