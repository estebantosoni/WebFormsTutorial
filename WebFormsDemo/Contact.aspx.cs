using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFormsDemo
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // I can access to the element properties using the ID
            //divMessage.Visible = false;
            //divMessage.Attributes.Add("style", "color:blue;");
        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            rfvName.Attributes.Add("style", "color:red;");

            string message = string.Format(
                "Name: {0}, Email: {1}, Color: {2}, Color: {3}",
                txtName.Text, txtEmail.Text, txtAge.Text, ddlColor.SelectedValue);

            ltMessage.Text = message;
        }
    }
}