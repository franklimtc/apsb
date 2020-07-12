using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Site.Classes;

namespace Site
{
    public partial class Dash : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CarregarDados();
            }
        }
        void CarregarDados() {
            Resumo r = Resumo.GetResumo();

            hrp.InnerText = r.repPendente;
            hfp.InnerText = r.fatPendente;
        }

        #region WebMethods

        [WebMethod]
        public static Chart GetChartfb()
        {
            Chart cht = Chart.GetChart("fb");
            return cht;
        }

        [WebMethod]
        public static Chart getChartfl()
        {
            Chart cht = Chart.GetChart("fl");
            return cht;
        }

        [WebMethod]
        public static Chart getChartrb()
        {
            Chart cht = Chart.GetChart("rb");
            return cht;
        }
        [WebMethod]
        public static Chart getChartrl()
        {
            Chart cht = Chart.GetChart("rl");
            return cht;
        }

        [WebMethod]
        public static Chart getChartDes()
        {
            Chart cht = Chart.GetChart("dp");
            return cht;
        }
        [WebMethod]
        public static Chart getChartNFs()
        {
            Chart cht = Chart.GetChart("nfs");
            return cht;
        }

        #endregion
    }
}