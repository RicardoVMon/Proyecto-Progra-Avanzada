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
    
    public partial class ObtenerInstitucionesAleatorias_Result
    {
        public long IdInstitucion { get; set; }
        public string Cedula { get; set; }
        public string Email { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public string Telefono { get; set; }
        public string PaginaWeb { get; set; }
        public bool Activo { get; set; }
        public string Imagen { get; set; }
        public long IdRol { get; set; }
        public long IdTipoInstitucion { get; set; }
        public bool TieneContrasennaTemp { get; set; }
        public System.DateTime FechaVencimientoTemp { get; set; }
    }
}