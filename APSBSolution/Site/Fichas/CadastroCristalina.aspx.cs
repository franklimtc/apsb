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
    public partial class CadastroCristalina : System.Web.UI.Page
    {
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
            int idProfissional = 0;
            int.TryParse(Profissional.ValidarToken(token).ToString(), out idProfissional);

            if (idProfissional > 0)
            {
                Profissional p1 = Profissional.ListarPorID(idProfissional);
                ProfissionalDados p2 = ProfissionalDados.ListarPorID(idProfissional);
                ProfissionalEndereco p3 = ProfissionalEndereco.ListarPorID(idProfissional);
                ProfissionalBanco p4 = ProfissionalBanco.Listar(idProfissional).First();
                
                tbNome.Text = p1.ccNome;
                tbSecao.Text = p1.ccSexo;
                tbEndereco.Text = p3.ccEndereco;
                tbCelular.Text = p3.cvCEP.Value.ToString("00000000");
                tbBairro.Text = p3.ccBairro;
                tbCidade.Text = p3.ccCidade;
                tbUF.Text = p3.ccUF;
                tbFone.Text = p1.cvTelefone.ToString("00000000000");
                tbCelular.Text = p1.cvCelular.ToString("00000000000");
                tbEmail.Text = p1.ccEmail;
                tbNaturalidade.Text = p1.ccNaturalCidade;
                tbUFNaturalidade.Text = p1.ccNaturalUF;
                tbDataNascimento.Text = p1.dtNascimento.ToString("dd/MM/yyyy");
                tbRG.Text = p1.RGNum.ToString();
                tbDataExp.Text = p1.RGdtEmissao.ToString("dd/MM/yyyy");
                tbOrgExp.Text = p1.RGEmissor;
                tbCPF.Text = p1.CPFNum.ToString();
                tbPIS.Text = p2.cvPIS.ToString();
                tbConselho.Text = p2.ccConselho;
                tbEstCivil.Text = p1.ccEstadoCivil;
                tbTitulo.Text = p2.cvTitulo.ToString();
                tbZona.Text = p2.cvTituloZona.ToString();
                tbSecao.Text = p2.cvTituloSecao.ToString();
                tbMae.Text = p1.nomeMae;
                tbPai.Text = p1.nomePai;
                tbConjuge.Text = p1.nomeConjuge;
                tbFormacao.Text = p2.ccFormacao;
                tbEspecialidade.Text = p2.ccEspecialidade;
                tbPosGraduacao.Text = p2.ccPosGraduacao;
            }
        }
    }
}