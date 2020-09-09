using Microsoft.Ajax.Utilities;
using Site.Classes;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Site
{
    public partial class Autocadastro : System.Web.UI.Page
    {
        static CultureInfo culture;
        static DateTimeStyles styles;
        protected void Page_Load(object sender, EventArgs e)
        {
            // Parse a date and time with no styles.
            culture = CultureInfo.CreateSpecificCulture("pt-BR");
            styles = DateTimeStyles.None;
        }

        protected void btValidar_Click(object sender, EventArgs e)
        {
            hdToken.Value = tbToken.Text;
            int ValidaToken = int.Parse(Profissional.ValidarToken(tbToken.Text).ToString());
            if (ValidaToken>0)
            {
                tbCampos.Visible = true;
                pnValidar.Visible = false;
                idHiddenMedico.Value = ValidaToken.ToString();
                CarregarModalBanco(ValidaToken);
                CarregarModalEndereco(ValidaToken);
                CarregarModalPessoal(ValidaToken);
                CarregarModalProfissional(ValidaToken);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, GetType(), "", "alert('Token inválido');", true);
            }
        }

        protected void btSalvar_Click(object sender, EventArgs e)
        {
            bool result = false;
            //string user = User.Identity.Name;
            string user = "AutoCadastro";

            Profissional pNew = new Profissional();
            pNew.ccNome = tbNome.Text;
            pNew.ccSexo = dpSexo.SelectedValue;
            pNew.ccNaturalUF = dpNaturalidade.SelectedValue;
            pNew.ccNaturalCidade = tbCidade.Text;
            pNew.ccEstadoCivil = dpEstCivil.SelectedValue;
            pNew.nomePai = tbNomePai.Text;
            pNew.nomeMae = tbNomeMae.Text;
            pNew.nomeConjuge = tbNomeConjuge.Text;
            if (!tbRG.Text.IsNullOrWhiteSpace())
                pNew.RGNum = long.Parse(tbRG.Text);
            pNew.RGEmissor = tbEmissorRG.Text;
            //if (DateTime.TryParse(tbdtEmissaoRG.Text, out DateTime newDate))
            if (!tbdtEmissaoRG.Text.IsNullOrWhiteSpace())
            {
                DateTime.TryParse(tbdtEmissaoRG.Text, culture, styles, out DateTime newDate1);
                pNew.RGdtEmissao = newDate1;
            }

            pNew.CPFNum = long.Parse(tbCPF.Text);
            pNew.ccEmail = tbEmail.Text;
            if (!tbTelefone.Text.IsNullOrWhiteSpace())
                pNew.cvTelefone = long.Parse(tbTelefone.Text);
            if (!tbCelular.Text.IsNullOrWhiteSpace())
                pNew.cvCelular = long.Parse(tbCelular.Text);
            pNew.Observacoes = tbObservacoes.Text;
            //if (DateTime.TryParse(tbDataNascimento.Text, out DateTime newDate2))
            if (!tbDataNascimento.Text.IsNullOrWhiteSpace())
            {
                DateTime.TryParse(tbDataNascimento.Text, culture, styles, out DateTime newDate);
                pNew.dtNascimento = newDate;
            }


            try
            {
                if (idHiddenMedico.Value.IsNullOrWhiteSpace())
                {
                    result = pNew.Adicionar(user);
                }
                else
                {
                    pNew.IdProfissional = int.Parse(idHiddenMedico.Value);
                    result = pNew.Salvar(user);
                }
                if (result)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('Registro salvo com sucesso!');", true);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", $"alert('Falha ao salvar o registro! ERRO: {ex.Message}')", true);
            }
        }

        private void CarregarModalBanco(int idProfissional)
        {
            //bancoModal
            List<ProfissionalBanco> Lista = ProfissionalBanco.Listar(idProfissional);
            dpProfissionalBanco.ClearSelection();
            tbAgencia.Text = "";
            tbConta.Text = "";
            tbOperacao.Text = "";

            if (Lista.Count == 0)
            {
                Lista.Add(new ProfissionalBanco());
            }
            else
            {
                HiddenBancoCadastrado.Value = Lista.Count.ToString();
            }

            gvProfissionalBanco.DataSource = Lista;
            gvProfissionalBanco.DataBind();

            //string scriptModal = @"$('#bancoModal').modal('show')";
            //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", scriptModal, true);
        }

        private void CarregarModalEndereco(int idProfissional)
        {
            //moradiaModal
            ProfissionalEndereco pde = ProfissionalEndereco.ListarPorID(idProfissional);
            if (pde != null)
            {
                idHiddenProfissionalEndereco.Value = pde.IdEndereco.ToString();
                tbEndereço.Text = pde.ccEndereco;
                tbBairro.Text = pde.ccBairro;
                tbEnderecoCidade.Text = pde.ccCidade;
                tbCep.Text = pde.cvCEP.ToString();
                dpEnderecoUF.ClearSelection();
                dpEnderecoUF.Items.FindByValue(pde.ccUF.IfNullOrWhiteSpace("00")).Selected = true;
            }
            else
            {
                idHiddenProfissionalEndereco.Value = "";
                tbEndereço.Text = "";
                tbBairro.Text = "";
                tbEnderecoCidade.Text = "";
                tbCep.Text = "";
                dpEnderecoUF.ClearSelection();
                dpEnderecoUF.Items.FindByValue("00").Selected = true;
            }

            //string scriptModal = @"$('#moradiaModal').modal('show')";
            //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", scriptModal, true);
        }

        private void CarregarModalProfissional(int idProfissional)
        {
            //profissionalModal
            ProfissionalDados pd = ProfissionalDados.ListarPorID(idProfissional);
            if (pd != null)
            {
                idHiddenProfissionalDado.Value = pd.IdDadoProfissional.ToString();
                tbFormacao.Text = pd.ccFormacao;
                dpEspecialidade.ClearSelection();
                dpEspecialidade.Items.FindByText(pd.ccEspecialidade.IfNullOrWhiteSpace("Clínico geral")).Selected = true;
                tbPosGraduacao.Text = pd.ccPosGraduacao;
                tbConselhoRegional.Text = pd.ccConselho;
                tbNumInscricaoConselho.Text = pd.cvNumInscricao.ToString();
                tbTituloEleitor.Text = pd.cvTitulo.ToString();
                tbZonaEleitor.Text = pd.cvTituloZona.ToString();
                tbSecaoEleitor.Text = pd.cvTituloSecao.ToString();
                tbReservista.Text = pd.cvReservista.ToString();
                tbPisPasep.Text = pd.cvPIS.ToString();

            }
            else
            {
                idHiddenProfissionalDado.Value = "";
                tbFormacao.Text = "";
                dpEspecialidade.ClearSelection();
                dpEspecialidade.Items.FindByValue("1").Selected = true;
                tbPosGraduacao.Text = "";
                tbConselhoRegional.Text = "";
                tbNumInscricaoConselho.Text = "";
                tbTituloEleitor.Text = "";
                tbZonaEleitor.Text = "";
                tbSecaoEleitor.Text = "";
                tbReservista.Text = "";
                tbPisPasep.Text = "";
            }

            //string scriptModal = @"$('#profissionalModal').modal('show')";
            //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", scriptModal, true);
        }

        private void CarregarModalPessoal(int idProfissional)
        {
            //medicoModal
            Profissional editProf = Profissional.ListarPorID(idProfissional);

            if (editProf != null)
            {
                tbNome.Text = editProf.ccNome;
                dpSexo.ClearSelection();
                dpSexo.Items.FindByValue(editProf.ccSexo.IfNullOrWhiteSpace("M")).Selected = true;
                dpNaturalidade.ClearSelection();
                dpNaturalidade.Items.FindByValue(editProf.ccNaturalUF.IfNullOrWhiteSpace("00")).Selected = true;
                tbCidade.Text = editProf.ccNaturalCidade;
                dpEstCivil.ClearSelection();
                dpEstCivil.Items.FindByValue(editProf.ccEstadoCivil.IfNullOrWhiteSpace("C")).Selected = true;
                tbNomePai.Text = editProf.nomePai;
                tbNomeMae.Text = editProf.nomeMae;
                tbNomeConjuge.Text = editProf.nomeConjuge;
                tbRG.Text = editProf.RGNum.ToString();
                tbEmissorRG.Text = editProf.RGEmissor;
                tbCPF.Text = editProf.CPFNum.ToString("00000000000");
                tbEmail.Text = editProf.ccEmail;
                tbTelefone.Text = editProf.cvTelefone.ToString();
                tbCelular.Text = editProf.cvCelular.ToString();
                tbObservacoes.Text = editProf.Observacoes;

                tbdtEmissaoRG.Text = editProf.RGdtEmissao.Value.ToString("yyyy-MM-dd");
                tbDataNascimento.Text = editProf.dtNascimento.Value.ToString("yyyy-MM-dd");
            }
           

            //tbdtEmissaoRG.Text = editProf.RGdtEmissao.ToString("yyyy-MM-dd");
            //tbDataNascimento.Text = editProf.dtNascimento.ToString("yyyy-MM-dd");
            

        }

        protected void btSalvarEndereco_Click(object sender, EventArgs e)
        {
            string user = "Franklim";
            ProfissionalEndereco pde = new ProfissionalEndereco();
            if (!idHiddenProfissionalEndereco.Value.IsNullOrWhiteSpace())
            {
                pde.IdEndereco = int.Parse(idHiddenProfissionalEndereco.Value);
            }
            pde.ccEndereco = tbEndereço.Text;
            pde.ccBairro = tbBairro.Text;
            pde.ccCidade = tbEnderecoCidade.Text;
            pde.ccUF = dpEnderecoUF.SelectedValue;
            long.TryParse(tbCep.Text, out long nLong);
            pde.cvCEP = nLong;
            pde.idProfissional = int.Parse(idHiddenMedico.Value);

            bool result = pde.Salvar(user);

            if (result)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('Registro salvo com sucesso!');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('Falha ao salvar o registro!');", true);
            }
        }

        protected void btSalvarDados_Click(object sender, EventArgs e)
        {
            //string user = User.Identity.Name;
            string user = "Franklim";
            ProfissionalDados pd1 = new ProfissionalDados();
            if (!idHiddenProfissionalDado.Value.IsNullOrWhiteSpace())
            {
                pd1.IdDadoProfissional = int.Parse(idHiddenProfissionalDado.Value);
            }
            pd1.idProfissional = int.Parse(idHiddenMedico.Value);
            pd1.ccFormacao = tbFormacao.Text;
            pd1.ccPosGraduacao = tbPosGraduacao.Text;
            if (tbEspecialidadeNova.Text.IsNullOrWhiteSpace())
            {
                pd1.ccEspecialidade = dpEspecialidade.SelectedItem.Text;
            }
            else
            {
                Especialidade nova = new Especialidade(tbEspecialidadeNova.Text.Trim());
                nova.Adicionar(user);
                dpEspecialidade.DataBind();
                pd1.ccEspecialidade = nova.ccEspecialidade;
            }
            pd1.ccConselho = tbConselhoRegional.Text;

            if (!tbNumInscricaoConselho.Text.IsNullOrWhiteSpace())
                pd1.cvNumInscricao = long.Parse(tbNumInscricaoConselho.Text);

            if (!tbTituloEleitor.Text.IsNullOrWhiteSpace())
                pd1.cvTitulo = long.Parse(tbTituloEleitor.Text);

            if (!tbZonaEleitor.Text.IsNullOrWhiteSpace())
                pd1.cvTituloZona = int.Parse(tbZonaEleitor.Text);

            if (!tbSecaoEleitor.Text.IsNullOrWhiteSpace())
                pd1.cvTituloSecao = int.Parse(tbSecaoEleitor.Text);

            if (!tbReservista.Text.IsNullOrWhiteSpace())
                pd1.cvReservista = long.Parse(tbReservista.Text);

            if (!tbPisPasep.Text.IsNullOrWhiteSpace())
                pd1.cvPIS = long.Parse(tbPisPasep.Text);

            bool result = pd1.Salvar(user);

            if (result)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('Registro salvo com sucesso!');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('Falha ao salvar o registro!');", true);
            }
        }

        protected void gvProfissionalBanco_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            var obj = e.CommandArgument;
            int idProfissionalBanco = int.Parse(gvProfissionalBanco.Rows[int.Parse(e.CommandArgument.ToString())].Cells[0].Text);
            idHiddenProfissionalBanco.Value = idProfissionalBanco.ToString();
            //string user = User.Identity.Name;
            string user = "Franklim";
            bool result = false;

            switch (e.CommandName)
            {
                case "Editar":
                    ProfissionalBanco pb1 = ProfissionalBanco.Listar(int.Parse(idHiddenMedico.Value)).Find(x => x.IdProfissionalBanco == idProfissionalBanco);
                    dpProfissionalBanco.ClearSelection();
                    dpProfissionalBanco.Items.FindByValue(pb1.idBanco.ToString());
                    tbAgencia.Text = pb1.ccAgencia;
                    break;

                case "Excluir":
                    result = ProfissionalBanco.Excluir(user, idProfissionalBanco);
                    if (result)
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('Registro excluído com sucesso!');$('#bancoModal').modal('show');", true);
                        gvProfissionalBanco.DataSource = ProfissionalBanco.Listar(int.Parse(idHiddenMedico.Value));
                        gvProfissionalBanco.DataBind();
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('Falha ao excluir o registro!');", true);
                    }
                    break;

                default:
                    break;
            }
        }

        protected void btImprimir_Click(object sender, EventArgs e)
        {
            int idProfissional = int.Parse(idHiddenMedico.Value);
            string script = "";
            string apsdf = "";
            if (HiddenEmpresa.Value == "APSDF")
            {
                apsdf = "_APSDF";
            }

            if (rbFicha.Checked)
            {
                script = $"window.open('{$"Fichas/Cadastro{apsdf}.aspx?token={hdToken.Value}"}', '', '');";

                if (Profissional.ValidarCristalina(idProfissional) > 0)
                {
                    script += $"window.open('{$"Fichas/CadastroCristalina.aspx?token={hdToken.Value}"}', '', '');";
                    script += $"window.open('{$"Fichas/Cristalina_Cargos.pdf"}', '', '');";
                }
                ScriptManager.RegisterStartupScript(this.Page, GetType(), "", script, true);

            }
            else if (rbAutorizacao.Checked)
            {
                List< ClinicaProfissional> relacoes = ClinicaProfissional.Listar(0, int.Parse(idHiddenMedico.Value));
                script = "";
                foreach (var r in relacoes)
                {
                    script += $"window.open('{$"Fichas/Repasse{apsdf}.aspx?token={hdToken.Value}"}&id={r.IdClinicaProfissional}', '', '');";
                }

                ScriptManager.RegisterStartupScript(this.Page, GetType(), "", script , true);
            }
            else if (rbInformativo.Checked)
                ScriptManager.RegisterStartupScript(this.Page, GetType(), "", $"window.open('{$"Fichas/Informativo{apsdf}.aspx?token={hdToken.Value}"}', '', '');", true);
            else if (rbAcordo.Checked)
                ScriptManager.RegisterStartupScript(this.Page, GetType(), "", $"window.open('{$"Fichas/Acordo{apsdf}.aspx?token={hdToken.Value}"}', '', '');", true);
        }

        protected void btUploadFile_Click(object sender, EventArgs e)
        {
            //string user = User.Identity.Name;
            string user = "Franklim";

            if (btUpload.HasFile)
            {
                if (btUpload.PostedFile.ContentLength < 52428800)
                {
                    string fullPath = $"{Server.MapPath("").Replace("Cadastros", "Arquivos")}\\{btUpload.PostedFile.FileName}";
                    btUpload.PostedFile.SaveAs(fullPath);

                    ProfissionalArquivo pa = new ProfissionalArquivo();
                    var nomeArquivo = btUpload.PostedFile.FileName.Split('.');
                    pa.ccNomeArquivo = $"Comprovante_Taxa.{nomeArquivo[1]}";

                    pa.fileBytes = File.ReadAllBytes(fullPath);
                    pa.idProfissional = int.Parse(idHiddenMedico.Value);
                    bool result = pa.Salvar(user);

                    if (result)
                    {
                        //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('Registro salvo com sucesso!');", true);
                        File.Delete(fullPath);
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "$('#divAnexo').addClass('d-none')", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('Falha ao salvar o registro!');", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('Selecione um arquivo com tamanho inferior a 50MB!');", true);
                }

            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('Selecione um arquivo!');", true);
            }
        }

        [WebMethod]
        public static bool AdicionarBanco(string _idProfissional, string ccAgencia, string ccConta, string ccOperacao, string _idBanco)
        {

            ProfissionalBanco pdb = new ProfissionalBanco();

            pdb.idProfissional = int.Parse(_idProfissional);
            pdb.ccAgencia = ccAgencia;
            pdb.ccConta = ccConta;
            pdb.ccOperacao = ccOperacao;
            pdb.idBanco = int.Parse(_idBanco);

            bool result = pdb.Salvar("API");
            return result;
        }

        [WebMethod]
        public static Clinica GetClinica(long cnpj)
        {
            Clinica c = Clinica.ListarPorCNPJ(cnpj);
            return c;
        }

        [WebMethod]
        public static bool AddClinicaProfissional(long cnpj, string token)
        {
            bool result = false;
            Clinica c = Clinica.ListarPorCNPJ(cnpj);
            var id = Profissional.ValidarToken(token);

            int idProfissional = 0;
            int.TryParse(id.ToString(), out idProfissional);

            if (idProfissional > 0)
            {
                ClinicaProfissional cNew = new ClinicaProfissional(c.idClinica, idProfissional, 10, "");
                result = cNew.Adicionar("Autocadastro");
            }

            return result;
        }
    }
}