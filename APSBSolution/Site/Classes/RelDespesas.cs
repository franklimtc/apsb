using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Site.Classes
{
    public class RelDespesas
    {
        #region Campos

        public int cvID { get; set; }
        public string ccDespesa { get; set; }
        public double cvValor { get; set; }
        public DateTime cdDataVencimento { get; set; }
        public string cvStatus { get; set; }

        #endregion

        public RelDespesas()
        {

        }

        public RelDespesas(int _id, string _despesa, double _valor, DateTime _dataVencimento, string _status)
        {
            this.cvID = _id;
            this.ccDespesa = _despesa;
            this.cvValor = _valor;
            this.cdDataVencimento = _dataVencimento;
            this.cvStatus = _status;
        }

        public List<RelDespesas> Listar()
        {
            List<RelDespesas> Lista = new List<RelDespesas>();
            Lista.Add(new RelDespesas(1,"Internet", 1000, DateTime.Now, "Pendente"));
            Lista.Add(new RelDespesas(2,"Luz", 1000, DateTime.Now, "Pendente"));
            Lista.Add(new RelDespesas(3,"Água", 1000, DateTime.Now, "Pendente"));
            Lista.Add(new RelDespesas(4,"Condomínio", 1000, DateTime.Now, "Pendente"));
            return Lista;
        }
    }
}