using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProyectoG1.Models
{
    public class ProyectoModel
    {
        public long IdProyecto { get; set; }
        public long? IdInstitucion { get; set; }
        public long? IdProvincia { get; set; }
        public long? IdEstudiante { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public int Cupo { get; set; }
        public string Estado { get; set; }
        public string CreadoPor { get; set; }
        public string Imagen { get; set; }
        public string Contacto { get; set; }
        public string Direccion { get; set; }
        public string CorreoAsociado { get; set; }
        public List<CategoriaModel> Categorias { get; set; }
        public List<int> CategoriasSeleccionadas { get; set; }
        public List<long> IdUsuariosPostulados { get; set; }
        public List <EstudianteModel> EstudiantesAceptados { get; set; }
        public string NombreInstitucion { get; set; }
        public string NombreProvincia { get; set; }
        public int? Postulaciones { get; set; }
        public string NombreEstudiante { get; set; }

    }
}