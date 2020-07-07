using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Site.Classes
{
    public class Receita
    {
        #region Campos
        public int idReceita { get; set; }//idReceita int
        public int IdClinica { get; set; }//IdClinica   int
        public float? cvValor { get; set; }//cvValor float
        public float? cvValorPago { get; set; }//cvValorPago float
        public float? cvValorDisponivel { get; set; }

        public DateTime? cdEmissao { get; set; }//cdEmissao   datetime
        public DateTime? cdPagamento { get; set; }//cdPagamento datetime
        public DateTime? cdRepasse { get; set; }//cdRepasse   datetime
        public float? cvDesconto { get; set; }//cvDesconto  real
        public bool cbArquivado { get; set; }//cbArquivado bit
        public bool cbStatus { get; set; }//cbStatus    bit
        public int? idObservacao { get; set; }//idObservacao    int
        public int? cvNF { get; set; }//cvNF    int
        public string Observacao { get; set; }

        #endregion

        public Receita()
        {

        }

        public Receita(int idReceita, float cvValor, float? cvValorPago, DateTime? cdEmissao, DateTime? cdPagamento, DateTime? cdRepasse, float? cvDesconto, int? cvNF, string observacao)
        {
            this.idReceita = idReceita;
            this.cvValor = cvValor;
            this.cvValorPago = cvValorPago;
            this.cdEmissao = cdEmissao;
            this.cdPagamento = cdPagamento;
            this.cdRepasse = cdRepasse;
            this.cvDesconto = cvDesconto;
            this.cvNF = cvNF;
            this.Observacao = observacao;
        }

        public Receita(int idReceita, float cvValor, float? cvValorPago, DateTime? cdEmissao, DateTime? cdPagamento, DateTime? cdRepasse, float? cvDesconto, int? cvNF, string observacao, float? cvValordisponivel)
        {
            this.idReceita = idReceita;
            this.cvValor = cvValor;
            this.cvValorPago = cvValorPago;
            this.cdEmissao = cdEmissao;
            this.cdPagamento = cdPagamento;
            this.cdRepasse = cdRepasse;
            this.cvDesconto = cvDesconto;
            this.cvNF = cvNF;
            this.Observacao = observacao;
            this.cvValorDisponivel = cvValordisponivel;
        }

        public bool Salvar(string Usuario)
        {
            bool result = false;
            List<object[]> parametros = new List<object[]>();
            parametros.Add(new object[] { "@UserName", Usuario});
            parametros.Add(new object[] { "@idReceita", this.idReceita});
            parametros.Add(new object[] { "@IdClinica", this.IdClinica});
            
            if (this.cvValor.HasValue)
            {
                parametros.Add(new object[] { "@cvValor", this.cvValor });
            }
            else
            {
                parametros.Add(new object[] { "@cvValor", DBNull.Value });
            }

            if (this.cvValorPago.HasValue)
            {
                parametros.Add(new object[] { "@cvValorPago", this.cvValorPago });
            }
            else
            {
                parametros.Add(new object[] { "@cvValorPago", DBNull.Value });
            }

            if (this.cvNF.HasValue)
            {
                parametros.Add(new object[] { "@cvNF", this.cvNF });
            }
            else
            {
                parametros.Add(new object[] { "@cvNF", DBNull.Value });
            }

            if (this.cdEmissao.HasValue)
            {
                parametros.Add(new object[] { "@cdEmissao", this.cdEmissao.Value });
            }
            else
            {
                parametros.Add(new object[] { "@cdEmissao", DBNull.Value });
            }

            if (this.cdPagamento.HasValue)
            {
                parametros.Add(new object[] { "@cdPagamento", this.cdPagamento });
            }
            else
            {
                parametros.Add(new object[] { "@cdPagamento", DBNull.Value });
            }

            if (this.cdRepasse.HasValue)
            {
                parametros.Add(new object[] { "@cdRepasse", this.cdRepasse });
            }
            else
            {
                parametros.Add(new object[] { "@cdRepasse", DBNull.Value });
            }

            if (this.cvDesconto.HasValue)
            {
                parametros.Add(new object[] { "@cvDesconto", this.cvDesconto });
            }
            else
            {
                parametros.Add(new object[] { "@cvDesconto", DBNull.Value });
            }

            parametros.Add(new object[] { "@observacoes", this.Observacao });

            try
            {
                object retorno = DAO.ExecuteScalar(@"UPD_Receita
                                                    @UserName = @UserName, @idReceita= @idReceita, @IdClinica= @IdClinica, @cvValor= @cvValor, @cvValorPago= @cvValorPago
                                                    , @cdEmissao= @cdEmissao, @cdPagamento= @cdPagamento, @cdRepasse= @cdRepasse, @cvDesconto= @cvDesconto, @observacoes= @observacoes
                                                    , @cvNF= @cvNF", parametros);
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

        public bool Adicionar(string Usuario)
        {
            bool result = false;
            List<object[]> parametros = new List<object[]>();
            parametros.Add(new object[] { "@UserName", Usuario });
            parametros.Add(new object[] { "@IdClinica", this.IdClinica });
            parametros.Add(new object[] { "@cvValor", this.cvValor });
            parametros.Add(new object[] { "@observacoes", this.Observacao });
            if (this.cvDesconto != null)
            {
                parametros.Add(new object[] { "@cvDesconto", this.cvDesconto });
            }
            else
            {
                parametros.Add(new object[] { "@cvDesconto", DBNull.Value });
            }

            try
            {
                object retorno = DAO.ExecuteScalar(@"INS_Receita  @UserName = @UserName, @IdClinica = @IdClinica, @cvValor = @cvValor, @cvDesconto = @cvDesconto, @observacoes = @observacoes", parametros);
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

        public bool Excluir(string Usuario, int idObject)
        {
            throw new NotImplementedException();
        }

        public static List<Receita> Listar(bool arquivado = false, bool status = true, DateTime? dtInicio = null, DateTime? dtFim = null)
        {
            List<object[]> parametros = new List<object[]>();
            parametros.Add(new object[] { "@cbArquivado", arquivado });
            parametros.Add(new object[] { "@cbStatus", status });
            parametros.Add(new object[] { "@dtInicial", dtInicio });
            parametros.Add(new object[] { "@dtFinal", dtFim });

            DataTable dt = DAO.RetornaDT("SEL_Receitas @cbArquivado = @cbArquivado, @cbStatus = @cbStatus, @dtInicial = @dtInicial, @dtFinal = @dtFinal", parametros);
            List<Receita> Lista = new List<Receita>();
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow c in dt.Rows)
                {
                    //idReceita cvValor cvValorPago cdEmissao   cdPagamento cdRepasse   cvDesconto cvNF    observacao

                    Nullable<DateTime> cdEmissao = new Nullable<DateTime>();
                    Nullable<DateTime> cdPagamento = new Nullable<DateTime>();
                    Nullable<DateTime> cdRepasse = new Nullable<DateTime>();

                    Nullable<float> cvValorPago = new Nullable<float>();
                    Nullable<float> cvDesconto = new Nullable<float>();
                    
                    Nullable<int> cvNF = new Nullable<int>();

                    if (DateTime.TryParse(c["cdEmissao"].ToString(), out DateTime dt1))
                    {
                        cdEmissao = dt1;
                    }

                    if (DateTime.TryParse(c["cdPagamento"].ToString(), out DateTime dt2))
                    {
                        cdPagamento = dt2;
                    }

                    if (DateTime.TryParse(c["cdRepasse"].ToString(), out DateTime dt3))
                    {
                        cdRepasse = dt3;
                    }

                    if (int.TryParse(c["cvNF"].ToString(), out int int1))
                    {
                        cvNF = int1;
                    }

                    if (float.TryParse(c["cvValorPago"].ToString(), out float float1))
                    {
                        cvValorPago = float1;
                    }
                    if (float.TryParse(c["cvDesconto"].ToString(), out float float2))
                    {
                        cvDesconto = float2;
                    }

                    Lista.Add(new Receita(
                        int.Parse(c["idReceita"].ToString())
                        , float.Parse(c["cvValor"].ToString().IfNullOrWhiteSpace("0"))
                        , cvValorPago
                        , cdEmissao
                        , cdPagamento
                        , cdRepasse
                        , float.Parse(c["cvDesconto"].ToString().IfNullOrWhiteSpace("0"))
                        , cvNF
                        , c["observacao"].ToString()
                        ));
                }

            }

            return Lista;
        }

        public static Receita ListarPorID(int idObject)
        {
            List<object[]> parametros = new List<object[]>();
            parametros.Add(new object[] { "@idReceita", idObject });

            DataTable dt = DAO.RetornaDT("SEL_Receitas @idReceita = @idReceita", parametros);
            List<Receita> Lista = new List<Receita>();
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow c in dt.Rows)
                {
                    //idReceita cvValor cvValorPago cdEmissao   cdPagamento cdRepasse   cvDesconto cvNF    observacao

                    Nullable<DateTime> cdEmissao = new Nullable<DateTime>();
                    Nullable<DateTime> cdPagamento = new Nullable<DateTime>();
                    Nullable<DateTime> cdRepasse = new Nullable<DateTime>();

                    Nullable<float> cvValorPago = new Nullable<float>();
                    Nullable<float> cvDesconto = new Nullable<float>();
                    Nullable<float> cvValorDisponivel = new Nullable<float>();

                    Nullable<int> cvNF = new Nullable<int>();

                    if (DateTime.TryParse(c["cdEmissao"].ToString(), out DateTime dt1))
                    {
                        cdEmissao = dt1;
                    }

                    if (DateTime.TryParse(c["cdPagamento"].ToString(), out DateTime dt2))
                    {
                        cdPagamento = dt2;
                    }

                    if (DateTime.TryParse(c["cdRepasse"].ToString(), out DateTime dt3))
                    {
                        cdRepasse = dt3;
                    }

                    if (int.TryParse(c["cvNF"].ToString(), out int int1))
                    {
                        cvNF = int1;
                    }

                    if (float.TryParse(c["cvValorPago"].ToString(), out float float1))
                    {
                        cvValorPago = float1;
                    }
                    if (float.TryParse(c["cvDesconto"].ToString(), out float float2))
                    {
                        cvDesconto = float2;
                    }
                    if (float.TryParse(c["cvValorDisponivel"].ToString(), out float float3))
                    {
                        cvValorDisponivel = float3;
                    }



                    Lista.Add(new Receita(
                        int.Parse(c["idReceita"].ToString())
                        , float.Parse(c["cvValor"].ToString().IfNullOrWhiteSpace("0"))
                        , cvValorPago
                        , cdEmissao
                        , cdPagamento
                        , cdRepasse
                        , cvDesconto
                        , cvNF
                        , c["observacao"].ToString()
                        , cvValorDisponivel
                        ));
                }

            }

            return Lista.FirstOrDefault();
        }
    }
}