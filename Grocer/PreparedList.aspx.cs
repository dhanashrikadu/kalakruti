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
    public partial class PreparedList : System.Web.UI.Page
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
                           where p.ActFlag == "P" && p.Status == "P" && s.GrocerId == GrocerID && p.Type == "G"
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

                    gvCordersList.DataSource = get;
                    gvCordersList.DataBind();
                }
                else
                {
                    gvCordersList.DataSource = null;
                    gvCordersList.DataBind();
                    lblnorecordfound.Visible = true;
                }

            }
            }
        }
        protected void btnBack_Click(object sender, EventArgs e)
        {
            PanelDetail.Visible = false;
        }
        protected void btnshowdetail_click(object sender, EventArgs e)
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                PanelDetail.Visible = true;
                string OderID = ((Label)((Button)sender).Parent.Parent.FindControl("lblConfirmorderId")).Text.ToString();
                var cart = (from s in db.tbl_CartDtls
                            join t in db.tbl_ItemListDtls on s.ItemId equals t.ItemId
                            where s.CustmerOdrId == OderID 
                            select new{s.cartID,s.CustmerOdrId,s.CustomerId,s.GrocerRateID,s.ItemId,s.Quantity,s.Size,t.BrandName,t.Image}).ToList();
                gvDetail.DataSource = cart;
                gvDetail.DataBind();
                


                
                        
            }
        }
        protected void Print_click(object sender, EventArgs e)
        {
            string OderID = ((Label)((Button)sender).Parent.Parent.FindControl("lblConfirmorderId")).Text.ToString();
           
            ReportEngine("~/Report/OrderListNew.rpt", OderID);

        }
        protected void btnDone_click(object sender, EventArgs e)
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                int GrocerID = int.Parse((Session["GrocId"]).ToString());
                
                    foreach (GridViewRow gr in gvDetail.Rows)
                    {
                      
                        CheckBox chk = gr.FindControl("Check") as CheckBox;

                        Label lblGrocerRate = gr.FindControl("lblGrocerRate") as Label;
                        Label lblCustOrdId = gr.FindControl("lblConfirmorderId") as Label;
                        Label lblCustId = gr.FindControl("lblCustID") as Label;
                        Label lblItemId = gr.FindControl("lblItemId") as Label;



                        if (chk.Checked == true)
                        {
                            var fht = (from d in db.Tbl_GrocerOrderconfirmLists where d.OrderID == lblCustOrdId.Text && d.GrocerId == GrocerID select d).FirstOrDefault();
                            if (fht == null)
                            {
                                Tbl_GrocerOrderconfirmList g = new Tbl_GrocerOrderconfirmList();
                                g.OrderID = lblCustOrdId.Text;
                                g.CustId = int.Parse(lblCustId.Text);
                                g.ItemId = int.Parse(lblItemId.Text);
                                g.GrocerId = int.Parse((Session["GrocId"]).ToString()); ;
                                g.Status = "C";
                                db.Tbl_GrocerOrderconfirmLists.InsertOnSubmit(g);
                                db.SubmitChanges();
                            }

                            var ft = (from d in db.Tbl_DeliveryActions where d.OrderId == lblCustOrdId.Text && d.ActFlag == "A" && d.Status == "P" && d.GrocerId == GrocerID && d.Type == "G" select d).FirstOrDefault();
                            if (ft != null)
                            {

                                ft.Status = "C";

                                db.SubmitChanges();
                            }
                            var tb = (from d in db.Tbl_DeliveryActions where d.OrderId == lblCustOrdId.Text && d.ActFlag == "P" && d.Status == "P" && d.GrocerId == GrocerID && d.Type == "G" select d).FirstOrDefault();
                            if (tb != null)
                            {
                                tb.Status = "C";
                                db.SubmitChanges();
                            }
                           

                            var tbt = (from d in db.Tbl_DeliveryActions where d.OrderId == lblCustOrdId.Text && d.ActFlag == "C" && d.Status == "C" && d.GrocerId == GrocerID && d.Type == "G" select d).FirstOrDefault();
                            if (tbt == null)
                            {
                                Tbl_DeliveryAction t = new Tbl_DeliveryAction();
                                t.OrderId = lblCustOrdId.Text;
                                t.GrocerId = int.Parse(Session["GrocId"].ToString());
                                t.CustId = int.Parse(lblCustId.Text);
                                t.ActFlag = "C";
                                t.Status = "C";
                                t.ActByCategory = int.Parse(Session["CategoryId"].ToString());
                                t.ActDate = DateTime.Now;
                                t.Type = "G";
                                t.Isdelete = false;
                                db.Tbl_DeliveryActions.InsertOnSubmit(t);
                                db.SubmitChanges();
                            }


                        }
                       

                  }
                    PanelDetail.Visible = false;
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "str", "alert('Order Accept.);", true);
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