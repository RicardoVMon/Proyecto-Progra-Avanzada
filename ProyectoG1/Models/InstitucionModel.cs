﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProyectoG1.Models
{
    public class InstitucionModel
    {

        public long IdInstitucion { get; set; }
        public long IdRol { get; set; }
        public long IdTipoInstitucion { get; set; }
        public String Cedula { get; set; }
        public String Email { get; set; }
        public String Imagen { get; set; }
        public String NombreRol { get; set; }
        public String TipoInstitucion { get; set; }
        public String Contrasenna { get; set; }
        public String Nombre { get; set; }
        public String Descripcion { get; set; }
        public String Telefono { get; set; }
        public String PaginaWeb { get; set; }
        public String Activo { get; set; }
        public List<ProyectoModel> Proyectos { get; set; }
        public List<CategoriaModel> CategoriasUsadas { get; set; }
    }
}