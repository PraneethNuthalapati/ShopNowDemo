using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoppingCart
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Int64 tv=0;
            if(ddlSamsung.SelectedValue!="0")
            {
                tv = tv + (Convert.ToInt64(ddlSamsung.SelectedValue) * 35000);
            }
            if (ddlSony.SelectedValue != "0")
            {
                tv = tv + (Convert.ToInt64(ddlSony.SelectedValue) * 40000);
            }
            if (ddlLG.SelectedValue != "0")
            {
                tv = tv + (Convert.ToInt64(ddlLG.SelectedValue) * 45000);
            }
            Session["tvPrice"] = tv;
            Response.Redirect("Payment.aspx");
            //Response.Redirect("Payment.aspx?tvCost=" + Convert.ToString(tv));
            //lblResult.Text = Convert.ToString(tv);
        }
    }
}