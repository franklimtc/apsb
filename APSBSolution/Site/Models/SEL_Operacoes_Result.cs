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
    
    public partial class SEL_Operacoes_Result
    {
        public int ID { get; set; }
        public Nullable<decimal> cvValor { get; set; }
        public Nullable<decimal> cvValorRecebido { get; set; }
        public Nullable<decimal> cvValorRepassado { get; set; }
        public string ccDescricao { get; set; }
        public string ccOperador { get; set; }
        public string observacao { get; set; }
        public Nullable<System.DateTime> cdEmissao { get; set; }
        public Nullable<System.DateTime> cdPagamento { get; set; }
        public Nullable<System.DateTime> cdRepasse { get; set; }
        public int Status { get; set; }
        public string Tipo { get; set; }
        public Nullable<int> cvNF { get; set; }
    }
}
