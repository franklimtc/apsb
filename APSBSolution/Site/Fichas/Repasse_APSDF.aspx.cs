using System;
using System.Collections.Generic;
using System.Globalization;
using Site.Classes;
using System.Linq;

namespace Site.Fichas
{
    public partial class Repasse_APSDF : System.Web.UI.Page
    {
        CultureInfo culture = CultureInfo.CreateSpecificCulture("pt-BR");
        protected void Page_Load(object sender, EventArgs e)
        {
            string token = "";
            int idClinicaProfissional = 0;
            if (!IsPostBack)
            {
                token = Request.QueryString["token"];
                int.TryParse(Request.QueryString["id"], out idClinicaProfissional);
                CarregarDados(token, idClinicaProfissional);
            }
        }
        private void CarregarDados(string token, int idClinicaProfissional)
        {
            lbData.Text = $"Brasília, {DateTime.Now.ToString("m", culture)} de {DateTime.Now.ToString("yyyy")}.";
            int idProfissional = 0;
            int.TryParse(Profissional.ValidarToken(token).ToString(), out idProfissional);

            if (idProfissional > 0)
            {
                Profissional p1 = Profissional.ListarPorID(idProfissional);
                ClinicaProfissional c1 = ClinicaProfissional.Listar(0, idProfissional).Where(x => x.IdClinicaProfissional == idClinicaProfissional).FirstOrDefault();
                Clinica c2 = Clinica.ListarPorID(c1.idClinica);

                lbNomeAss.Text = p1.ccNome;
                lbNomeProfissional.Text = p1.ccNome;
                lbProfissionalCPF.Text = p1.CPFNum.ToString("00000000000");
                lbCPF.Text = p1.CPFNum.ToString("00000000000");

                lbClinicaFantasia.Text = c2.ccNomeFantasia;
                lbClinicaCNPJ.Text = c2.cvCNPJ.ToString("00000000000000");
            }
        }
    }
}