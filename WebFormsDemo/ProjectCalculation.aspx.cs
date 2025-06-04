using ProjectFees;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFormsDemo
{
    public partial class ProjectCalculation : Page
    {
        public decimal BasePrice = 99.99m;

        protected void Page_Load(object sender, EventArgs e)
        {
            ltBase.Text = BasePrice.ToString("C");
        }

        protected void ddlStates_SelectedIndexChanged(object sender, EventArgs e)
        {
            States states = new States();

            decimal fee = states.GetFeeForState(ddlStates.SelectedValue) + BasePrice;

            //"C" is for currency
            ltCustomPrice.Text = fee.ToString("C");
        }
    }
}