using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
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
                    CarregarModalPessoal();
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

        private void CarregarModalPessoal()
        {
            //medicoModal

            string scriptModal = @"$('#medicoModal').modal('show')";
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", scriptModal, true);
        }
        #endregion

    }
}