using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Site.Classes
{
    public class RelProfissionais
    {
        public Profissional profissional { get; set; }
        public ProfissionalDados profissionalDados { get; set; }
        public RelProfissionais()
        {
        }
        public static List<RelProfissionais> Listar()
        {
            List<RelProfissionais> Lista = new List<RelProfissionais>();

            foreach (var p in Profissional.Listar())
            {
                RelProfissionais rp = new RelProfissionais();
                rp.profissional = p;
                Lista.Add(rp);
            }

            foreach (var p in Lista)
            {
                p.profissionalDados = ProfissionalDados.ListarPorID(p.profissional.IdProfissional);
            }

            return Lista;
        }
    }
}