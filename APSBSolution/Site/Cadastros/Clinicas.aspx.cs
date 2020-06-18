using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Ajax.Utilities;
using Microsoft.Reporting.Map.WebForms.BingMaps;
using Microsoft.ReportingServices.ReportProcessing.ReportObjectModel;
using Simple.Data;
using Site.Classes;

namespace Site.Cadastros
{
    public partial class Clinicas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CarregarItens();
            }
        }

        private void CarregarItens()
        {
            //dpBancoClinica.DataSource = Banco.Listar();
            dpSelectProfissional.DataSource = Profissional.ListaDropDown();
            dpSelectProfissional.DataValueField = "cvIdProfissional";
            dpSelectProfissional.DataTextField = "ccNome";
            dpSelectProfissional.DataBind();

            dpSelectProfissional.Items.Add(new ListItem("Selecionar..."));
            dpSelectProfissional.Items.FindByText("Selecionar...").Selected = true;
            
        }

        protected void gvClinicas_PreRender(object sender, EventArgs e)
        {
            // You only need the following 2 lines of code if you are not 
            // using an ObjectDataSource of SqlDataSource
            gvClinicas.DataSource = Clinica.Listar();
            gvClinicas.DataBind();

            if (gvClinicas.Rows.Count > 0)
            {
                //This replaces <td> with <th> and adds the scope attribute
                gvClinicas.UseAccessibleHeader = true;

                //This will add the <thead> and <tbody> elements
                gvClinicas.HeaderRow.TableSection = TableRowSection.TableHeader;

                //This adds the <tfoot> element. 
                //Remove if you don't have a footer row
                //gvClinicas.FooterRow.TableSection = TableRowSection.TableFooter;
            }
        }

        protected void btNovaClinica_Click(object sender, EventArgs e)
        {
        }

        protected void btSalvar_Click(object sender, EventArgs e)
        {
            Clinica c = new Clinica();
            bool result;

            c.ccApelido = tbApelido.Text;
            c.ccRazaoSocial = tbRazaoSocial.Text;
            c.ccNomeFantasia = tbClinicaNomeFantasia.Text;
            c.ccEmail = tbClinicaEmail.Text;
            if (tbClinicaISS.Text == "")
            {
                c.cvISS = 0;
            }
            else
            {
                c.cvISS = double.Parse(tbClinicaISS.Text);
            }
            if (tbDescontos.Text == "")
            {
                c.cvDescontos = 0;
            }
            else
            {
                c.cvDescontos = double.Parse(tbDescontos.Text);
            }
            c.cvIdBanco = int.Parse(dpBancoClinica.SelectedValue);
            c.cbDescontoVariavel = chDescontoVariavel.Checked;
            c.ccObservacao = tbObsClinica.Text;

            if (idHiddenClinica.Value.IsNullOrWhiteSpace())
            {
                result = c.Adicionar("Franklim");
            }
            else
            {
                c.idClinica = int.Parse(idHiddenClinica.Value);
                result = c.Salvar("Franklim");
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

        protected void gvClinicas_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            var obj = e.CommandArgument;
            int idClinica = int.Parse(gvClinicas.Rows[int.Parse(e.CommandArgument.ToString())].Cells[13].Text);
            idHiddenClinica.Value = idClinica.ToString();
            string user = "Franklim";

            bool result = false;

            switch (e.CommandName)
            {
                case "Excluir":
                    result = Clinica.Excluir(user, idClinica);
                    if (result)
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('Registro excluído com sucesso!');", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('Falha ao excluir o registro!');", true);
                    }
                    break;
                case "Editar":
                    CarregarModalClinica(idClinica);
                  
                    break;
                case "Associar":
                    CarregarModalRelacao(idClinica);
                    
                    break;
                default:
                    break;
            }

           
        }

        private void CarregarModalRelacao(int idClinica)
        {
            dpSelectProfissional.DataSource = Profissional.ListaDropDown();
            dpSelectProfissional.DataValueField = "idProfissional";
            dpSelectProfissional.DataTextField = "ccNome";


            List<ClinicaProfissional> lista = ClinicaProfissional.Listar(idClinica);
            if (lista.Count == 0)
            {
                lista.Add(new ClinicaProfissional());
            }
            gvProfissionalClinica.DataSource = lista;
            gvProfissionalClinica.DataBind();

            dpSelectProfissional.ClearSelection();
            dpSelectProfissional.Items.FindByValue("Selecionar...").Selected = true;
            tbObsProfissional.Text = "";
            tbValorRepasse.Text = "10";

            string profissionalModal = @"$('#profissionalModal').modal('show')";
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", profissionalModal, true);
        }

        private void CarregarModalClinica(int idClinica)
        {
            string clinicaModal = @"$('#clinicaModal').modal('show')";
            Clinica c = Clinica.ListarPorID(idClinica);
            tbApelido.Text = c.ccApelido;
            tbRazaoSocial.Text = c.ccRazaoSocial;
            tbClinicaNomeFantasia.Text = c.ccNomeFantasia;
            tbClinicaEmail.Text = c.ccEmail;
            tbClinicaISS.Text = c.cvISS.ToString();
            tbDescontos.Text = c.cvDescontos.ToString();
            dpBancoClinica.ClearSelection();
            dpBancoClinica.Items.FindByText(c.ccBanco).Selected = true;
            tbPgtoDias.Text = c.cvPgtoDias.ToString();
            if (c.ccDescontoVariavel == "Sim")
            {
                chDescontoVariavel.Checked = true;
            }
            else
            {
                chDescontoVariavel.Checked = false;
            }
            tbObsClinica.Text = c.ccObservacao;


            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", clinicaModal, true);
        }

        [WebMethod]
        public static string OnSubmit()
        {
            return "Hello";
        }

        [WebMethod]
        public static bool SalvarRelacao(string idClinica, string idProfissional, string taxa, string observacao)
        {
            //strin user = User.Identity.Name;
            string user = "Franklim";

            if (taxa.Contains("."))
            {
                taxa = taxa.Replace(".", ",");
            }

            ClinicaProfissional cp = new ClinicaProfissional(int.Parse(idClinica), int.Parse(idProfissional), double.Parse(taxa), observacao);
            bool result = cp.Adicionar(user);
            return result;
        }

        protected void gvProfissionalClinica_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            var obj = e.CommandArgument;
            int idRelacao = int.Parse(gvProfissionalClinica.Rows[int.Parse(e.CommandArgument.ToString())].Cells[0].Text);
            string user = "Franklim";

            bool result = false;

            switch (e.CommandName)
            {
                case "Excluir":
                    result = ClinicaProfissional.Excluir(user, idRelacao);
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


        //protected void AdicionarRelacao(string user)
        //{
        //    ClinicaProfissional cp = new ClinicaProfissional(int.Parse(idHiddenClinica.Value), int.Parse(dpSelectProfissional.SelectedValue), double.Parse(tbValorRepasse.Text), tbObsProfissional.Text);
        //    bool result = cp.Adicionar(user);
        //    if (result)
        //    {
        //        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('Registro salvo com sucesso!');", true);
        //    }
        //    else
        //    {
        //        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('Falha ao salvar o registro!');", true);
        //    }
        //}

        //protected void btSalvarRelacao_Click(object sender, EventArgs e)
        //{
        //    if (idHiddenClinica.Value != "")
        //    {
        //        foreach (GridViewRow r in gvProfissionalClinica.Rows)
        //        {
        //            string status = r.Cells[3].Text;
        //        }
        //    }
        //}
    }
}