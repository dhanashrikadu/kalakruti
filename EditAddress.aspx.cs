using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineClothing
{
    public partial class EditAddress : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MyAddress();
                Bindddl();
            }
        }
        private void Bindddl()
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {

                var State = (from s in db.mstStates select new { s.StateID, s.StateName }).ToList();
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

        private void MyAddress()
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                if (Session["CustId"] != null)
                {
                    int custid = int.Parse(Session["CustId"].ToString());

                    var adrress = (from s in db.Tbl_CustDeliveryAddressDtls where s.CustId == custid select s).FirstOrDefault();
                    txtFName.Text = adrress.CustFullName;
                    txtLName.Text = adrress.CustLName;
                    txtMobileNo.Text = adrress.MobileNo;
                    txtALTMobile.Text = adrress.AltMobileNo;
                    txtEMail.Text = adrress.EmailId;
                    txtAddress.Text = adrress.Address;
                    txtZip.Text = adrress.ZipCode.ToString();
                    if (adrress.StateId != null)
                    {
                        ddlState.SelectedValue = adrress.StateId.ToString();


                    }
                    if (adrress.CityId != null)
                    {
                        ddlCity.SelectedValue = adrress.CityId.ToString();

                    }
                }
               

            }
        }
      

     

        protected void ddlState_SelectedIndexChanged1(object sender, EventArgs e)
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

        protected void lbtnUpdateAddress_Click(object sender, EventArgs e)
        {
            using (dbDatabaseDataDataContext db = new dbDatabaseDataDataContext())
            {
                int custid = int.Parse(Session["CustId"].ToString());
                var adrress = (from s in db.Tbl_CustDeliveryAddressDtls where s.CustId == custid select s).FirstOrDefault();

                adrress.CustFullName = txtFName.Text;



                adrress.CustLName = txtLName.Text;
                adrress.MobileNo = txtMobileNo.Text;
                adrress.AltMobileNo = txtALTMobile.Text;
                adrress.EmailId = txtEMail.Text;
                if (ddlState.SelectedItem.Value != "-----Select-----")
                {
                    adrress.StateId = int.Parse(ddlState.SelectedItem.Value);
                }
                if (ddlCity.SelectedItem.Value != "-----Select-----")
                {
                    adrress.CityId = int.Parse(ddlCity.SelectedItem.Value);
                }

                adrress.Address = txtAddress.Text;

                adrress.ZipCode = int.Parse(txtZip.Text);

                db.SubmitChanges();

                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "str", "alert('Address Updated Successfully');", true);

            }
        }
    }
}