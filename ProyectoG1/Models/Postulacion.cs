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
    
    public partial class Postulacion
    {
        public long IdPostulacion { get; set; }
        public long IdEstudiante { get; set; }
        public long IdProyecto { get; set; }
        public System.DateTime FechaPostulacion { get; set; }
        public string Estado { get; set; }
        public bool ConfirmacionEstudiante { get; set; }
    
        public virtual Estudiante Estudiante { get; set; }
        public virtual Proyecto Proyecto { get; set; }
    }
}