using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFormsDemo
{
    public partial class PageLifeCycle : System.Web.UI.Page
    {
        protected void Page_PreInit(object sender, EventArgs e)
        {
            // Start stage completed.
            // Page properties have been loaded and we enter to the initialization phase
            bool isPostBack = Page.IsPostBack;
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            // Controls and controls properties initializated
            // You can set control properties
            lblInit.Text = "Page_Init event fired.";
        }

        protected void Page_InitComplete(object sender, EventArgs e)
        {
            // Initialization of the page is complete
            // this stage can be used for tasks that require everything to first be initialized
        }

        protected void Page_PreLoad(object sender, EventArgs e)
        {
            // Use this if you need to perform a task before the page load
            // transitioning from the initialization to the Load stage
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            // Load stage
            // This is where you will perform most of your pages related tasks
            // e.g.: data binding, setting texts

            lblPageLoad.Text = "Page_Load event fired.";

            if(Page.IsPostBack)
                lblPostBack.Text = "Page is a postback.";
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Post back event handling stage
            lblButtonEvent.Text = "Button clicked";
        }

        protected void Page_LoadComplete(object sender, EventArgs e)
        {
            // Use this method when you need to perform a task after the Page Load Phase is completed
            lblButtonEvent.Text = "Button clicked";
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            //Rendering Phase
            //Use this method if you need to modify a control's markup output before it's rendered
        }

        protected void Page_unload(object sender, EventArgs e)
        {
            //Unload Phase
            //Use this method if you need to do final cleanup
            //Lifecycle completed
        }
    }
}