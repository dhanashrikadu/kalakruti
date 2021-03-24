using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineClothing.Grocer
{
    public partial class AddItemRate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                
                BindCategory();
            }
        }

        protected void showItemRateGrid()
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                if (Session["GrocId"] != null)
                {
                    int grocer = int.Parse(Session["GrocId"].ToString());


                    var get = (from s in db.tbl_GrocerRateDtls
                               join a in db.tbl_ItemQtyDtls on s.ItemQtyId equals a.ItemQtyId
                               join b in db.tbl_ItemListDtls on a.ItemId equals b.ItemId
                               join c in db.tbl_ProductListDtls on b.ProductId equals c.ProductId
                               where s.GrocerId == int.Parse(grocer.ToString())
                               select new { ItemName = (b.BrandName + " " + c.ProductName), a.MRP, s.GrocerRateId, b.Image, Qty = (a.Quantity + " " + a.Unit), s.OfferRate, s.Discount }).ToList();

                   
                     if (get.Count != 0)
                    {
                        gvItemRate.DataSource = get;
                        gvItemRate.DataBind();
                    }
                    else
                    {
                        lblnorecordfound.Visible = true;
                    }
              }
            }
        }
        
        protected void txtOwnerRate_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < gvItemRate.Rows.Count; i++)
            {
                string OwnerRate = (((TextBox)gvItemRate.Rows[i].FindControl("txtOwnerRate")).Text.ToString());

                if (OwnerRate != "")
                {

                    string Rate = (Convert.ToDouble(OwnerRate) * 10 / 100).ToString();

                    string OfferRate = (Convert.ToDouble(Rate) + Convert.ToDouble(OwnerRate)).ToString();

                    ((TextBox)gvItemRate.Rows[i].FindControl("txtOfferRate")).Text = OfferRate.ToString();

                }

            }
        }

        protected void BindCategory()
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                var cat = (from a in db.mstCategories
                           where a.IsDelete == false
                           select new
                           {
                               a.CatId,
                               a.CategoryName
                           }).ToList();

                ddlCategory.DataSource = cat;
                ddlCategory.DataTextField = "CategoryName";
                ddlCategory.DataValueField = "CatId";
                ddlCategory.DataBind();
                db.Dispose();
                ddlCategory.Items.Insert(0, new ListItem("--Select Category--", "0"));
            }
        }


        //protected void Productbind()
        //{
        //    using (dbDatabaseDataContext db = new dbDatabaseDataContext())
        //    {

        //        var cat = (from s in db.tbl_ProductListDtls where s.IsDelete == false select new { s.ProductId, s.ProductName, }).ToList();
        //        ddlProduct.DataSource = cat;
        //        ddlProduct.DataTextField = "ProductName";
        //        ddlProduct.DataValueField = "ProductId";
        //        ddlProduct.DataBind();
        //        ddlProduct.Items.Insert(0, new ListItem("--Select-Products---", " "));
        //    }

        //}
        protected void gvItemRate_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
        {
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            gvItemRate.EditIndex = -1;

        }

        protected void gvItemRate_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                //Finding the controls from Gridview for the row which is going to update  
                Label GrocerId = gvItemRate.Rows[e.RowIndex].FindControl("lblGrocerId") as Label;
                TextBox name = gvItemRate.Rows[e.RowIndex].FindControl("txt_OffeRate") as TextBox;
                TextBox Disc = gvItemRate.Rows[e.RowIndex].FindControl("txt_Discount") as TextBox;
                int grocer = int.Parse(Session["GrocId"].ToString());



                gvItemRate.EditIndex = -1;

                //Call ShowData method for displaying updated data  
                //var item = (from s in db.tbl_GrocerRateDtls
                //            join a in db.tbl_ItemQtyDtls on s.ItemQtyId equals a.ItemQtyId
                //            join b in db.tbl_ItemListDtls on a.ItemId equals b.ItemId
                //            join c in db.tbl_ProductListDtls on b.ProductId equals c.ProductId
                //            where b.IsDelete == false
                //                // & s.OfferRate == null 
                //            & b.ProductId == int.Parse(ddlProduct.SelectedItem.Value) & s.GrocerId == int.Parse(GrocerId.ToString())
                //            select new { ItemName = (b.BrandName + " " + c.ProductName), a.MRP, s.GrocerRateId, b.Image, Qty = (a.Quantity + " " + a.Unit), s.OfferRate }).FirstOrDefault ();
                var check = (from s in db.tbl_GrocerRateDtls where s.GrocerRateId == int.Parse(GrocerId.Text) select s).FirstOrDefault();
                check.OfferRate = Convert.ToDouble(name.Text);
                check.Discount = Convert.ToInt16(Disc.Text);

                // item.IsDelete = false;
                db.SubmitChanges();
                var item = (from s in db.tbl_GrocerRateDtls
                            join a in db.tbl_ItemQtyDtls on s.ItemQtyId equals a.ItemQtyId
                            join b in db.tbl_ItemListDtls on a.ItemId equals b.ItemId
                            join c in db.tbl_ProductListDtls on b.ProductId equals c.ProductId
                            where b.IsDelete == false
                                // & s.OfferRate == null 
                            & b.ProductId == int.Parse(ddlProduct.SelectedItem.Value) & s.GrocerId == int.Parse(grocer.ToString())
                            select new { ItemName = (b.BrandName + " " + c.ProductName), a.MRP, s.GrocerRateId, b.Image, Qty = (a.Quantity + " " + a.Unit), s.OfferRate, s.Discount }).ToList();


                gvItemRate.DataSource = item;
                gvItemRate.DataBind();

            }
        }
        protected void gvItemRate_RowEditing(object sender, GridViewEditEventArgs e)
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                if (ddlProduct.SelectedItem.Text == "--Select-Products---")
                {

                    if (this.gvItemRate.EditIndex == -1)
                    {
                        this.gvItemRate.EditIndex = e.NewEditIndex;



                        GridViewRow currentRow = this.gvItemRate.Rows[e.NewEditIndex];
                        Label gocerid = currentRow.FindControl("lblGrocerId") as Label;
                        int grocer = int.Parse(Session["GrocId"].ToString());
                        gvItemRate.EditIndex = e.NewEditIndex;

                        var item = (from s in db.tbl_GrocerRateDtls
                                    join a in db.tbl_ItemQtyDtls on s.ItemQtyId equals a.ItemQtyId
                                    join b in db.tbl_ItemListDtls on a.ItemId equals b.ItemId
                                    join c in db.tbl_ProductListDtls on b.ProductId equals c.ProductId
                                    where b.IsDelete == false
                                         & s.OfferRate == null
                                        //   & b.ProductId == int.Parse(ddlProduct.SelectedItem.Value)
                                    & s.GrocerId == int.Parse(grocer.ToString())
                                    //& s.GrocerRateId == int.Parse(gocerid.Text)
                                    select new { ItemName = (b.BrandName + " " + c.ProductName), a.MRP, s.GrocerRateId, b.Image, Qty = (a.Quantity + " " + a.Unit), s.OfferRate, s.Discount }).ToList();


                        gvItemRate.DataSource = item;
                        gvItemRate.DataBind();
                    }
                }
                else
                {

                    int grocer = int.Parse(Session["GrocId"].ToString());

                    //NewEditIndex property used to determine the index of the row being edited.  
                    gvItemRate.EditIndex = e.NewEditIndex;




                    var item = (from s in db.tbl_GrocerRateDtls
                                join a in db.tbl_ItemQtyDtls on s.ItemQtyId equals a.ItemQtyId
                                join b in db.tbl_ItemListDtls on a.ItemId equals b.ItemId
                                join c in db.tbl_ProductListDtls on b.ProductId equals c.ProductId
                                where b.IsDelete == false
                                    // & s.OfferRate == null 
                                & b.ProductId == int.Parse(ddlProduct.SelectedItem.Value)
                                & s.GrocerId == int.Parse(grocer.ToString())
                                select new { ItemName = (b.BrandName + " " + c.ProductName), a.MRP, s.GrocerRateId, b.Image, Qty = (a.Quantity + " " + a.Unit), s.OfferRate, s.Discount }).ToList();


                    gvItemRate.DataSource = item;
                    gvItemRate.DataBind();

                }
            }
        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                var subcat = (from a in db.tbl_SubCategoryDtls
                              where a.IsDelete == false & a.CatId == int.Parse(ddlCategory.SelectedItem.Value)
                              select new
                              {
                                  a.SubCatId,
                                  a.SubCatName
                              }).ToList();

                ddlSubCategory.DataSource = subcat;
                ddlSubCategory.DataTextField = "SubCatName";
                ddlSubCategory.DataValueField = "SubCatId";
                ddlSubCategory.DataBind();
                db.Dispose();
                ddlSubCategory.Items.Insert(0, new ListItem("--Select Sub Category--", "0"));
            }
        }
        protected void ddlSubCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                var pro = (from a in db.tbl_ProductListDtls
                           where a.IsDelete == false & a.SubCatId == int.Parse(ddlSubCategory.SelectedItem.Value)
                           select new
                           {
                               a.ProductId,
                               a.ProductName
                           }).ToList();

                ddlProduct.DataSource = pro;
                ddlProduct.DataTextField = "ProductName";
                ddlProduct.DataValueField = "ProductId";
                ddlProduct.DataBind();
                db.Dispose();
                ddlProduct.Items.Insert(0, new ListItem("--Select Product--", "0"));

            }
        }
        protected void ddlproducts_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {


                if (ddlProduct.SelectedItem.Text == "--Select-Products---")
                {

                }
                else
                {


                    int grocer = int.Parse(Session["GrocId"].ToString());


                    var item = (from s in db.tbl_GrocerRateDtls
                                join a in db.tbl_ItemQtyDtls on s.ItemQtyId equals a.ItemQtyId
                                join b in db.tbl_ItemListDtls on a.ItemId equals b.ItemId
                                join c in db.tbl_ProductListDtls on b.ProductId equals c.ProductId
                                where b.IsDelete == false
                                    // & s.OfferRate == null 
                                & b.ProductId == int.Parse(ddlProduct.SelectedItem.Value) & s.GrocerId == int.Parse(grocer.ToString())
                                select new { ItemName = (b.BrandName + " " + c.ProductName), a.MRP, s.GrocerRateId, b.Image, Qty = (a.Quantity + " " + a.Unit), s.OfferRate, s.Discount }).ToList();


                    gvItemRate.DataSource = item;
                    gvItemRate.DataBind();
                    Panel1.Visible = true;

                }
            }
        }

        protected void btnUpdateRates_click(Object sender, EventArgs e)
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                if (gvItemRate.Rows.Count > 0)
                {
                    for (int i = 0; i < gvItemRate.Rows.Count; i++)
                    {
                        int grocerid = int.Parse(((Label)gvItemRate.Rows[i].FindControl("lblGrocerId")).Text.ToString());

                        if (grocerid != null)
                        {
                            string Offer = (((Label)gvItemRate.Rows[i].FindControl("lbl_OffeRate")).Text.ToString());

                            if (Offer != "")
                            {
                                Double OffRate = Convert.ToDouble(((Label)gvItemRate.Rows[i].FindControl("lbl_OffeRate")).Text.ToString());
                                int Discount = Convert.ToInt16(((Label)gvItemRate.Rows[i].FindControl("lbl_Discount")).Text.ToString());
                                int MRP = int.Parse(((Label)gvItemRate.Rows[i].FindControl("lblMRP")).Text.ToString());

                                var check = (from s in db.tbl_GrocerRateDtls where s.GrocerRateId == int.Parse(grocerid.ToString()) select s).FirstOrDefault();

                                //OffRate = Convert.ToDouble (check.OfferRate);
                                check.OfferRate = Convert.ToDouble(OffRate.ToString());
                                check.MRP = int.Parse(MRP.ToString());
                                check.Discount = Discount;
                                check.IsDelete = false;
                                db.SubmitChanges();

                            }
                        }
                    }
                }
                //showItemRateGrid();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Item Rate Added Successfully.....!')", true);
            }
        }

        protected void txtsearchproduct_TextChanged(object sender, EventArgs e)
        {


            //  List<tbl_ItemListDtl> clientsList = new List<tbl_ItemListDtl>();
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {

                // var data = db.tbl_ItemListDtls.Where(c => (c.BrandName.ToString() + " ( " + c.Details + ") ").Contains(txtSearchProduct.Text)).OrderBy(c => c.BrandName).FirstOrDefault();
                //int Productidbytxt = int.Parse(data.ProductId.ToString());


                var data = db.tbl_ItemListDtls.Where(c => (c.BrandName.ToString() + " ( " + c.Details + ") ").Contains(txtSearchProduct.Text)).OrderBy(c => c.BrandName).FirstOrDefault();
                int Productidbytxt = int.Parse(data.ItemId.ToString());


                var get = (from s in db.tbl_GrocerRateDtls
                           join a in db.tbl_ItemQtyDtls on s.ItemQtyId equals a.ItemQtyId
                           join b in db.tbl_ItemListDtls on a.ItemId equals b.ItemId
                           join c in db.tbl_ProductListDtls on b.ProductId equals c.ProductId
                           where b.ItemId == int.Parse(Productidbytxt.ToString())
                           select new { ItemName = (b.BrandName + " " + c.ProductName), a.MRP, s.GrocerRateId, b.Image, Qty = (a.Quantity + " " + a.Unit), s.OfferRate, s.Discount }).ToList();

                gvItemRate.DataSource = get;
                gvItemRate.DataBind();
                //Response.Redirect("~/frmAddContentToCart.aspx?ProdId=" + Productidbytxt);

            }
        }

        protected void rbtItemPriceSrch_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rbtItemPriceSrch.SelectedItem.Value == "1")
            {
                PnlSearch.Visible = true;
                pnlItemRate.Visible = false;

            }
            else if (rbtItemPriceSrch.SelectedItem.Value == "2")
            {
                PnlSearch.Visible = false;
                pnlItemRate.Visible = true;
            }
        }

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


        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static List<string> GetEmployeesName(string prefixText)
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                List<string> lstNames = new List<string>();
                var Name = db.SearchProduct(int.Parse(prefixText)).ToList();
                for (int i = 0; i < Name.Count; i++)
                {
                    lstNames.Add(Name[i].ProductName);

                }
                return lstNames;
            }
        }
        private void ClearData()
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                foreach (GridViewRow row in gvItemRate.Rows) //Running all lines of grid
                {

                    //CheckBox chkRow = (CheckBox)(row.FindControl("ChkChild"));
                    //chkRow.Checked = false;
                }
            }
        }
    }
}