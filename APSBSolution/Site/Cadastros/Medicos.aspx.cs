using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
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
                    CarregarModalProfissional();
                    break;
                case "EdEndereco":
                    CarregarModalEndereco();
                    break;
                case "EdBanco":
                    CarregarModalBanco();
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

        private void CarregarModalBanco()
        {
            //bancoModal

            string scriptModal = @"$('#bancoModal').modal('show')";
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", scriptModal, true);
        }

        private void CarregarModalEndereco()
        {
            //moradiaModal

            string scriptModal = @"$('#moradiaModal').modal('show')";
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", scriptModal, true);
        }

        private void CarregarModalProfissional()
        {
            //profissionalModal

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
    }
}