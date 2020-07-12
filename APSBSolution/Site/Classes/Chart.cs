using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Site.Classes
{
    public class Chart
    {
        public string[] labels { get; set; }
        public int[] data { get; set; }

        public Chart()
        {

        }
        public Chart(string[] lb, int[] dt)
        {
            this.labels = lb;
            this.data = dt;
        }

        public static Chart GetChart(string name)
        {
            string procedure = "";
            switch (name)
            {
                case "fb":
                    procedure = "SEL_ChartFatBruto";
                    break;
                case "fl":
                    procedure = "SEL_ChartFatEfetivo";
                    break;
                case "rb":
                    procedure = "SEL_ChartReceitaBruta";
                    break;
                case "rl":
                    procedure = "SEL_ChartReceitaLiquida";
                    break;
                case "dp":
                    procedure = "SEL_ChartDespesas";
                    break;
                case "nfs":
                    procedure = "SEL_QtdNotas";
                    break;
                default:
                    break;
            }

            DataTable dt = new DataTable();
            dt = DAO.RetornaDT(procedure);
            Chart nChart = new Chart();
            if (dt.Rows.Count > 0)
            {
                
                List<int> data = new List<int>();
                List<string> label = new List<string>();

                foreach (DataRow row in dt.Rows)
                {
                    data.Add(int.Parse(row["cvValor"].ToString()));
                    label.Add(row["d"].ToString());
                    //?DateTime.Parse(row["cdEmissao"].ToString()).DayOfWeek.ToString().ToCharArray()[0]
                }
                nChart = new Chart(label.ToArray(), data.ToArray());
            }

            return nChart;
        }
    }

    public class Resumo
    {
        public string fatPendente { get; set; }
        public string repPendente { get; set; }

        public Resumo(string fp, string rp)
        {
            this.fatPendente = fp;
            this.repPendente = rp;
        }

        public Resumo()
        {

        }

        public static Resumo GetResumo()
        {
            DataTable dt = new DataTable();
            dt = DAO.RetornaDT("SEL_Dashboard");
            Resumo resumo = new Resumo();

            if (dt.Rows.Count > 0)
            {
                foreach (DataRow r in dt.Rows)
                {
                    resumo = new Resumo(r["fatPendente"].ToString(), r["repPendente"].ToString());
                }
            }

            return resumo;
        }

    }


}