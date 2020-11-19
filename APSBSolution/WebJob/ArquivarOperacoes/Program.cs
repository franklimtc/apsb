using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Configuration;

namespace ArquivarOperacoes
{
    class Program
    {
        static string JobName = ConfigurationManager.AppSettings["JobName"];

        static void Main(string[] args)
        {
            Default db = new Default();
            tbParametros parametros = db.tbParametros.ToList().FirstOrDefault();

            DateTime dtFiltro = DateTime.Now.AddDays(DateTime.Now.Day * -1).AddMonths(parametros.ArquivarOperacoesEmMeses * -1).AddDays(1);

            tbLogJobs log = new tbLogJobs();
            log.JobName = JobName;

            try
            {
                var result = db.ARQ_Operacoes(dtFiltro);

                log.logs = $"Foram arquivadas {result} operações.";
                log.status = "C";

                db.tbLogJobs.Add(log);
                db.SaveChanges();
            }
            catch (Exception ex)
            {
                log.status = "E";
                log.logs = $"{ex.Message}";
                db.SaveChanges();
            }
           
        }
    }
}
