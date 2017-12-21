using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoppingCart
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddMobile_Click(object sender, EventArgs e)
        {
            Int64 mb = 0;
            if (ddlIPhone.SelectedValue != "0")
            {
                mb = mb + (Convert.ToInt64(ddlIPhone.SelectedValue) * 60000);
            }
            if (ddlOneplus.SelectedValue != "0")
            {
                mb = mb + (Convert.ToInt64(ddlOneplus.SelectedValue) * 40000);
            }
            if (ddlBlackberry.SelectedValue != "0")
            {
                mb = mb + (Convert.ToInt64(ddlBlackberry.SelectedValue) * 35000);
            }
            //Response.Redirect("Payment.aspx?mobileCost=" + Convert.ToString(mb));
            Session["mobilePrice"] = mb;
            Response.Redirect("Payment.aspx");
            //lblResult.Text = Convert.ToString(tv);
        }
    }
}