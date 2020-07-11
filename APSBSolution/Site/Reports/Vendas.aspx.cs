using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Site.Reports
{
    public partial class Vendas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btExportar_Click(object sender, EventArgs e)
        {
            Response.Redirect(@"Report.aspx?report=report03");
        }

        protected void gvVendas_PreRender(object sender, EventArgs e)
        {
            if (gvVendas.Rows.Count > 0)
            {
                //This replaces <td> with <th> and adds the scope attribute
                gvVendas.UseAccessibleHeader = true;

                //This will add the <thead> and <tbody> elements
                gvVendas.HeaderRow.TableSection = TableRowSection.TableHeader;

                //This adds the <tfoot> element. 
                //Remove if you don't have a footer row
                //gvClinicas.FooterRow.TableSection = TableRowSection.TableFooter;
            }
        }
    }
}