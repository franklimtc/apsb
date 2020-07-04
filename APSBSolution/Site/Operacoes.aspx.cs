﻿using Microsoft.Ajax.Utilities;
using Microsoft.SqlServer.Server;
using Simple.Data;
using Site.Classes;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Runtime.InteropServices;
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

        protected void gvOperacoes_PreRender(object sender, EventArgs e)
        {
            // You only need the following 2 lines of code if you are not 
            // using an ObjectDataSource of SqlDataSource
            if (!IsPostBack)
            {
                //gvMedicos.DataSource = Profissional.Listar();
                gvOperacoes.DataBind();
            }

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
                var listaTipo = DespesaTipo.Listar();
                listaTipo.Add(new DespesaTipo(0, "Selecionar.."));
                dpTipoDespesa.DataSource = listaTipo;
                dpTipoDespesa.DataBind();
                dpTipoDespesa.ClearSelection();
                dpTipoDespesa.Items.FindByValue("0").Selected = true;

                //Dropdown Tipo Receitas
                listaTipo = DespesaTipo.Listar("Receita");
                listaTipo.Add(new DespesaTipo(0, "Selecionar.."));
                dpTipoReceita.DataSource = listaTipo;
                dpTipoReceita.DataBind();
                dpTipoDespesa.ClearSelection();
                dpTipoDespesa.Items.FindByValue("0").Selected = true;

                //Data
                tbDespesaDataNF.Text = DateTime.Now.ToString("dd/MM/yyyy");

                // Parse a date and time with no styles.
                culture = CultureInfo.CreateSpecificCulture("pt-BR");
                styles = DateTimeStyles.None;
            }
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
                dp.cdData = DateTime.Parse(tbDespesaDataNF.Text.IfNullOrWhiteSpace(DateTime.Now.ToString("dd/MM/yyyy")), culture, styles);
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
            tbDespesaDataNF.Text = DateTime.Now.ToString("dd/MM/yyyy");
            tbDespesaObs.Text = "";
            tbSearch.Text = "";
            //Form Receitas

        }

        protected void gvOperacoes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            var obj = e.CommandArgument;
            int idOperacao = int.Parse(gvOperacoes.Rows[int.Parse(e.CommandArgument.ToString())].Cells[0].Text);
            idHiddenOperacao.Value = idOperacao.ToString();
            string operacaoTipo = gvOperacoes.Rows[int.Parse(e.CommandArgument.ToString())].Cells[7].Text;
            string user = "Franklim";

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
                    tbDespesaDataNF.Text = op.cdEmissao.Value.ToString("dd/MM/yyyy");
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
                    tbReceitaDataNF.Text = op.cdEmissao.Value.ToString("dd/MM/yyyy");
                }
                else
                { 
                    tbReceitaDataNF.Text = "";
                }

                if (op.cdPagamento.HasValue)
                {
                    tbReceitaDataPgtoNF.Text = op.cdPagamento.Value.ToString("dd/MM/yyyy");
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

            }

            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", scriptModal, true);
        }

        private string ConvertMoney(string v)
        {
            if (!v.Contains(','))
            {
                v += "00";
            }
            return v;
        }

        private void CarregarModalRepasse(int idProfissional, string tipo)
        {
            string scriptModal = "$('#repasseMedicoModal').modal('show')";
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", scriptModal, true);
        }

        protected void btNovaOperacao_Click(object sender, EventArgs e)
        {
            string scriptModal = "$('#operacaoModal').modal('show')";
            tbReceitaDesconto.Text = "6,5";
            idHiddenOperacao.Value = "";
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", scriptModal, true);

        }
    }
}