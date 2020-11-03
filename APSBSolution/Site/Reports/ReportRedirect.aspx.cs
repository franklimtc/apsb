using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Site.Reports
{
    public partial class ReportRedirect : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = 0;
            string report;
            if (!IsPostBack)
            {
                try
                {
                    report = Request.QueryString["report"];
                    switch (report)
                    {
                        case "geral":
                            ExibirRelatorioGeral();
                            break;
                        default:
                            break;
                    }
                }
                catch (Exception ex)
                {
                    string erro = ex.Message;
                }
            }
        }

        private void ExibirRelatorioGeral()
        {
            throw new NotImplementedException();
        }

        protected void gvRelatorioGeral_PreRender(object sender, EventArgs e)
        {
            if (gvRelatorioGeral.Rows.Count > 0)
            {
                gvRelatorioGeral.UseAccessibleHeader = true;

                gvRelatorioGeral.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }
    }
}