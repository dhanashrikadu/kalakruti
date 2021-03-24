using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineClothing.Grocer
{
    public partial class AcceptOrder : System.Web.UI.Page
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
            if (Session["GrocId"] != null)
            {
                int GrocerID = int.Parse((Session["GrocId"]).ToString());
                using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
                {

                    var get1 = (from s in db.SPPendingOdr(GrocerID)
                                where s.Complt_Odr == "S" && s.GrocerId == GrocerID 
                                select new
                                {
                                    s.CustId,
                                    s.ConfirmOdrID,
                                    s.name,
                                    s.Address,
                                    s.MobileNo,
                                    s.EmailId,
                                    s.Toatal_price,
                                    s.GrocerId

                                }).ToList();

                    if (get1.Count != 0)
                    {
                        gvAcceptordersList.DataSource = get1;
                        gvAcceptordersList.DataBind();
                    }
                    else 
                    {
                        gvAcceptordersList.DataSource = null;
                        gvAcceptordersList.DataBind();
                        lblnorecordfound.Visible = true;
                        btnDone.Visible = false;
                    }

                }
            }
        }
      

        protected void btnDone_Click(object sender, EventArgs e)
        {
            if (true)
            {

                using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
                {
                    foreach (GridViewRow gr in gvAcceptordersList.Rows)
                    {
                        //int custordid = int.Parse(Request.QueryString["custeOrdId"]);
                        CheckBox chk = gr.FindControl("Check") as CheckBox;

                        //Label lblcartID = gr.FindControl("lblcartID") as Label;
                        Label lblGrocerId = gr.FindControl("lblGrocerId") as Label;
                        Label lblCustOrdId = gr.FindControl("lblConfirmorderId") as Label;
                        Label lblCustID = gr.FindControl("lblCustID") as Label;


                       
                        if (chk.Checked == true)
                        {
                            int GrocerID = int.Parse((Session["GrocId"]).ToString());
                            var so = (from s in db.tbl_orderConfirms where s.ConfirmOdrID == lblCustOrdId.Text && s.GrocerId == GrocerID select s).FirstOrDefault();
                            if (so != null)
                            {
                                so.Complt_Odr = "A";
                                db.SubmitChanges();
                            }
                            
                           
                                    AcceptItemList ac = new AcceptItemList();

                                    ac.GrocerId = int.Parse(lblGrocerId.Text);
                                    ac.CustorderId = lblCustOrdId.Text;
                                    ac.CustomerId = int.Parse(lblCustID.Text);
                                    ac.Isdelete = false;
                                    db.AcceptItemLists.InsertOnSubmit(ac);
                                    db.SubmitChanges();
                                    
                               
                               // var b = (from s in db.tbl_orderConfirms where s.ConfirmOdrID == lblCustOrdId.Text select new { s.CustOrdId}).FirstOrDefault();
                                Tbl_DeliveryAction t = new Tbl_DeliveryAction();
                                t.OrderId = lblCustOrdId.Text;
                                t.GrocerId = int.Parse(lblGrocerId.Text);
                                t.CustId = int.Parse(lblCustID.Text);
                                t.ActFlag = "A";
                                t.Status = "A";
                                t.ActByCategory = int.Parse(Session["CategoryId"].ToString());
                                t.ActDate = DateTime.Now;
                                t.Isdelete = false;
                                t.Type = "G";
                                db.Tbl_DeliveryActions.InsertOnSubmit(t);
                                db.SubmitChanges();
                                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "str", "alert('Items Verified......');", true);

                          
                        }
                       
                    }
                } 
               
            }
            BindData();
        }
        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/m.app/Grocer/Orderlist.aspx");

        }

   
    }
}