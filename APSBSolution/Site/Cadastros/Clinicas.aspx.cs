using System;
using System.Collections.Generic;
using System.Text;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Ajax.Utilities;
using Site.Classes;
using Newtonsoft.Json;

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
            HiddenUser.Value = User.Identity.Name;
        }

        private void CarregarItens()
        {
            List<Profissional> listaProfissionais = Profissional.ListaDropDown();

            //dpBancoClinica.DataSource = Banco.Listar();
            //dpSelectProfissional.DataSource = listaProfissionais;
            //dpSelectProfissional.DataValueField = "IdProfissional";
            //dpSelectProfissional.DataTextField = "ccNome";
            //dpSelectProfissional.DataBind();

            //dpSelectProfissional.Items.Add(new ListItem("Selecionar..."));
            //dpSelectProfissional.Items.FindByText("Selecionar...").Selected = true;


            //StringBuilder sb = new StringBuilder();

            //foreach (var p in listaProfissionais)
            //{
            //    sb.AppendLine($"$('#dsProfissionais').append(\"<option value = '{p.ccNome}'>\");");
            //}
            //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", sb.ToString(), true);

        }
        protected void gvProfissionalClinica_PreRender(object sender, EventArgs e)
        {
            if (gvProfissionalClinica.Rows.Count > 0)
            {
                gvProfissionalClinica.UseAccessibleHeader = true;
                gvProfissionalClinica.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }
        protected void gvClinicas_PreRender(object sender, EventArgs e)
        {
            // You only need the following 2 lines of code if you are not 
            // using an ObjectDataSource of SqlDataSource

            if (gvClinicas.Rows.Count == 0 || idHiddenChange.Value == "1")
            {
                if (bool.Parse(chkStatus.SelectedValue))
                {
                    gvClinicas.DataSource = Clinica.Listar();
                }
                else
                {
                    gvClinicas.DataSource = Clinica.Listar(false);
                }
                idHiddenChange.Value = "0";
                gvClinicas.DataBind();
            }
           


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
            string user = User.Identity.Name.Substring(0, User.Identity.Name.IndexOf("@"));
            //Validar CNPJ
            if (IsCnpj(tbCNPJ.Text))
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
                if (chDescontoVariavel.Checked)
                {
                    c.cbDescontoVariavel = chDescontoVariavel.Checked;


                    c.cvValorCorte = ConvertDouble(tbValorCorte.Value);
                    c.cvValorMaior = ConvertDouble(tbTaxaMaior.Value);
                    c.cvValorMenor = ConvertDouble(tbTaxaMenor.Value);
                    
                }
                c.ccObservacao = tbObsClinica.Text;
                c.cvCNPJ = long.Parse(tbCNPJ.Text);
                c.cvPgtoDias = int.Parse(tbPgtoDias.Text);
                if (idHiddenClinica.Value.IsNullOrWhiteSpace())
                {
                    result = c.Adicionar(user);
                    idHiddenChange.Value = "1";
                }
                else
                {
                    c.idClinica = int.Parse(idHiddenClinica.Value);
                    result = c.Salvar(user);
                    idHiddenChange.Value = "1";
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
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('Informe um CNPJ válido!');$('#clinicaModal').modal('show');", true);
            }

        }

        private double? ConvertDouble(string Value)
        {
            double? valor = null;
            if (Value.Length >= 3 && !Value.IsNullOrWhiteSpace())
            {
                if (double.TryParse(Value.Insert(Value.Length - 2, ","), out double c1))
                {
                    valor = c1;
                }
            }
            else
            {
                if (double.TryParse(Value, out double c5))
                    valor = c5;
            }
            return valor;
        }

        protected void gvClinicas_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            var obj = e.CommandArgument;
            int idClinica = int.Parse(gvClinicas.Rows[int.Parse(e.CommandArgument.ToString())].Cells[0].Text);
            idHiddenClinica.Value = idClinica.ToString();

            HiddenClinicaName.Value = gvClinicas.Rows[int.Parse(e.CommandArgument.ToString())].Cells[1].Text;
            HiddenClinicaDesconto.Value = gvClinicas.Rows[int.Parse(e.CommandArgument.ToString())].Cells[11].Text;
            string user = User.Identity.Name.Substring(0, User.Identity.Name.IndexOf("@"));

            bool result = false;

            switch (e.CommandName)
            {
                case "Excluir":
                    result = Clinica.Excluir(user, idClinica);
                    if (result)
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('Registro excluído com sucesso!');", true);
                        idHiddenChange.Value = "1";
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
            //dpSelectProfissional.DataSource = Profissional.ListaDropDown();
            //dpSelectProfissional.DataValueField = "idProfissional";
            //dpSelectProfissional.DataTextField = "ccNome";
            tbTextClinica.Text = $" - {HiddenClinicaName.Value} ({HiddenClinicaDesconto.Value}%)";


            List<ClinicaProfissional> lista = ClinicaProfissional.Listar(idClinica);
            if (lista.Count == 0)
            {
                lista.Add(new ClinicaProfissional());
            }
            gvProfissionalClinica.DataSource = lista;
            gvProfissionalClinica.DataBind();

            //dpSelectProfissional.ClearSelection();
            //dpSelectProfissional.Items.FindByValue("Selecionar...").Selected = true;
            tbObsProfissional.Text = "";
            tbValorRepasse.Text = "10";

            string profissionalModal = @"$('#profissionalModal').modal('show')";
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", profissionalModal, true);
        }

        private void CarregarModalClinica(int idClinica)
        {

            StringBuilder sbRequireds = new StringBuilder();
            //string clinicaModal = @"$('#clinicaModal').modal('show');";

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
            tbCNPJ.Text = c.cvCNPJ.ToString("00000000000000");
            if (c.ccDescontoVariavel == "Sim")
            {
                chDescontoVariavel.Checked = true;
                tbValorCorte.Value = ConvertMoney(c.cvValorCorte.ToString());
                tbTaxaMenor.Value = ConvertMoney(c.cvValorMenor.ToString());
                tbTaxaMaior.Value = ConvertMoney(c.cvValorMaior.ToString());
                sbRequireds.AppendLine("$('#MainContent_divDescontoVariavel').collapse('show')");
            }
            else
            {
                chDescontoVariavel.Checked = false;
                tbValorCorte.Value  = "";
                tbTaxaMenor.Value   = "";
                tbTaxaMaior.Value = "";
                sbRequireds.AppendLine("$('#MainContent_divDescontoVariavel').collapse('hide')");
            }
            tbObsClinica.Text = c.ccObservacao;


            //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", clinicaModal, true);

            sbRequireds.AppendLine("$('#MainContent_tbApelido').attr('required',true);");
            sbRequireds.AppendLine("$('#MainContent_tbRazaoSocial').attr('required',true);");
            sbRequireds.AppendLine("$('#MainContent_tbNomeFantasia').attr('required',true);");
            sbRequireds.AppendLine("$('#MainContent_tbCNPJ').attr('required',true);");
            
            
            sbRequireds.AppendLine("$('#clinicaModal').modal('show');");


            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", sbRequireds.ToString(), true);
            //Page.RegisterStartupScript("", sbRequireds.ToString());
        }

        [WebMethod]
        public static string OnSubmit()
        {
            return "Hello";
        }

        [WebMethod]
        public static bool SalvarRelacao(string idClinica, string idProfissional, string taxa, string observacao, string user)
        {
            //strin user = User.Identity.Name;

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
            string user = User.Identity.Name.Substring(0, User.Identity.Name.IndexOf("@"));

            bool result = false;

            switch (e.CommandName)
            {
                case "Excluir":
                    result = ClinicaProfissional.Excluir(user, idRelacao);
                    if (result)
                    {
                        //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('Registro excluído com sucesso!');", true);
                        CarregarModalRelacao(int.Parse(idHiddenClinica.Value));
                        idHiddenChange.Value = "1";
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

        //Métodos Auxiliares


        public static bool IsCnpj(string cnpj)
        {
            int[] multiplicador1 = new int[12] { 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2 };
            int[] multiplicador2 = new int[13] { 6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2 };
            int soma;
            int resto;
            string digito;
            string tempCnpj;
            cnpj = cnpj.Trim();
            cnpj = cnpj.Replace(".", "").Replace("-", "").Replace("/", "");
            if (cnpj.Length != 14)
                return false;
            tempCnpj = cnpj.Substring(0, 12);
            soma = 0;
            for (int i = 0; i < 12; i++)
                soma += int.Parse(tempCnpj[i].ToString()) * multiplicador1[i];
            resto = (soma % 11);
            if (resto < 2)
                resto = 0;
            else
                resto = 11 - resto;
            digito = resto.ToString();
            tempCnpj = tempCnpj + digito;
            soma = 0;
            for (int i = 0; i < 13; i++)
                soma += int.Parse(tempCnpj[i].ToString()) * multiplicador2[i];
            resto = (soma % 11);
            if (resto < 2)
                resto = 0;
            else
                resto = 11 - resto;
            digito = digito + resto.ToString();
            return cnpj.EndsWith(digito);
        }

        protected void btAplicarFiltro_Click(object sender, EventArgs e)
        {
            bool status = bool.Parse(chkStatus.SelectedValue);

            gvClinicas.DataSource = Clinica.Listar(status);
            gvClinicas.DataBind();
        }

        [WebMethod]
        public static List<ProfissionalDP> ListarProfissionalDP()
        {
            List<Profissional> lista =  Profissional.ListaDropDown();
            List<ProfissionalDP> listaDP = new List<ProfissionalDP>();

            foreach (var item in lista)
            {
                listaDP.Add(new ProfissionalDP(item.IdProfissional, item.ccNome));
            }

            return listaDP;
        }

        [WebMethod]
        public static int GetIdByName(string name)
        {
            return Profissional.GetIDByName(name);
        }

        private static string ConvertMoney(string v)
        {
            if (!v.Contains(","))
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
            return v.Replace("-", "");
        }


    }

    public class ProfissionalDP
    {
        public int idProfissional { get; set; }
        public string ccNome { get; set; }
        public ProfissionalDP(int id, string nome)
        {
            this.idProfissional = id;
            this.ccNome = nome;
        }
    }
}