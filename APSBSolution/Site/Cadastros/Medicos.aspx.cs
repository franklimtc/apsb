﻿using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Mapping;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using Microsoft.Ajax.Utilities;
using Simple.Data;
using Site.Classes;


namespace Site.Cadastros
{
    public partial class Medicos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gvMedicos_PreRender(object sender, EventArgs e)
        {
            // You only need the following 2 lines of code if you are not 
            // using an ObjectDataSource of SqlDataSource
            gvMedicos.DataSource = Profissional.Listar();
            gvMedicos.DataBind();

            if (gvMedicos.Rows.Count > 0)
            {
                //This replaces <td> with <th> and adds the scope attribute
                gvMedicos.UseAccessibleHeader = true;

                //This will add the <thead> and <tbody> elements
                gvMedicos.HeaderRow.TableSection = TableRowSection.TableHeader;

                //This adds the <tfoot> element. 
                //Remove if you don't have a footer row
                //gvClinicas.FooterRow.TableSection = TableRowSection.TableFooter;
            }
        }

        protected void gvMedicos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            var obj = e.CommandArgument;
            int idProfissional = int.Parse(gvMedicos.Rows[int.Parse(e.CommandArgument.ToString())].Cells[0].Text);
            idHiddenMedico.Value = idProfissional.ToString();
            string user = "Franklim";

            bool result = false;

            switch (e.CommandName)
            {
                case "Editar":
                    CarregarModalPessoal(idProfissional);
                    break;
                case "EdProfissionais":
                    CarregarModalProfissional(idProfissional);
                    break;
                case "EdEndereco":
                    CarregarModalEndereco(idProfissional);
                    break;
                case "EdBanco":
                    CarregarModalBanco(idProfissional);
                    break;
                case "AddArquivos":
                    CarregarModalArquivos();
                    break;

                case "Excluir":
                    result = Profissional.Excluir(user, idProfissional);
                    if (result)
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('Registro excluído com sucesso!');", true);
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

        #region Modais

        private void CarregarModalArquivos()
        {
            //arquivosModal

            string scriptModal = @"$('#arquivosModal').modal('show')";
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", scriptModal, true);
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
            gvProfissionalBanco.DataSource = Lista;
            gvProfissionalBanco.DataBind();

            string scriptModal = @"$('#bancoModal').modal('show')";
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", scriptModal, true);
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
                dpEnderecoUF.Items.FindByValue(pde.ccUF).Selected = true;
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

            string scriptModal = @"$('#moradiaModal').modal('show')";
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", scriptModal, true);
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
                dpEspecialidade.Items.FindByText(pd.ccEspecialidade).Selected = true;
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

            string scriptModal = @"$('#profissionalModal').modal('show')";
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", scriptModal, true);
        }

        private void CarregarModalPessoal(int idProfissional)
        {
            //medicoModal
            Profissional editProf = Profissional.ListarPorID(idProfissional);
            tbNome.Text = editProf.ccNome;
            dpSexo.ClearSelection();
            dpSexo.Items.FindByValue(editProf.ccSexo).Selected = true;
            dpNaturalidade.ClearSelection();
            dpNaturalidade.Items.FindByValue(editProf.ccNaturalUF).Selected = true;
            tbCidade.Text = editProf.ccNaturalCidade;
            dpEstCivil.ClearSelection();
            dpEstCivil.Items.FindByValue(editProf.ccEstadoCivil).Selected = true;
            tbNomePai.Text = editProf.nomePai;
            tbNomeMae.Text = editProf.nomeMae;
            tbNomeConjuge.Text = editProf.nomeConjuge;
            tbRG.Text = editProf.RGNum.ToString();
            tbEmissorRG.Text = editProf.RGEmissor;
            tbdtEmissaoRG.Text = editProf.RGdtEmissao.ToString("dd/MM/yyyy");
            tbCPF.Text = editProf.CPFNum.ToString();
            tbEmail.Text = editProf.ccEmail;
            tbTelefone.Text = editProf.cvTelefone.ToString();
            tbCelular.Text = editProf.cvCelular.ToString();
            tbObservacoes.Text = editProf.Observacoes;
            tbDataNascimento.Text = editProf.dtNascimento.ToString("dd/MM/yyyy");

            string scriptModal = @"$('#medicoModal').modal('show')";
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", scriptModal, true);
        }
        #endregion
        protected void btSalvar_Click(object sender, EventArgs e)
        {
            bool result = false;
            //string user = User.Identity.Name;
            string user = "Franklim";

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
            if (!tbdtEmissaoRG.Text.IsNullOrWhiteSpace())
                pNew.RGdtEmissao = DateTime.Parse(tbdtEmissaoRG.Text);
            pNew.CPFNum = long.Parse(tbCPF.Text);
            pNew.ccEmail = tbEmail.Text;
            if (!tbTelefone.Text.IsNullOrWhiteSpace())
                pNew.cvTelefone = long.Parse(tbTelefone.Text);
            if (!tbCelular.Text.IsNullOrWhiteSpace())
                pNew.cvCelular = long.Parse(tbCelular.Text);
            pNew.Observacoes = tbObservacoes.Text;
            if (!tbDataNascimento.Text.IsNullOrWhiteSpace())
                pNew.dtNascimento = DateTime.Parse(tbDataNascimento.Text);

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

        protected void btSalvarEndereco_Click(object sender, EventArgs e)
        {
            //string user = User.Identity.Name;
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

        protected void btSalvarProfissionalBanco_Click(object sender, EventArgs e)
        {
            //string user = User.Identity.Name;
            string user = "Franklim";
            ProfissionalBanco pdb = new ProfissionalBanco();

            pdb.idProfissional = int.Parse(idHiddenMedico.Value);
            pdb.ccAgencia = tbAgencia.Text;
            pdb.ccConta = tbConta.Text;
            pdb.ccOperacao = tbOperacao.Text;
            pdb.idBanco = int.Parse(dpProfissionalBanco.SelectedValue);

            bool result = pdb.Salvar(user);

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
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('Registro excluído com sucesso!');", true);
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
    }
}