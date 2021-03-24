using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineClothing.Grocer
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindHomeDelChages();
                //Session["GrocId"] = 9;
            }
        }
        private void BindHomeDelChages()
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {

                var a = (from s in db.tbl_HomeDelChrgs
                         where s.GrocerId == 9 && s.IsDelete == false
                         select new { s.Id, s.HomeDelCrhg }).ToList();

                if (a.Count != 0)
                {
                    //gvHomeDel.DataSource = a;
                    //gvHomeDel.DataBind();
                    //GridView1.DataSource = a;
                    //GridView1.DataBind();
                    //GridView2.DataSource = a;
                    //GridView2.DataBind();
                    //GridView3.DataSource = a;
                    //GridView3.DataBind();
                    GridView4.DataSource = a;
                    GridView4.DataBind();
                    //GridView5.DataSource = a;
                    //GridView5.DataBind();
                }
                
            }
        }
    }
}