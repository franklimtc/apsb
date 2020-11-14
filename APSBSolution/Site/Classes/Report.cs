using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.Reporting.WebForms;
using System.Web.UI.WebControls;



namespace Site.Classes
{
    public class Report
    {
        //public static void Render(string fileName, )
        //{
        //    // Variables  
        //    Warning[] warnings;
        //    string[] streamIds;
        //    string mimeType = string.Empty;
        //    string encoding = string.Empty;
        //    string extension = string.Empty;


        //    // Setup the report viewer object and get the array of bytes  
        //    ReportViewer viewer = new ReportViewer();
        //    ReportDataSource DataSet1 = new ReportDataSource("DataSet1", Clinica.Listar());

        //    viewer.ProcessingMode = ProcessingMode.Local;
        //    viewer.LocalReport.ReportPath = @"Reports\Report3.rdlc";
        //    viewer.LocalReport.DisplayName = "Lista de Profissionais";

        //    viewer.LocalReport.DataSources.Add(DataSet1);

        //    byte[] bytes = viewer.LocalReport.Render("PDF", null, out mimeType, out encoding, out extension, out streamIds, out warnings);
        //    //byte[] bytes = viewer.LocalReport.Render("PDF");

        //    // Now that you have all the bytes representing the PDF report, buffer it and send it to the client.  
        //    Response.Buffer = true;
        //    Response.Clear();
        //    Response.ContentType = mimeType;
        //    Response.AddHeader("content-disposition", "attachment; filename=" + fileName + "." + extension);
        //    Response.BinaryWrite(bytes); // create the file  
        //    Response.Flush(); // send it to the client to download  
        //}
    }
}