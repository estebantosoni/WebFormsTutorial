using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFormsDemo
{
    public partial class ExceptionHandlingExample : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string message = string.Empty;

            try
            {
                decimal expectedDecimal = decimal.Parse(txtDecimal.Text);
                message = "Your decimal is: " + expectedDecimal;
            }
            catch (Exception ex)
            {
                //message = "Error: " + ex.Message;
                //ex has more properties that are helpful to log, such as ex.StackTrace

                //NOTE: it didnt work for me with web config, so i tried this way
                Response.Redirect("~/ErrorPage.aspx");
            }

            lblMessage.Text = message;
            lblMessage.Visible = true;
        }
    }
}