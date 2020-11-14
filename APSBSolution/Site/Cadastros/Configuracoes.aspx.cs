using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Site.Cadastros
{
    public partial class Configurações : System.Web.UI.Page
    {
        static Models.dbapsbEntities db;

        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CarregarCategoriaDespesas();
                db =  new Models.dbapsbEntities();
            }
        }
        private void CarregarCategoriaDespesas()
        {
            Models.dbapsbEntities db = new Models.dbapsbEntities();

            var categorias = db.tbDespesasCategoria.Where(x => x.cbStatus == true).ToList();
            gvCategoriasDespesas.DataSource = categorias;
            gvCategoriasDespesas.DataBind();

            dpCategorias.DataSource = categorias;
            dpCategorias.DataBind();

            var tiposCategorias = db.tbDespesaTipo.Where(x => x.cbStatus == true).ToList().Join(categorias, tipo => tipo.idCategoria, categoria => categoria.idCategoria, (tipo, categoria) => new { tipo.idTipo, tipo.ccTipo, tipo.cdDataCriacao, categoria.ccCategoria }).ToList();
            gvtiposDespesas.DataSource = tiposCategorias;
            gvtiposDespesas.DataBind();
        }

        protected void btnSalvarCategoria_Click(object sender, EventArgs e)
        {
            if (tbNovaCategoria.Text != "")
            {
               
                Models.tbDespesasCategoria novaCategoria = new Models.tbDespesasCategoria();
                novaCategoria.ccCategoria = tbNovaCategoria.Text;
                novaCategoria.cdCriacao = DateTime.Now;
                novaCategoria.ccUsuario = User.Identity.Name.Split('@')[0];
                novaCategoria.cbStatus = true;

                db.tbDespesasCategoria.Add(novaCategoria);
                try
                {
                    db.SaveChanges();
                    CarregarCategoriaDespesas();
                }
                catch (Exception ex)
                {

                    ScriptManager.RegisterStartupScript(this.Page, GetType(), "", $"alert('Erro ao registrar nova categoria: {ex.Message}')", true);
                }
                
            }
        }
        protected void btnSalvarTipo_Click(object sender, EventArgs e)
        {
            if (tbNovoTipo.Text != "")
            {
                Models.tbDespesaTipo novoTipo = new Models.tbDespesaTipo();
                novoTipo.ccTipo = tbNovoTipo.Text;
                novoTipo.idCategoria = int.Parse(dpCategorias.SelectedValue);
                novoTipo.cdDataCriacao = DateTime.Now;
                novoTipo.ccUsuario = User.Identity.Name.Split('@')[0];
                novoTipo.cbStatus = true;

                db.tbDespesaTipo.Add(novoTipo);
                try
                {
                    db.SaveChanges();
                    CarregarCategoriaDespesas();
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this.Page, GetType(), "", $"alert('Erro ao registrar nova categoria: {ex.Message}')", true);
                }
            }
        }
        protected void gvCategoriasDespesas_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int idCategoriaDespesa = int.Parse(gvCategoriasDespesas.Rows[e.RowIndex].Cells[1].Text);
            Models.tbDespesasCategoria cat = db.tbDespesasCategoria.Where(x => x.idCategoria == idCategoriaDespesa).FirstOrDefault();
            cat.cbStatus = false;
            try
            {
                db.SaveChanges();
                CarregarCategoriaDespesas();
            }
            catch (Exception ex)
            {

                ScriptManager.RegisterStartupScript(this.Page, GetType(), "", $"alert('Erro ao registrar nova categoria: {ex.Message}')", true);
            }
        }
        protected void gvtiposDespesas_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int idTipoDespesa = int.Parse(gvtiposDespesas.Rows[e.RowIndex].Cells[1].Text);
            Models.tbDespesaTipo tipo = db.tbDespesaTipo.Where(x => x.idTipo == idTipoDespesa).FirstOrDefault();
            tipo.cbStatus = false;
            try
            {
                db.SaveChanges();
                CarregarCategoriaDespesas();
            }
            catch (Exception ex)
            {

                ScriptManager.RegisterStartupScript(this.Page, GetType(), "", $"alert('Erro ao registrar nova categoria: {ex.Message}')", true);
            }
        }

        protected void gvCategoriasDespesas_PreRender(object sender, EventArgs e)
        {
            if (gvCategoriasDespesas.Rows.Count > 0)
            {
                //This replaces <td> with <th> and adds the scope attribute
                gvCategoriasDespesas.UseAccessibleHeader = true;

                //This will add the <thead> and <tbody> elements
                gvCategoriasDespesas.HeaderRow.TableSection = TableRowSection.TableHeader;

                //This adds the <tfoot> element. 
                //Remove if you don't have a footer row
                //gvClinicas.FooterRow.TableSection = TableRowSection.TableFooter;
            }
        }
    }
}