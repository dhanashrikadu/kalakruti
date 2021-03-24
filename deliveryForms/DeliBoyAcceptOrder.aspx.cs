using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineClothing.deliveryForms
{
    public partial class DeliBoyAcceptOrder : System.Web.UI.Page
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
            if (Session["DeliBoyID"] != null)
            {
                int DeliBoyID = int.Parse((Session["DeliBoyID"]).ToString());
                using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
                {
                    
                    //var get1 = (from s in db.SPPendingOdr(DeliBoyID)
                    //           join p in db.Tbl_DeliveryActions on s.ConfirmOdrID equals p.OrderId
                    //           where p.ActFlag == "C" && p.Status == "C" 
                   
                    //            select new
                    //            {
                    //                s.CustId,
                    //                s.ConfirmOdrID,
                    //                s.name,
                    //                s.Address,
                    //                s.MobileNo,
                    //                s.EmailId,
                    //                s.Toatal_price,
                    //                s.GrocerId

                    //            }).ToList();

                    //if (get1.Count != 0)
                    //{
                    //    gvAcceptordersList.DataSource = get1;
                    //    gvAcceptordersList.DataBind();
                    //}
                    //else
                    //{
                    //    gvAcceptordersList.DataSource = null;
                    //    gvAcceptordersList.DataBind();
                    //    lblnorecordfound.Visible = true;
                    //    btnDone.Visible = false;
                    //}
                    var gtf = (from s in db.tbl_DeliveryBoy_Odrs where s.Flag == "S"
                               select new {s.ConfirmOdrID,s.Cust_Address,s.Cust_Mob,s.Cust_Name,s.CustOdr_ID,s.Deli_ID,s.GrocerId,s.Paymet_Method,s.Total_Amount }).ToList();


                    if (gtf.Count != 0)
                    {
                        gvAcceptordersList.DataSource = gtf;
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
                            int DeliBoyID = int.Parse((Session["DeliBoyID"]).ToString());
                            var so = (from s in db.tbl_DeliveryBoy_Odrs where s.ConfirmOdrID == lblCustOrdId.Text && s.GrocerId == int.Parse((lblGrocerId.Text).ToString()) && s.Flag == "S" select s).FirstOrDefault();
                            if (so != null)
                            {
                                so.Flag = "A";
                                so.Deli_BoyID = int.Parse((Session["DeliBoyID"]).ToString());
                                db.SubmitChanges();
                            }


                            // var b = (from s in db.tbl_orderConfirms where s.ConfirmOdrID == lblCustOrdId.Text select new { s.CustOrdId}).FirstOrDefault();
                            Tbl_DeliveryAction t = new Tbl_DeliveryAction();
                            t.OrderId = lblCustOrdId.Text;
                            t.GrocerId = DeliBoyID;
                            //t.CustId = int.Parse(lblCustID.Text);
                            t.ActFlag = "A";
                            t.Status = "A";
                            t.ActByCategory = int.Parse(Session["CategoryId"].ToString());
                            t.ActDate = DateTime.Now;
                            t.Isdelete = false;
                            t.Type = "D";
                            db.Tbl_DeliveryActions.InsertOnSubmit(t);
                            db.SubmitChanges();
                            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "str", "alert('Items Verified......');", true);


                        }

                    }
                }

            }
            BindData();
        }
      

    }
}