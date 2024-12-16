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
    
    public partial class Estudiante
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Estudiante()
        {
            this.Auditoria = new HashSet<Auditoria>();
            this.Conexion = new HashSet<Conexion>();
            this.Conexion1 = new HashSet<Conexion>();
            this.Notificacion = new HashSet<Notificacion>();
            this.Postulacion = new HashSet<Postulacion>();
            this.Proyecto = new HashSet<Proyecto>();
            this.Habilidad = new HashSet<Habilidad>();
        }
    
        public long IdEstudiante { get; set; }
        public string Cedula { get; set; }
        public string Email { get; set; }
        public string Contrasenna { get; set; }
        public string Nombre { get; set; }
        public string Apellidos { get; set; }
        public string Descripcion { get; set; }
        public string Carrera { get; set; }
        public string Imagen { get; set; }
        public bool Activo { get; set; }
        public long IdRol { get; set; }
        public long IdGenero { get; set; }
        public long IdUniversidad { get; set; }
        public bool TieneContrasennaTemp { get; set; }
        public System.DateTime FechaVencimientoTemp { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Auditoria> Auditoria { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Conexion> Conexion { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Conexion> Conexion1 { get; set; }
        public virtual Genero Genero { get; set; }
        public virtual Rol Rol { get; set; }
        public virtual Universidad Universidad { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Notificacion> Notificacion { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Postulacion> Postulacion { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Proyecto> Proyecto { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Habilidad> Habilidad { get; set; }
    }
}
