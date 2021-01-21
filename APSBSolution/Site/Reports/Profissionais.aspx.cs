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
    public partial class Report1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btExportar_Click(object sender, EventArgs e)
        {
            //Response.Redirect(@"Report.aspx?report=report01");

            // Variables  
            Warning[] warnings;
            string[] streamIds;
            string mimeType = string.Empty;
            string encoding = string.Empty;
            string extension = string.Empty;
            string fileName = "Lista de Profissionais";


            // Setup the report viewer object and get the array of bytes  
            ReportViewer viewer = new ReportViewer();
            ReportDataSource DataSet1 = new ReportDataSource("DataSet1", DAO.RetornaDT("SEL_ProfissionaisRel", null, true));

            viewer.ProcessingMode = ProcessingMode.Local;
            viewer.LocalReport.ReportPath = @"Reports\Rep01.rdlc";
            viewer.LocalReport.DisplayName = "Lista de Profissionais";

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