using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Configuration;

namespace MalaDireta
{
    public class Dao
    {
        static string connString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString();

        public static bool Conectar()
        {
            SqlConnection conn = new SqlConnection(connString);
            bool result = false;
            try
            {
                conn.Open();
                result = true;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                conn.Close();
            }
            return result;
        }

        public static object ExecuteScalar(string query)
        {
            SqlConnection conn = new SqlConnection(connString);
            SqlCommand comand = new SqlCommand(query, conn);
            object result;

            try
            {
                conn.Open();
                result = comand.ExecuteScalar();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                conn.Close();
            }
            return result;
        }
    }

    public class Profissional
    {
        public string ccNome { get; set; }
        public string ccEmail { get; set; }

        public Profissional(string nome)
        {
            this.ccNome = nome;
            string query = $"SELECT ccEmail FROM tbProfissionais WHERE ccNome = '{this.ccNome}'";
            var email = Dao.ExecuteScalar(query);

            if (email != null)
            {
                this.ccEmail = email.ToString();
            }
        }
    }
}
