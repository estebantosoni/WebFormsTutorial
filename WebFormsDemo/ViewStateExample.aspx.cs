using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFormsDemo
{
    public partial class ViewStateExample : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
                ltPostBack.Text = "Mírenme, mírenme! Soy un post back :)";
            else
                ltPostBack.Text = "Fuera de este form.";
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

        }
    }
}