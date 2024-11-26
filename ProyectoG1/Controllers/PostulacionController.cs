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




        [HttpGet]
        public ActionResult PostularseProyecto(long p)
        {
            using (var context = new EncuentraTCUEntities())
            {
                long idEstudiante = long.Parse(Session["Id"].ToString());
                var respuesta = context.InsertarPostulacion(idEstudiante, p);

                if (respuesta == 1)
                {
                    return RedirectToAction("BuscarPostulaciones", "Estudiante");
                }
                else
                {
                    ViewBag.MensajeError = "No se ha podido postular correctamente, intente de nuevo";
                    return View();
                }
            }
        }
    }
}