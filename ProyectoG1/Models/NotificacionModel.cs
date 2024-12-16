using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProyectoG1.Models
{
    public class NotificacionModel
    {
        public long IdNotificacion { get; set; }
        public long IdEstudiante { get; set; }
        public long IdInstitucion { get; set; }
        public long IdPostulacion { get; set; }
        public long IdProyecto { get; set; }
        public DateTime Fecha { get; set; }
        public string Contenido { get; set; }
        public bool TipoNotificacion { get; set; } // 0 = Postulación, 1 = Aprobación/Rechazo
        public string NombreInstitucion { get; set; } // Agregado
        public string NombreProyecto { get; set; }
    }
}