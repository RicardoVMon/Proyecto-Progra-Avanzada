using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProyectoG1.Models
{
    public class ConexionModel
    {
        public long IdConexion { get; set; }
        public long IdEstudianteSolicitante { get; set; }
        public string NombreEstudianteSolicitante { get; set; }
        public long IdEstudianteReceptor { get; set; }
        public string NombreEstudianteReceptor { get; set; }
        public DateTime FechaSolicitud { get; set; }
        public string Estado { get; set; }
        public string MensajeSolicitud { get; set; }
        public string Universidad { get; set; }
        public List<ConexionModel> ConexionesAceptadas { get; set; }
        public List<ConexionModel> SolicitudesPendientes { get; set; }

    }
}