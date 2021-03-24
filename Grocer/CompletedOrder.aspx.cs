using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrystalDecisions.Shared;
using System.Configuration;

namespace OnlineClothing.Grocer
{
    public partial class CompletedOrder : System.Web.UI.Page
    {

        public CrystalDecisions.CrystalReports.Engine.ReportDocument crReportDocument;
        public CrystalDecisions.Shared.ConnectionInfo crConnectionInfo = new CrystalDecisions.Shared.ConnectionInfo();
        public CrystalDecisions.CrystalReports.Engine.Tables CrTables;
        public TableLogOnInfo crtableLogoninfo = new TableLogOnInfo();
        string FilePath1;
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
                    var get = (from s in db.SPPendingOdr(GrocerID)
                               join p in db.Tbl_DeliveryActions on s.ConfirmOdrID equals p.OrderId
                               where p.ActFlag == "C" && p.Status == "C" && s.GrocerId == GrocerID && p.Type == "G"
                               select new
                               {
                                   s.CustId,
                                   s.ConfirmOdrID,
                                   s.name,
                                   s.Address,
                                   s.MobileNo,
                                   s.EmailId,
                                   s.Toatal_price
                                   

                               }).ToList();

                    if (get.Count != 0)
                    {

                        gvCompleteorders.DataSource = get;
                        gvCompleteorders.DataBind();
                    }
                    else
                    {
                        gvCompleteorders.DataSource = null;
                        gvCompleteorders.DataBind();
                        lblnorecordfound.Visible = true;
                    }

                }
            }
        }

        protected void Changestatus_click(object sender, EventArgs e)
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {   string name ;
                Button brn = (Button)sender;
                string CustOdr_ID = brn.ToolTip;

                var get = (from a in db.Tbl_CustDeliveryAddressDtls
                           join c in db.tbl_orderConfirms on a.CustId equals c.CustId
                           where c.ConfirmOdrID == CustOdr_ID
                           select new { name = a.CustFullName + " "+ a.CustLName , a.Address, c.ConfirmOdrID, a.MobileNo, c.DeliType, c.PaymentMode, c.Toatal_price }).FirstOrDefault();



                tbl_DeliveryBoy_Odr d = new tbl_DeliveryBoy_Odr();

                d.Cust_Address = get.Address;
                d.Cust_Name = get.name;
                d.Paymet_Method = get.PaymentMode;
                d.Cust_Mob = get.MobileNo;
                d.Total_Amount = Convert.ToInt32(get.Toatal_price);
                d.ConfirmOdrID = get.ConfirmOdrID;
                d.IsDelete = false;
                d.GrocerId = int.Parse((Session["GrocId"]).ToString());
                d.Flag = "S";
            
                db.tbl_DeliveryBoy_Odrs.InsertOnSubmit(d);
                db.SubmitChanges();

                string CustOdrID = ((Label)((Button)sender).Parent.Parent.FindControl("lblConfirmorderId")).Text.ToString();

                var z = (from s in db.tbl_orderConfirms where s.ConfirmOdrID == CustOdrID select s).FirstOrDefault();

                z.Complt_Odr = "true";
                db.SubmitChanges();
                BindData();
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "str", "alert('Order Completed Successfully....' );", true);
            }

        }
        protected void Print_click(object sender, EventArgs e)
        {
            string OderID = ((Label)((Button)sender).Parent.Parent.FindControl("lblConfirmorderId")).Text.ToString();
            ReportEngine("~/Report/OrderListNew.rpt", OderID);
            
           

        }
        public void ReportEngine(string rptNm, string OderID)
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {

                //int sample = int.Parse(Request.QueryString["ApplicationId"]);
                crReportDocument = new CrystalDecisions.CrystalReports.Engine.ReportDocument();
                crReportDocument.Load(Server.MapPath(rptNm));
                //crReportDocument.Refresh();

                ConnectionInfo connectionInfo = new ConnectionInfo();
                connectionInfo.DatabaseName = ConfigurationManager.AppSettings["DBaseName"];
                connectionInfo.UserID = ConfigurationManager.AppSettings["DBUserName"];
                connectionInfo.Password = ConfigurationManager.AppSettings["DBPassword"];
                connectionInfo.ServerName = ConfigurationManager.AppSettings["DBServerName"];

                CrTables = crReportDocument.Database.Tables;
                connectionInfo.Type = ConnectionInfoType.SQL;
                TableLogOnInfo tableLogOnInfo = new TableLogOnInfo();
                tableLogOnInfo.ConnectionInfo = connectionInfo;
                crReportDocument.DataSourceConnections[0].SetConnection(tableLogOnInfo.ConnectionInfo.ServerName, tableLogOnInfo.ConnectionInfo.DatabaseName, tableLogOnInfo.ConnectionInfo.UserID, tableLogOnInfo.ConnectionInfo.Password);

                int GrocerID = int.Parse((Session["GrocId"]).ToString());
                crReportDocument.SetParameterValue("@CustOdrID", OderID);
                crReportDocument.SetParameterValue("@GrocerId", GrocerID);



                if (System.IO.File.Exists(Server.MapPath("~/DownloadApplication/ItemLIst" + ".pdf")))
                {
                    System.IO.File.Delete(Server.MapPath("~/DownloadApplication/ItemLIst" + ".pdf"));
                }
                crReportDocument.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("~/DownloadApplication/ItemLIst" + ".pdf"));

                ViewState["ApplicationPath"] = "~/DownloadApplication/ItemLIst" + ".pdf";
                FilePath1 = Server.MapPath(ViewState["ApplicationPath"].ToString());
                System.Net.WebClient User = new System.Net.WebClient();
                byte[] FileBuffer = User.DownloadData(FilePath1);
                if ((FileBuffer != null))
                {
                    Response.ContentType = "application/pdf";
                    Response.AddHeader("content-length", FileBuffer.Length.ToString());
                    Response.BinaryWrite(FileBuffer);
                }
                Response.Redirect(ViewState["ApplicationPath"].ToString());
            }
        }
    }
}