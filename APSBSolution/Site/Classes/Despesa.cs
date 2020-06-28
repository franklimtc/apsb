using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Site.Classes
{
    public class Despesa
    {
        #region Campos
        public int idDespesas { get; set; }//idDespesas int no	4
        public int idTipo { get; set; }//idTipo int no	4
        public float cvValor { get; set; }//cvValor float no	8
        public DateTime cdData { get; set; }//cdData datetime    no	8
        public string ccTipo { get; set; }
        public bool cbArquivado { get; set; }//cbArquivado bit no	1
        public bool cbStatus { get; set; }//cbStatus bit no	1
        public int IdObservacao { get; set; }//IdObservacao int no	4
        public string ccObservacao { get; set; }
        #endregion

        public Despesa()
        {

        }
        public Despesa(int id, float valor , DateTime data, string tipo, string  observacao)
        {
            this.idDespesas = id;
            this.cvValor = valor;
            this.cdData = data;
            this.ccTipo = tipo;
            this.ccObservacao = observacao;
        }
        public bool Adicionar(string Usuario)
        {
            bool result = false;
            List<object[]> parametros = new List<object[]>();
            parametros.Add(new object[] { "@UserName", Usuario });
            parametros.Add(new object[] { "@idTipo", this.idTipo});
            parametros.Add(new object[] { "@cvValor",  this.cvValor});
            parametros.Add(new object[] { "@cdData", this.cdData});
            parametros.Add(new object[] { "@observacoes", this.ccObservacao});

            try
            {
                object retorno = DAO.ExecuteScalar(@"INS_DESPESA @idTipo = @idTipo, @cvValor = @cvValor, @cdData = @cdData, @observacoes = @observacoes, @UserName = @UserName;", parametros);
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

        public static bool Excluir(string Usuario, int idObject)
        {
            bool result = false;
            List<object[]> parametros = new List<object[]>();
            parametros.Add(new object[] { "@UserName", Usuario });
            parametros.Add(new object[] { "@idDespesa", idObject });

            try
            {
                object retorno = DAO.ExecuteScalar(@"EXC_DESPESA @idDespesa = @idDespesa, @UserName = @UserName;", parametros);
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

        public static List<Despesa> Listar(bool arquivado = false, bool status = true, DateTime? dtInicio = null, DateTime? dtFim = null)
        {
            List<object[]> parametros = new List<object[]>();
            parametros.Add(new object[] { "@cbArquivado", arquivado });
            parametros.Add(new object[] { "@cbStatus", status });
            parametros.Add(new object[] { "@dtInicial", dtInicio });
            parametros.Add(new object[] { "@dtFinal", dtFim });

            DataTable dt = DAO.RetornaDT("SEL_DESPESAS @cbArquivado = @, @cbStatus = @cbStatus, @dtInicial = @dtInicial, @dtFinal = @dtFinal;", parametros);
            List<Despesa> Lista = new List<Despesa>();
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow c in dt.Rows)
                {
                    Lista.Add(new Despesa(
                        int.Parse(c["idDespesas"].ToString())
                        , float.Parse(c["idDespesas"].ToString())
                        , DateTime.Parse(c["cdData"].ToString())
                        , c["ccTipo"].ToString()
                        , c["observacao"].ToString()
                        )); ;
                }

            }

            return Lista;
        }

        public static Despesa ListarPorID(int idDespesa)
        {
            List<object[]> parametros = new List<object[]>();
            parametros.Add(new object[] { "@idDespesa", idDespesa });

            DataTable dt = DAO.RetornaDT("SEL_Despesas @idDespesa = @idDespesa;", parametros);
            List<Despesa> Lista = new List<Despesa>();
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow c in dt.Rows)
                {
                    Lista.Add(new Despesa(
                        int.Parse(c["idDespesas"].ToString())
                        , float.Parse(c["idDespesas"].ToString())
                        , DateTime.Parse(c["cdData"].ToString())
                        , c["ccTipo"].ToString()
                        , c["observacao"].ToString()
                        )); ;
                }

            }
            return Lista.FirstOrDefault();
        }

        public bool Salvar(string Usuario)
        {
            bool result = false;
            List<object[]> parametros = new List<object[]>();
            parametros.Add(new object[] { "@UserName", Usuario });
            parametros.Add(new object[] { "@idDespesa", this.idDespesas });
            parametros.Add(new object[] { "@idTipo", this.idTipo });
            parametros.Add(new object[] { "@cvValor", this.cvValor });
            parametros.Add(new object[] { "@cdData", this.cdData });
            parametros.Add(new object[] { "@observacoes", this.ccObservacao });

            try
            {
                object retorno = DAO.ExecuteScalar(@"UPD_DESPESA @idDespesa = @idDespesa, @idTipo = @idTipo, @cvValor = @cvValor, @cdData = @cdData, @observacoes = @observacoes, @UserName = @UserName", parametros);
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

    public class DespesaTipo
    {
        public int idTipo { get; set; }//idTipo int no	4
        public string ccTipo { get; set; }//ccTipo varchar no	50

        public DespesaTipo(int id, string tipo)
        {
            this.idTipo = id;
            this.ccTipo = tipo;
        }
        public static bool Adicionar(string Usuario, string Tipo)
        {
            bool result = false;
            List<object[]> parametros = new List<object[]>();
            parametros.Add(new object[] { "@UserName", Usuario });
            parametros.Add(new object[] { "@tipo", Tipo });

            try
            {
                object retorno = DAO.ExecuteScalar(@"INS_DespesaTipo @tipo = @tipo, @UserName = @UserName;", parametros);
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

        public static List<DespesaTipo> Listar()
        {
            DataTable dt = DAO.RetornaDT("SEL_DespesaTipo");
            List<DespesaTipo> Lista = new List<DespesaTipo>();
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow c in dt.Rows)
                {
                    Lista.Add(new DespesaTipo(
                        int.Parse(c["idtipo"].ToString())
                        , c["ccTipo"].ToString()
                        ));
                }

            }

            return Lista;
        }

        public static DespesaTipo ListarPorID(int idObject)
        {
            throw new NotImplementedException();
        }

        public bool Salvar(string Usuario)
        {
            throw new NotImplementedException();
        }
    }
}