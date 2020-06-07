using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Site.Classes
{
    public class Clinica
    {
        public int cvIdClinica { get; set; }
        public string ccApelido { get; set; }
        public string ccEmail { get; set; }
        public string ccObs { get; set; }

        public Clinica()
        {

        }

        public Clinica(int _id, string _apelido, string _email, string _obs = null)
        {
            this.cvIdClinica = _id;
            this.ccApelido = _apelido;
            this.ccEmail = _email;
            this.ccObs = _obs;
        }

        public List<Clinica> Listar()
        {
            List<Clinica> Lista = new List<Clinica>();
            Lista.Add(new Clinica(1,"Clinica A", "clinicaa@email.com"));
            Lista.Add(new Clinica(2,"Clinica B", "clinicab@email.com"));
            Lista.Add(new Clinica(3,"Clinica C", "clinicab@email.com"));
            return Lista;
        }
    }

}