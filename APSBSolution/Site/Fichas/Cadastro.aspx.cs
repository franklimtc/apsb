using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Site.Classes;

namespace Site.Fichas
{
    public partial class Cadastro : System.Web.UI.Page
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
            lbData.Text = $"{DateTime.Now.ToString("m", culture)} de {DateTime.Now.ToString("yyyy")}";
            int idProfissional = 0;
            int.TryParse(Profissional.ValidarToken(token).ToString(), out idProfissional);

            if (idProfissional > 0)
            {
                Profissional p1 = Profissional.ListarPorID(idProfissional);
                ProfissionalDados p2 = ProfissionalDados.ListarPorID(idProfissional);
                ProfissionalEndereco p3 = ProfissionalEndereco.ListarPorID(idProfissional);
                ProfissionalBanco p4 = ProfissionalBanco.Listar(idProfissional).First();

                lbNome.Text = p1.ccNome;
                lbNomeAss.Text = p1.ccNome;
                lbSexo.Text = p1.ccSexo;
                lbDtNascimento.Text = p1.dtNascimento.ToString("dd/MM/yyyy");
                lbCPF.Text = p1.CPFNum.ToString("00000000000");
                lbRG.Text = p1.RGNum.ToString();
                lbOrgExp.Text = p1.RGEmissor;
                lbNumInscr.Text = p2.cvNumInscricao.ToString();
                lbConselho.Text = p2.ccConselho;
                lbEspecialidade.Text = p2.ccEspecialidade;
                lbPis.Text = p2.cvPIS.ToString();
                lbEndereco.Text = p3.ccEndereco;
                lbCEP.Text = p3.cvCEP.Value.ToString("00000000");
                lbBairro.Text = p3.ccBairro;
                lbCidade.Text = $"{p3.ccCidade}/{p3.ccUF}";
                lbCelular.Text = p1.cvCelular.ToString("00000000000");
                lbEmail.Text = p1.ccEmail;
                lbTitulo.Text = p2.cvTitulo.ToString();
                lbCNH.Text = p2.cvCHN.ToString();
                lbReservista.Text = p2.cvReservista.ToString();
                lbCTPS.Text = p2.cvCTPS.ToString();
                lbBanco.Text = p4.ccBanco;
                lbAgencia.Text = p4.ccAgencia;
                lbConta.Text = p4.ccConta;

            }
        }
    }
}