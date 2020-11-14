using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;
using Site.Classes;

namespace Site.Reports
{
    public partial class Report : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int id;

                try
                {
                    id = int.Parse(Request.QueryString["id"].ToString());
                    GerarFichaCadastral(id);
                }
                catch(Exception ex) 
                {
                    ScriptManager.RegisterStartupScript(this.Page, GetType(), "", $"alert('{ex.Message}')", true);
                }
            }
           
        }

        void GerarFichaCadastral(int idProfissional)
        {
            ReportViewer viewer = new ReportViewer();
            viewer.ProcessingMode = ProcessingMode.Local;
            viewer.LocalReport.ReportPath = @"Reports\FichaCadastral2.rdlc";
            viewer.LocalReport.DisplayName = "Ficha Cadastral";


            List<ProfissionalDados> ProfissionalDadosLista = new List<ProfissionalDados>();
            List<ProfissionalEndereco> ProfissionalEnderecoLista = new List<ProfissionalEndereco>();

            ProfissionalDadosLista.Add(ProfissionalDados.ListarPorID(idProfissional));
            ProfissionalEnderecoLista.Add(ProfissionalEndereco.ListarPorID(idProfissional));
            
            ReportDataSource dsProfissional = new ReportDataSource("dsProfissional", Profissional.Listar().Where(x => x.IdProfissional == idProfissional));
            ReportDataSource dsProfissionalDados    = new ReportDataSource("dsProfissionalDados", ProfissionalDadosLista);
            ReportDataSource dsProfissionalEndereco = new ReportDataSource("dsProfissionalEndereco", ProfissionalEnderecoLista);
            ReportDataSource dsProfissionalBanco = new ReportDataSource("dsProfissionalBanco", ProfissionalBanco.Listar(idProfissional));

            viewer.LocalReport.DataSources.Add(dsProfissional);
            viewer.LocalReport.DataSources.Add(dsProfissionalDados);
            viewer.LocalReport.DataSources.Add(dsProfissionalEndereco);
            viewer.LocalReport.DataSources.Add(dsProfissionalBanco);

            // Variables  
            Warning[] warnings;
            string[] streamIds;
            string mimeType = string.Empty;
            string encoding = string.Empty;
            string extension = string.Empty;
            string fileName = "Ficha Cadastral";

            byte[] bytes = viewer.LocalReport.Render("PDF", null, out mimeType, out encoding, out extension, out streamIds, out warnings);

            // Now that you have all the bytes representing the PDF report, buffer it and send it to the client.  
            Response.Buffer = true;
            Response.Clear();
            Response.ContentType = mimeType;
            Response.AddHeader("content-disposition", "attachment; filename=" + fileName + "." + extension);
            Response.BinaryWrite(bytes); // create the file  
            Response.Flush(); // send it to the client to download  
        }
    }
}