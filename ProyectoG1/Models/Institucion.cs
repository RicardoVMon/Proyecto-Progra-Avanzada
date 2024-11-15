//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ProyectoG1.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Institucion
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Institucion()
        {
            this.Auditoria = new HashSet<Auditoria>();
            this.Proyecto = new HashSet<Proyecto>();
        }
    
        public long IdInstitucion { get; set; }
        public string Cedula { get; set; }
        public string Email { get; set; }
        public string Contrasenna { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public string Telefono { get; set; }
        public string PaginaWeb { get; set; }
        public bool Activo { get; set; }
        public long IdRol { get; set; }
        public long IdTipoInstitucion { get; set; }
        public bool TieneContrasennaTemp { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Auditoria> Auditoria { get; set; }
        public virtual Rol Rol { get; set; }
        public virtual TipoInstitucion TipoInstitucion { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Proyecto> Proyecto { get; set; }
    }
}
