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
    
    public partial class IngresoSistema_Result
    {
        public long Id { get; set; }
        public string Nombre { get; set; }
        public string Cedula { get; set; }
        public string Email { get; set; }
        public string Contrasenna { get; set; }
        public bool Activo { get; set; }
        public long IdRol { get; set; }
        public bool TieneContrasennaTemp { get; set; }
    }
}
