using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoppingCart
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Int64 lap = 0;
            if (ddlSamsung.SelectedValue != "0")
            {
                lap = lap + (Convert.ToInt64(ddlSamsung.SelectedValue) * 50000);
            }
            if (ddlDell.SelectedValue != "0")
            {
                lap = lap + (Convert.ToInt64(ddlDell.SelectedValue) * 35000);
            }
            if (ddlLenovo.SelectedValue != "0")
            {
                lap = lap + (Convert.ToInt64(ddlLenovo.SelectedValue) * 45000);
            }
            Session["laptopPrice"] = lap;
            Response.Redirect("Payment.aspx");
        }
    }
}