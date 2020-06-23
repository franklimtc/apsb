﻿using Microsoft.ReportingServices.ReportProcessing.ReportObjectModel;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Site.Classes
{
    public class Clinica
    {
        #region Campos
        public int idClinica { get; set; }
        public string ccApelido { get; set; }
        public string ccRazaoSocial { get; set; }
        public string ccUF { get; set; }
        public string ccCidade { get; set; }
        public string ccNomeFantasia { get; set; }
        public string ccContato { get; set; }
        public string cvCNPJ { get; set; }
        public string ccEmail { get; set; }
        public double cvISS { get; set; }
        public double cvDescontos { get; set; }
        public string ccDescontoVariavel { get; set; }
        public bool cbDescontoVariavel { get; set; }
        public string ccBanco { get; set; }
        public string ccObservacao { get; set; }
        public int cvIdBanco { get; set; }
        public int cvPgtoDias { get; set; }
        public long cvTelefone { get; set; }


        #endregion

        public Clinica()
        {

        }

        public Clinica(int _id, string _apelido, string _razaoSocial, string _nomeFantasia, string _email, double _iss, double _descontos, string _descontoVariavel, string _banco, string _observacoes, int _pgtoDias)
        {
            this.idClinica = _id;
            this.ccApelido = _apelido;
            this.ccRazaoSocial = _razaoSocial;
            this.ccNomeFantasia = _nomeFantasia;
            this.ccEmail = _email;
            this.cvISS = _iss;
            this.cvDescontos = _descontos;
            this.ccDescontoVariavel = _descontoVariavel;
            this.ccBanco = _banco;
            this.ccObservacao = _observacoes;
            this.cvPgtoDias = _pgtoDias;
        }

        public static List<Clinica> Listar()
        {
            DataTable dt = DAO.RetornaDT("SEL_Clinicas");
            List<Clinica> Lista = new List<Clinica>();
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow c in dt.Rows)
                {
                    Lista.Add(new Clinica(
                        int.Parse(c["IdClinica"].ToString())
                        , c["ccApelido"].ToString()
                        , c["ccRazaoSocial"].ToString()
                        , c["ccNomeFantasia"].ToString()
                        , c["ccEmail"].ToString()
                        , double.Parse(c["cvISS"].ToString())
                        , double.Parse(c["cvDescontos"].ToString())
                        , c["cbDescontoVariavel"].ToString()
                        , c["ccBanco"].ToString()
                        , c["observacao"].ToString()
                        , int.Parse(c["cvPgtoDias"].ToString())
                                        ));
                }

            }

            return Lista;
        }
        internal static Clinica ListarPorID(int _idClinica)
        {
            List<object[]> parametros = new List<object[]>();
            parametros.Add(new object[] { "@IdClinica", _idClinica });
            DataTable dt = DAO.RetornaDT("SEL_Clinicas", parametros);


            List<Clinica> Lista = new List<Clinica>();
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow c in dt.Rows)
                {
                    Lista.Add(new Clinica(
                        int.Parse(c["IdClinica"].ToString())
                        , c["ccApelido"].ToString()
                        , c["ccRazaoSocial"].ToString()
                        , c["ccNomeFantasia"].ToString()
                        , c["ccEmail"].ToString()
                        , double.Parse(c["cvISS"].ToString())
                        , double.Parse(c["cvDescontos"].ToString())
                        , c["cbDescontoVariavel"].ToString()
                        , c["ccBanco"].ToString()
                        , c["observacao"].ToString()
                        , int.Parse(c["cvPgtoDias"].ToString())
                                        ));
                }

            }

            return Lista.Where(x => x.idClinica == _idClinica).FirstOrDefault();
        }
        internal bool Adicionar(string Usuario)
        {
            bool result = false;
            List<object[]> parametros = new List<object[]>();
            parametros.Add(new object[] { "@UserName", Usuario });
            parametros.Add(new object[] { "@ccApelido", this.ccApelido });
            parametros.Add(new object[] { "@ccRazaoSocial", this.ccRazaoSocial });
            parametros.Add(new object[] { "@ccNomeFantasia", this.ccNomeFantasia });
            parametros.Add(new object[] { "@ccEmail", this.ccEmail });
            parametros.Add(new object[] { "@cvISS", this.cvISS });
            parametros.Add(new object[] { "@cvDescontos", this.cvDescontos });
            parametros.Add(new object[] { "@idBanco", this.cvIdBanco });
            parametros.Add(new object[] { "@cbDescontoVariavel", this.cbDescontoVariavel });
            parametros.Add(new object[] { "@observacoes", this.ccObservacao });
            parametros.Add(new object[] { "@cvPgtoDias", this.cvPgtoDias });

            try
            {
                object retorno = DAO.ExecuteScalar(@"INS_Clinica @UserName = @UserName,@ccApelido = @ccApelido, @ccRazaoSocial = @ccRazaoSocial, @ccNomeFantasia = @ccNomeFantasia, @ccEmail = @ccEmail, 
@cvISS = @cvISS, @cvDescontos = @cvDescontos, @idBanco = @idBanco, @cbDescontoVariavel = @cbDescontoVariavel, @observacoes = @observacoes, @cvPgtoDias= @cvPgtoDias", parametros);
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
        internal static bool Excluir(string Usuario, int idClinica)
        {
            bool result = false;
            List<object[]> parametros = new List<object[]>();
            parametros.Add(new object[] { "@UserName", Usuario });
            parametros.Add(new object[] { "@idClinica", idClinica });

            try
            {
                object retorno = DAO.ExecuteScalar(@"EXC_Clinica @UserName = @UserName, @idClinica = @idClinica;", parametros);
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
        internal bool Salvar(string Usuario)
        {
            bool result = false;
            List<object[]> parametros = new List<object[]>();
            parametros.Add(new object[] { "@idClinica", this.idClinica });
            parametros.Add(new object[] { "@UserName", Usuario });
            parametros.Add(new object[] { "@ccApelido", this.ccApelido });
            parametros.Add(new object[] { "@ccRazaoSocial", this.ccRazaoSocial });
            parametros.Add(new object[] { "@ccNomeFantasia", this.ccNomeFantasia });
            parametros.Add(new object[] { "@ccEmail", this.ccEmail });
            parametros.Add(new object[] { "@cvISS", this.cvISS });
            parametros.Add(new object[] { "@cvDescontos", this.cvDescontos });
            parametros.Add(new object[] { "@idBanco", this.cvIdBanco });
            parametros.Add(new object[] { "@cbDescontoVariavel", this.cbDescontoVariavel });
            parametros.Add(new object[] { "@observacoes", this.ccObservacao });
            parametros.Add(new object[] { "@cvPgtoDias", this.cvPgtoDias });

            try
            {
                object retorno = DAO.ExecuteScalar(@"UPD_Profissional @ccNome, @ccSexo, @ccNaturalUF, @ccNaturalCidade, @ccEstadoCivil, @ccEmail
, @UserName, @observacoes, @RGNum, @RGEmissor, @RGdtEmissao, @CPFNum, @cvTelefone, @cvCelular, @nomePai, @nomeMae, @nomeConjuge, @IdProfissional", parametros);

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