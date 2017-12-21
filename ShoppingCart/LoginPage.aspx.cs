using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoppingCart
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
             //string[,] login = new string[2,2] { { "admin", "pass123" }, { "user", "corp123" } };
            if((txtUserName.Text=="Admin" && txtPassword.Text=="pass123" )||( txtUserName.Text == "User" && txtPassword.Text == "corp123"))
            {
                Response.Redirect("Menu.aspx");
            }
            else
            {
                Response.Write("<script>alert('Invalid Credentials!!')</script>");
            }
        }
    }
}