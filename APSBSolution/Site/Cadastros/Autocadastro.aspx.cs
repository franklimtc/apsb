using Site.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Ajax.Utilities;


namespace Site.Cadastros
{
    public partial class Autocadastro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btSalvar_Click(object sender, EventArgs e)
        {
            if (tbEmail.Text.IsNullOrWhiteSpace() || tbEmail.Text.IsNullOrWhiteSpace())
            {
                ScriptManager.RegisterStartupScript(this.Page, GetType(), "", "alert('Informe nome e email do profissional!')", true);
            }
            else
            {
                Profissional pNew = new Profissional();
                pNew.ccNome = tbName.Text;
                pNew.ccEmail = tbEmail.Text;
                //string Usuario = User.Identity.Name;
                string Usuario = "Franklim";

                if (pNew.GerarToken(Usuario))
                {
                    ScriptManager.RegisterStartupScript(this.Page, GetType(), "", "alert('Registro adicionado com sucesso!')", true);
                    gvAutocadastro.DataBind();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, GetType(), "", "alert('Falha ao adicionar registro!')", true);
                }
            }

        }

        protected void gvAutocadastro_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            var obj = e.CommandArgument;
            Token.Value = gvAutocadastro.Rows[int.Parse(e.CommandArgument.ToString())].Cells[2].Text;
            string status = gvAutocadastro.Rows[int.Parse(e.CommandArgument.ToString())].Cells[4].Text;

            string Usuario = "Franklim";
            bool result = false;
            switch (e.CommandName)
            {
                case "Excluir":
                    result = Profissional.ExcluirAuto(Usuario, Token.Value);
                    break;
                case "Ativar":
                    if (status == "Incompleto")
                    {
                        ScriptManager.RegisterStartupScript(this.Page, GetType(), "", "alert('Não é possível ativar um cadastro incompleto!');", true);
                    }
                    else
                    {
                        result = Profissional.AtivarAuto(Usuario, Token.Value);
                    }
                    break;
                default:
                    break;
            }
            if (result)
            {
                ScriptManager.RegisterStartupScript(this.Page, GetType(), "", "alert('Operação realizada com sucesso!');", true);
                gvAutocadastro.DataBind();
            }
            else if (status != "Incompleto")
            {
                ScriptManager.RegisterStartupScript(this.Page, GetType(), "", "alert('Falha na operação!');", true);
            }

        }

        protected void gvAutocadastro_PreRender(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                gvAutocadastro.DataBind();
            }

            if (gvAutocadastro.Rows.Count > 0)
            {
                //This replaces <td> with <th> and adds the scope attribute
                gvAutocadastro.UseAccessibleHeader = true;

                //This will add the <thead> and <tbody> elements
                gvAutocadastro.HeaderRow.TableSection = TableRowSection.TableHeader;

                //This adds the <tfoot> element. 
                //Remove if you don't have a footer row
                //gvClinicas.FooterRow.TableSection = TableRowSection.TableFooter;
            }
        }
    }
}