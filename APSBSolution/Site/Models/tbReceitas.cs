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
    
    public partial class tbReceitas
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tbReceitas()
        {
            this.tbProfissionalRepasse = new HashSet<tbProfissionalRepasse>();
        }
    
        public int idReceita { get; set; }
        public int IdClinica { get; set; }
        public double cvValor { get; set; }
        public Nullable<double> cvValorPago { get; set; }
        public Nullable<System.DateTime> cdEmissao { get; set; }
        public Nullable<System.DateTime> cdPagamento { get; set; }
        public Nullable<System.DateTime> cdRepasse { get; set; }
        public Nullable<float> cvDesconto { get; set; }
        public Nullable<bool> cbArquivado { get; set; }
        public Nullable<bool> cbStatus { get; set; }
        public Nullable<int> idObservacao { get; set; }
        public Nullable<int> cvNF { get; set; }
        public Nullable<bool> cbIssRetido { get; set; }
        public Nullable<float> cvDescontoISS { get; set; }
        public Nullable<System.DateTime> cdDataCriacao { get; set; }
        public string UserName { get; set; }
    
        public virtual tbClinicas tbClinicas { get; set; }
        public virtual tbObservacoes tbObservacoes { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbProfissionalRepasse> tbProfissionalRepasse { get; set; }
    }
}