using Site.Models;
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
        static Models.entity db = new Models.entity();


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CarregarTreeView();
                CarregarCategoriaDespesas();
            }
        }

        public static List<tbDespesasCategoria> ListarMenus()
        {
            List<tbDespesasCategoria> Lista = new List<tbDespesasCategoria>();
            Lista.Add(new tbDespesasCategoria { ccCategoria = "Default1", idCategoria = 1, idCategoriaPai = 0 });
            Lista.Add(new tbDespesasCategoria { ccCategoria = "Default2", idCategoria = 2, idCategoriaPai = 0 });
            Lista.Add(new tbDespesasCategoria { ccCategoria = "Default3", idCategoria = 3, idCategoriaPai = 0 });
            Lista.Add(new tbDespesasCategoria { ccCategoria = "Default4", idCategoria = 4, idCategoriaPai = 0 });
            return Lista;
        }
        public static List<tbDespesasCategoria> ListarSubMenus()
        {
            List<tbDespesasCategoria> Lista = new List<tbDespesasCategoria>();

            Lista.Add(new tbDespesasCategoria { ccCategoria = "Default11", idCategoria = 5, idCategoriaPai = 1 });
            Lista.Add(new tbDespesasCategoria { ccCategoria = "Default12", idCategoria = 6, idCategoriaPai = 1 });
            Lista.Add(new tbDespesasCategoria { ccCategoria = "Default21", idCategoria = 7, idCategoriaPai = 2 });
            Lista.Add(new tbDespesasCategoria { ccCategoria = "Default22", idCategoria = 8, idCategoriaPai = 2 });
            Lista.Add(new tbDespesasCategoria { ccCategoria = "Default23", idCategoria = 9, idCategoriaPai = 3 });


            return Lista;
        }
        private void CarregarTreeView()
        {
            //var listaMenus = db.tbDespesasCategoria.Where(x => x.idCategoriaPai == 0).ToList();
            //var listaSubMenus = db.tbDespesasCategoria.Where(x => x.idCategoriaPai > 0).ToList();

            var listaMenus = ListarMenus();
            var listaSubMenus = ListarSubMenus();

            foreach (var menu in listaMenus)
            {
                var node = new TreeNode(menu.ccCategoria,menu.idCategoria.ToString());
                node.SelectAction = TreeNodeSelectAction.None;
                node.Expanded = false;

                int countNode = 0;

                foreach (var submenu in listaSubMenus)
                {
                    if (menu.idCategoria == submenu.idCategoriaPai)
                    {
                        TreeNode _submenu = new TreeNode(submenu.ccCategoria, submenu.idCategoria.ToString());
                        _submenu.ShowCheckBox = true;
                        _submenu.SelectAction = TreeNodeSelectAction.None;
                        node.ChildNodes.Add(_submenu);
                        countNode++;
                    }
                }

                if (countNode == 0)
                    node.ShowCheckBox = true;
                else
                    node.ShowCheckBox = false;


                tvCategoriasDespesas.Nodes.Add(node);
                countNode = 0;

            }

            tvCategoriasDespesas.Attributes.Add("onclick", "postBackByObject()");
        }
        private void CarregarCategoriaDespesas()
        {
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
            var categoriaPai = tvCategoriasDespesas.CheckedNodes;
            string idCategoriaPai = "0";

            if (categoriaPai.Count > 0)
            {
                idCategoriaPai = categoriaPai[0].Value;
            }

            if (tbNovaCategoria.Text != "")
            {

                Models.tbDespesasCategoria novaCategoria = new Models.tbDespesasCategoria();
                novaCategoria.ccCategoria = tbNovaCategoria.Text;
                novaCategoria.cdCriacao = DateTime.Now;
                novaCategoria.ccUsuario = User.Identity.Name.Split('@')[0];
                novaCategoria.cbStatus = true;
                novaCategoria.idCategoriaPai = int.Parse(idCategoriaPai);
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