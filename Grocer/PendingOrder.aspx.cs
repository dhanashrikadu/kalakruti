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
    public partial class PendingOrder : System.Web.UI.Page
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
                           where p.ActFlag == "A" && p.Status == "A" && s.GrocerId == GrocerID && p.Type == "G"
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


                if (get.Count != 0)
                {

                    gvPendingorders.DataSource = get;
                    gvPendingorders.DataBind();
                }
                else
                {
                    gvPendingorders.DataSource = null;
                    gvPendingorders.DataBind();
                    lblnorecordfound.Visible = true;
                }


               
            }

            }
        }

     
        protected void Print_click(object sender, EventArgs e)
        {

            string OderID = ((Label)((Button)sender).Parent.Parent.FindControl("lblConfirmorderId")).Text.ToString();

          
            ReportEngine("~/Report/OrderListNew.rpt", OderID);

        }
        protected void btnPrepared_click(object sender, EventArgs e)
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                string OderID =((Label)((Button)sender).Parent.Parent.FindControl("lblConfirmorderId")).Text.ToString();
                int lblGrocerId = Convert.ToInt32(((Label)((Button)sender).Parent.Parent.FindControl("lblGrocerId")).Text.ToString());
                int lblCustID = Convert.ToInt32(((Label)((Button)sender).Parent.Parent.FindControl("lblCustID")).Text.ToString());
                Tbl_DeliveryAction t = new Tbl_DeliveryAction();

                var ft = (from d in db.Tbl_DeliveryActions where d.OrderId == OderID && d.ActFlag == "A" && d.Status == "A" && d.Type == "G" select d).FirstOrDefault();
                if (ft != null)
                {
                   
                    ft.Status = "P";
                   
                    db.SubmitChanges();
                }

                t.OrderId = OderID;
                t.GrocerId = lblGrocerId;
                t.CustId = lblCustID;
                t.ActFlag = "P";
                t.Status = "P";
                t.ActByCategory = int.Parse(Session["CategoryId"].ToString());
                t.ActDate = DateTime.Now;
                t.Isdelete = false;
                t.Type = "G";
                db.Tbl_DeliveryActions.InsertOnSubmit(t);
                db.SubmitChanges();
               

                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "str", "alert('Order is Prepared......');", true);
                    BindData();

                
            }
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