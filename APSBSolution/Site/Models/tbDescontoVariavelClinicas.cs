//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Site.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class tbDescontoVariavelClinicas
    {
        public int idDesconto { get; set; }
        public Nullable<int> idClinica { get; set; }
        public decimal cvValorCorte { get; set; }
        public double cvValorMenor { get; set; }
        public double cvValorMaior { get; set; }
        public Nullable<bool> cbStatus { get; set; }
        public Nullable<System.DateTime> cdDataAtivacao { get; set; }
        public Nullable<System.DateTime> cdDataDesativacao { get; set; }
        public string ccAlteradoPor { get; set; }
    
        public virtual tbClinicas tbClinicas { get; set; }
    }
}