using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoppingCart
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGenerateBill_Click(object sender, EventArgs e)
        {
            Int64 bill = 0;
            bill = Convert.ToInt64(Session["tvPrice"])
                   + Convert.ToInt64(Session["fridgePrice"])
                   + Convert.ToInt64(Session["laptopPrice"])
                   + Convert.ToInt64(Session["carPrice"])
                   + Convert.ToInt64(Session["mobilePrice"]);
            lblTv.Text = "Your total bill is";
            lblMobile.Text = bill.ToString();
                       
        }

        protected void btnMenu_Click(object sender, EventArgs e)
        {
            Response.Redirect("Menu.aspx");
        }
    }
}