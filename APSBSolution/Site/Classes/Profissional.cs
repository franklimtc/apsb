using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Site.Classes
{
    public class Profissional
    {
        #region Campos

        public int cvIdProfissional { get; set; }
        public int cvTelCelular { get; set; }
        public string ccNome { get; set; }
        public string ccEmail { get; set; }
        public string ccSexo { get; set; }
        public string ccNaturalidade { get; set; }
        public string ccUF { get; set; }
        public DateTime cdNascimento { get; set; }
        public string ccEstadoCivil { get; set; }
        public string ccNomePai { get; set; }
        public string ccNomeMae { get; set; }
        public string ccNomeConjuge { get; set; }
        public int cvRG { get; set; }
        public DateTime cdDataExpedicao { get; set; }
        public string ccOrgaoExpedidor { get; set; }
        public int cvCPF { get; set; }
        public string ccTelefone { get; set; }

        public string ccFormacaoProfissional { get; set; }
        public string ccEspecialidade { get; set; }
        public string ccPosGraduacao { get; set; }
        public int cvNumInscricao { get; set; }
        public string ccConselhoRegional { get; set; }
        public int cvPisPasepNit { get; set; }
        public int cvTituloEleitor { get; set; }
        public int cvZona { get; set; }
        public int cvSecao { get; set; }
        public int cvCnh { get; set; }
        public int cvCertificadoReservista { get; set; }

        public string ccEndereco { get; set; }
        public string ccBairro { get; set; }
        public string ccCep { get; set; }
        public string ccCidade { get; set; }

        public string ccBanco { get; set; }
        public string ccAgencia { get; set; }
        public string ccContaCorrente { get; set; }
        public string ccOperacao { get; set; }
        public string ccObservacoes { get; set; }
        public List<Documento> Documentos { get; set; }
        public List<Banco> Bancos { get; set; }
        public List<Endereco> Enderecos { get; set; }
        public List<Arquivo> Arquivos { get; set; }
        #endregion

        public Profissional()
        {

        }

        public Profissional(int _id, string _nome)
        {
            this.cvIdProfissional = _id;
            this.ccNome = _nome;
        }
        public Profissional(int _id, int _cel, string _nome, string _email)
        {
            this.cvIdProfissional = _id;
            this.cvTelCelular = _cel;
            this.ccNome = _nome;
            this.ccEmail = _email;
        }

        public Profissional(int _id, string _nome, string _email, string _observacoes)
        {
            this.cvIdProfissional = _id;
            this.ccNome = _nome;
            this.ccEmail = _email;
            this.ccObservacoes = _observacoes;
        }

        public static List<Profissional> Listar()
        {
            List<Profissional> Lista = new List<Profissional>();
            DataTable dt = DAO.RetornaDT("SEL_Profissionais");
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow p in dt.Rows)
                {
                    Lista.Add(new Profissional(int.Parse(p["IdProfissional"].ToString())
                        , p["ccNome"].ToString()
                        , p["ccEmail"].ToString()
                        , p["observacao"].ToString()
                        ));
                }
            }
            return Lista;
        }
        public static List<Profissional> ListaDropDown()
        {
            DataTable dt = DAO.RetornaDT("SEL_ProfissionaisDP");
            List<Profissional> Lista = new List<Profissional>();
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow p in dt.Rows)
                {
                    Lista.Add(new Profissional(int.Parse(p["idProfissional"].ToString()), p["ccNome"].ToString()));
                }

            }

            return Lista;
        }

        internal static bool Excluir(string Usuario, int idProfissional)
        {
            bool result = false;
            List<object[]> parametros = new List<object[]>();
            parametros.Add(new object[] { "@UserName", Usuario });
            parametros.Add(new object[] { "@idProfissional", idProfissional });

            try
            {
                object retorno = DAO.ExecuteScalar(@"EXC_Profissional @UserName = @UserName, @idProfissional = @idProfissional;", parametros);
                if (bool.Parse(retorno.ToString()) == true)
                {
                    result = true;
                }
            }
            catch
            {

            }
            return result;
        }
    }
}