using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;

namespace OnlineClothing
{
    public partial class CheckOut : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGvCardDtl();
                Bindddl();
                //BindShippingCharge();
                BindInformation();
                
            }
        }

        private void BindInformation()
        {
            //if (Request.QueryString["CustId"] != null)
            if(Session["CustId"] != null)
            {
                using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
                {
                    int custid = int.Parse(Session["CustId"].ToString());
                    var name = (from s in db.mstCustomerDtls
                                join a in db.Tbl_CustDeliveryAddressDtls on s.CustId equals a.CustId
                                where s.CustId == custid select new { s.CustName, s.CustLName,a.MobileNo,a.AltMobileNo,a.Address,a.ZipCode,a.CityId,a.StateId,a.EmailId}).FirstOrDefault();
                    if (name != null)
                    {
                        txtFName.Text = name.CustName;
                        txtLName.Text = name.CustLName;
                        txtMobileNo.Text = name.MobileNo;
                        txtALTMobile.Text = name.AltMobileNo;
                        txtAddress.Text = name.Address;
                        txtZip.Text = name.ZipCode.ToString();
                        txtEMail.Text = name.EmailId;
                        ddlState.SelectedValue = name.StateId.ToString();
                        ddlCity.SelectedValue = name.CityId.ToString();
                    }
                }
            }
        }
        //protected void BindShippingCharge()
        //{
        //    using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
        //    {
        //        var shpping = (from s in db.tbl_HomeDelChrgs where s.GrocerId == 9 select new { s.HomeDelCrhg, s.DelyType }).ToList();
        //        rbtDelivertype.DataSource = shpping;
        //        rbtDelivertype.DataValueField = "HomeDelCrhg";
        //        rbtDelivertype.DataTextField = "DelyType";
        //        rbtDelivertype.DataBind();
        //        lblstanddelcharge.Text = shpping[0].HomeDelCrhg;
        //        lblExpDelvCharge.Text = shpping[1].HomeDelCrhg;
        //        lblNextDayShpiingChar.Text = shpping[2].HomeDelCrhg;

        //    }
        //}
         protected void btnUpdateCart_Click(object sender, EventArgs e)
        {
            using(dbDatabaseDataDataContext db=new dbDatabaseDataDataContext())
            {
                 
            foreach (GridViewRow row in GvCardDtl.Rows) //Running all lines of grid
                { 
                 int CartId = int.Parse(((Label)row.FindControl("lblCartId")).Text.ToString());
                 int Quantity = int.Parse(((TextBox)row.FindControl("txtQunatity")).Text.ToString());
                 var a = (from s in db.tbl_CartDtls where s.cartID == CartId select s).FirstOrDefault();
                 a.Quantity = int.Parse(Quantity.ToString());
                 db.SubmitChanges();
                }
            }
        }
    
        private void Bindddl()
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {            
                
                var State = (from s in db.mstStates  select new { s.StateID, s.StateName }).ToList();
                ddlState.DataSource = State;
                ddlState.DataValueField = "StateID";
                ddlState.DataTextField = "StateName";
                ddlState.DataBind();
                ddlState.Items.Insert(0, "-----Select-----");

                var city = (from s in db.mstCities select new { s.CityId, s.CityName }).ToList();

                ddlCity.DataSource = city;
                ddlCity.DataValueField = "CityId";
                ddlCity.DataTextField = "CityName";

                ddlCity.DataBind();
                ddlCity.Items.Insert(0, "-----Select-----");
            }
        }
        private void BindGvCardDtl()//string CustId
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                int quantity1 = 0;
                double Subtotal = 0;
                double total1 = 0;
                if (Request.Cookies["ShoppingCart"] != null)
                {
                    string objCartListString = Request.Cookies["ShoppingCart"].Value.ToString();
                    string[] objCartListStringSplit = objCartListString.Split('|');

                    DataTable dt = new DataTable();

                    DataRow dr = null;
                    dt.Columns.Add(new DataColumn("RowNumber", typeof(string)));
                    dt.Columns.Add(new DataColumn("ItemId", typeof(string)));
                    dt.Columns.Add(new DataColumn("Image", typeof(string)));
                    dt.Columns.Add(new DataColumn("BrandName", typeof(string)));
                    dt.Columns.Add(new DataColumn("Quantity", typeof(string)));
                    dt.Columns.Add(new DataColumn("OfferRate", typeof(string)));
                    dt.Columns.Add(new DataColumn("Size", typeof(string)));
                    dt.Columns.Add(new DataColumn("GrocerId", typeof(string)));
                    //dt.Columns.Add(new DataColumn("Column5", typeof(string)));
                    //dt.Columns.Add(new DataColumn("Column6", typeof(string)));

                    //dr = dt.NewRow();
                    ////dr["RowNumber"] = 1;
                    ////dr["Image"] = string.Empty;
                    ////dr["BrandName"] = string.Empty;
                    ////dr["Quantity"] = string.Empty;
                    ////dr["OfferRate"] = string.Empty;
                    ////dr["Column5"] = string.Empty;
                    ////dr["Column6"] = string.Empty;

                    //dt.Rows.Add(dr);              

                    //foreach (string s in objCartListStringSplit)
                    //{
                    //string fname = Request.Cookies["ShoppingCart"]["FirstName"];
                    //string lname = Request.Cookies["ShoppingCart"]["LastName"];

                    int ri = 0;

                    foreach (string item in objCartListStringSplit)
                    {
                        ArrayList colCookies1 = new ArrayList();

                        string[] ss = item.Split(',');
                        
                        var BrandName = ss[0];
                        var Quantity = int.Parse(ss[1]);
                        var OfferRate = Convert.ToDouble(ss[2]);
                        var Size = ss[3];
                        var grocerId = ss[4];
                        colCookies1.Add(BrandName);
                        colCookies1.Add(Quantity);
                        colCookies1.Add(OfferRate);
                        colCookies1.Add(Size);
                        colCookies1.Add(grocerId);
                       



                        var a = (from ssss in
                                     db.tbl_ItemListDtls
                                 join c in db.tbl_ProductListDtls on ssss.ProductId equals c.ProductId
                                 where ssss.ItemId == int.Parse(BrandName.ToString()) 
                                 select new { ssss.Image, ssss.BrandName, c.ProductName, ssss.ItemId, OfferRate = OfferRate, Quantity = Quantity, Size = Size, grocerId = grocerId }).FirstOrDefault();

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
                            dt.Rows[ri]["ItemId"] = a.ItemId;
                            dt.Rows[ri]["BrandName"] = a.BrandName;
                            dt.Rows[ri]["Quantity"] = a.Quantity;
                            dt.Rows[ri]["OfferRate"] = a.OfferRate;
                            dt.Rows[ri]["Size"] = a.Size;
                            dt.Rows[ri]["GrocerId"] = a.grocerId;

                            //dt.Rows[ri]["Column5"] = "";
                            //dt.Rows[ri]["Column6"] = DaaieIsDelete.Text;

                            ri = ri + 1;
                            quantity1 = quantity1 + int.Parse(Quantity.ToString());
                            double total = double.Parse((Quantity * OfferRate).ToString());
                            total1 = total1 + total;
                            Subtotal = Subtotal + total;
                            lblSubTotal.Text = total1.ToString();
                            lblQuantity.Text = quantity1.ToString();

                            var ship = (from s in db.tbl_HomeDelChrgs where s.DelyType == "SC " select s).FirstOrDefault();
                            if (ship.Amount >= int.Parse(lblSubTotal.Text))
                            {
                                lblShoppingCost.Text = ship.Amount.ToString();
                            }
                            else
                            {
                                lblShoppingCost.Text = "FREE";
                            }
                            if (lblShoppingCost.Text == "FREE")
                            {
                                lblGrandTotal.Text = Subtotal.ToString();
                            }
                            else
                            {
                                lblGrandTotal.Text = (ship.Amount + int.Parse(lblSubTotal.Text)).ToString();
                            }

                        }
                        //}


                        GvCardDtl.DataSource = dt;
                        GvCardDtl.DataBind();

                        


                    }


                  
                }
            }
        }


       

        protected void btnPlaceOrder_Click(object sender, EventArgs e)
        {

            if (Page.IsValid)
            {

                if (Session["CustId"] != null)
                {
                    int CustID = int.Parse(Session["CustId"].ToString());

                    var k = DateTime.Today.ToString("ddMMyy");
                    //string OderID = k + CustID + CustOdr;
                    string OderID = CustID + k;


                    using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
                    {
                        string j = "";
                        int rowcount = 1;
                            foreach (GridViewRow row in GvCardDtl.Rows) //Running all lines of grid
                            {
                                int CartId = int.Parse(((Label)row.FindControl("lblItemID")).Text.ToString());
                                int Quantity = int.Parse(((Label)row.FindControl("txtQunatity")).Text.ToString());
                                int MRP = int.Parse(((Label)row.FindControl("lblMRP")).Text.ToString());
                                string Size = (((Label)row.FindControl("lblSize")).Text.ToString());
                                int grocerid = int.Parse(((Label)row.FindControl("lblGrocerId")).Text.ToString());

                                if (rowcount < 2)
                                {
                                    //var da = (from s in db.tbl_orderConfirms where s.ConfirmOdrID == j && s.GrocerId == grocerid select s).FirstOrDefault();
                                    //if (da == null)
                                    //{
                                    tbl_orderConfirm h = new tbl_orderConfirm();
                                    h.ConfirmOdrID = OderID;
                                    db.tbl_orderConfirms.InsertOnSubmit(h);
                                    db.SubmitChanges();
                                    h.CustId = CustID;
                                        h.OrderAmount = lblSubTotal.Text;
                                        //if (rbtDelivertype.SelectedItem != null)
                                        //{
                                        //    t.DeliType = rbtDelivertype.SelectedItem.Text;
                                        //}
                                        //else
                                        //{
                                        //    t.DeliType = "Standard Delivery";

                                        //}
                                        h.Time_Date = DateTime.Now;
                                        //t.PaymentMode = 
                                        h.Toatal_price = lblGrandTotal.Text;
                                        h.isDelete = false;
                                        //if (rbtDelivertype.SelectedItem != null)
                                        //{
                                        //    t.Deliver_Charge = rbtDelivertype.SelectedItem.Value;
                                        //}
                                        //else
                                        //{
                                        //    t.Deliver_Charge = "FREE";

                                        //}
                                        h.Deliver_Charge = lblShoppingCost.Text;
                                        h.Odr_status = true;
                                        h.Complt_Odr = "S";
                                        h.GrocerId = grocerid;
                                        h.ConfirmOdrID = OderID + h.CustOrdId;
                                        // db.tbl_orderConfirms.InsertOnSubmit(t);
                                        db.SubmitChanges();
                                        rowcount++;
                                        j = h.ConfirmOdrID;

                                    //}
                                }
                               
                               

                                    var daa = (from s in db.tbl_orderConfirms where s.ConfirmOdrID == j && s.GrocerId == grocerid select s).FirstOrDefault();
                                    if (daa == null)
                                    {
                                        tbl_orderConfirm b = new tbl_orderConfirm();
                                        b.GrocerId = grocerid;
                                        b.CustId = CustID;
                                        b.OrderAmount = lblSubTotal.Text;
                                        //if (rbtDelivertype.SelectedItem != null)
                                        //{
                                        //    t.DeliType = rbtDelivertype.SelectedItem.Text;
                                        //}
                                        //else
                                        //{
                                        //    t.DeliType = "Standard Delivery";

                                        //}
                                        b.Time_Date = DateTime.Now;
                                        //t.PaymentMode = 
                                        b.Toatal_price = lblGrandTotal.Text;
                                        b.isDelete = false;
                                        //if (rbtDelivertype.SelectedItem != null)
                                        //{
                                        //    t.Deliver_Charge = rbtDelivertype.SelectedItem.Value;
                                        //}
                                        //else
                                        //{
                                        //    t.Deliver_Charge = "FREE";

                                        //}
                                        b.Odr_status = true;
                                        b.Complt_Odr = "S";
                                        b.ConfirmOdrID = j;
                                        db.tbl_orderConfirms.InsertOnSubmit(b);
                                        db.SubmitChanges();
                                    }
                               

                                tbl_CartDtl m = new tbl_CartDtl();

                                var a = (from s in db.tbl_CartDtls where s.cartID == CartId select s).FirstOrDefault();
                                //a.Quantity = int.Parse(Quantity.ToString());
                                m.ItemId = CartId;
                                m.Quantity = Quantity;
                                m.GrocerRateID = MRP;
                                m.CustomerId = CustID;
                                m.Size = Size;
                                m.GrocerId = grocerid;


                                m.PaymentStatus = false;
                                m.IsDelete = false;
                                m.CustmerOdrId = j;
                                db.tbl_CartDtls.InsertOnSubmit(m);
                                db.SubmitChanges();



                            }

                        Tbl_CustDeliveryAddressDtl c = new Tbl_CustDeliveryAddressDtl();

                        c.CustId = CustID;
                        c.CustFullName = txtFName.Text;
                        c.CustLName = txtLName.Text;
                        c.MobileNo = txtMobileNo.Text;
                        c.AltMobileNo = txtALTMobile.Text;
                        c.EmailId = txtEMail.Text;
                        if (ddlState.SelectedItem.Value != "-----Select-----")
                        {
                            c.StateId = int.Parse(ddlState.SelectedItem.Value);
                        }
                        if (ddlCity.SelectedItem.Value != "-----Select-----")
                        {
                            c.CityId = int.Parse(ddlCity.SelectedItem.Value);
                        }

                        c.Address = txtAddress.Text;
                        //if (rbtDelivertype.SelectedItem != null)
                        //{
                        //    c.Deliverytype = rbtDelivertype.SelectedItem.Value;
                        //}
                        //else
                        //{
                        //    c.Deliverytype = "FREE";

                        //}
                        c.Odr_Status = true;
                        c.CustOrdId = j;
                       
                        c.isdelete = false;
                        if (txtZip.Text != "")
                        {
                            c.ZipCode = int.Parse(txtZip.Text);
                        }

                        db.Tbl_CustDeliveryAddressDtls.InsertOnSubmit(c);
                        db.SubmitChanges();
                       

                        txtFName.Text = "";
                        txtLName.Text = "";
                        txtMobileNo.Text = "";
                        txtAddress.Text = "";
                        txtALTMobile.Text = "";
                        txtCreDitCardNumber.Text = "";
                        txtCVV.Text = "";
                        txtEMail.Text = "";
                        txtExperyDate.Text = "";
                        txtNameOnCard.Text = "";
                        txtZip.Text = "";
                        ddlState.Items.Clear();
                        ddlCity.Items.Clear();
                        //rbtDelivertype.SelectedItem.Value = "FREE";
                        GvCardDtl.DataSource = null;
                        GvCardDtl.DataBind();
                        lblSubTotal.Text = "";

                        if (Request.Cookies["ShoppingCart"] != null)
                        {
                            //Session.Abandon();
                            //Session.Clear();
                            Response.Cookies.Clear();
                            Response.Cookies["ShoppingCart"].Value = null;
                            Request.Cookies["ShoppingCart"].Value = null;
                            Response.Cookies["ShoppingCart"].Expires = DateTime.Now.AddDays(-30);
                            Session["ShoppingCart"] = null;
                            //Response.Cookies.Add(Response.Cookies["ShoppingCart"]);                       
                        }

                        ((Site1)Master).BindGvCardDtl();
                        Response.Redirect("Default.aspx");


                        //var a = (from s in db.tbl_CartDtls where s.CustomerId == CustID && s.PaymentStatus == false && s.IsDelete == false select s).ToList();

                        // var c = (from s in db.Tbl_CustDeliveryAddressDtls where s.CustId == CustID & s.Odr_Status == false select s).FirstOrDefault();

                        //var d = (from s in db.tbl_orderConfirms where s.CustOrdId == CustOdr select s).FirstOrDefault();

                        //foreach (tbl_CartDtl s in a)
                        //{
                        //    s.CustmerOdrId = Convert.ToInt64(OderID);
                        //    s.CustmerOdrId = CustOdr;
                        //    s.PaymentStatus = true;
                        //    db.SubmitChanges();
                        //}


                        //c.CustOrdId = int.Parse(CustOdr.ToString());
                        //c.Odr_Status = true;
                        //db.SubmitChanges();

                        //d.Complt_Odr = false;
                        //d.Odr_status = true;
                        //d.ConfirmOdrID = int.Parse(OderID.ToString());
                        //db.SubmitChanges();

                        //if (Session["OnlinePayment"] != null)
                        //{
                        //    Response.Redirect("~/m.app/PaytmPaymentGateway.aspx");
                        //}
                        //API api = new API();
                        //var Customer = (from s in db.mstCustomerDtls where s.CustId == CustID select s).FirstOrDefault();
                        //var Grocer = (from s in db.mstGrocerDtls where s.GrocerId == GrocerID select s).FirstOrDefault();

                        //string _CustomerName = Customer.CustName;
                        //string _MOBNO = Customer.MobileNo;
                        //string _OderNo = d.ConfirmOdrID.ToString();
                        //string _msg = "Thanks Mr. " + _CustomerName + "<br>" + " your order list has been submitted successfully." + " Order ID :" + ' ' + _OderNo + " for future reference. your order will be process soon. " + "<br>" + "KITCHEN BASKET";
                        //sendsms(_MOBNO, _msg);

                        //string _GrocerName = Grocer.ShopName;
                        //string _MOBILENO = Grocer.MobNo;
                        //string _MESSAGE = "MR. " + _CustomerName + " has Submited Order list Order ID " + ' ' + _OderNo + " For Future reference" + "<br>" + "KITCHEN BASKET";
                        //sendsms(_MOBILENO, _MESSAGE);

                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "str", "alert('Your Order Place Successfully...!.' );", true);
                    }

                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "str", "alert('Please Login First');", true);
                }
            }
        }

        //protected void rbtDelivertype_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    if (rbtDelivertype.SelectedItem.Value != "FREE")
        //    {
        //        lblShoppingCost.Text = rbtDelivertype.SelectedItem.Value;
        //        int total = int.Parse(lblSubTotal.Text);
        //        int shipping = int.Parse(lblExpDelvCharge.Text);
        //        lblGrandTotal.Text = (total + shipping).ToString();
        //    }
        //    else
        //    {
        //        lblShoppingCost.Text = rbtDelivertype.SelectedItem.Value;
        //        lblGrandTotal.Text = lblSubTotal.Text;
        //    }
        //}

        protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                var city = (from s in db.mstCities where s.StateID == int.Parse(ddlState.SelectedItem.Value) select new { s.CityId, s.CityName }).ToList();

                ddlCity.DataSource = city;
                ddlCity.DataTextField = "CityName";
                ddlCity.DataValueField = "CityId";
                ddlCity.DataBind();
                ddlCity.Items.Insert(0, "-----Select-----");
            }

        }

       
     

       

       
    
       
        //protected void sendsms(string phNo, string msg)
        //{
        //    API cs = new API();
        //    cs.SendSMS(phNo, msg);
        //}
        
      
        
    }
 }

    