using Microsoft.Ajax.Utilities;
using Microsoft.SqlServer.Server;
using Simple.Data;
using Site.Classes;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Runtime.InteropServices;
using System.Security.AccessControl;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Site
{
    public partial class Operacoes : System.Web.UI.Page
    {
        static CultureInfo culture;
        static DateTimeStyles styles;

        protected void gvRepasses_PreRender(object sender, EventArgs e)
        {
            // You only need the following 2 lines of code if you are not 
            // using an ObjectDataSource of SqlDataSource
            //gvOperacoes.DataBind();


            //gvMedicos.DataSource = Profissional.Listar();
            if (gvRepasses.Rows.Count > 0)
            {
                //This replaces <td> with <th> and adds the scope attribute
                gvRepasses.UseAccessibleHeader = true;

                //This will add the <thead> and <tbody> elements
                gvRepasses.HeaderRow.TableSection = TableRowSection.TableHeader;

                //This adds the <tfoot> element. 
                //Remove if you don't have a footer row
                //gvClinicas.FooterRow.TableSection = TableRowSection.TableFooter;
            }
        }
        protected void gvOperacoes_PreRender(object sender, EventArgs e)
        {
            // You only need the following 2 lines of code if you are not 
            // using an ObjectDataSource of SqlDataSource
            //gvOperacoes.DataBind();


            //gvMedicos.DataSource = Profissional.Listar();
            if (gvOperacoes.Rows.Count > 0)
            {
                //This replaces <td> with <th> and adds the scope attribute
                gvOperacoes.UseAccessibleHeader = true;

                //This will add the <thead> and <tbody> elements
                gvOperacoes.HeaderRow.TableSection = TableRowSection.TableHeader;

                //This adds the <tfoot> element. 
                //Remove if you don't have a footer row
                //gvClinicas.FooterRow.TableSection = TableRowSection.TableFooter;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Dropdown Tipo Despesas
                CarregarDPDespesa();

                //Dropdown Tipo Receitas
                CarregarDPReceita();

                //Data
                tbDespesaDataNF.Text = DateTime.Now.ToString("yyyy-MM-dd");

                // Parse a date and time with no styles.
                culture = CultureInfo.CreateSpecificCulture("pt-BR");
                styles = DateTimeStyles.None;
            }
        }

        void CarregarDPDespesa()
        {
            var listaTipo = DespesaTipo.Listar();
            listaTipo.Add(new DespesaTipo(0, "Selecionar.."));
            dpTipoDespesa.DataSource = listaTipo;
            dpTipoDespesa.DataBind();
            dpTipoDespesa.ClearSelection();
            dpTipoDespesa.Items.FindByValue("0").Selected = true;
        }

        void CarregarDPReceita()
        {
            var listaTipo = DespesaTipo.Listar("Receita");
            listaTipo.Add(new DespesaTipo(0, "Selecionar.."));
            dpTipoReceita.DataSource = listaTipo;
            dpTipoReceita.DataBind();
            dpTipoReceita.ClearSelection();
            dpTipoReceita.Items.FindByValue("0").Selected = true;
        }


        protected void btSalvar_Click(object sender, EventArgs e)
        {
            //string Usuario = User.Identity.Name;
            string Usuario = "Franklim";
            bool result = false;

            if (tbAbaAtiva.Text == "Despesa")
            {
                Despesa dp = new Despesa();
                dp.idTipo = int.Parse(dpTipoDespesa.SelectedValue);
                dp.cdData = DateTime.Parse(tbDespesaDataNF.Text.IfNullOrWhiteSpace(DateTime.Now.ToString("yyyy-MM-dd")), culture, styles);
                dp.cvValor = float.Parse(tbValorOperacao.Text);
                dp.ccObservacao = tbDespesaObs.Text;
                if (idHiddenOperacao.Value.IsNullOrWhiteSpace())
                {
                    result = dp.Adicionar(Usuario);
                }
                else
                {
                    dp.idDespesas = int.Parse(idHiddenOperacao.Value);
                    result = dp.Salvar(Usuario);
                }
            }
            else if (tbAbaAtiva.Text == "Receita")
            {
                Receita rc = new Receita();
                rc.cvValor = float.Parse(tbValorOperacao.Text);
                rc.IdClinica = int.Parse(dpTipoReceita.SelectedValue);
                //
                if (!tbReceitaDataNF.Text.IsNullOrWhiteSpace())
                {
                    rc.cdEmissao = DateTime.Parse(tbReceitaDataNF.Text);
                }
                //
                if (!tbReceitaNF.Text.IsNullOrWhiteSpace())
                {
                    rc.cvNF = int.Parse(tbReceitaNF.Text);
                }
                //
                if (!tbReceitaDataPgtoNF.Text.IsNullOrWhiteSpace())
                {
                    rc.cdPagamento = DateTime.Parse(tbReceitaDataPgtoNF.Text);
                }
                //
                if (!tbReceitaNFValorPG.Text.IsNullOrWhiteSpace())
                {
                    rc.cvValorPago = float.Parse(tbReceitaNFValorPG.Text);
                }
                if (!tbReceitaDesconto.Text.IsNullOrWhiteSpace())
                {
                    rc.cvDesconto = float.Parse(tbReceitaDesconto.Text);
                }
                rc.Observacao = tbReceitaObs.Text;

                rc.cbIssRetido = chkIssRetido.Checked;

                if (idHiddenOperacao.Value.IsNullOrWhiteSpace())
                {
                    result = rc.Adicionar(Usuario);
                }
                else
                {
                    rc.idReceita = int.Parse(idHiddenOperacao.Value);
                    result = rc.Salvar(Usuario);
                }


            }

            gvOperacoes.DataBind();
            LimparForm();

        }

        private void LimparForm()
        {
            //Form Despesas

            tbValorOperacao.Text = "";
            dpTipoDespesa.ClearSelection();
            dpTipoDespesa.Items.FindByValue("0").Selected = true;
            tbDespesaDataNF.Text = DateTime.Now.ToString("yyyy-MM-dd");
            tbDespesaObs.Text = "";
            tbSearch.Text = "";
            //Form Receitas

        }

        protected void gvOperacoes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            var obj = e.CommandArgument;
            int idOperacao = int.Parse(gvOperacoes.Rows[int.Parse(obj.ToString())].Cells[0].Text);
            idHiddenOperacao.Value = idOperacao.ToString();
            string operacaoTipo = gvOperacoes.Rows[int.Parse(obj.ToString())].Cells[9].Text;
            string user = "Franklim";
            pnObs.Visible = false;


            switch (e.CommandName)
            {
                case "Editar":
                    tbValorOperacao.Text = gvOperacoes.Rows[int.Parse(e.CommandArgument.ToString())].Cells[2].Text;
                        
                    CarregarModalOperacao(idOperacao, operacaoTipo);
                    break;
                case "Repassar":
                    if (operacaoTipo == "Receita")
                    {
                        CarregarModalRepasse(idOperacao, operacaoTipo);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('Repasse não disponível para Despesas!');", true);
                    }
                    break;
                case "Arquivar":
                    Operacao.Arquivar(user, idOperacao, operacaoTipo);
                    gvOperacoes.DataBind();
                    break;
                case "Excluir":
                    Operacao.Excluir(user, idOperacao, operacaoTipo);
                    gvOperacoes.DataBind();
                    break;
                default:
                    break;
            }
        }
        protected void gvRepasseMedico_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            var obj = e.CommandArgument;
            string Usuario = "Franklim";
            int idRepasse = int.Parse(gvRepasseMedico.Rows[int.Parse(obj.ToString())].Cells[0].Text);
            DateTime dtPgto = DateTime.Now;

            DateTime.TryParse(tbDtRepasse.Text, out dtPgto);

            bool result = false;

            switch (e.CommandName)
            {
                case "Pagar":
                    result = ReceitaRepasse.Pagar(Usuario, idRepasse, dtPgto);
                    break;
                case "Excluir":
                    result = ReceitaRepasse.Excluir(Usuario, idRepasse);
                    break;
                case "Info":
                    pnObs.Visible = true;
                    tbObsRepasseProfissional.Text = ReceitaRepasse.GetObs(idRepasse);
                    result = true;
                    break;
                default:
                    break;
            }
            if (!result)
            {
                ScriptManager.RegisterStartupScript(this.Page, GetType(), "", "alert('Falha na operação')", true);
            }
            else
            {
                gvRepasseMedico.DataBind();
                gvOperacoes.DataBind();
            }
            CarregarModalRepasse(int.Parse(idHiddenOperacao.Value), "Receita");
        }
        private void CarregarModalOperacao(int idOperacao, string tipo)
        {
            string scriptModal = "null";
            Operacao op = Operacao.ListarPorID(idOperacao, tipo);
            tbValorOperacao.Text = ConvertMoney(op.cvValor.ToString());

            if (tipo == "Despesa")
            {
                scriptModal = "EditDespesa()";
                dpTipoDespesa.ClearSelection();
                dpTipoDespesa.Items.FindByText(op.ccDescricao).Selected = true;
                if (op.cdEmissao.HasValue)
                {
                    tbDespesaDataNF.Text = op.cdEmissao.Value.ToString("yyyy-MM-dd");
                }
                else
                {
                    tbDespesaDataNF.Text = "";
                }
                tbDespesaObs.Text = op.observacao;

            }
            else if (tipo == "Receita")
            {
                Receita rec = Receita.ListarPorID(op.ID);

                scriptModal = "EditReceita()";
                dpTipoReceita.ClearSelection();
                dpTipoReceita.Items.FindByText(op.ccDescricao).Selected = true;

                if (op.cdEmissao.HasValue)
                {
                    tbReceitaDataNF.Text = op.cdEmissao.Value.ToString("yyyy-MM-dd");
                }
                else
                { 
                    tbReceitaDataNF.Text = "";
                }

                if (op.cdPagamento.HasValue)
                {
                    tbReceitaDataPgtoNF.Text = op.cdPagamento.Value.ToString("yyyy-MM-dd");
                }
                else
                {
                    tbReceitaDataPgtoNF.Text = "";
                }

                if (op.cvNF.HasValue)
                {
                    tbReceitaNF.Text = op.cvNF.Value.ToString();
                }
                else
                {
                    tbReceitaNF.Text = "";
                }

                if (rec.cvValorPago.HasValue)
                {
                    tbReceitaNFValorPG.Text = ConvertMoney(rec.cvValorPago.ToString());
                }
                else
                {
                    tbReceitaNFValorPG.Text = "";
                }

                tbReceitaDesconto.Text = rec.cvDesconto.ToString();

                tbReceitaDataNF.Enabled = true;
                tbReceitaDataPgtoNF.Enabled = true;
                tbReceitaNFValorPG.Enabled = true;
                tbReceitaNF.Enabled = true;
                chkIssRetido.Enabled = true;
                chkIssRetido.Checked = rec.cbIssRetido;

            }

            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", scriptModal, true);
        }
        private string ConvertMoney(string v)
        {
            if (!v.Contains(','))
            {
                v += "00";
            }
            else
            {
                var vt = v.Split(',');
                if (vt.Length == 2)
                {
                    if (vt[1].Length == 1)
                    {
                        v += "0";
                    }
                }
            }
            return v.Replace("-","");
        }
        private void CarregarModalRepasse(int idOperacao, string tipo)
        {
            Receita rr = Receita.ListarPorID(idOperacao);
            HddValorDisponivel.Value = rr.cvValorDisponivel.Value.ToString();
            tbValorPago.Text = ConvertMoney(rr.cvValorPago.ToString());
            tbValorNF.Text = ConvertMoney(rr.cvValor.ToString());
            tbValorRepassado.Text = ConvertMoney(rr.cvValorRepassado.ToString());

            //tbValorRepassado.Text = ConvertMoney((rr.cvValorPago - rr.cvValorDisponivel).ToString());
            tbDtRepasse.Text = DateTime.Now.ToString("yyyy-MM-dd");
            if (rr.cvValorDisponivel < 0)
            {
                HddValorNegativo.Value = "1";
                tbValorDisponivel.Text = ConvertMoney("0");

            }
            else
            { 
                HddValorNegativo.Value = "0";
                tbValorDisponivel.Text = ConvertMoney(HddValorDisponivel.Value);
            }

            string scriptModal = $"formatValorDisponivel('{HddValorNegativo.Value}'); $('#repasseMedicoModal').modal('show')";
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", scriptModal, true);
        }
        protected void btNovaOperacao_Click(object sender, EventArgs e)
        {
            string scriptModal = "$('#operacaoModal').modal('show')";
            idHiddenOperacao.Value = "";
            tbValorDisponivel.Text = "";
            tbValorOperacao.Text = "";

            tbReceitaDataNF.Text = "";
            tbReceitaDataNF.Enabled = false;
            tbReceitaNF.Text = "";
            tbReceitaNF.Enabled = false;
            tbReceitaDataPgtoNF.Text = "";
            tbReceitaDataPgtoNF.Enabled = false;
            tbReceitaNFValorPG.Text = "";
            tbReceitaNFValorPG.Enabled = false;
            tbReceitaDesconto.Text = "";
            tbReceitaDesconto.Enabled = false;
            chkIssRetido.Checked = false;
            chkIssRetido.Enabled = false;
            dpTipoDespesa.ClearSelection();
            dpTipoDespesa.Items.FindByValue("0").Selected = true;
            dpTipoReceita.ClearSelection();
            dpTipoReceita.Items.FindByValue("0").Selected = true;

            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", scriptModal, true);

        }
        protected void bdAddRepasse_Click(object sender, EventArgs e)
        {
            string Usuario = "Franklim";
            ReceitaRepasse rr = new ReceitaRepasse();
            rr.IdProfissional = int.Parse(dpSelectProfissional.SelectedValue);
            rr.cvValor = float.Parse(tbValorDisponivel.Text);
            rr.idReceita = int.Parse(idHiddenOperacao.Value);
            string scriptModal = null;

            if (!rr.Adicionar(Usuario))
            {
                scriptModal = string.Format($"alert('Falha na operação!'); formatValorDisponivel('{HddValorNegativo.Value}'); $('#repasseMedicoModal').modal('show')");
                ScriptManager.RegisterStartupScript(this.Page, GetType(), "", scriptModal, true);
            }
            else
            {
                gvRepasseMedico.DataBind();
                gvOperacoes.DataBind();
                CarregarModalRepasse(rr.idReceita, "Receita");
            }

        }

        protected void btAplicarFiltro_Click(object sender, EventArgs e)
        {
            gvOperacoes.DataSourceID = "";
            bool status = bool.Parse(chkStatus.SelectedValue);
            bool arquivado = bool.Parse(chkArquivado.SelectedValue);
            DateTime? dtIni = null;
            DateTime? dtFin = null;

            if (!dtInicio.Text.IsNullOrWhiteSpace())
            {
                dtIni = DateTime.Parse(dtInicio.Text);
            }

            if (!dtFim.Text.IsNullOrWhiteSpace())
            {
                dtFin = DateTime.Parse(dtFim.Text);
            }

            gvOperacoes.DataSource = Operacao.Listar(arquivado, status, dtIni, dtFin);
            gvOperacoes.DataBind();
        }

        protected void dpTipoReceita_TextChanged(object sender, EventArgs e)
        {
            Clinica c = Clinica.ListarPorID(int.Parse(dpTipoReceita.SelectedValue));

            tbReceitaDesconto.Text = c.cvDescontos.ToString();
            tbReceitaDesconto.Enabled = true;
            if (c.cvISS > 0)
            {
                chkIssRetido.Checked = true;
                chkIssRetido.Enabled = true;
            }
            else
            {
                chkIssRetido.Checked = false;
                chkIssRetido.Enabled = true;
            }
            string scriptModal = "$('#operacaoModal').modal('show')";

            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", scriptModal, true);
        }

       
    }
}