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
    
    public partial class ConsultarConexiones_Result
    {
        public long IdConexion { get; set; }
        public long IdEstudianteSolicitante { get; set; }
        public string NombreEstudianteSolicitante { get; set; }
        public string EmailEstudianteSolicitante { get; set; }
        public string Universidad { get; set; }
        public string MensajeSolicitud { get; set; }
        public System.DateTime FechaSolicitud { get; set; }
        public string Estado { get; set; }
    }
}
