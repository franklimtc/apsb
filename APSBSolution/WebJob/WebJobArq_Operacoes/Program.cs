using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace WebJobArq_Operacoes
{
    class Program
    {
        static void Main(string[] args)
        {
            while (true)
            {
                using (var db = new APSB())
                {
                    try
                    {
                        Console.WriteLine("Iniciando arquivamento de operações!");
                        var qtdMonths = ConfigurationManager.AppSettings["Months"];
                        DateTime dtfim = DateTime.Now.AddMonths(int.Parse(qtdMonths) * -1);
                        var qtd = db.ARQ_Operacoes(dtfim, "WebJobArquivamento");
                        //db.SaveChanges();
                        Console.WriteLine($"{qtd} registros arquivados com sucesso!");
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex.Message);
                    }
                   
                }
                Thread.Sleep(new TimeSpan(24, 0, 0));
            }
           
        }
    }
}
