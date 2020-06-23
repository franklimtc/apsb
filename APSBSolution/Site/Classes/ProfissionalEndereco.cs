using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity.Core.Common.CommandTrees;
using System.Linq;
using System.Web;

namespace Site.Classes
{
    public class ProfissionalEndereco
    {
        #region Campos

        public int IdEndereco { get; set; }//IdEndereco int
        public string ccEndereco { get; set; }//ccEndereco  varchar
        public string ccBairro { get; set; }//ccBairro    varchar
        public long? cvCEP { get; set; }//cvCEP   int
        public string ccUF { get; set; }//ccUF    varchar
        public string ccCidade { get; set; }//ccCidade    varchar
        public int? idProfissional { get; set; }//idProfissional  int
        #endregion


        public ProfissionalEndereco()
        {

        }
        public ProfissionalEndereco(int IdEndereco, string ccEndereco, string ccBairro, long? cvCEP, string  ccUF, string ccCidade, int? idProfissional = null)
        {
            this.IdEndereco = IdEndereco;
            this.ccEndereco = ccEndereco;
            this.ccBairro = ccBairro;
            this.cvCEP = cvCEP;
            this.ccUF = ccUF;
            this.ccCidade = ccCidade;
            this.idProfissional = idProfissional;
        }
        public bool Adicionar(string Usuario)
        {
            return Salvar(Usuario);
        }
        #region Não implementar
        public bool Excluir(string Usuario, int idObject)
        {
            throw new NotImplementedException();
        }

        public List<object> Listar()
        {
            throw new NotImplementedException();
        }
        #endregion
        public static ProfissionalEndereco ListarPorID(int idProfissional)
        {
            List<object[]> parametros = new List<object[]>();
            parametros.Add(new object[] { "@idProfissional", idProfissional });
            DataTable dt = DAO.RetornaDT("SEL_ProfissionalEndereco @idProfissional = @idProfissional;", parametros);
            List<ProfissionalEndereco> Lista = new List<ProfissionalEndereco>();

            if (dt.Rows.Count > 0)
            {
                foreach (DataRow p in dt.Rows)
                {
                    ProfissionalEndereco p1 = new ProfissionalEndereco(
                        int.Parse(p["IdEndereco"].ToString())
                        , p["ccEndereco"].ToString()
                        , p["ccBairro"].ToString()
                        , IsLongNumeric(p["cvCEP"].ToString())
                        , p["ccUF"].ToString()
                        , p["ccCidade"].ToString()
                        );
                    
                    Lista.Add(p1);
                }
            }
            return Lista.FirstOrDefault();
        }

        private static long? IsLongNumeric(string Number)
        {
            _ = long.TryParse(Number, out long num);
            return num;
        }

        public bool Salvar(string Usuario)
        {
            bool result = false;
            List<object[]> parametros = new List<object[]>();
            parametros.Add(new object[] { "@UserName", Usuario });
            parametros.Add(new object[] { "@IdEndereco", this.IdEndereco });
            parametros.Add(new object[] { "@ccEndereco", this.ccEndereco });
            parametros.Add(new object[] { "@ccBairro", this.ccBairro });
            parametros.Add(new object[] { "@cvCEP", this.cvCEP });
            parametros.Add(new object[] { "@ccUF", this.ccUF });
            parametros.Add(new object[] { "@ccCidade", this.ccCidade });
            parametros.Add(new object[] { "@idProfissional", this.idProfissional });

            try
            {
                object retorno = DAO.ExecuteScalar(@"UPD_ProfissionalEndereco
                                                    @UserName = @UserName
                                                    , @IdEndereco = @IdEndereco
                                                    , @ccEndereco = @ccEndereco
                                                    , @ccBairro = @ccBairro
                                                    , @cvCEP = @cvCEP
                                                    , @ccUF = @ccUF
                                                    , @ccCidade = @ccCidade
                                                    , @idProfissional = @idProfissional", parametros);
                if (bool.Parse(retorno.ToString()) == true)
                {
                    result = true;
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return result;
        }

    }
}