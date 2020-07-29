using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Site.Classes
{
    public class ClinicaProfissional
    {
        #region Campos
        public enum Status { Inativo = 0, Ativo = 1};

        public int IdClinicaProfissional { get; set; }
        public int idClinica { get; set; }
        public int idProfissional { get; set; }
        public double cvTaxaProfissional { get; set; }
        public int idObservacao { get; set; }
        public string ccObservacao { get; set; }
        public Status cvStatus { get; set; }
        public string ccNomeProfissional { get; set; }

        #endregion

        public ClinicaProfissional(int _idClinica, int _idProfissional, double _taxa, string _obs)
        {
            this.idClinica = _idClinica;
            this.idProfissional = _idProfissional;
            this.cvTaxaProfissional = _taxa;
            this.ccObservacao = _obs;
        }
        public ClinicaProfissional(int _idClinicaProfissional, string _nomeProfissional, double _taxa, string Observacao, int _status)
        {
            this.IdClinicaProfissional = _idClinicaProfissional;
            this.ccNomeProfissional = _nomeProfissional;
            this.cvTaxaProfissional = _taxa;
            this.ccObservacao = Observacao;
            this.cvStatus = (Status)_status;
        }

        public ClinicaProfissional()
        {
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

        public static List<ClinicaProfissional> Listar(int _idClinica, int? _idProfissional = null)
        {
            List<object[]> parametros = new List<object[]>();
            parametros.Add(new object[] { "@idClinica", _idClinica });
            if (_idProfissional.HasValue)
            {
                parametros.Add(new object[] { "@idProfissional", _idProfissional.Value });
            }
            else
            { 
                parametros.Add(new object[] { "@idProfissional", DBNull.Value});
            }
            DataTable dt = DAO.RetornaDT("SEL_ClinicaProfissional @idClinica = @idClinica, @idProfissional = @idProfissional", parametros);

            List<ClinicaProfissional> Lista = new List<ClinicaProfissional>();
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow c in dt.Rows)
                {
                    ClinicaProfissional cNew = new ClinicaProfissional(int.Parse(c["IdClinicaProfissional"].ToString())
                        , c["ccNome"].ToString()
                        , double.Parse(c["cvTaxaProfissional"].ToString())
                        , c["observacao"].ToString()
                        , int.Parse(c["cvStatus"].ToString())
                        );
                    cNew.idClinica = int.Parse(c["idClinica"].ToString());
                    Lista.Add(cNew);
                }
            }

            return Lista;
        }

        internal static bool Excluir(string Usuario, int idRelacao)
        {
            bool result = false;
            List<object[]> parametros = new List<object[]>();
            parametros.Add(new object[] { "@UserName", Usuario });
            parametros.Add(new object[] { "@idClinicaProfissional", idRelacao });

            try
            {
                object retorno = DAO.ExecuteScalar(@"EXC_ClinicaProfissional @UserName = @UserName, @idClinicaProfissional = @idClinicaProfissional;", parametros);
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