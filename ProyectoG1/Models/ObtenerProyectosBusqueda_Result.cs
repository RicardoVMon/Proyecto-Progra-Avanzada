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
    
    public partial class ObtenerProyectosBusqueda_Result
    {
        public long IdProyecto { get; set; }
        public Nullable<long> IdInstitucion { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public int Cupo { get; set; }
        public string Estado { get; set; }
        public string CreadoPor { get; set; }
        public string Imagen { get; set; }
        public string Contacto { get; set; }
        public string Direccion { get; set; }
        public string CorreoAsociado { get; set; }
        public Nullable<long> IdProvincia { get; set; }
        public Nullable<long> IdEstudiante { get; set; }
        public string NombreProvincia { get; set; }
        public string NombreInstitucion { get; set; }
    }
}