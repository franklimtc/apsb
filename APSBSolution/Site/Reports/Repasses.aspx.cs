using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Site.Classes;
using System.Data;

namespace Site.Reports
{
    public partial class Repasses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btExportar_Click(object sender, EventArgs e)
        {
            if (dtInicio.Text != "" && dtFinal.Text != "")
            {
                Warning[] warnings;
                string[] streamIds;
                string mimeType = string.Empty;
                string encoding = string.Empty;
                string extension = string.Empty;
                string fileName = "Rel_Repasses";

                // Setup the report viewer object and get the array of bytes
                List<object[]> parametros = new List<object[]>();

                parametros.Add(new object[] { "@dtInicial", dtInicio.Text });
                parametros.Add(new object[] { "@dtFinal", dtFinal.Text });

                ReportParameter dtini = new ReportParameter("dtInicial", dtInicio.Text);
                ReportParameter dtfin = new ReportParameter("dtFinal", dtFinal.Text);

                DataTable dt = DAO.RetornaDT("SEL_ProfissionalRepasses @dtInicial = @dtInicial, @dtFinal = @dtFinal;", parametros);

                ReportViewer viewer = new ReportViewer();
                ReportDataSource DataSet1 = new ReportDataSource("dsRepasses", dt);

                viewer.ProcessingMode = ProcessingMode.Local;
                viewer.LocalReport.ReportPath = @"Reports\Rel_repasse.rdlc";
                viewer.LocalReport.DisplayName = fileName;

                viewer.LocalReport.DataSources.Add(DataSet1);
                viewer.LocalReport.SetParameters(new ReportParameter[] { dtini, dtfin });

                byte[] bytes = viewer.LocalReport.Render("EXCEL", null, out mimeType, out encoding, out extension, out streamIds, out warnings);
                //byte[] bytes = viewer.LocalReport.Render("PDF");

                // Now that you have all the bytes representing the PDF report, buffer it and send it to the client.  
                Response.Buffer = true;
                Response.Clear();
                Response.ContentType = mimeType;
                Response.AddHeader("content-disposition", "attachment; filename=" + fileName + "." + extension);
                Response.BinaryWrite(bytes); // create the file  
                Response.Flush(); // send it to the client to download 
            }
        }

        protected void btAtualizar_Click(object sender, EventArgs e)
        {
            if (dtInicio.Text != "" && dtFinal.Text !="")
            {
                gvRepasses.DataSourceID = "dsRepasses";
                gvRepasses.DataBind();
            }
        }
    }
}