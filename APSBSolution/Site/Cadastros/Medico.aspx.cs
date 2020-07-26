using Site.Classes;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Site.Cadastros
{
    public partial class Medico : System.Web.UI.Page
    {
        static CultureInfo culture;
        static DateTimeStyles styles;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Parse a date and time with no styles.
            culture = CultureInfo.CreateSpecificCulture("pt-BR");
            styles = DateTimeStyles.None;
        }

        protected void gvMedicos_PreRender(object sender, EventArgs e)
        {
            gvMedicos.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

        [WebMethod]
        public static Profissional BuscarPorID(int idProfissional)
        {
            Profissional p = new Profissional();
            p = Profissional.ListarPorID(idProfissional);
            return p;
        }
    }
}