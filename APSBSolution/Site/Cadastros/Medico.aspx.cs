using Site.Classes;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Site.Cadastros
{
    public partial class Medico : System.Web.UI.Page
    {
        static CultureInfo culture;
        static DateTimeStyles styles;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Parse a date and time with no styles.
            culture = CultureInfo.CreateSpecificCulture("pt-BR");
            styles = DateTimeStyles.None;
            HiddenUser.Value = User.Identity.Name;
        }

        protected void gvMedicos_PreRender(object sender, EventArgs e)
        {
            if (gvMedicos.Rows.Count > 0)
            {
                gvMedicos.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }

        protected void gvMedicos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int idLinha = int.Parse(e.CommandArgument.ToString());
            int idProfissional = int.Parse(gvMedicos.Rows[idLinha].Cells[0].Text);
            idHiddenMedico.Value = idProfissional.ToString();
            string user = User.Identity.Name;

            bool result = false;

            switch (e.CommandName)
            {

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

        protected void btSalvar_Click(object sender, EventArgs e)
        {
            Profissional pNew = new Profissional();
            pNew.ccNome = tbNome.Value;
            pNew.ccSexo = dpSexo.Value;
            pNew.ccNaturalUF = dpUFNatural.Value;
            pNew.ccNaturalCidade = tbCidade.Value;
            pNew.ccEstadoCivil = tbEstCivil.Value;
            pNew.nomePai = tbPai.Value;
            pNew.nomeMae = tbMae.Value;
            pNew.nomeConjuge = tbConjuge.Value;
            pNew.RGNum = int.Parse(tbRGNum.Value);
            pNew.RGEmissor = tbRGEmissor.Value;
            if (tbRGdata.Value != "")
            {
                pNew.RGdtEmissao = DateTime.Parse(tbRGdata.Value);
            }

            pNew.CPFNum = long.Parse(tbCPF.Value.Replace(".","").Replace("-",""));
            pNew.ccEmail = tbEmail.Value;
            pNew.Observacoes = tbObs.Value;

            if (tbFone.Value != "")
                pNew.cvTelefone = long.Parse(Regex.Replace(tbFone.Value, "[^0-9a-zA-Z]+", ""));
            if (tbCelular.Value != "")
                pNew.cvCelular = long.Parse(Regex.Replace(tbCelular.Value, "[^0-9a-zA-Z]+", ""));

            if (tbdtNascimento.Value != "")
            {
                DateTime.TryParse(tbdtNascimento.Value, out DateTime newDate);
                pNew.dtNascimento = newDate;
            }

            if (tbDtPagamento.Value !="")
            {
                DateTime.TryParse(tbDtPagamento.Value, out DateTime newDate);
                pNew.cdPgtoTaxa = newDate;
            }
            if (tbDtFiliacao.Value != "")
            {
                DateTime.TryParse(tbDtFiliacao.Value, out DateTime newDate);
                pNew.cdFiliacao = newDate;
            }

            if (tbDtRegCartorio.Value != "")
            {
                DateTime.TryParse(tbDtRegCartorio.Value, out DateTime newDate);
                pNew.cdRegCartorio = newDate;
            }

            try
            {
                bool result = false;
                if (idHiddenMedico.Value == "")
                {
                    result = pNew.Adicionar(HiddenUser.Value);
                }
                else
                {
                    pNew.IdProfissional = int.Parse(idHiddenMedico.Value);
                    result = pNew.Salvar(HiddenUser.Value);
                }
                if (result)
                {
                    gvMedicos.DataBind();
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", $"alert('Falha ao salvar o registro! ERRO: {ex.Message}')", true);
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
                        File.Delete(fullPath);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('Falha ao salvar o registro!');", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('Selecione um arquivo com tamanho inferior a 50MB!');", true);
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
                    break;
                default:
                    break;
            }
        }

        #region WebMethods

        [WebMethod]
        public static Profissional BuscarPorID(string idProfissional)
        {
            return Profissional.ListarPorID(int.Parse(idProfissional));
        }

        [WebMethod]
        public static ProfissionalDados BuscarDadosID(string idProfissional)
        {
            return ProfissionalDados.ListarPorID(int.Parse(idProfissional));
        }

        [WebMethod]
        public static ProfissionalEndereco BuscarEnderecoID(string idProfissional)
        {
            return ProfissionalEndereco.ListarPorID(int.Parse(idProfissional));
        }

        [WebMethod]
        public static List<ProfissionalBanco> BuscarBancosID(string idProfissional)
        {
            return ProfissionalBanco.Listar(int.Parse(idProfissional));
        }

        [WebMethod]
        public static List<ProfissionalArquivo> BuscararquivosID(string idProfissional)
        {
            return ProfissionalArquivo.Listar(int.Parse(idProfissional));
        }

        [WebMethod]
        private static object SalvarMedico(string user, string nome, string sexo, string uf, string cidade, string estCivil, string pai, string mae, string conjuge, string rgNum, string rgEmissor, string rgData, string cpf, string email, string telefone, string celular, string obs, string dtNascimento, string dtTaxa, string dtFiliacao, string dtCartorio, string idMedico)
        {
            bool result = false;
            //string user = User.Identity.Name;

            Profissional pNew = new Profissional();
            pNew.ccNome = nome;
            pNew.ccSexo = sexo;
            pNew.ccNaturalUF = uf;
            pNew.ccNaturalCidade = cidade;
            pNew.ccEstadoCivil = estCivil;
            pNew.nomePai = pai;
            pNew.nomeMae = mae;
            pNew.nomeConjuge =conjuge;
            if (rgNum != "")
                pNew.RGNum = long.Parse(rgNum);
            pNew.RGEmissor = rgEmissor;
            //if (DateTime.TryParse(tbdtEmissaoRG.Text, out DateTime newDate))
            if (rgData != "")
            {
                DateTime.TryParse(rgData, culture, styles, out DateTime newDate1);
                pNew.RGdtEmissao = newDate1;
            }
            
            pNew.CPFNum = long.Parse(cpf);
            pNew.ccEmail = email;
            if (telefone != "")
                pNew.cvTelefone = long.Parse(telefone);
            if (celular != "")
                pNew.cvCelular = long.Parse(celular);
            pNew.Observacoes = obs;
            //if (DateTime.TryParse(tbDataNascimento.Text, out DateTime newDate2))
            if (dtNascimento != "")
            {
                DateTime.TryParse(dtNascimento, culture, styles, out DateTime newDate);
                pNew.dtNascimento = newDate;
            }
            //
            if (dtTaxa != "")
            {
                DateTime.TryParse(dtTaxa, culture, styles, out DateTime newDate);
                pNew.cdPgtoTaxa = newDate;
            }
            if (dtFiliacao != "")
            {
                DateTime.TryParse(dtFiliacao, culture, styles, out DateTime newDate);
                pNew.cdFiliacao = newDate;
            }

            if (dtCartorio != "")
            {
                DateTime.TryParse(dtCartorio, culture, styles, out DateTime newDate);
                pNew.cdRegCartorio = newDate;
            }

            try
            {
                if (idMedico != "")
                {
                    result = pNew.Adicionar(user);
                }
                else
                {
                    pNew.IdProfissional = int.Parse(idMedico);
                    result = pNew.Salvar(user);
                }
            }
            catch (Exception ex)
            {
                return ex.Message; 
            }
            return result;
        }
        
        [WebMethod]
        public static bool SalvarDados(string user, string idDado, string idMedico, string ccFormacao, string ccPosGraduacao, string ccEspecialidade, string ccEspecialidadeNova, string ccConselho, string NumInscricaoConselho, string TituloEleitor, string ZonaEleitor, string SecaoEleitor, string Reservista, string PisPasep)
        {
            ProfissionalDados pd1 = new ProfissionalDados();
            if (idDado != "")
            {
                pd1.IdDadoProfissional = int.Parse(idDado);
            }
            pd1.idProfissional = int.Parse(idMedico);
            pd1.ccFormacao = ccFormacao;
            pd1.ccPosGraduacao = ccPosGraduacao;
            if (ccEspecialidadeNova == "")
            {
                pd1.ccEspecialidade = ccEspecialidade;
            }
            else
            {
                Especialidade nova = new Especialidade(ccEspecialidadeNova);
                nova.Adicionar(user);
                pd1.ccEspecialidade = nova.ccEspecialidade;
            }
            pd1.ccConselho = ccConselho;

            if (NumInscricaoConselho != "")
                pd1.cvNumInscricao = long.Parse(NumInscricaoConselho);

            if (TituloEleitor != "")
                pd1.cvTitulo = long.Parse(TituloEleitor);

            if (ZonaEleitor != "")
                pd1.cvTituloZona = int.Parse(ZonaEleitor);

            if (SecaoEleitor != "")
                pd1.cvTituloSecao = int.Parse(SecaoEleitor);

            if (Reservista != "")
                pd1.cvReservista = long.Parse(Reservista);

            if (PisPasep != "")
                pd1.cvPIS = long.Parse(PisPasep);

            bool result = pd1.Salvar(user);
            return result;
        }

        [WebMethod]
        public static bool SalvarEndereco(string user, string idMedico, string endereco, string bairro, string cep, string uf, string cidade, string idEndereco)
        {
            bool result = false;
            ProfissionalEndereco pe = new ProfissionalEndereco();

            pe.ccEndereco = endereco;
            pe.ccBairro = bairro;
            pe.cvCEP = long.Parse(cep.Replace("-", ""));
            pe.ccUF = uf;
            pe.ccCidade = cidade;
            pe.idProfissional = int.Parse(idMedico);
            if (int.TryParse(idEndereco, out int newIdEndereco))
            {
                pe.IdEndereco = newIdEndereco;
                result = pe.Adicionar(user);
            }
            else
            {
                result = pe.Salvar(user);
            }
            return result;
        }


        [WebMethod]
        public static bool RemoverBanco(string Usuario, string IdProfissionalBanco)
        {
            bool result = false;
            result =  ProfissionalBanco.Excluir(Usuario, int.Parse(IdProfissionalBanco));
            return result;
        }

        #endregion
    }
}