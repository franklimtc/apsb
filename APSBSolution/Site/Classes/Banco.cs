using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Site.Classes
{
    public class Banco
    {
        public int IdBanco { get; set; }
        public string ccBanco { get; set; }
        public int cvCodBanco { get; set; }

        public Banco()
        {

        }

        public Banco(int _id, string _banco, int _codigo)
        {
            this.IdBanco = _id;
            this.ccBanco = _banco;
            this.cvCodBanco = _codigo;
        }
        public static List<Banco> Listar()
        {
            List<Banco> Lista = new List<Banco>();
            DataTable dt = DAO.RetornaDT("SEL_Bancos");

            if (dt.Rows.Count > 0)
            {
                foreach (DataRow b in dt.Rows)
                {
                    Lista.Add(new Banco(
                        int.Parse(b["IdBanco"].ToString()),
                        b["ccBanco"].ToString(),
                        int.Parse(b["cvCodBanco"].ToString())
                        ));
                }
            }
            return Lista;
        }
    }
}