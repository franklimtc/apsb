using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Site.Classes
{
    public class Documento
    {
        #region Campos
        public enum tpDocumento { RG, CNH, CPF, Outros}
        public int idDocumento { get; set; }
        public string Numero { get; set; }
        public tpDocumento Tipo { get; set; }
        public string orgaoEmissor { get; set; }
        public DateTime dataEmissao { get; set; }
                
        #endregion
    }
}