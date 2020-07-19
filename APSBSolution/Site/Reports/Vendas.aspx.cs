using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Site.Classes;

namespace Site.Reports
{
    public partial class Vendas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btExportar_Click(object sender, EventArgs e)
        {
            //Response.Redirect(@"Report.aspx?report=report03");
            Warning[] warnings;
            string[] streamIds;
            string mimeType = string.Empty;
            string encoding = string.Empty;
            string extension = string.Empty;
            string fileName = "Relatório de Vendas";


            // Setup the report viewer object and get the array of bytes  
            ReportViewer viewer = new ReportViewer();
            ReportDataSource DataSet1 = new ReportDataSource("DataSet1", RelVendas.Listar());

            viewer.ProcessingMode = ProcessingMode.Local;
            viewer.LocalReport.ReportPath = @"Reports\RepVendas.rdlc";
            viewer.LocalReport.DisplayName = fileName;

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