using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Site.Classes
{
    public class Especialidade
    {
        #region Campos
        public int idEspecialidade { get; set; }//idEspecialidade
        public string ccEspecialidade { get; set; }//Especialidade
        #endregion
        public bool Adicionar(string Usuario)
        {
            throw new NotImplementedException();
        }

        public bool Excluir(string Usuario, int idObject)
        {
            throw new NotImplementedException();
        }

        public static List<Especialidade> Listar()
        {
            List<object[]> parametros = new List<object[]>();
            DataTable dt = DAO.RetornaDT("SEL_Especialidades");
            List<Especialidade> Lista = new List<Especialidade>();

            if (dt.Rows.Count > 0)
            {
                foreach (DataRow p in dt.Rows)
                {
                    Especialidade p1 = new Especialidade();
                    p1.ccEspecialidade = p["ccEspecialidade"].ToString();
                    p1.idEspecialidade = int.Parse(p["idEspecialidade"].ToString());
                    Lista.Add(p1);
                }
            }
            return Lista;
        }

        public static Especialidade ListarPorID(int idObject)
        {
            throw new NotImplementedException();
        }

        public bool Salvar(string Usuario)
        {
            throw new NotImplementedException();
        }
    }
}