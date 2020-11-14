using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Site.Classes
{
    public class Endereco
    {
        #region Campos
        public int idEndereco { get; set; }
        public string ccEndereco { get; set; }
        public string ccBairro { get; set; }
        public int cvCEP { get; set; }
        public string ccUF { get; set; }
        public string ccCidade { get; set; }
        public int idProfissional { get; set; }

        #endregion
    }
}