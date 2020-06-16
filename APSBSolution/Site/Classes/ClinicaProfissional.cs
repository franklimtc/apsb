using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Site.Classes
{
    public class ClinicaProfissional
    {
        #region Campos
        public int IdClinicaProfissional { get; set; }
        public int idClinica { get; set; }
        public int idProfissional { get; set; }
        public double cvTaxaProfissional { get; set; }
        public int idObservacao { get; set; }
        public string ccObservacao { get; set; }

        #endregion

        public ClinicaProfissional(int _idClinica, int _idProfissional, double _taxa, string Observacao)
        {
            this.idClinica = _idClinica;
            this.idProfissional = _idProfissional;
            this.cvTaxaProfissional = _taxa;
            this.ccObservacao = Observacao;
        }

        public bool Adicionar(string Usuario)
        {
              bool result = false;
            List<object[]> parametros = new List<object[]>();
            parametros.Add(new object[] { "@UserName", Usuario });
            parametros.Add(new object[] { "@idClinica", this.idClinica });
            parametros.Add(new object[] { "@idProfissional", this.idProfissional });
            parametros.Add(new object[] { "@taxa", this.cvTaxaProfissional });
            parametros.Add(new object[] { "@observacoes", this.ccObservacao });

            try
            {
                object retorno = DAO.ExecuteScalar(@"INS_ClinicaProfissional @UserName = @UserName, @idClinica = @idClinica, @idProfissional = @idProfissional, @cvTaxaProfissional = @taxa, @observacoes = @observacoes", parametros);
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