using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineClothing
{
    public partial class EditLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Edit();
            }
        }
        protected void Edit()
        {
            if (Session["CustId"] != null)
            {
                using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
                {
                    int custid = int.Parse(Session["CustId"].ToString());
                    var login = (from s in db.RegistrationInfos where s.UserID == custid select s).FirstOrDefault();
                    txtLoginUserName.Text = login.MobileNo;

                }
            }

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (Session["CustId"] != null)
            {
                using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
                {
                    int custid = int.Parse(Session["CustId"].ToString());
                    var login = (from s in db.RegistrationInfos where s.UserID == custid select s).FirstOrDefault();
                    login.MobileNo = txtLoginUserName.Text;
                    login.Password = txtLoginPassword.Text;
                    db.SubmitChanges();
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "str", "alert('Information Updated Sucessfully');", true);

                }
            }
        }

    }
}