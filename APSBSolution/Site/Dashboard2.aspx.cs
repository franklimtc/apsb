using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Site.Classes;

namespace Site
{
    public partial class Dashboard2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CarregarDados();
            }
        }

        private void CarregarDados()
        {
            //MN Mes FatBruto FatLiquido  RecBruta RecLiquida
            DataTable dtResumo = DAO.RetornaDT("SEL_ChartGeral", new List<object[]>() { new object[] { "@mes", DateTime.Now.Month } }, true);
            if (dtResumo.Rows.Count > 0)
            {
                lbFatBruto.InnerText = dtResumo.Rows[0]["FatBruto"].ToString();
                lbFatLiquido.InnerText = dtResumo.Rows[0]["FatLiquido"].ToString();
                lbRecBruta.InnerText = dtResumo.Rows[0]["RecBruta"].ToString();
                lbRecLiquida.InnerText = dtResumo.Rows[0]["RecLiquida"].ToString();
            }
            
            //lbFatLiquido .InnerText = r.repPendente;

        }

        [WebMethod]
        public static List<object[]> GetChartGeral()
        {
            DataTable dtChart = DAO.RetornaDT("SEL_ChartGeral");
            List<object[]> listaDados = new List<object[]>();
            listaDados.Add(new object[] { "Mês", "Fat Bruto", "Fat Liquido", "Rec Bruta", "Rec Liquida" });

            foreach (DataRow row in dtChart.Rows)
            {
                listaDados.Add(new object[] { row["Mes"], row["FatBruto"], row["FatLiquido"], row["RecBruta"], row["RecLiquida"] });
            }

            return listaDados;
        }
    }
}