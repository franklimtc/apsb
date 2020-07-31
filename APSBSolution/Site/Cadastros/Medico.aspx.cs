using Site.Classes;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
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
        }

        protected void gvMedicos_PreRender(object sender, EventArgs e)
        {
            gvMedicos.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

        [WebMethod]
        public static Profissional BuscarPorID(int idProfissional)
        {
            Profissional p = new Profissional();
            p = Profissional.ListarPorID(idProfissional);
            return p;
        }
        [WebMethod]
        public static object SalvarMedico(string user, string nome, string sexo, string uf, string cidade, string estCivil, string pai, string mae, string conjuge, string rgNum, string rgEmissor, string rgData, string cpf, string email, string telefone, string celular, string obs, string dtNascimento, string dtTaxa, string dtFiliacao, string dtCartorio, string idMedico)
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
    }
}