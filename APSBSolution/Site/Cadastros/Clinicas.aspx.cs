using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Ajax.Utilities;
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
            if (tbIdClinica.Value.IsNullOrWhiteSpace())
            {
                result = c.Adicionar("Franklim");
            }
            else
            {
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
            bool result = Clinica.Excluir("Franklim",idClinica);

            if (result)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('Registro excluído com sucesso!');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('Falha ao excluir o registro!');", true);
            }
        }

       
        protected void btEditarGrid_Click(object sender, EventArgs e)
        {
            var teste = "";
            //var obj = e.CommandArgument;
            //int idClinica = int.Parse(gvClinicas.Rows[int.Parse(e.CommandArgument.ToString())].Cells[13].Text);
            //Clinica c = Clinica.ListarPorID(idClinica);

            //tbApelido.Text = c.ccApelido;
            //tbRazaoSocial.Text = c.ccRazaoSocial;
            //tbClinicaNomeFantasia.Text = c.ccNomeFantasia;
            //tbClinicaEmail.Text = c.ccEmail;

            //tbClinicaISS.Text = c.cvISS.ToString();
            //tbDescontos.Text = c.cvDescontos.ToString();
            //dpBancoClinica.ClearSelection();
            //dpBancoClinica.Items.FindByText(c.ccBanco).Selected = true;
            //chDescontoVariavel.Checked = c.cbDescontoVariavel;
            //tbObsClinica.Text = c.ccObservacao;
        }
    }
}