using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Site.Classes
{
    public class RelVendas
    {
        #region Campos
        public int cvIDVenda { get; set; }

        //Colunas do relatório de vendas:
        //clínica(razão social)
        public string ccClinica { get; set; }
        public string ccCNPJ { get; set; }
        public string ccEmail { get; set; }
        public string ccCidade { get; set; }
        public string ccUF { get; set; }
        public int cvNF { get; set; }
        public DateTime cdDataEmissao { get; set; }
        public double cvValorBruto { get; set; }
        public DateTime cdDataPrevista { get; set; }
        public DateTime cdDataPagamento { get; set; }
        public double cvValorPago { get; set; }
        public double cvImpostoRetidoPercentual { get; set; }
        public double cvImpostoRetidoValor { get; set; }
        public double cvISSPercentual { get; set; }
        public double cvISSValor { get; set; }
        public DateTime cdDataRepasse { get; set; }
        public double cvValorRepasse { get; set; }
        public string cvStatus { get; set; }
        #endregion

        public RelVendas()
        {

        }

        public RelVendas(int _id, string _clinica, double _valor)
        {
            this.cvIDVenda = _id;
            this.ccClinica = _clinica;
            this.cvValorBruto = _valor;
            this.cvValorPago = _valor;
            this.cvValorPago = _valor * 0.9;
        }

        public List<RelVendas> Listar()
        {
            List<RelVendas> Lista = new List<RelVendas>();

            Lista.Add(new RelVendas(1, "Clínica A", 1000));
            Lista.Add(new RelVendas(2, "Clínica B", 1000));
            Lista.Add(new RelVendas(3, "Clínica C", 1000));
            Lista.Add(new RelVendas(4, "Clínica D", 1000));
            Lista.Add(new RelVendas(5, "Clínica E", 1000));

            return Lista;

        }
    }
}