using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProyectoG1.Models
{
    public class ProyectoModel
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
        public List<CategoriaModel> Categorias { get; set; }
        public List<int> CategoriasSeleccionadas { get; set; }

    }
}