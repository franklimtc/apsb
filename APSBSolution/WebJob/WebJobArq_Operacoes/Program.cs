using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WebJobArq_Operacoes
{
    class Program
    {
        static void Main(string[] args)
        {
            APSB db = new APSB();
            var qtdMonths = ConfigurationManager.AppSettings["Months"];
            DateTime dtfim = DateTime.Now.AddMonths(int.Parse(qtdMonths) * -1);
            db.ARQ_Operacoes(dtfim, "WebJobArquivamento");
            db.SaveChanges();
        }
    }
}
