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
                ReportViewer1.ProcessingMode = ProcessingMode.Local;
                ReportViewer1.LocalReport.ReportPath = @"Reports\FichaCadastral.rdlc";
                ReportViewer1.LocalReport.SetParameters(new ReportParameter("ccNome", "Franklim Costa"));
                ReportViewer1.LocalReport.SetParameters(new ReportParameter("ccSexo", "M"));
                ReportViewer1.LocalReport.SetParameters(new ReportParameter("dtNasc", "28/03/1097"));
                ReportViewer1.LocalReport.SetParameters(new ReportParameter("cvCPF", "00100200304"));
                ReportViewer1.LocalReport.SetParameters(new ReportParameter("cvRG", "00100200304"));
                ReportViewer1.LocalReport.SetParameters(new ReportParameter("ccRgExp", "SSPMA"));
                ReportViewer1.LocalReport.SetParameters(new ReportParameter("cvInscricao", "1111111"));
                ReportViewer1.LocalReport.SetParameters(new ReportParameter("ccConselho", "CRM"));
                ReportViewer1.LocalReport.SetParameters(new ReportParameter("ccEspecialidade", "Pediatria"));
                ReportViewer1.LocalReport.SetParameters(new ReportParameter("cvPIS", "11112222"));
                ReportViewer1.LocalReport.SetParameters(new ReportParameter("ccEndereco", "Av. dos Guararapes"));
                ReportViewer1.LocalReport.SetParameters(new ReportParameter("cvCEP", "00102555"));
                ReportViewer1.LocalReport.SetParameters(new ReportParameter("ccBairro", "Centro"));
                ReportViewer1.LocalReport.SetParameters(new ReportParameter("ccCidade", "São Paulo"));
                ReportViewer1.LocalReport.SetParameters(new ReportParameter("ccUF", "SP"));
                ReportViewer1.LocalReport.SetParameters(new ReportParameter("cvCelular", "11999991111"));
                ReportViewer1.LocalReport.SetParameters(new ReportParameter("ccEmail", "email@email.com"));
                ReportViewer1.LocalReport.SetParameters(new ReportParameter("cvTitulo", "11110000"));
                ReportViewer1.LocalReport.SetParameters(new ReportParameter("cvCNH", "11110000"));
                ReportViewer1.LocalReport.SetParameters(new ReportParameter("cvReservista", "11110000"));
                ReportViewer1.LocalReport.SetParameters(new ReportParameter("cvTrabalho", "11110000"));
                ReportViewer1.LocalReport.SetParameters(new ReportParameter("ccBanco", "Caixa"));
                ReportViewer1.LocalReport.SetParameters(new ReportParameter("cvAgencia", "1010"));
                ReportViewer1.LocalReport.SetParameters(new ReportParameter("cvConta", "101011-1"));

                ReportViewer1.LocalReport.DisplayName = "teste";
            }
           
        }
    }
}