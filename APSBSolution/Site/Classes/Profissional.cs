using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Site.Classes
{
    public class Profissional
    {
        public int cvIdProfissional { get; set; }
        public int cvTelCelular { get; set; }
        public string ccNome { get; set; }
        public string ccEmail { get; set; }

        public Profissional()
        {

        }
        public Profissional(int _id, int _cel, string _nome, string _email)
        {
            this.cvIdProfissional = _id;
            this.cvTelCelular = _cel;
            this.ccNome = _nome;
            this.ccEmail = _email;
        }

        public List<Profissional> Listar()
        {
            List<Profissional> Lista = new List<Profissional>();
            Lista.Add(new Profissional(1, 991919191, "Antonio", "antonio@email.com"));
            Lista.Add(new Profissional(2, 991919191, "Maria", "maria@email.com"));
            Lista.Add(new Profissional(3, 991919191, "Guimaraes", "guimaraes@email.com"));
            return Lista;
        }
    }
}