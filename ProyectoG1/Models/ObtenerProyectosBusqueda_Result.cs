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
    
    public partial class ObtenerProyectosBusqueda_Result
    {
        public long IdProyecto { get; set; }
        public long IdInstitucion { get; set; }
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
        public string NombreProvincia { get; set; }
        public string NombreInstitucion { get; set; }
    }
}
