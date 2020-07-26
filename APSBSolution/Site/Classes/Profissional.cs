using Microsoft.Ajax.Utilities;
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
        public enum Status { Inativo = 0, Ativo = 1 }
        public int IdProfissional { get; set; }//IdProfissional int no	4
        public string ccNome { get; set; }//ccNome varchar no	100
        public string ccSexo { get; set; }//ccSexo char no	1     

        public string ccNaturalUF { get; set; }//ccNaturalUF char no	2
        public string ccNaturalCidade { get; set; }//ccNaturalCidade varchar no	50
        public string ccEstadoCivil { get; set; }//ccEstadoCivil char no	1
        public string ccEmail { get; set; }//ccEmail varchar no	100
        public Status cvStatus { get; set; }//cvStatus smallint    no	2
        public string ccCriadoPor { get; set; }//ccCriadoPor varchar no	20
        public DateTime cdDataCriacao { get; set; }//cdDataCriacao datetime    no	8
        public string ccAlteradoPor { get; set; }//ccAlteradoPor varchar no	20
        public DateTime cdDAtaAlteracao { get; set; }//cdDataAlteracao datetime    no	8
        public int idObservacao { get; set; }//IdObservacao int no	4
        public string Observacoes { get; set; }
        public long RGNum { get; set; }//RGNum varchar no	20
        public string RGEmissor { get; set; }//RGEmissor varchar no	5
        public DateTime RGdtEmissao { get; set; }//RGdtEmissao datetime    no	8
        public long CPFNum { get; set; }//CPFNum varchar no	15
        public long cvTelefone { get; set; }//cvTelefone bigint  no	8
        public long cvCelular { get; set; }//cvCelular bigint  no	8   
        public string nomePai { get; set; }//nomePai
        public string nomeMae { get; set; }//nomeMae
        public string nomeConjuge { get; set; }//nomeConjuge
        public DateTime dtNascimento { get; set; }
        public DateTime cdFiliacao { get; set; }
        public DateTime cdPgtoTaxa { get; set; }
        public string Token { get; set; }
        public string StatusCadastro { get; set; }
        public DateTime cdRegCartorio { get; internal set; }
        public int cvCNH { get; set; }
        #endregion

        public Profissional()
        {

        }

        public Profissional(int _id, string _nome)
        {
            this.IdProfissional = _id;
            this.ccNome = _nome;
        }
        public Profissional(int _id, int _cel, string _nome, string _email)
        {
            this.IdProfissional = _id;
            this.cvCelular = _cel;
            this.ccNome = _nome;
            this.ccEmail = _email;
        }

       

        public Profissional(int _id, string _nome, string _email, string _observacoes)
        {
            this.IdProfissional = _id;
            this.ccNome = _nome;
            this.ccEmail = _email;
            this.Observacoes = _observacoes;
        }

       
        public static List<Profissional> Listar(bool status = true)
        {
            List<Profissional> Lista = new List<Profissional>();

            List<object[]> parametros = new List<object[]>();
            parametros.Add(new object[] { "@Status", status });

            DataTable dt = DAO.RetornaDT("SEL_Profissionais @Status = @Status", parametros);
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

        public static Profissional ListarPorID(int _idProfissional)
        {
            List<object[]> parametros = new List<object[]>();
            parametros.Add(new object[] { "@IdProfissional", _idProfissional });
            DataTable dt = DAO.RetornaDT("SEL_Profissionais @IdProfissional = @IdProfissional", parametros);
            List<Profissional> Lista = new List<Profissional>();

            if (dt.Rows.Count > 0)
            {
                foreach (DataRow p in dt.Rows)
                {
                    Profissional p1 = new Profissional(int.Parse(p["IdProfissional"].ToString())
                        , p["ccNome"].ToString()
                        , p["ccEmail"].ToString()
                        , p["observacao"].ToString()
                        );
                    p1.ccSexo = p["ccSexo"].ToString();
                    p1.ccNaturalUF = p["ccNaturalUF"].ToString();
                    p1.ccNaturalCidade = p["ccNaturalCidade"].ToString();
                    p1.ccEstadoCivil = p["ccEstadoCivil"].ToString();
                    if (!p["RGNum"].ToString().IsNullOrWhiteSpace())
                    {
                        p1.RGNum = long.Parse(p["RGNum"].ToString());
                    }
                    if (!p["CPFNum"].ToString().IsNullOrWhiteSpace())
                    {
                        p1.CPFNum = long.Parse(p["CPFNum"].ToString());
                    }
                    if (!p["cvTelefone"].ToString().IsNullOrWhiteSpace())
                    {
                        p1.cvTelefone = long.Parse(p["cvTelefone"].ToString());
                    }
                    if (!p["cvCelular"].ToString().IsNullOrWhiteSpace())
                    {
                        p1.cvCelular = long.Parse(p["cvCelular"].ToString());
                    }

                    p1.RGEmissor = p["RGEmissor"].ToString();
                    DateTime data;
                    if (DateTime.TryParse(p["RGdtEmissao"].ToString(), out data))
                    {
                        p1.RGdtEmissao = data;
                    }

                    if (DateTime.TryParse(p["cdDataNascimento"].ToString(), out data))
                    {
                        p1.dtNascimento = data;
                    }
                    

                    if (DateTime.TryParse(p["cdPgtoTaxa"].ToString(), out data))
                    {
                        p1.cdPgtoTaxa = data;
                    }
                    if (DateTime.TryParse(p["cdFiliacao"].ToString(), out data))
                    {
                        p1.cdFiliacao = data;
                    }
                    if (DateTime.TryParse(p["cdRegCartorio"].ToString(), out data))
                    {
                        p1.cdRegCartorio = data;
                    }

                    p1.nomePai = p["nomePai"].ToString();
                    p1.nomeMae = p["nomeMae"].ToString();
                    p1.nomeConjuge = p["nomeConjuge"].ToString();
                    Lista.Add(p1);
                }
            }
            return Lista.First();
        }

        public static List<Profissional> Listar()
        {
            DataTable dt = DAO.RetornaDT("SEL_Profissionais");
            List<Profissional> Lista = new List<Profissional>();

            if (dt.Rows.Count > 0)
            {
                foreach (DataRow p in dt.Rows)
                {
                    Profissional p1 = new Profissional(int.Parse(p["IdProfissional"].ToString())
                        , p["ccNome"].ToString()
                        , p["ccEmail"].ToString()
                        , p["observacao"].ToString()
                        );
                    p1.ccSexo = p["ccSexo"].ToString();
                    p1.ccNaturalUF = p["ccNaturalUF"].ToString();
                    p1.ccNaturalCidade = p["ccNaturalCidade"].ToString();
                    p1.ccEstadoCivil = p["ccEstadoCivil"].ToString();
                    if (!p["RGNum"].ToString().IsNullOrWhiteSpace())
                    {
                        p1.RGNum = long.Parse(p["RGNum"].ToString());
                    }
                    if (!p["CPFNum"].ToString().IsNullOrWhiteSpace())
                    {
                        p1.CPFNum = long.Parse(p["CPFNum"].ToString());
                    }
                    if (!p["cvTelefone"].ToString().IsNullOrWhiteSpace())
                    {
                        p1.cvTelefone = long.Parse(p["cvTelefone"].ToString());
                    }
                    if (!p["cvCelular"].ToString().IsNullOrWhiteSpace())
                    {
                        p1.cvCelular = long.Parse(p["cvCelular"].ToString());
                    }

                    p1.RGEmissor = p["RGEmissor"].ToString();
                    DateTime data;
                    if (DateTime.TryParse(p["RGdtEmissao"].ToString(), out data))
                    {
                        p1.RGdtEmissao = data;
                    }

                    if (DateTime.TryParse(p["cdDataNascimento"].ToString(), out data))
                    {
                        p1.dtNascimento = data;
                    }


                    if (DateTime.TryParse(p["cdPgtoTaxa"].ToString(), out data))
                    {
                        p1.cdPgtoTaxa = data;
                    }
                    if (DateTime.TryParse(p["cdFiliacao"].ToString(), out data))
                    {
                        p1.cdFiliacao = data;
                    }
                    if (DateTime.TryParse(p["cdRegCartorio"].ToString(), out data))
                    {
                        p1.cdRegCartorio = data;
                    }

                    p1.nomePai = p["nomePai"].ToString();
                    p1.nomeMae = p["nomeMae"].ToString();
                    p1.nomeConjuge = p["nomeConjuge"].ToString();
                    Lista.Add(p1);
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
        public static List<Profissional> ListaDropDown(int idClinica)
        {
            List<object[]> parametros = new List<object[]>();
            parametros.Add(new object[] { "@idOperacao", idClinica });

            DataTable dt = DAO.RetornaDT("SEL_ProfissionalClinicaDP @idOperacao = @idOperacao;", parametros);
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

        internal bool Salvar(string Usuario)
        {
            bool result = false;
            List<object[]> parametros = new List<object[]>();
            parametros.Add(new object[] { "@UserName", Usuario });
            parametros.Add(new object[] { "@ccNome", this.ccNome });
            parametros.Add(new object[] { "@ccSexo", this.ccSexo });
            parametros.Add(new object[] { "@ccNaturalUF", this.ccNaturalUF });
            parametros.Add(new object[] { "@ccNaturalCidade", this.ccNaturalCidade });
            parametros.Add(new object[] { "@ccEstadoCivil", this.ccEstadoCivil });
            parametros.Add(new object[] { "@ccEmail", this.ccEmail });
            parametros.Add(new object[] { "@observacoes", this.Observacoes });
            parametros.Add(new object[] { "@RGNum", this.RGNum });
            parametros.Add(new object[] { "@RGEmissor", this.RGEmissor });
            parametros.Add(new object[] { "@RGdtEmissao", this.RGdtEmissao });
            parametros.Add(new object[] { "@CPFNum", this.CPFNum });
            parametros.Add(new object[] { "@cvTelefone", this.cvTelefone });
            parametros.Add(new object[] { "@cvCelular", this.cvCelular });
            parametros.Add(new object[] { "@nomePai", this.nomePai });
            parametros.Add(new object[] { "@nomeMae", this.nomeMae });
            parametros.Add(new object[] { "@nomeConjuge", this.nomeConjuge });
            parametros.Add(new object[] { "@IdProfissional", this.IdProfissional });
            parametros.Add(new object[] { "@cdDataNascimento", this.dtNascimento });

            if (this.cdFiliacao.ToString("dd/MM/yyyy") != "01/01/0001")
            {
                parametros.Add(new object[] { "@cdFiliacao", this.cdFiliacao });
            }
            else
            { 
                parametros.Add(new object[] { "@cdFiliacao", DBNull.Value });
            }

            if (this.cdPgtoTaxa.ToString("dd/MM/yyyy") != "01/01/0001")
            {
                parametros.Add(new object[] { "@cdPgtoTaxa", this.cdPgtoTaxa });
            }
            else
            {
                parametros.Add(new object[] { "@cdPgtoTaxa", DBNull.Value });
            }

            if (this.cdRegCartorio.ToString("dd/MM/yyyy") != "01/01/0001")
            {
                parametros.Add(new object[] { "@cdRegCartorio", this.cdRegCartorio });
            }
            else
            {
                parametros.Add(new object[] { "@cdRegCartorio", DBNull.Value });
            }

            try
            {
                object retorno = DAO.ExecuteScalar(@"UPD_Profissional @ccNome = @ccNome, @ccSexo = @ccSexo, @ccNaturalUF = @ccNaturalUF, @ccNaturalCidade = @ccNaturalCidade, @ccEstadoCivil = @ccEstadoCivil, @ccEmail = @ccEmail
                                                    , @UserName = @UserName, @observacoes = @observacoes, @RGNum = @RGNum, @RGEmissor = @RGEmissor, @RGdtEmissao = @RGdtEmissao, @CPFNum = @CPFNum, @cvTelefone = @cvTelefone
                                                    , @cvCelular = @cvCelular, @nomePai = @nomePai, @nomeMae = @nomeMae, @nomeConjuge = @nomeConjuge, @IdProfissional = @IdProfissional, @cdDataNascimento = @cdDataNascimento
                                                    , @cdFiliacao=@cdFiliacao, @cdPgtoTaxa=@cdPgtoTaxa, @cdRegCartorio = @cdRegCartorio", parametros);
                if (bool.Parse(retorno.ToString()) == true)
                {
                    result = true;
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return result;
        }

        internal bool Adicionar(string Usuario)
        {
            bool result = false;
            List<object[]> parametros = new List<object[]>();
            string query = @"INS_Profissional @ccNome = @ccNome, @ccSexo = @ccSexo, @ccNaturalUF = @ccNaturalUF, @ccNaturalCidade = @ccNaturalCidade
                , @ccEstadoCivil = @ccEstadoCivil, @ccEmail = @ccEmail, @UserName = @UserName, @observacoes = @observacoes, @RGNum = @RGNum
                , @RGEmissor = @RGEmissor, @RGdtEmissao = @RGdtEmissao, @CPFNum = @CPFNum, @cvTelefone = @cvTelefone, @cvCelular = @cvCelular
                , @nomePai = @nomePai, @nomeMae = @nomeMae, @nomeConjuge = @nomeConjuge, @cdDataNascimento = @cdDataNascimento, @cdFiliacao = @cdFiliacao
                , @cdPgtoTaxa = @cdPgtoTaxa, @cdRegCartorio = @cdRegCartorio";

            parametros.Add(new object[] { "@UserName", Usuario });

            parametros.Add(new object[] { "@ccNome", this.ccNome });
            parametros.Add(new object[] { "@ccSexo", this.ccSexo });
            parametros.Add(new object[] { "@ccNaturalUF", this.ccNaturalUF });
            parametros.Add(new object[] { "@ccNaturalCidade", this.ccNaturalCidade });
            parametros.Add(new object[] { "@ccEstadoCivil", this.ccEstadoCivil });
            parametros.Add(new object[] { "@ccEmail", this.ccEmail });
            parametros.Add(new object[] { "@observacoes", this.Observacoes });
            parametros.Add(new object[] { "@RGNum", this.RGNum });
            parametros.Add(new object[] { "@RGEmissor", this.RGEmissor });
            parametros.Add(new object[] { "@RGdtEmissao", this.RGdtEmissao });
            parametros.Add(new object[] { "@CPFNum", this.CPFNum });
            parametros.Add(new object[] { "@cvTelefone", this.cvTelefone });
            parametros.Add(new object[] { "@cvCelular", this.cvCelular });
            parametros.Add(new object[] { "@nomePai", this.nomePai });
            parametros.Add(new object[] { "@nomeMae", this.nomeMae });
            parametros.Add(new object[] { "@nomeConjuge", this.nomeConjuge });
            parametros.Add(new object[] { "@cdDataNascimento", this.dtNascimento });

            if (this.cdFiliacao.ToString("dd/MM/yyyy") != "01/01/0001")
            {
                parametros.Add(new object[] { "@cdFiliacao", this.cdFiliacao });
            }
            else
            {
                parametros.Add(new object[] { "@cdFiliacao", DBNull.Value });
            }

            if (this.cdPgtoTaxa.ToString("dd/MM/yyyy") != "01/01/0001")
            {
                parametros.Add(new object[] { "@cdPgtoTaxa", this.cdPgtoTaxa });
            }
            else
            {
                parametros.Add(new object[] { "@cdPgtoTaxa", DBNull.Value });
            }

            if (this.cdRegCartorio.ToString("dd/MM/yyyy") != "01/01/0001")
            {
                parametros.Add(new object[] { "@cdRegCartorio", this.cdRegCartorio });
            }
            else
            {
                parametros.Add(new object[] { "@cdRegCartorio", DBNull.Value });
            }


            try
            {
                object retorno = DAO.ExecuteScalar(query, parametros);
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

        public static List<Profissional> ListarAuto()
        {
            List<Profissional> Lista = new List<Profissional>();
            DataTable dt = DAO.RetornaDT("SEL_ProfissionalAuto");
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow p in dt.Rows)
                {
                    Profissional p1 = new Profissional();
                    p1.ccNome = p["ccNome"].ToString();
                    p1.ccEmail = p["ccEmail"].ToString();
                    p1.Token = p["Token"].ToString();
                    p1.StatusCadastro = p["StatusCadastro"].ToString();
                    p1.cdDataCriacao = DateTime.Parse(p["cdDataCriacao"].ToString());
                    Lista.Add(p1);
                }
            }
            return Lista;
        }

        internal bool GerarToken(string Usuario)
        {
            bool result = false;
            List<object[]> parametros = new List<object[]>();
            parametros.Add(new object[] { "@UserName", Usuario });
            parametros.Add(new object[] { "@ccNome", this.ccNome });
            parametros.Add(new object[] { "@ccEmail", this.ccEmail });


            try
            {
                object retorno = DAO.ExecuteScalar(@"INS_ProfissionalAuto @ccNome = @ccNome, @ccEmail = @ccEmail, @UserName = @UserName; ", parametros);
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

        internal static bool RenovarToken(string Usuario, string token)
        {
            bool result = false;
            List<object[]> parametros = new List<object[]>();
            parametros.Add(new object[] { "@UserName", Usuario });
            parametros.Add(new object[] { "@Token", token });


            try
            {
                object retorno = DAO.ExecuteScalar(@"RNV_ProfissionalAuto @UserName = @UserName, @Token = @Token;", parametros);
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
        internal static bool ExcluirAuto(string Usuario, string token)
        {
            bool result = false;
            List<object[]> parametros = new List<object[]>();
            parametros.Add(new object[] { "@UserName", Usuario });
            parametros.Add(new object[] { "@Token", token });


            try
            {
                object retorno = DAO.ExecuteScalar(@"EXC_ProfissionalAuto @UserName = @UserName, @Token = @Token;", parametros);
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

        internal static bool AtivarAuto(string Usuario, string token)
        {
            bool result = false;
            List<object[]> parametros = new List<object[]>();
            parametros.Add(new object[] { "@UserName", Usuario });
            parametros.Add(new object[] { "@Token", token });

            try
            {
                object retorno = DAO.ExecuteScalar(@"ATV_ProfissionalAuto @UserName = @UserName, @Token = @Token;", parametros);
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

        internal static object ValidarToken(string token)
        {
            List<object[]> parametros = new List<object[]>();
            parametros.Add(new object[] { "@Token", token });
            object retorno = new object();
            try
            {
                retorno = DAO.ExecuteScalar(@"SEL_Token @Token = @Token;", parametros);
            }
            catch
            {

            }
            return retorno;
        }

        internal static int ValidarCristalina(int idProfissional) 
        {
            int qtdRegistros = 0;

            List<object[]> parametros = new List<object[]>();
            parametros.Add(new object[] { "@idProfissional", idProfissional });
            object retorno = new object();
            try
            {
                retorno = DAO.ExecuteScalar(@"SEL_ProfissionalCristalina @idProfissional = @idProfissional;", parametros);
            }
            catch
            {

            }
            int.TryParse(retorno.ToString(), out qtdRegistros);

            return qtdRegistros;
        }
    }
}