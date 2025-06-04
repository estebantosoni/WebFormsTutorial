using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFormsDemo
{
    public partial class ValidationExample : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // important to add this line
            // without this check, if the user disables javascript, there is no guarantee the page is valid
            if (Page.IsValid)
            {
                // Process the form data
                ltMessage.Text = "Form submitted successfully!";
            }
            else
            {
                valSummaryForm.Visible = true;
            }
        }
    }
}