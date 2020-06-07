using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Site.Reports
{
    public partial class Report1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btExportar_Click(object sender, EventArgs e)
        {
            Response.Redirect(@"Report.aspx?report=report01");
        }
    }
}