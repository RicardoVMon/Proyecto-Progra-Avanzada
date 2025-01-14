﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProyectoG1.Models
{
    public class PostulacionModel
    {
        public long IdPostulacion { get; set; }
        public long IdEstudiante { get; set; }
        public long IdProyecto { get; set; }
        public DateTime FechaPostulacion { get; set; }
        public string Estado { get; set; }
        public bool ConfirmacionEstudiante { get; set; }
        public string NombreInstitucion { get; set; }
        public string NombreProyecto { get; set; }
        public string NombreEstudiante { get; set; }
        public string ApellidosEstudiante { get; set; }
        public string NombreCompletoEstudiante { get; set; }
        public string CarreraEstudiante { get; set; }
        public string UniversidadEstudiante { get; set; }
        public string DescripcionEstudiante { get; set; }
        public string CorreoEstudiante { get; set; }
        public string ImagenEstudiante { get; set; }

    }
}