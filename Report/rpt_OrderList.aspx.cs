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


namespace OnlineClothing.Report
{
    public partial class rpt_OrderList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string CustId = Request.QueryString["CustId"];
                if (CustId !=null)
                {
                    //BindData(CustId);
                }
            }
        }

        //private void BindData(string CustId)
        //{
        //    using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
        //    {
        //        var a = (from s in db.SPRptItemList(CustId) select s).FirstOrDefault();

        //        lblFullName.Text=a.CustFullName;
        //        lblAddress.Text = a.Address;
        //        lblMobileNo.Text = a.MobileNo;
        //        lblEmail.Text = a.EmailId;
        //        lblConsumerNo.Text = a.CustOrdId.ToString();
        //        lblorder.Text = a.ConfirmOdrID.ToString();
        //        lbldate.Text = a.Time_Date.ToString();



        //        var b = (from p in db.SP_RptCustItemList(lblorder.Text) 
        //                 where p.CustmerOdrId == CustId.ToString()
        //                 select new
        //                 {
        //                     p.ItemName,
        //                     p.Quantity,
        //                     p.MRP,
        //                     p.OfferRate,
        //                     p.Total
        //                 }).ToList();

        //        GVItemDtl.DataSource = b;
        //        GVItemDtl.DataBind();
                
                
        //    }
        //}
    }
}