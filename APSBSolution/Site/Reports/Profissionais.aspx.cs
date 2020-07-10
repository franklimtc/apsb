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

        protected void gvMedicos_PreRender(object sender, EventArgs e)
        {
            if (gvMedicos.Rows.Count > 0)
            {
                //This replaces <td> with <th> and adds the scope attribute
                gvMedicos.UseAccessibleHeader = true;

                //This will add the <thead> and <tbody> elements
                gvMedicos.HeaderRow.TableSection = TableRowSection.TableHeader;

            }
        }
    }
}