﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Site.Classes
{
    public class ProfissionalDados 
    {
        #region Campos
        public int IdDadoProfissional { get; set; }//IdDadoProfissional int
        public int idProfissional { get; set; }//idProfissional  int
        public string ccFormacao { get; set; }//ccFormacao  varchar
        public string ccPosGraduacao { get; set; }//ccPosGraduacao  varchar
        public string ccEspecialidade { get; set; }//ccEspecialidade varchar
        public string ccConselho { get; set; }//ccConselho  varchar
        public long cvNumInscricao { get; set; }//cvNumInscricao  bigint
        public long cvTitulo { get; set; }//cvTitulo    bigint
        public int cvTituloZona { get; set; }//cvTituloZona    smallint
        public int cvTituloSecao { get; set; }//cvTituloSecao   smallint
        public long cvReservista { get; set; }//cvReservista    bigint
        public long cvPIS { get; set; }//cvPIS   bigint
        #endregion

        public ProfissionalDados()
        {

        }
        public bool Adicionar(string Usuario)
        {
            throw new NotImplementedException();
        }

        public static bool Excluir(string Usuario, int idObject)
        {
            throw new NotImplementedException();
        }

        public List<ProfissionalDados> Listar()
        {
            throw new NotImplementedException();
        }

        public static ProfissionalDados ListarPorID(int _idProfissional)
        {
            List<object[]> parametros = new List<object[]>();
            parametros.Add(new object[] { "@IdProfissional", _idProfissional });
            DataTable dt = DAO.RetornaDT("SEL_ProfissionaisDados @IdProfissional = @IdProfissional", parametros);
            List<ProfissionalDados> Lista = new List<ProfissionalDados>();
           
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow p in dt.Rows)
                {
                    ProfissionalDados p1 = new ProfissionalDados();
                    p1.IdDadoProfissional = int.Parse(p["IdDadoProfissional"].ToString());
                    p1.ccFormacao = p["ccFormacao"].ToString();
                    p1.ccPosGraduacao = p["ccPosGraduacao"].ToString();
                    p1.ccEspecialidade = p["ccEspecialidade"].ToString();
                    p1.ccConselho = p["ccConselho"].ToString();
                    p1.cvNumInscricao = long.Parse(p["cvNumInscricao"].ToString());
                    p1.cvTitulo = long.Parse(p["cvTitulo"].ToString());
                    p1.cvTituloZona = int.Parse(p["cvTituloZona"].ToString());
                    p1.cvTituloSecao = int.Parse(p["cvTituloSecao"].ToString());
                    p1.cvReservista = long.Parse(p["cvReservista"].ToString());
                    p1.cvPIS = long.Parse(p["cvPIS"].ToString());
                    Lista.Add(p1);
                }
            }
            return Lista.FirstOrDefault();
        }

        public bool Salvar(string Usuario)
        {
            throw new NotImplementedException();
        }
    }
}