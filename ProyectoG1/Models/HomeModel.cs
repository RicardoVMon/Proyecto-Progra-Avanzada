using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProyectoG1.Models
{
    public class HomeModel
    {
        public List<ProyectoModel> ProyectosRecomendados { get; set; }
        public List<CategoriaModel> CategoriasRecomendadas { get; set; }
        public List<InstitucionModel> InstitucionesRecomendadas { get; set; }

        public int ProyectoActivos { get; set; }
        public int PostulacionesPendientes { get; set; }
        public int Notificaciones { get; set; }
        public int UsuarioAceptados { get; set; }
        public int ProyectosLlenos { get; set; }
    }
}