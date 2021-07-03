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
    
    public partial class tbClinicas
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tbClinicas()
        {
            this.tbClinicaProfissional = new HashSet<tbClinicaProfissional>();
            this.tbDescontoVariavelClinicas = new HashSet<tbDescontoVariavelClinicas>();
            this.tbReceitas = new HashSet<tbReceitas>();
        }
    
        public int IdClinica { get; set; }
        public string ccApelido { get; set; }
        public string ccRazaoSocial { get; set; }
        public string ccNomeFantasia { get; set; }
        public string ccEmail { get; set; }
        public Nullable<float> cvISS { get; set; }
        public Nullable<float> cvDescontos { get; set; }
        public Nullable<bool> cbDescontoVariavel { get; set; }
        public Nullable<int> idObservacao { get; set; }
        public Nullable<int> idBanco { get; set; }
        public Nullable<short> cvPgtoDias { get; set; }
        public short cvStatus { get; set; }
        public string ccCriadoPor { get; set; }
        public Nullable<System.DateTime> cdDataCriacao { get; set; }
        public string ccAlteradoPor { get; set; }
        public Nullable<System.DateTime> cdDataAlteracao { get; set; }
        public Nullable<long> cvCNPJ { get; set; }
        public string ccOperador { get; set; }
    
        public virtual tbBancos tbBancos { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbClinicaProfissional> tbClinicaProfissional { get; set; }
        public virtual tbObservacoes tbObservacoes { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbDescontoVariavelClinicas> tbDescontoVariavelClinicas { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbReceitas> tbReceitas { get; set; }
    }
}