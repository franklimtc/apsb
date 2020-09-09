using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Text;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Ajax.Utilities;
using Microsoft.SqlServer.Server;
using Site.Classes;


namespace Site.Cadastros
{
    public partial class Medicos : System.Web.UI.Page
    {
        static CultureInfo culture;
        static DateTimeStyles styles;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Parse a date and time with no styles.
            culture = CultureInfo.CreateSpecificCulture("pt-BR");
            styles = DateTimeStyles.None;
        }

        protected void gvMedicos_PreRender(object sender, EventArgs e)
        {
            gvMedicos.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

        protected void gvMedicos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int idLinha = int.Parse(e.CommandArgument.ToString());
            int idProfissional = int.Parse(gvMedicos.Rows[idLinha].Cells[0].Text);
            nameProfissional.Value = gvMedicos.Rows[idLinha].Cells[1].Text;

            idHiddenMedico.Value = idProfissional.ToString();
            string user = "Franklim";

            bool result = false;

            gvMedicos.HeaderRow.TableSection = TableRowSection.TableHeader;

            switch (e.CommandName)
            {
                case "Editar":
                    CarregarModalPessoal(idProfissional);
                    break;
                case "EdProfissionais":
                    CarregarModalProfissional(idProfissional);
                    break;
                case "EdEndereco":
                    CarregarModalEndereco(idProfissional);
                    break;
                case "EdBanco":
                    CarregarModalBanco(idProfissional);
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

            List<ProfissionalArquivo> Lista = ProfissionalArquivo.Listar(idHiddenMedico.Value);
            nameArquivos.Text = nameProfissional.Value;
            if (Lista.Count == 0)
            {
                Lista.Add(new ProfissionalArquivo());
            }
            gvProfissionalArquivo.DataSource = Lista;
            gvProfissionalArquivo.DataBind();

            string scriptModal = @"$('#arquivosModal').modal('show')";
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", scriptModal, true);
        }

        private void CarregarModalBanco(int idProfissional)
        {
            //bancoModal
            List<ProfissionalBanco> Lista = ProfissionalBanco.Listar(idProfissional);
            dpProfissionalBanco.ClearSelection();
            tbAgencia.Text = "";
            tbConta.Text = "";
            tbOperacao.Text = "";

            if (Lista.Count == 0)
            {
                Lista.Add(new ProfissionalBanco());
            }
            gvProfissionalBanco.DataSource = Lista;
            gvProfissionalBanco.DataBind();

            string scriptModal = @"$('#bancoModal').modal('show')";
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", scriptModal, true);
        }

        private void CarregarModalEndereco(int idProfissional)
        {
            //moradiaModal
            ProfissionalEndereco pde = ProfissionalEndereco.ListarPorID(idProfissional);
            if (pde != null)
            {
                idHiddenProfissionalEndereco.Value = pde.IdEndereco.ToString();
                tbEndereço.Text = pde.ccEndereco;
                tbBairro.Text = pde.ccBairro;
                tbEnderecoCidade.Text = pde.ccCidade;
                tbCep.Text = pde.cvCEP.ToString();
                dpEnderecoUF.ClearSelection();
                dpEnderecoUF.Items.FindByValue(pde.ccUF).Selected = true;
            }
            else
            {
                idHiddenProfissionalEndereco.Value = "";
                tbEndereço.Text = "";
                tbBairro.Text = "";
                tbEnderecoCidade.Text = "";
                tbCep.Text = "";
                dpEnderecoUF.ClearSelection();
                dpEnderecoUF.Items.FindByValue("00").Selected = true;
            }

            string scriptModal = @"$('#moradiaModal').modal('show')";
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", scriptModal, true);
        }

        private void CarregarModalProfissional(int idProfissional)
        {
            //profissionalModal
            ProfissionalDados pd = ProfissionalDados.ListarPorID(idProfissional);
            if (pd != null)
            {
                idHiddenProfissionalDado.Value = pd.IdDadoProfissional.ToString();
                tbFormacao.Text = pd.ccFormacao;
                dpEspecialidade.ClearSelection();
                dpEspecialidade.Items.FindByText(pd.ccEspecialidade).Selected = true;
                tbPosGraduacao.Text = pd.ccPosGraduacao;
                tbConselhoRegional.Text = pd.ccConselho;
                tbNumInscricaoConselho.Text = pd.cvNumInscricao.ToString();
                tbTituloEleitor.Text = pd.cvTitulo.ToString();
                tbZonaEleitor.Text = pd.cvTituloZona.ToString();
                tbSecaoEleitor.Text = pd.cvTituloSecao.ToString();
                tbReservista.Text = pd.cvReservista.ToString();
                tbPisPasep.Text = pd.cvPIS.ToString();

            }
            else
            {
                idHiddenProfissionalDado.Value = "";
                tbFormacao.Text = "";
                dpEspecialidade.ClearSelection();
                dpEspecialidade.Items.FindByValue("1").Selected = true;
                tbPosGraduacao.Text = "";
                tbConselhoRegional.Text = "";
                tbNumInscricaoConselho.Text = "";
                tbTituloEleitor.Text = "";
                tbZonaEleitor.Text = "";
                tbSecaoEleitor.Text = "";
                tbReservista.Text = "";
                tbPisPasep.Text = "";
                tbdtEmissaoRG.Text = "";
                tbDataNascimento.Text = "";
            }

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
            tbCPF.Text = editProf.CPFNum.ToString("00000000000");
            tbEmail.Text = editProf.ccEmail;
            tbTelefone.Text = editProf.cvTelefone.ToString();
            tbCelular.Text = editProf.cvCelular.ToString();
            tbObservacoes.Text = editProf.Observacoes;
            DateTime? dtdefault = new DateTime();
            if (editProf.RGdtEmissao.HasValue)
            {
                tbdtEmissaoRG.Text = editProf.RGdtEmissao.Value.ToString("dd/MM/yyyy");
            }
            if (editProf.dtNascimento.HasValue)
            {
                tbDataNascimento.Text = editProf.dtNascimento.Value.ToString("dd/MM/yyyy");
            }
            if (editProf.cdPgtoTaxa.HasValue)
            {
                tbPgtoTaxa.Text = editProf.cdPgtoTaxa.Value.ToString("dd/MM/yyyy");
            }
            if (editProf.cdFiliacao.HasValue)
            {
                tbFiliacao.Text = editProf.cdFiliacao.Value.ToString("dd/MM/yyyy");
            }
            if (editProf.cdRegCartorio.HasValue)
            {
                tbRegCartorio.Text = editProf.cdRegCartorio.Value.ToString("dd/MM/yyyy");
            }

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
            //if (DateTime.TryParse(tbdtEmissaoRG.Text, out DateTime newDate))
            if (!tbdtEmissaoRG.Text.IsNullOrWhiteSpace())
            {
                DateTime.TryParse(tbdtEmissaoRG.Text, culture, styles, out DateTime newDate1);
                pNew.RGdtEmissao = newDate1;
            }

            pNew.CPFNum = long.Parse(tbCPF.Text);
            pNew.ccEmail = tbEmail.Text;
            if (!tbTelefone.Text.IsNullOrWhiteSpace())
                pNew.cvTelefone = long.Parse(tbTelefone.Text);
            if (!tbCelular.Text.IsNullOrWhiteSpace())
                pNew.cvCelular = long.Parse(tbCelular.Text);
            pNew.Observacoes = tbObservacoes.Text;
            //if (DateTime.TryParse(tbDataNascimento.Text, out DateTime newDate2))
            if (!tbDataNascimento.Text.IsNullOrWhiteSpace())
            {
                DateTime.TryParse(tbDataNascimento.Text, culture, styles, out DateTime newDate);
                pNew.dtNascimento = newDate;
            }

            if (!tbPgtoTaxa.Text.IsNullOrWhiteSpace())
            {
                DateTime.TryParse(tbPgtoTaxa.Text, culture, styles, out DateTime newDate);
                pNew.cdPgtoTaxa = newDate;
            }
            if (!tbFiliacao.Text.IsNullOrWhiteSpace())
            {
                DateTime.TryParse(tbFiliacao.Text, culture, styles, out DateTime newDate);
                pNew.cdFiliacao = newDate;
            }

            if (!tbRegCartorio.Text.IsNullOrWhiteSpace())
            {
                DateTime.TryParse(tbRegCartorio.Text, culture, styles, out DateTime newDate);
                pNew.cdRegCartorio = newDate;
            }

            try
            {
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
                    //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('Registro salvo com sucesso!');", true);
                    gvMedicos.DataBind();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", $"alert('Falha ao salvar o registro!)", true);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", $"alert('Falha ao salvar o registro! ERRO: {ex.Message}')", true);
            }
        }

        protected void btSalvarDados_Click(object sender, EventArgs e)
        {
            //string user = User.Identity.Name;
            string user = "Franklim";
            ProfissionalDados pd1 = new ProfissionalDados();
            if (!idHiddenProfissionalDado.Value.IsNullOrWhiteSpace())
            {
                pd1.IdDadoProfissional = int.Parse(idHiddenProfissionalDado.Value);
            }
            pd1.idProfissional = int.Parse(idHiddenMedico.Value);
            pd1.ccFormacao = tbFormacao.Text;
            pd1.ccPosGraduacao = tbPosGraduacao.Text;
            if (tbEspecialidadeNova.Text.IsNullOrWhiteSpace())
            {
                pd1.ccEspecialidade = dpEspecialidade.SelectedItem.Text;
            }
            else
            {
                Especialidade nova = new Especialidade(tbEspecialidadeNova.Text.Trim());
                nova.Adicionar(user);
                dpEspecialidade.DataBind();
                pd1.ccEspecialidade = nova.ccEspecialidade;
            }
            pd1.ccConselho = tbConselhoRegional.Text;

            if (!tbNumInscricaoConselho.Text.IsNullOrWhiteSpace())
                pd1.cvNumInscricao = long.Parse(tbNumInscricaoConselho.Text);

            if (!tbTituloEleitor.Text.IsNullOrWhiteSpace())
                pd1.cvTitulo = long.Parse(tbTituloEleitor.Text);

            if (!tbZonaEleitor.Text.IsNullOrWhiteSpace())
                pd1.cvTituloZona = int.Parse(tbZonaEleitor.Text);

            if (!tbSecaoEleitor.Text.IsNullOrWhiteSpace())
                pd1.cvTituloSecao = int.Parse(tbSecaoEleitor.Text);

            if (!tbReservista.Text.IsNullOrWhiteSpace())
                pd1.cvReservista = long.Parse(tbReservista.Text);

            if (!tbPisPasep.Text.IsNullOrWhiteSpace())
                pd1.cvPIS = long.Parse(tbPisPasep.Text);

            bool result = pd1.Salvar(user);

            if (result)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('Registro salvo com sucesso!');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('Falha ao salvar o registro!');", true);
            }
        }

        protected void btSalvarEndereco_Click(object sender, EventArgs e)
        {
            //string user = User.Identity.Name;
            string user = "Franklim";
            ProfissionalEndereco pde = new ProfissionalEndereco();
            if (!idHiddenProfissionalEndereco.Value.IsNullOrWhiteSpace())
            {
                pde.IdEndereco = int.Parse(idHiddenProfissionalEndereco.Value);
            }
            pde.ccEndereco = tbEndereço.Text;
            pde.ccBairro = tbBairro.Text;
            pde.ccCidade = tbEnderecoCidade.Text;
            pde.ccUF = dpEnderecoUF.SelectedValue;
            long.TryParse(tbCep.Text, out long nLong);
            pde.cvCEP = nLong;
            pde.idProfissional = int.Parse(idHiddenMedico.Value);

            bool result = pde.Salvar(user);

            if (result)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('Registro salvo com sucesso!');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('Falha ao salvar o registro!');", true);
            }
        }

        protected void btSalvarProfissionalBanco_Click(object sender, EventArgs e)
        {
            //string user = User.Identity.Name;
            string user = "Franklim";
            ProfissionalBanco pdb = new ProfissionalBanco();

            pdb.idProfissional = int.Parse(idHiddenMedico.Value);
            pdb.ccAgencia = tbAgencia.Text;
            pdb.ccConta = tbConta.Text;
            pdb.ccOperacao = tbOperacao.Text;
            pdb.idBanco = int.Parse(dpProfissionalBanco.SelectedValue);

            bool result = pdb.Salvar(user);

            if (result)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('Registro salvo com sucesso!');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('Falha ao salvar o registro!');", true);
            }
        }

        protected void gvProfissionalBanco_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            var obj = e.CommandArgument;
            int idProfissionalBanco = int.Parse(gvProfissionalBanco.Rows[int.Parse(e.CommandArgument.ToString())].Cells[0].Text);
            idHiddenProfissionalBanco.Value = idProfissionalBanco.ToString();
            //string user = User.Identity.Name;
            string user = "Franklim";
            bool result = false;

            switch (e.CommandName)
            {
                case "Editar":
                    ProfissionalBanco pb1 = ProfissionalBanco.Listar(int.Parse(idHiddenMedico.Value)).Find(x => x.IdProfissionalBanco == idProfissionalBanco);
                    dpProfissionalBanco.ClearSelection();
                    dpProfissionalBanco.Items.FindByValue(pb1.idBanco.ToString());
                    tbAgencia.Text = pb1.ccAgencia;
                    break;

                case "Excluir":
                    result = ProfissionalBanco.Excluir(user, idProfissionalBanco);
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

        protected void btUploadFile_Click(object sender, EventArgs e)
        {
            //string user = User.Identity.Name;
            string user = "Franklim";

            if (btUpload.HasFile)
            {
                if (btUpload.PostedFile.ContentLength < 52428800)
                {
                    string fullPath = $"{Server.MapPath("").Replace("Cadastros", "Arquivos")}\\{btUpload.PostedFile.FileName}";
                    btUpload.PostedFile.SaveAs(fullPath);

                    ProfissionalArquivo pa = new ProfissionalArquivo();
                    pa.ccNomeArquivo = btUpload.PostedFile.FileName;

                    pa.fileBytes = File.ReadAllBytes(fullPath);
                    pa.idProfissional = int.Parse(idHiddenMedico.Value);
                    bool result = pa.Salvar(user);

                    if (result)
                    {
                        //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('Registro salvo com sucesso!');", true);
                        CarregarModalArquivos();
                        File.Delete(fullPath);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('Falha ao salvar o registro!');", true);
                        CarregarModalArquivos();
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('Selecione um arquivo com tamanho inferior a 50MB!');", true);
                    CarregarModalArquivos();
                }

            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('Selecione um arquivo!');", true);
            }
        }

        protected void gvProfissionalArquivo_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            var obj = e.CommandArgument;
            int idProfissionalArquivo = int.Parse(gvProfissionalArquivo.Rows[int.Parse(e.CommandArgument.ToString())].Cells[0].Text);
            //string nomeArquivo = Server.HtmlDecode(gvProfissionalArquivo.Rows[int.Parse(e.CommandArgument.ToString())].Cells[1].Text);
            string nomeArquivo = ProfissionalArquivo.GetName(idProfissionalArquivo);
            //string user = User.Identity.Name;
            string user = "Franklim";
            bool result = false;
            switch (e.CommandName)
            {
                case "Excluir":
                    ProfissionalArquivo file = new ProfissionalArquivo();
                    file.idArquivo = idProfissionalArquivo;
                    result = file.Excluir(user);
                    if (result)
                    {
                        gvProfissionalArquivo.DataBind();
                        CarregarModalArquivos();
                    }
                    break;
                case "Baixar":
                    string fullPath = $"{Server.MapPath("").Replace("Cadastros", "Arquivos")}\\{nomeArquivo}";
                    ProfissionalArquivo.BaixarArquivo(fullPath, idProfissionalArquivo);

                    Response.ContentType = "application/pdf";
                    Response.AppendHeader("Content-Disposition", $"attachment; filename={nomeArquivo}");
                    Response.ContentEncoding = Encoding.Default;
                    Response.TransmitFile(fullPath);
                    Response.End();

                    File.Delete(fullPath);
                    CarregarModalArquivos();
                    break;
                default:
                    break;
            }
        }

        [WebMethod]
        public static bool AdicionarBanco(string _idProfissional, string ccAgencia, string ccConta, string ccOperacao, string _idBanco)
        {

            ProfissionalBanco pdb = new ProfissionalBanco();

            pdb.idProfissional = int.Parse(_idProfissional);
            pdb.ccAgencia = ccAgencia;
            pdb.ccConta = ccConta;
            pdb.ccOperacao = ccOperacao;
            pdb.idBanco = int.Parse(_idBanco);

            bool result = pdb.Salvar("API");
            return result;
        }

        protected void btAplicarFiltro_Click(object sender, EventArgs e)
        {
            bool status = bool.Parse(chkStatus.SelectedValue);

            gvMedicos.DataSource = Profissional.Listar(status);
            gvMedicos.DataBind();
        }
    }
}