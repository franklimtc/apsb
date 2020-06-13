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
        public string ccRazaoSocial { get; set; }
        public string ccNomeFantasia { get; set; }
        public string cvCNPJ { get; set; }
        public string ccContato { get; set; }
        public string cvTelefone { get; set; }
        public string ccEmail { get; set; }
        public string ccUF { get; set; }
        public string ccCidade { get; set; }
        public double cvImpostos { get; set; }
        public double cvISS { get; set; }
        public string cbTaxaVariavel { get; set; }
        public string ccObs { get; set; }

        public Clinica()
        {

        }

        public Clinica(int _id, string _apelido, string _razaoSocial, string _nomeFantasia, string _cnpj, string _contato, string _telefone, string _email, string _uf
            , string _cidade, double _impostos, bool _taxaVariavel, string _obs = null)
        {
            this.cvIdClinica = _id;
            this.ccApelido = _apelido;
            this.ccRazaoSocial = _razaoSocial;
            this.ccNomeFantasia = _nomeFantasia;
            this.cvCNPJ = _cnpj;
            this.ccContato = _contato;
            this.cvTelefone = _telefone;
            this.ccUF = _uf;
            this.ccCidade = _cidade;
            this.cvImpostos = _impostos;
            if (_taxaVariavel) { this.cbTaxaVariavel = "Sim"; } else { this.cbTaxaVariavel = "Não"; }
            this.ccEmail = _email;
            this.ccObs = _obs;
        }

        public static List<Clinica> Listar()
        {
            List<Clinica> Lista = new List<Clinica>();
            Lista.Add(new Clinica(1, "ABC", "Clinica social", "Clinica fantasia", "8323434312343", "Nome Contato", "4511234343", "contato@email.com", "DF", "Brasília", 6.5, false));
            Lista.Add(new Clinica(1, "DEF", "Clinica social", "Clinica fantasia", "8323434312343", "Nome Contato", "4511234343", "contato@email.com", "DF", "Brasília", 6.5, true));
            Lista.Add(new Clinica(1, "GHI", "Clinica social", "Clinica fantasia", "8323434312343", "Nome Contato", "4511234343", "contato@email.com", "DF", "Brasília", 6.5, false));

            Lista.Add(new Clinica(1, "ABC", "Clinica social", "Clinica fantasia", "8323434312343", "Nome Contato", "4511234343", "contato@email.com", "DF", "Brasília", 6.5, false));
            Lista.Add(new Clinica(1, "DEF", "Clinica social", "Clinica fantasia", "8323434312343", "Nome Contato", "4511234343", "contato@email.com", "DF", "Brasília", 6.5, true));
            Lista.Add(new Clinica(1, "GHI", "Clinica social", "Clinica fantasia", "8323434312343", "Nome Contato", "4511234343", "contato@email.com", "DF", "Brasília", 6.5, false));

            Lista.Add(new Clinica(1, "ABC", "Clinica social", "Clinica fantasia", "8323434312343", "Nome Contato", "4511234343", "contato@email.com", "DF", "Brasília", 6.5, false));
            Lista.Add(new Clinica(1, "DEF", "Clinica social", "Clinica fantasia", "8323434312343", "Nome Contato", "4511234343", "contato@email.com", "DF", "Brasília", 6.5, true));
            Lista.Add(new Clinica(1, "GHI", "Clinica social", "Clinica fantasia", "8323434312343", "Nome Contato", "4511234343", "contato@email.com", "DF", "Brasília", 6.5, false));
            return Lista;
        }
    }

}