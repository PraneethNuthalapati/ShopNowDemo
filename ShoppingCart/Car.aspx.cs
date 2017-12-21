using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoppingCart
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddCar_Click(object sender, EventArgs e)
        {
            Int64 c = 0;
            if (ddlI20.SelectedValue != "0")
            {
                c = c + (Convert.ToInt64(ddlI20.SelectedValue) * 500000);
            }
            if (ddlZen.SelectedValue != "0")
            {
                c = c + (Convert.ToInt64(ddlZen.SelectedValue) * 600000);
            }
            if (ddlRitz.SelectedValue != "0")
            {
                c = c + (Convert.ToInt64(ddlRitz.SelectedValue) * 700000);
            }
            Session["carPrice"] = c;
            Response.Redirect("Payment.aspx");
        }
    }
}