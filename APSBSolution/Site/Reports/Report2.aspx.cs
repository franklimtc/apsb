using Microsoft.Reporting.WebForms;
using Site.Classes;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Site.Reports
{
    public partial class Report21 : System.Web.UI.Page
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
                    id = int.Parse(Request.QueryString["id"]);
                    switch (report)
                    {
                        case "cadastro":
                            ExibirFichaCadastral(id);
                            break;
                        case "autorizacao":
                            ExibirAutorizacao(id);
                            break;
                        case "informativo":
                            ExibirInformativo(id);
                            break;
                        case "acordo":
                            ExibirAcordo(id);
                            break;
                        default:
                            break;
                    }
                }
                catch(Exception ex)
                {
                    string erro = ex.Message;
                }
            }
        }

        private void ExibirAcordo(int idProfissional)
        {
            viewer.LocalReport.ReportPath = @"Reports\Acordo.rdlc";
            viewer.LocalReport.DisplayName = "Acordo";

            List<Profissional> ProfissionalLista = new List<Profissional>();
            ProfissionalLista.Add(Profissional.ListarPorID(idProfissional));


            ReportDataSource dsProfissional = new ReportDataSource("dsProfissional", ProfissionalLista);
            viewer.LocalReport.DataSources.Add(dsProfissional);
        }

        private void ExibirInformativo(int idProfissional)
        {
            viewer.LocalReport.ReportPath = @"Reports\Informativo.rdlc";
            viewer.LocalReport.DisplayName = "Informativo";

            List<Profissional> ProfissionalLista = new List<Profissional>();
            ProfissionalLista.Add(Profissional.ListarPorID(idProfissional));


            ReportDataSource dsProfissional = new ReportDataSource("dsProfissional", ProfissionalLista);
            viewer.LocalReport.DataSources.Add(dsProfissional);
        }

        private void ExibirAutorizacao(int id)
        {
            throw new NotImplementedException();
        }

        private void ExibirFichaCadastral(int idProfissional)
        {
            viewer.LocalReport.ReportPath = @"Reports\FichaCadastral2.rdlc";
            viewer.LocalReport.DisplayName = "Ficha Cadastral";


            List<Profissional> ProfissionalLista = new List<Profissional>();
            List<ProfissionalDados> ProfissionalDadosLista = new List<ProfissionalDados>();
            List<ProfissionalEndereco> ProfissionalEnderecoLista = new List<ProfissionalEndereco>();

            ProfissionalLista.Add(Profissional.ListarPorID(idProfissional));
            ProfissionalDadosLista.Add(ProfissionalDados.ListarPorID(idProfissional));
            ProfissionalEnderecoLista.Add(ProfissionalEndereco.ListarPorID(idProfissional));


            ReportDataSource dsProfissional = new ReportDataSource("dsProfissional", ProfissionalLista);
            ReportDataSource dsProfissionalDados = new ReportDataSource("dsProfissionalDados", ProfissionalDadosLista);
            ReportDataSource dsProfissionalEndereco = new ReportDataSource("dsProfissionalEndereco", ProfissionalEnderecoLista);
            ReportDataSource dsProfissionalBanco = new ReportDataSource("dsProfissionalBanco", ProfissionalBanco.Listar(idProfissional));

            viewer.LocalReport.DataSources.Add(dsProfissional);
            viewer.LocalReport.DataSources.Add(dsProfissionalDados);
            viewer.LocalReport.DataSources.Add(dsProfissionalEndereco);
            viewer.LocalReport.DataSources.Add(dsProfissionalBanco);

        }
    }
}