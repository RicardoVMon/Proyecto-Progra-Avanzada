using System;
using System.Collections.Generic;
using ProyectoG1.Models;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProyectoG1.Controllers
{
    [Filtros]
    public class PostulacionController : Controller
    {
        [HttpGet]
        public ActionResult ListadoProyectosConPostulaciones()
        {
            return View();
        }

        [HttpGet]
        public ActionResult PostulacionesDeProyecto()
        {
            return View();
        }
    }
}