﻿using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.Entity.Core.Common.CommandTrees;
using System.Linq;
using System.Web;

namespace Site.Classes
{
    public class Operacao 
    {
        #region Campos
        public enum imgStatus { zero = 0, one = 1, two = 2, three = 3  }
        public int ID { get; set; }//idReceita 
        public float cvValor { get; set; }//cvValor
        public string ccDescricao { get; set; }//ccApelido 
        public string observacao { get; set; }//observacao  
        public DateTime? cdEmissao { get; set; }//cdEmissao 
        public DateTime? cdPagamento { get; set; }//cdPagamento 
        public DateTime? cdRepasse { get; set; }//cdRepasse 
        public imgStatus Status { get; set; }//Status  
        public string Tipo { get; set; }//Tipo 
        public int? cvNF { get; set; }//cvNF

        #endregion

        public Operacao()
        {

        }

        public Operacao(int id, float valor , string descricao , string observacao  , DateTime? dtEmissao ,DateTime? dtPagamento, DateTime? dtRepasse, int status, string tipo , int? nf)
        {
            this.ID = id;
            this.cvValor = valor;
            this.ccDescricao = descricao;
            this.observacao = observacao;
            this.cdEmissao = dtEmissao;
            this.cdPagamento = dtPagamento;
            this.cdRepasse = dtRepasse;
            this.Status = (imgStatus)status;
            this.Tipo = tipo;
            this.cvNF = nf;
        }
        public bool Adicionar(string Usuario)
        {
            throw new NotImplementedException();
        }
        internal static bool Arquivar(string Usuario, int idOperacao, string operacaoTipo)
        {
            bool result = false;
            List<object[]> parametros = new List<object[]>();
            parametros.Add(new object[] { "@UserName", Usuario });
            parametros.Add(new object[] { "@idOperacao", idOperacao });
            parametros.Add(new object[] { "@tipo", operacaoTipo });

            try
            {
                object retorno = DAO.ExecuteScalar(@"ARQ_Operacao @UserName = @UserName, @idOperacao = @idOperacao, @tipo = @tipo;", parametros);
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
        internal static bool Excluir(string Usuario, int idOperacao, string operacaoTipo)
        {
            bool result = false;
            List<object[]> parametros = new List<object[]>();
            parametros.Add(new object[] { "@UserName", Usuario });
            parametros.Add(new object[] { "@idOperacao", idOperacao });
            parametros.Add(new object[] { "@tipo", operacaoTipo });

            try
            {
                object retorno = DAO.ExecuteScalar(@"EXC_Operacao @UserName = @UserName, @idOperacao = @idOperacao, @tipo = @tipo;", parametros);
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

        public static List<Operacao> Listar()
        {
            List<object[]> parametros = new List<object[]>();
            //parametros.Add(new object[] { "@cbArquivado", arquivado });
            //parametros.Add(new object[] { "@cbStatus", status });
            //parametros.Add(new object[] { "@dtInicial", dtInicio });
            //parametros.Add(new object[] { "@dtFinal", dtFim });


            //ID cvValor ccDescricao observacao  cdEmissao cdPagamento cdRepasse Status  Tipo cvNF
            DataTable dt = DAO.RetornaDT("SEL_Operacoes", parametros);
            List<Operacao> Lista = new List<Operacao>();
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow c in dt.Rows)
                {
                    Nullable<DateTime> dtEmissao = new Nullable<DateTime>();
                    Nullable<DateTime> dtPagamento = new Nullable<DateTime>();
                    Nullable<DateTime> dtRepasse = new Nullable<DateTime>();

                    if (DateTime.TryParse(c["cdEmissao"].ToString(), out DateTime dt1))
                    {
                        dtEmissao = dt1;
                    }
                    if (DateTime.TryParse(c["cdPagamento"].ToString(), out DateTime dt2))
                    {
                        dtPagamento = dt2;
                    }
                    if (DateTime.TryParse(c["cdRepasse"].ToString(), out DateTime dt3))
                    {
                        dtRepasse = dt3;
                    }

                    int.TryParse(c["cvNF"].ToString(), out int cvNF);
                    Lista.Add(new Operacao(
                        int.Parse(c["ID"].ToString())
                        , float.Parse(c["cvValor"].ToString())
                        , c["ccDescricao"].ToString()
                        , c["observacao"].ToString()
                        , dtEmissao
                        , dtPagamento
                        , dtRepasse
                        , int.Parse(c["Status"].ToString())
                        , c["Tipo"].ToString()
                        , cvNF
                        ));
                }

            }

            return Lista;
        }

        public object ListarPorID(int idObject)
        {
            throw new NotImplementedException();
        }

        public bool Salvar(string Usuario)
        {
            throw new NotImplementedException();
        }
    }
}