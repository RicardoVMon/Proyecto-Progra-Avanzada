using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProyectoG1.Models
{
    public class EstudianteModel
    {
        public long Id { get; set; }
        public long IdGenero { get; set; }
        public long IdUniversidad { get; set; }
        public String Cedula { get; set; }
        public String Email { get; set; }
        public String Contrasenna { get; set; }
        public String Nombre { get; set; }
        public String Apellidos { get; set; }
        public String Descripcion { get; set; }
        public String Carrera { get; set; }
        public bool Activo { get; set; }
    }
}