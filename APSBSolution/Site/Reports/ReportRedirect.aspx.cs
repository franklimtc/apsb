using Microsoft.Reporting.WebForms;
using Site.Classes;
using System;
using System.Collections.Generic;
using System.Data;
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

        protected void btnExportar_Click(object sender, EventArgs e)
        {
            // Variables  
            Warning[] warnings;
            string[] streamIds;
            string mimeType = string.Empty;
            string encoding = string.Empty;
            string extension = string.Empty;
            string fileName = "Relatorio_Geral";


            List<object[]> parametros = new List<object[]>();
            parametros.Add(new object[] { "dtInicial", dtInicial.Text });
            parametros.Add(new object[] { "dtFinal", dtFinal.Text });

            // Setup the report viewer object and get the array of bytes  
            DataTable dtSource = DAO.RetornaDT("PROC_RelatorioGeral", parametros, true);
            ReportViewer viewer = new ReportViewer();
            ReportDataSource DataSet1 = new ReportDataSource("DSRelatorioGeral", dtSource);

            viewer.ProcessingMode = ProcessingMode.Local;
            viewer.LocalReport.ReportPath = @"Reports\Rel_geral.rdlc";
            viewer.LocalReport.DisplayName = "Relatorio_Geral";

            viewer.LocalReport.DataSources.Add(DataSet1);

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

        protected void btnExibir_Click(object sender, EventArgs e)
        {
            gvRelatorioGeral.DataBind();
        }
    }
}