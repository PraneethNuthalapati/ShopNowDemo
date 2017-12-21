using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoppingCart
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Int64 frid = 0;
            if (ddlSamsungF.SelectedValue != "0")
            {
                frid = frid + (Convert.ToInt64(ddlSamsungF.SelectedValue) * 20000);
            }
            if (ddlLgF.SelectedValue != "0")
            {
                frid = frid + (Convert.ToInt64(ddlLgF.SelectedValue) * 15000);
            }
            if (ddlGodrej.SelectedValue != "0")
            {
                frid = frid + (Convert.ToInt64(ddlGodrej.SelectedValue) * 10000);
            }
            Session["fridgePrice"] = frid;
            Response.Redirect("Payment.aspx");
        }
    }
}