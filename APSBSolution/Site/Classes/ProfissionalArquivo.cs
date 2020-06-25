using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace Site.Classes
{
    public class ProfissionalArquivo
    {
        #region Campos
        public int idArquivo { get; set; }//idArquivo int no	4
        public int idProfissional { get; set; }//idProfissional int no	4
        public string ccNomeArquivo { get; set; }//ccNomeArquivo varchar no	50
        public DateTime cdDataCriacao { get; set; }//cdDataCriacao datetime    no	8
        public string ccArquivoUpload { get; set; }
        public string ccArquivoDownload { get; set; }
        public byte[] fileBytes { get; set; }

        public ProfissionalArquivo()
        {

        }

        public ProfissionalArquivo(int id, string nome, DateTime data)
        {
            this.idArquivo = id;
            this.ccNomeArquivo = nome;
            this.cdDataCriacao = data;
        }
        #endregion

        public bool Adicionar(string Usuario)
        {
            throw new NotImplementedException();
        }

        public bool Excluir(string Usuario)
        {
            bool result = false;
            List<object[]> parametros = new List<object[]>();
            parametros.Add(new object[] { "@UserName", Usuario });
            parametros.Add(new object[] { "@idArquivo", this.idArquivo });

            try
            {
                object retorno = DAO.ExecuteScalar(@"EXC_ProfissionalArquivo @UserName=@UserName, @idArquivo = @idArquivo;", parametros);

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

        public static List<ProfissionalArquivo> Listar(object id)
        {
            List<ProfissionalArquivo> Lista = new List<ProfissionalArquivo>();
            if(id != null)
            {
                int.TryParse(id.ToString(), out int idProfissional);
                DataTable dt = DAO.RetornaDT($"SEL_ProfissionalArquivo @idProfissional={idProfissional};");
                if (dt.Rows.Count > 0)
                {
                    foreach (DataRow p in dt.Rows)
                    {
                        //idArquivo ccNomeArquivo   cdDataCriacao
                        Lista.Add(new ProfissionalArquivo(
                            int.Parse(p["idArquivo"].ToString()),
                            p["ccNomeArquivo"].ToString(),
                            DateTime.Parse(p["cdDataCriacao"].ToString())
                            ));
                    }
                }
            }

            return Lista;
        }

        public static ProfissionalArquivo ListarPorID(int idArquivo)
        {
            ProfissionalArquivo p1 = new ProfissionalArquivo();

            DataTable dt = DAO.RetornaDT($"SEL_ProfissionalArquivoBinary @idArquivo = {idArquivo};");
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow p in dt.Rows)
                {
                    //idArquivo ccNomeArquivo   cdDataCriacao
                    p1.fileBytes = Encoding.ASCII.GetBytes(p["binaryFile"].ToString()); //GetBytes(p["binaryFile"].ToString());
                    p1.ccNomeArquivo = p["ccNomeArquivo"].ToString();
                }
            }
            return p1;
        }
      
        public bool Salvar(string Usuario)
        {
            bool result = false;
            List<object[]> parametros = new List<object[]>();
            parametros.Add(new object[] { "@UserName", Usuario });
            parametros.Add(new object[] { "@idProfissional", this.idProfissional });
            parametros.Add(new object[] { "@ccNomeArquivo", this.ccNomeArquivo });
            parametros.Add(new object[] { "@binaryFile", this.fileBytes });

            try
            {
                object retorno = DAO.ExecuteScalar(@"INS_ProfissionalArquivo @UserName = @UserName, @idProfissional = @idProfissional,@ccNomeArquivo = @ccNomeArquivo, @binaryFile = @binaryFile;", parametros);

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

        public static void BaixarArquivo(string path, int idProfissionalArquivo)
        {
            SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["Dados"].ToString());

            var command = new SqlCommand($"select binaryFile from tbProfissionalArquivo where idArquivo = {idProfissionalArquivo}", sqlConnection);
            sqlConnection.Open();
            var reader = command.ExecuteReader();
            reader.Read();
            var pdfBinaryBuffer = (byte[])reader[0];

            // Save file to disk
            var file = File.Create(path, pdfBinaryBuffer.Length);
            file.Write(pdfBinaryBuffer, 0, pdfBinaryBuffer.Length);
            file.Close();
            sqlConnection.Close();
        }

        public static string GetName(int idArquivo)
        {
            string query = $"select ccNomeArquivo from tbProfissionalArquivo where idArquivo = {idArquivo}";
            return DAO.ExecuteScalar(query).ToString();
        }
    }
}