//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ProyectoG1.Models
{
    using System;
    
    public partial class ConsultarPostulaciones_Result
    {
        public long IdPostulacion { get; set; }
        public long IdEstudiante { get; set; }
        public long IdProyecto { get; set; }
        public System.DateTime FechaPostulacion { get; set; }
        public string Estado { get; set; }
        public bool ConfirmacionEstudiante { get; set; }
        public string NombreInstitucion { get; set; }
        public string NombreProyecto { get; set; }
    }
}
