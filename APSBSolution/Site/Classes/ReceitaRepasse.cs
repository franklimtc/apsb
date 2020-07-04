using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.InteropServices;
using System.Web;

namespace Site.Classes
{
    public class ReceitaRepasse
    {
        #region Campos
        public enum StatusReceita { Aguardando = 'A', Cancelada = 'C', Repassada = 'R' };
        public int idRepasse { get; set; }//idRepasse int
        public int idReceita { get; set; }//idReceita   int
        public int IdProfissional { get; set; }//IdProfissional  int
        public string ccNome { get; set; }
        public int IdObservacao { get; set; }//IdObservacao    int
        public string Observacao { get; set; }
        public float cvValor { get; set; }//cvValor real
        public StatusReceita ccStatus { get; set; }//ccStatus    char
        public DateTime dataRepasse { get; set; }//dataRepasse datetime
        public string ccCriadoPor { get; set; }//ccCriadoPor varchar


        #endregion

        public ReceitaRepasse()
        {

        }
        public ReceitaRepasse(int _idReasse, int _idReceita, int _idProfissional, string _Obs, float _valor, char _status, DateTime dtRepasse, string criadoPor)
        {
            this.idRepasse = _idReasse;
            this.idReceita = _idReceita;
            this.IdProfissional = _idProfissional;
            this.Observacao = _Obs;
            this.cvValor = _valor;
            this.ccStatus = (StatusReceita)_status;
            this.dataRepasse = dtRepasse;
            this.ccCriadoPor = criadoPor;

        }

        public ReceitaRepasse(object _idReasse, object _idReceita, object _idProfissional, object _Obs, object _valor, object _status, object dtRepasse, object criadoPor, object nome)
        {
            this.idRepasse = int.Parse(_idReasse.ToString());
            this.idReceita = int.Parse(_idReceita.ToString());
            this.IdProfissional = int.Parse(_idProfissional.ToString());
            this.Observacao = _Obs.ToString();
            this.cvValor = float.Parse(_valor.ToString());
            this.ccStatus = (StatusReceita)Convert.ToChar(_status);
            this.ccCriadoPor = criadoPor.ToString();
            //Validar se a propriedade é igual a null
            if (!dtRepasse.ToString().IsNullOrWhiteSpace())
            {
                this.dataRepasse =DateTime.Parse(dtRepasse.ToString());
            }
            this.ccNome = nome.ToString();
        }

        public bool Salvar(string Usuario)
        {
            //UPD_Repasse @idRepasse = @idRepasse, @ccStatus = @ccStatus, @UserName = @UserName;

            bool result = false;
            List<object[]> parametros = new List<object[]>();
            parametros.Add(new object[] { "@UserName", Usuario });
            parametros.Add(new object[] { "@idReceita", this.idReceita });
            parametros.Add(new object[] { "@ccStatus", this.ccStatus });

            try
            {
                object retorno = DAO.ExecuteScalar(@"UPD_Repasse @idRepasse = @idRepasse, @ccStatus = @ccStatus, @UserName = @UserName;", parametros);
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
            //INS_Repasse @idReceita = @idReceita, @IdProfissional = @IdProfissional, @cvValor = @cvValor, @observacoes = @observacoes, @UserName = @UserName;

            bool result = false;
            List<object[]> parametros = new List<object[]>();
            parametros.Add(new object[] { "@UserName", Usuario });
            parametros.Add(new object[] { "@idReceita", this.idReceita });
            parametros.Add(new object[] { "@IdProfissional",  this.IdProfissional});
            parametros.Add(new object[] { "@cvValor", this.cvValor });
            parametros.Add(new object[] { "@observacoes", this.Observacao });

            try
            {
                object retorno = DAO.ExecuteScalar(@"INS_Repasse @idReceita = @idReceita, @IdProfissional = @IdProfissional, @cvValor = @cvValor, @observacoes = @observacoes, @UserName = @UserName;", parametros);
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

        public bool Excluir(string Usuario, int idReceita)
        {
            //EXC_Repasse @idRepasse = @idRepasse, @UserName = @UserName;
            bool result = false;
            List<object[]> parametros = new List<object[]>();
            parametros.Add(new object[] { "@idRepasse", idReceita });
            parametros.Add(new object[] { "@UserName", Usuario });

            try
            {
                object retorno = DAO.ExecuteScalar(@"EXC_Repasse @idRepasse = @idRepasse, @UserName = @UserName;", parametros);
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

        public static List<ReceitaRepasse> Listar(int idReceita)
        {
            List<object[]> parametros = new List<object[]>();
            parametros.Add(new object[] { "@idReceita", idReceita });
            DataTable dt = DAO.RetornaDT("SEL_Repasse @idReceita = @idReceita;", parametros);
            List<ReceitaRepasse> Lista = new List<ReceitaRepasse>();
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow c in dt.Rows)
                {
                    Lista.Add(new ReceitaRepasse(
                        c["idRepasse"]
                        , c["idReceita"]
                        , c["IdProfissional"]
                        , c["observacao"]
                        , c["cvValor"]
                        , c["ccStatus"]
                        , c["dataRepasse"]
                        , c["ccCriadoPor"]
                        , c["ccNome"]
                        ));
                }
            }

            return Lista;
        }

        //public static ReceitaRepasse ListarPorID(int idReceita)
        //{
        //    List<object[]> parametros = new List<object[]>();
        //    parametros.Add(new object[] { "@idReceita", idReceita });
        //    DataTable dt = DAO.RetornaDT("SEL_Receitas @idReceita = @idReceita;", parametros);
        //    List<ReceitaRepasse> Lista = new List<ReceitaRepasse>();
        //    if (dt.Rows.Count > 0)
        //    {
        //        foreach (DataRow c in dt.Rows)
        //        {
        //            Lista.Add(new ReceitaRepasse(
        //                c["idRepasse"]
        //                , c["idReceita"]
        //                , c["IdProfissional"]
        //                , c["observacao"]
        //                , c["cvValor"]
        //                , c["ccStatus"]
        //                , c["dataRepasse"]
        //                , c["ccCriadoPor"]
        //                , c["ccNome"]
        //                , c["cvValorDisponivel"]
        //                ));
        //        }
        //    }

        //    return Lista.FirstOrDefault();
        //}
    }
}