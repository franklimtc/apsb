using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Site
{
    public partial class Dashboard : System.Web.UI.Page
    {
        private string _debug = ConfigurationManager.AppSettings["debug"];

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Request.IsAuthenticated && Page.Title != "Logon" && _debug == "false")
            {
                Response.Redirect(@"~\Account\Login");
            }

        }
    }
}