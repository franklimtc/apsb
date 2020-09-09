using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Site.Classes
{
    public class DAO
    {
        public static string connString = ConfigurationManager.ConnectionStrings["Dados"].ToString();

        public static void ExecuteNonQuery(string query, List<object[]> parametros = null)
        {
            SqlConnection conexao = new SqlConnection(connString);
            SqlCommand comand = new SqlCommand(query, conexao);

            if (parametros != null)
            {
                foreach (var item in parametros)
                {
                    comand.Parameters.AddWithValue(item[0].ToString(), item[1]);
                }
            }

            try
            {
                conexao.Open();
                comand.ExecuteNonQuery();
                conexao.Close();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                conexao.Close();
            }
        }

        public static object ExecuteScalar(string query, List<object[]> parametros = null)
        {
            SqlConnection conexao = new SqlConnection(connString);
            SqlCommand comand = new SqlCommand(query, conexao);
            if (parametros != null)
            {
                foreach (var item in parametros)
                {
                    switch (item[1])
                    {
                        case null:
                            comand.Parameters.AddWithValue(item[0].ToString(), DBNull.Value);
                            break;
                        case "":
                            comand.Parameters.AddWithValue(item[0].ToString(), DBNull.Value);
                            break;
                        default:
                            comand.Parameters.AddWithValue(item[0].ToString(), item[1]);
                            break;
                    }
                }
            }
            

            object result;

            try
            {
                conexao.Open();
                result = comand.ExecuteScalar();
                conexao.Close();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                conexao.Close();
            }
            return result;
        }

        public static DataTable RetornaDT(string query, List<object[]> parametros = null)
        {
            SqlConnection conexao = new SqlConnection(connString);
            SqlCommand comand = new SqlCommand(query, conexao);
            DataTable dt = new DataTable();

            if (parametros != null)
            {
                foreach (var item in parametros)
                {
                    comand.Parameters.AddWithValue(item[0].ToString(), item[1]);
                }
            }

            SqlDataAdapter da = new SqlDataAdapter(comand);

            try
            {
                conexao.Open();
                da.Fill(dt);
                conexao.Close();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                conexao.Close();
            }

            return dt;
        }
    }
}