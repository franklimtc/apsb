using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Site.Classes
{
    public interface @base
    {
        bool Salvar(string Usuario);
        bool Adicionar(string Usuario);
        bool Excluir(string Usuario, int idObject);
        List<object> Listar();
        Object ListarPorID(int idObject);
    }
}
