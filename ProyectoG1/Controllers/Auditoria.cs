//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ProyectoG1.Controllers
{
    using System;
    using System.Collections.Generic;
    
    public partial class Auditoria
    {
        public long IdAuditoria { get; set; }
        public string Mensaje { get; set; }
        public System.DateTime Fecha { get; set; }
        public string Origen { get; set; }
        public Nullable<long> IdEstudiante { get; set; }
        public Nullable<long> IdInstitucion { get; set; }
    
        public virtual Estudiante Estudiante { get; set; }
        public virtual Institucion Institucion { get; set; }
    }
}