using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Site.Classes
{
    public class RelVendas
    {
        #region Campos
        public int idReceita { get; set; }
        public float cvValor { get; set; }//cvValor
        public float cvValorPago { get; set; }//cvValorPago
        public float cvValorRepassado { get; set; }//cvValorRepassado
        public float cvValorDisponivel { get; set; }//cvValorDisponivel
        public DateTime? cdEmissao { get; set; }//cdEmissao
        public DateTime? cdPagamento { get; set; }//cdPagamento
        public DateTime? cdRepasse { get; set; }//cdRepasse
        public float cvDesconto { get; set; }//cvDesconto
        public long cvNF { get; set; }//cvNF
        public string observacao { get; set; }//observacao
        public bool cbIssRetido { get; set; }//cbIssRetido
        public string ccIssRetido { get; set; }
        public string ccApelido { get; set; }//ccApelido
        public long cvCNPJ { get; set; }//cvCNPJ
        public DateTime? cdPrevistaPgto { get; set; }//cdPrevistaPgto
        public float cvDescontoValor { get; set; }//cvDescontoValor
        public float cvISS { get; set; }//cvISS
        public float cvISSValor { get; set; }//cvISSValor
        public string Status { get; set; }//Status

        #endregion

        public RelVendas()
        {

        }


        public static List<RelVendas> Listar()
        {
            List<object[]> parametros = new List<object[]>();
           

            DataTable dt = DAO.RetornaDT("SEL_Receitas", parametros);
            List<RelVendas> Lista = new List<RelVendas>();
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow c in dt.Rows)
                {
                    //         
                    RelVendas rv = new RelVendas();

                    rv.idReceita = int.Parse(c["idReceita"].ToString());
                    rv.observacao = (c["observacao"].ToString());
                    rv.Status = (c["Status"].ToString());
                    rv.ccApelido = (c["ccApelido"].ToString());

                    if (DateTime.TryParse(c["cdPrevistaPgto"].ToString(), out DateTime cdPrevistaPgtot))
                    {
                        rv.cdPrevistaPgto = cdPrevistaPgtot;
                    }
                    if (float.TryParse(c["cvISS"].ToString(), out float cvISSt))
                    {
                        rv.cvISS = cvISSt / 100;
                    }
                    if (float.TryParse(c["cvISSValor"].ToString(), out float cvISSValort))
                    {
                        rv.cvISSValor = cvISSValort;
                    }
                    if (float.TryParse(c["cvDescontoValor"].ToString(), out float cvDescontoValort))
                    {
                        rv.cvDescontoValor = cvDescontoValort;
                    }
                    if (long.TryParse(c["cvCNPJ"].ToString(), out long cvCNPJt))
                    {
                        rv.cvCNPJ = cvCNPJt;
                    }
                    if (bool.TryParse(c["cbIssRetido"].ToString(), out bool cbIssRetidot))
                    {
                        rv.cbIssRetido = cbIssRetidot;
                        if (cbIssRetidot)
                        {
                            rv.ccIssRetido = "Sim";
                        }
                        else
                        {
                            rv.ccIssRetido = "Não";
                        }

                    }
                    if (float.TryParse(c["cvValor"].ToString() , out float cvValorT))
                    {
                        rv.cvValor = cvValorT;
                    }
                    if (float.TryParse(c["cvValorPago"].ToString(), out float cvValorPagoT))
                    {
                        rv.cvValorPago = cvValorPagoT;
                    }
                    if (float.TryParse(c["cvValorRepassado"].ToString(), out float cvValorRepassadot))
                    {
                        rv.cvValorRepassado = cvValorRepassadot;
                    }
                    if (float.TryParse(c["cvValorDisponivel"].ToString(), out float cvValorDisponivelt))
                    {
                        rv.cvValorDisponivel = cvValorDisponivelt;
                    }
                    if (DateTime.TryParse(c["cdEmissao"].ToString(), out DateTime cdEmissaot))
                    {
                        rv.cdEmissao = cdEmissaot;
                    }
                    if (DateTime.TryParse(c["cdPagamento"].ToString(), out DateTime cdPagamentot))
                    {
                        rv.cdPagamento = cdPagamentot;
                    }
                    if (DateTime.TryParse(c["cdRepasse"].ToString(), out DateTime cdRepasset))
                    {
                        rv.cdRepasse = cdRepasset;
                    }
                    if (float.TryParse(c["cvDesconto"].ToString(), out float cvDescontot))
                    {
                        rv.cvDesconto = cvDescontot / 100;
                    }

                    if (int.TryParse(c["cvNF"].ToString(), out int cvNFt))
                    {
                        rv.cvNF = cvNFt;
                    }

                    Lista.Add(rv);
                }
            }

                return Lista;
        }
    }
}