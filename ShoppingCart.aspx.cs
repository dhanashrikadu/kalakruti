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
    public partial class ShoppingCart : System.Web.UI.Page
    {
    
         DataTable dt = new DataTable();
         DataRow dr = null;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                //string CustId = Request.QueryString["CustId"];
                //if (CustId != null)
                //{
                //    BindGvCardDtl(CustId);
                //    // bindGrandTotal(CustId);
                //}
                //else
                //{
                //    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('You are not Authenticate User')", true);
                //    return;
                //}
               
                    BindGvCardDtl();
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


                    dt.Columns.Add(new DataColumn("RowNumber", typeof(string)));

                    dt.Columns.Add(new DataColumn("Image", typeof(string)));
                    dt.Columns.Add(new DataColumn("BrandName", typeof(string)));
                    dt.Columns.Add(new DataColumn("Quantity", typeof(string)));
                    dt.Columns.Add(new DataColumn("OfferRate", typeof(string)));
                    dt.Columns.Add(new DataColumn("Size", typeof(string)));
                    dt.Columns.Add(new DataColumn("ItemId", typeof(string)));
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
                        var groserid = ss[4];

                        colCookies1.Add(BrandName);
                        colCookies1.Add(Quantity);
                        colCookies1.Add(OfferRate);
                        colCookies1.Add(Size);
                        colCookies1.Add(groserid);

                        var a = (from ssss in
                                     db.tbl_ItemListDtls
                                 join c in db.tbl_ProductListDtls on ssss.ProductId equals c.ProductId
                                 where ssss.ItemId == int.Parse(BrandName.ToString())
                                 select new { ssss.Image, ssss.BrandName, c.ProductName, ssss.ItemId, OfferRate = OfferRate, Quantity = Quantity, Size = Size, groserid = groserid }).FirstOrDefault();

                        if (a != null)
                        {
                            // DataRow drCurrentRow = null;==================

                            //if (dt.Rows.Count > 0)
                            //{
                            //drCurrentRow = dt.NewRow();=======================================
                            dr = dt.NewRow();
                            //drCurrentRow["RowNumber"] = dt.Rows.Count + 1;==============================
                            dr["RowNumber"] = dt.Rows.Count + 1;
                            //add new row to DataTable   
                            //dt.Rows.Add(drCurrentRow);==================================
                            dt.Rows.Add(dr);


                            dt.Rows[ri]["Image"] = a.Image;
                            dt.Rows[ri]["BrandName"] = a.BrandName;
                            dt.Rows[ri]["Quantity"] = a.Quantity;
                            dt.Rows[ri]["OfferRate"] = a.OfferRate;
                            dt.Rows[ri]["Size"] = a.Size;
                            dt.Rows[ri]["ItemId"] = a.ItemId;
                            dt.Rows[ri]["GrocerId"] = a.groserid;

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
                                lblShoppingCost.Text = ship.HomeDelCrhg.ToString();
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

                        int m = dt.Rows.Count;

                        ViewState["CurrentTreatmentTable"] = dt;
                        if (dt != null)
                        {
                            GvCardDtl.DataSource = dt;
                            GvCardDtl.DataBind();
                        }
                        else
                        {

                        }

                        //ArrayList colCookies = new ArrayList();
                        //for (int i = 0; i < Request.Cookies.Count; i++)
                        //{

                        //    colCookies.Add(Request.Cookies[i]);

                        //    // string[] arr = text.Split('|');

                        //    //return cart;

                        //}



                    }

                    int h = dt.Rows.Count;
                }
                else 
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Your Cart is Empty.')", true);
                }
                
                

                //ArrayList colCookies = new ArrayList();
                //for (int i = 0; i < Request.Cookies.Count; i++)
                //{

                //    colCookies.Add(Request.Cookies[i]);
                //    GvCardDtl.DataSource = colCookies;
                //    GvCardDtl.DataBind();
                //}


                //var a = (from s in db.tbl_ItemListDtls
                //         join q in db.tbl_ItemQtyDtls on s.ItemId equals q.ItemId
                //         join p in db.tbl_CartDtls on s.ItemId equals p.ItemId
                //         join r in db.tbl_GrocerRateDtls on q.ItemQtyId equals r.ItemQtyId
                //         //join h in db.tbl_HomeDelChrgs on r.GrocerRateId equals h.GrocerId
                //         //where p.CustomerId == int.Parse(CustId) && p.PaymentStatus == false
                //         select new { s.Image, s.BrandName, r.OfferRate, p.Quantity, p.cartID ,r.GrocerId}).ToList();

                ////var a = (from s in db.ShopCart(int.Parse(CustId)) select s).ToList();

                //GvCardDtl.DataSource = a;
                //GvCardDtl.DataBind();
                //int quantity1 = 0;
                //int Subtotal = 0;


                //for (int i = 0; i < a.Count; i++)
                //{
                //    quantity1 = quantity + int.Parse(a[i].Quantity.ToString());
                //    int total = int.Parse((a[i].Quantity * a[i].OfferRate).ToString());
                //    Subtotal = Subtotal + total;
                //}
               

                //lblQuantity.Text = quantity.ToString();
                //lblSubTotal.Text = Subtotal.ToString();
                //lblShoppingCost.Text = "FREE";
                //if (lblShoppingCost.Text == "FREE")
                //{
                //    lblGrandTotal.Text = Subtotal.ToString();
                //}
                //else 
                //{
                //    lblGrandTotal.Text = lblShoppingCost.Text + Subtotal;
                       
                //}
            }
        }
        protected void bindGrandTotal(string CustId) 
        {
            using (dbDatabaseDataDataContext db1 = new dbDatabaseDataDataContext())
            {
                var GrandTotal = (from s in db1.spCartGTotal(int.Parse(CustId.ToString())) select new { s.Total }).FirstOrDefault();
                lblSubTotal.Text = GrandTotal.Total.ToString();
            }
        }

        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            string CustId = Request.QueryString["CustId"];
            Response.Redirect("~/Checkout.aspx?CustId=" + CustId);
        }

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

        protected void lbtnCheckOut_Click(object sender, EventArgs e)
        {
           
            if (Session["CustId"] == null)
            {
                Session["ButtonName"] = "Checkout";
                Response.Redirect("Login.aspx");
            }
            else 
            {
                Response.Redirect("CheckOut.aspx");
            }
        }

        protected void lbtnRemoveFromCart_Click(object sender, EventArgs e)
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
               

                LinkButton lb = (LinkButton)sender;
                GridViewRow gvRow = (GridViewRow)lb.NamingContainer;
                int rowID = gvRow.RowIndex;
                if (ViewState["CurrentTreatmentTable"] != null)
                {
                    DataTable dtt = (DataTable)ViewState["CurrentTreatmentTable"];
                    if (dtt.Rows.Count > 0)
                    {
                        if (gvRow.RowIndex < dtt.Rows.Count)
                        {
                            //Remove the Selected Row data and reset row number  
                            dtt.Rows.Remove(dtt.Rows[rowID]);
                            ResetRowID(dt);
                        }
                    }
                    //Store the current data in ViewState for future reference  
                    ViewState["CurrentTreatmentTable"] = dtt;
                    //Re bind the GridView for the updated data  
                    if (dtt.Rows.Count >0)
                    {
                        GvCardDtl.DataSource = dtt;
                        GvCardDtl.DataBind();
                    }
                    else
                    {
                        GvCardDtl.DataSource = dtt;
                        GvCardDtl.DataBind();
                        lblnorecordfound.Visible = true;
                    }
                    //int quantity1 = 0;
                    //double Subtotal = 0;
                    //double total1 = 0;
                    lblSubTotal.Text = "0";
                    lblQuantity.Text = "0";
                    string dta = "";
                    foreach (DataRow row in dtt.Rows)
                    {
                        //var Image = row["Image"];
                        var BrandName = row["ItemId"];
                        var Quantity = row["Quantity"];
                        var OfferRate = row["OfferRate"];
                        var Size = row["Size"];
                        var Grocerid = row["GrocerId"];
                        

                        if (dta == "")
                        {
                            dta = BrandName + "," + Quantity + "," + OfferRate + "," + Size + "," + Grocerid;
                           
                        }
                        else
                        {
                            dta = dta + "|" + BrandName + "," + Quantity + "," + OfferRate + "," + Size + "," + Grocerid;
                           
                        }

                        
                        lblSubTotal.Text = (int.Parse(lblSubTotal.Text) + int.Parse(OfferRate.ToString())).ToString();
                        lblQuantity.Text = (int.Parse(lblQuantity.Text) + int.Parse(Quantity.ToString())).ToString();

                        var ship = (from s in db.tbl_HomeDelChrgs where s.DelyType == "SC " select s).FirstOrDefault();
                        if (ship.Amount >= int.Parse(lblSubTotal.Text))
                        {
                            lblShoppingCost.Text = ship.HomeDelCrhg.ToString();
                        }
                        else
                        {
                            lblShoppingCost.Text = "FREE";
                        }
                        if (lblShoppingCost.Text == "FREE")
                        {
                            lblGrandTotal.Text = lblSubTotal.Text;
                        }
                        else
                        {
                            lblGrandTotal.Text = (ship.Amount + int.Parse(lblSubTotal.Text)).ToString();
                        }

                       

                    }
                    Response.Cookies["ShoppingCart"].Value = dta;
                    Session["ShoppingCart"] = dta;

                    //lbtnUpadate.Visible = true;
                    //btnBuyNew.Visible = false;

                    
                   
                     //Request.Cookies["ShoppingCart"].Expires = DateTime.Now.AddDays(-30);
                   
                    ((Site1)Master).BindGvCardDtl();
                     
                   // UpadateCook(); 
                  

                    
                }
            }
        }
        //=====================================================================================
        private void ResetRowID(DataTable dt)
        {
            int rowNumber = 1;
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    row[0] = rowNumber;
                    rowNumber++;
                }
            }
        }
        //=====================================================================================


        protected void lbtnUpadate_Click(object sender, EventArgs e)
        {
            string sample = Request.Cookies["ShoppingCart"].Value;
            if (Request.Cookies["ShoppingCart"] == null)
            {

                if (ViewState["CurrentTreatmentTable"] != null)
                {
                    DataTable dtt = (DataTable)ViewState["CurrentTreatmentTable"];

                    foreach (DataRow row in dtt.Rows)
                    {
                        //var Image = row["Image"];
                        var BrandName = row["ItemId"];
                        var Quantity = row["Quantity"];
                        var OfferRate = row["OfferRate"];
                        var Size = row["Size"];

                        //var cook = Request.Cookies["ShoppingCart"].Value;

                        if (Request.Cookies["ShoppingCart"] == null)
                        {
                            Response.Cookies["ShoppingCart"].Value = BrandName + "," + Quantity + "," + OfferRate + "," + Size;
                            // Response.Cookies["ShoppingCart"].Expires = DateTime.Now.AddDays(1);

                            //lbl_UserName.Text = "1";
                        }
                        else
                        {
                            Response.Cookies["ShoppingCart"].Value = Request.Cookies["ShoppingCart"].Value + "|" + BrandName + "," + Quantity + "," + OfferRate + "," + Size;
                            //Response.Cookies["ShoppingCart"].Expires = DateTime.Now.AddDays(1);
                        }


                        
                    }

                    ((Site1)Master).BindGvCardDtl();
                    btnBuyNew.Visible = true;
                    lbtnUpadate.Visible = false;

                }
            }
          
        }

        protected void UpadateCook()
        {
            if (Request.Cookies["ShoppingCart"] == null)
            {

                if (ViewState["CurrentTreatmentTable"] != null)
                {
                    DataTable dtt = (DataTable)ViewState["CurrentTreatmentTable"];

                    foreach (DataRow row in dtt.Rows)
                    {
                        //var Image = row["Image"];
                        var BrandName = row["ItemId"];
                        var Quantity = row["Quantity"];
                        var OfferRate = row["OfferRate"];
                        var Size = row["Size"];

                        //var cook = Request.Cookies["ShoppingCart"].Value;

                        if (Request.Cookies["ShoppingCart"] == null)
                        {
                            Response.Cookies["ShoppingCart"].Value = BrandName + "," + Quantity + "," + OfferRate + "," + Size;
                            // Response.Cookies["ShoppingCart"].Expires = DateTime.Now.AddDays(1);

                            //lbl_UserName.Text = "1";
                        }
                        else
                        {
                            Response.Cookies["ShoppingCart"].Value = Request.Cookies["ShoppingCart"].Value + "|" + BrandName + "," + Quantity + "," + OfferRate + "," + Size;
                            //Response.Cookies["ShoppingCart"].Expires = DateTime.Now.AddDays(1);
                        }


                        ((Site1)Master).BindGvCardDtl();
                    }



                }
            }
          
          
        }

        protected void btnBuyNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        //protected void GvCardDtl_RowDataBound(object sender, GridViewRowEventArgs e)
        //{
        //    if (e.Row.RowType == DataControlRowType.DataRow)
        //    {
        //         DataTable dt = (DataTable)ViewState["CurrentTreatmentTable"];
        //        //Find the DropDownList in the Row
        //        DropDownList ddlSize = (e.Row.FindControl("ddlSize") as DropDownList);
        //        ddlSize.Items.Add(new ListItem("---Select---", "0"));
        //        ddlSize.Items.Add(new ListItem("S", "1"));
        //        ddlSize.Items.Add(new ListItem("M", "2"));
        //        ddlSize.Items.Add(new ListItem("L", "3"));
        //         ddlSize.Items.Add(new ListItem("XL", "4"));
        //         ddlSize.Items.Add(new ListItem("XXL", "5"));
        //         ddlSize.Items.Add(new ListItem("Free Size", "6"));
               


        //        // Select the Country of Customer in DropDownList
        //        string country = (e.Row.FindControl("lblSize") as Label).Text;
        //        ddlSize.Items.FindByText(country).Selected = true;
        //    }
        //}

       
      
        //------------------------------------------------------------------------------------------------------------
        //private void AddNewRowToAnganwadiGrid()
        //{

        //    if (ViewState["CurrentAnganwadiTable"] != null)
        //    {

        //        DataTable dtCurrentTable = (DataTable)ViewState["CurrentAnganwadiTable"];

        //        DataRow drCurrentRow = null;

        //        if (dtCurrentTable.Rows.Count > 0)
        //        {
        //            drCurrentRow = dtCurrentTable.NewRow();
        //            drCurrentRow["RowNumber"] = dtCurrentTable.Rows.Count + 1;

        //            //add new row to DataTable   
        //            dtCurrentTable.Rows.Add(drCurrentRow);
        //            //Store the current data to ViewState for future reference   

        //            ViewState["CurrentAnganwadiTable"] = dtCurrentTable;


        //            for (int i = 0; i < dtCurrentTable.Rows.Count - 1; i++)
        //            {

        //                //extract the TextBox values & extract the DropDownList Selected Items      

        //                TextBox box1 = (TextBox)gvAnganwadi.Rows[i].Cells[1].FindControl("txtAnganwadiName");
        //                Label AnganwadiId = (Label)gvAnganwadi.Rows[i].Cells[1].FindControl("lblAnganwadiId");
        //                Label AnganwadiIsDelete = (Label)gvAnganwadi.Rows[i].Cells[1].FindControl("lblAnganwadiIsDelete");
        //                TextBox box2 = (TextBox)gvAnganwadi.Rows[i].Cells[2].FindControl("txtAnganwadiSevikaName");
        //                TextBox box3 = (TextBox)gvAnganwadi.Rows[i].Cells[3].FindControl("txtAnganwadiSevikaMobNo");

        //                var a = (from ssss in
        //                             db.tbl_ItemListDtls
        //                         join c in db.tbl_ProductListDtls on ssss.ProductId equals c.ProductId
        //                         where ssss.ItemId == int.Parse(BrandName.ToString())
        //                         select new { ssss.Image, ssss.BrandName, c.ProductName, ssss.ItemId, OfferRate = OfferRate, Quantity = Quantity }).ToList();


        //                dtCurrentTable.Rows[i]["Column1"] = box1.Text;
        //                dtCurrentTable.Rows[i]["Column2"] = box2.Text;
        //                dtCurrentTable.Rows[i]["Column3"] = box3.Text;
        //                dtCurrentTable.Rows[i]["Column4"] = AnganwadiId.Text;
        //                dtCurrentTable.Rows[i]["Column5"] = AnganwadiIsDelete.Text;

        //            }

        //            //Rebind the Grid with the current data to reflect changes   
        //            gvAnganwadi.DataSource = dtCurrentTable;
        //            gvAnganwadi.DataBind();

        //        }
        //    }
        //    else
        //    {
        //        Response.Write("ViewState is null");
        //    }
        //    //Set Previous Data on Postbacks   
        //    SetPreviousDataToAnganwadiGrid();
        //    ResetAnganwadiGridAfterRemoving();
        //}




    }
}