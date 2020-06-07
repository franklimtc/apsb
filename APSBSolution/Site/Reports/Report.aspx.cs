using Simple.Data.Extensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Site.Reports
{
	public partial class Report : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
            if (!IsPostBack)
            {
                string report = Request.QueryString["report"];
                CarregarReport(report);
            }
        }

        private void CarregarReport(string report)
        {
            switch (report)
            {
                case "report01":
                    repv01.LocalReport.ReportPath = @"Reports\Rep01.rdlc";
                    repv01.LocalReport.DataSources["DataSet1"].DataSourceId = "dsReport01";

                    repv01.DataBind();

                    break;
                case "report02":
                    repv01.LocalReport.ReportPath = @"Reports\Report3.rdlc";
                    repv01.LocalReport.DataSources["DataSet1"].DataSourceId = "dsReport02";

                    repv01.DataBind();
                    
                    break;
                default:
                    break;
            }
        }
    }
}