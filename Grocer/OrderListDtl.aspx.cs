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
    public partial class OrderListDtl : System.Web.UI.Page
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

                if (Request.QueryString["CusterOrderId"] != null)
                {
                    BindData();
                }
                else
                {
                }
            }
        }


        protected void BindData()
        {
            if (Session["GrocId"] != null)
            {
                int GrocerId = int.Parse(Session["GrocId"].ToString());
                using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
                {
                    int CustOrderId = int.Parse(Request.QueryString["CusterOrderId"]);
                    var data = (from s in db.SPListOdr(CustOrderId, GrocerId)
                                // where s.flag != "Accept"
                                select new
                                {
                                    // s.CustFullName,
                                    s.GrocerId,
                                    s.CustomerId,
                                    s.CustmerOdrId,
                                    //s.ConfirmOdrID,
                                    //s.Address,
                                    //  s.MobileNo,
                                    //   s.EmailId,
                                    // s.Delivery_Date,
                                    //  s.Toatal_price
                                    s.cartID,
                                    s.productDtl,
                                    s.productPkgQty,
                                    s.Quantity,
                                    s.ItemName,
                                    s.OfferRate,
                                    s.Total,
                                    s.MRP
                                }).Distinct().ToList();




                    if (data.Count != 0)
                    {

                        gvCordersList.DataSource = data;
                        gvCordersList.DataBind();
                    }
                    else
                    {
                        lblnorecordfound.Visible = true;
                    }




                }
            }

        }


        protected void Print_click(object sender, EventArgs e)
        {
            int OderID = Convert.ToInt32(((Label)((Button)sender).Parent.Parent.FindControl("lblCustOdrID")).Text.ToString());

            //int GrocerID = int.Parse(Session["GrocId"].ToString());
            ReportEngine("~/m.app/Report/RptOdrList.rpt", OderID);

        }
        protected void btnAccept_click(object sender, EventArgs e)
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                Button btnAccept = (Button)sender;
                btnAccept.Enabled = false;

                int OderID = Convert.ToInt32(((Label)((Button)sender).Parent.Parent.FindControl("lblCustOdrID")).Text.ToString());
                // var rt = (from d in db.tbl_orderConfirms where d.CustOrdId == OderID select d).FirstOrDefault();
                // rt.flag = "Accept";
                // db.SubmitChanges();
                // ScriptManager.RegisterStartupScript(Page, Page.GetType(), "str", "alert('Order Accepted Successfully......');", true);

                //   Response.Redirect("~/m.app/Grocer/AcceptOrder.aspx?custeOrdId=" + OderID);
            }
        }
        public void ReportEngine(string rptNm, int OderID)
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                //int sample = int.Parse(Request.QueryString["ApplicationId"]);
                crReportDocument = new CrystalDecisions.CrystalReports.Engine.ReportDocument();
                crReportDocument.Load(Server.MapPath(rptNm));
                crReportDocument.Refresh();

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

                crReportDocument.SetParameterValue(0, OderID);
                //crReportDocument.SetParameterValue(1,CustID);

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