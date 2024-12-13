using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProyectoG1.Models
{
    public class EstudianteModel
    {
        public long IdEstudiante { get; set; }
        public String Cedula { get; set; }
        public String Email { get; set; }
        public String Contrasenna { get; set; }
        public String Nombre { get; set; }
        public String Apellidos { get; set; }
        public String Descripcion { get; set; }
        public String Carrera { get; set; }
        public String Imagen { get; set; }
        public bool Activo { get; set; }
        public long IdRol { get; set; }
        public String NombreRol { get; set; }
        public long IdGenero { get; set; }
        public String NombreGenero { get; set; }
        public long IdUniversidad { get; set; }
        public String NombreUniversidad { get; set; }
        public bool TieneContrasennaTemp { get; set; }
        public List<HabilidadModel> Habilidades { get; set; }
        public List<int> HabilidadesSeleccionadas { get; set; }
    }
}