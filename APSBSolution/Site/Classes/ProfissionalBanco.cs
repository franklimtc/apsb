using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Site.Classes
{
    public class ProfissionalBanco 
    {
        #region Campos

        public int IdProfissionalBanco { get; set; }//IdProfissionalBanco int
        public string ccAgencia { get; set; }//ccAgencia   varchar
        public string ccConta { get; set; }//ccConta varchar
        public string ccOperacao { get; set; }//ccOperacao  varchar
        public int idProfissional { get; set; }//idProfissional  int
        public int idBanco { get; set; }//idBanco int
        public bool cvStatus { get; set; }//cvStatus    bit
        public string ccBanco { get; set; }
        public int cvCodBanco { get; set; }
        #endregion

        public ProfissionalBanco(int id, string banco, int codBanco, string agencia, string conta, string operacao, int _idProfissional, int _idbanco )
        {
            this.IdProfissionalBanco = id;
            this.ccBanco = banco;
            this.cvCodBanco = codBanco;
            this.ccAgencia = agencia;
            this.ccConta = conta;
            this.ccOperacao = operacao;
            this.idProfissional = _idProfissional;
            this.idBanco = _idbanco;
        }

        public ProfissionalBanco()
        {

        }
        public bool Adicionar(string Usuario)
        {
            throw new NotImplementedException();
        }

        public static bool Excluir(string Usuario, int IdProfissionalBanco)
        {
            bool result = false;
            List<object[]> parametros = new List<object[]>();
            parametros.Add(new object[] { "@UserName", Usuario });
            parametros.Add(new object[] { "@IdProfissionalBanco", IdProfissionalBanco });

            try
            {
                object retorno = DAO.ExecuteScalar(@"EXC_ProfissionalBanco @UserName = @UserName, @IdProfissionalBanco = @IdProfissionalBanco;", parametros);
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

        public static List<ProfissionalBanco> Listar(int idProfissional)
        {
            List<ProfissionalBanco> Lista = new List<ProfissionalBanco>();
            List<object[]> parametros = new List<object[]>();
            parametros.Add(new object[] { "@idProfissional", idProfissional });
            DataTable dt = DAO.RetornaDT("SEL_ProfissionalBanco @idProfissional = @idProfissional;", parametros);

            //IdProfissionalBanco ccBanco cvCodBanco ccAgencia   ccConta ccOperacao  idProfissional idBanco cvStatus

            if (dt.Rows.Count > 0)
            {
                foreach (DataRow p in dt.Rows)
                {
                    Lista.Add(new ProfissionalBanco(
                        int.Parse(p["IdProfissionalBanco"].ToString())
                        , p["ccBanco"].ToString()
                        , int.Parse(p["cvCodBanco"].ToString())
                        , p["ccAgencia"].ToString()
                        , p["ccConta"].ToString()
                        , p["ccOperacao"].ToString()
                        , idProfissional
                        , int.Parse(p["idBanco"].ToString())
                        ));
                }
            }
            return Lista;
        }

        public object ListarPorID(int idObject)
        {
            throw new NotImplementedException();
        }

        public bool Salvar(string Usuario)
        {
            //UPD_ProfissionalBanco @UserName = @UserName, @IdProfissionalBanco = @IdProfissionalBanco, @ccAgencia = @ccAgencia, @ccConta = @ccConta, @ccOperacao = @ccOperacao, @idProfissional = @idProfissional, @idBanco = @idBanco

            bool result = false;
            List<object[]> parametros = new List<object[]>();
            parametros.Add(new object[] { "@UserName", Usuario });
            parametros.Add(new object[] { "@IdProfissionalBanco", this.IdProfissionalBanco });
            parametros.Add(new object[] { "@ccAgencia", this.ccAgencia });
            parametros.Add(new object[] { "@ccConta", this.ccConta });
            parametros.Add(new object[] { "@ccOperacao", this.ccOperacao });
            parametros.Add(new object[] { "@idProfissional", this.idProfissional });
            parametros.Add(new object[] { "@idBanco", this.idBanco });

            try
            {
                object retorno = DAO.ExecuteScalar(@"UPD_ProfissionalBanco @UserName = @UserName, @IdProfissionalBanco = @IdProfissionalBanco, @ccAgencia = @ccAgencia
                                                    , @ccConta = @ccConta, @ccOperacao = @ccOperacao, @idProfissional = @idProfissional, @idBanco = @idBanco", parametros);
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