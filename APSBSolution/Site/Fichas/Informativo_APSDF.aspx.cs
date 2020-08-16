using Site.Classes;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Site.Fichas
{
    public partial class Informativo_APSDF : System.Web.UI.Page
    {
        CultureInfo culture = CultureInfo.CreateSpecificCulture("pt-BR");
        protected void Page_Load(object sender, EventArgs e)
        {
            string token = "";
            if (!IsPostBack)
            {
                token = Request.QueryString["token"];
                CarregarDados(token);
            }
        }
        private void CarregarDados(string token)
        {
            lbData.Text = $"Brasília, {DateTime.Now.ToString("m", culture)} de {DateTime.Now.ToString("yyyy")}.";
            int idProfissional = 0;
            int.TryParse(Profissional.ValidarToken(token).ToString(), out idProfissional);

            if (idProfissional > 0)
            {
                Profissional p1 = Profissional.ListarPorID(idProfissional);
                lbNomeAss.Text = p1.ccNome;
                lbCPF.Text = p1.CPFNum.ToString("00000000000");
            }
        }
    }
}