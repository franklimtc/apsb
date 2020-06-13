using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Site.Classes;

namespace Site.Cadastros
{
    public partial class Clinicas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CarregarGrid();
            }
        }

        private void CarregarGrid()
        {
            
        }

        protected void gvClinicas_PreRender(object sender, EventArgs e)
        {
            // You only need the following 2 lines of code if you are not 
            // using an ObjectDataSource of SqlDataSource
            gvClinicas.DataSource = Clinica.Listar();
            gvClinicas.DataBind();

            if (gvClinicas.Rows.Count > 0)
            {
                //This replaces <td> with <th> and adds the scope attribute
                gvClinicas.UseAccessibleHeader = true;

                //This will add the <thead> and <tbody> elements
                gvClinicas.HeaderRow.TableSection = TableRowSection.TableHeader;

                //This adds the <tfoot> element. 
                //Remove if you don't have a footer row
                gvClinicas.FooterRow.TableSection = TableRowSection.TableFooter;
            }
        }
    }
}