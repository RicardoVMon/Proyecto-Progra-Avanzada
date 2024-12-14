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
        MetodosPublicos MP = new MetodosPublicos();
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
                    return RedirectToAction("BuscarPostulaciones", "Postulacion");
                }
                else
                {
                    ViewBag.MensajeError = "No se ha podido postular correctamente, intente de nuevo";
                    return View();
                }
            }
        }

        [HttpGet]
        public ActionResult BuscarPostulaciones()
        {
            using (var context = new EncuentraTCUEntities())
            {
                long idEstudiante = long.Parse(Session["Id"].ToString());
                var datos = context.ConsultarPostulaciones(idEstudiante).ToList();
                var postulaciones = new List<PostulacionModel>();
                foreach (var postulacion in datos)
                {
                    postulaciones.Add(new PostulacionModel
                    {
                        IdProyecto = postulacion.IdProyecto,
                        IdPostulacion = postulacion.IdPostulacion,
                        NombreInstitucion = postulacion.NombreInstitucion,
                        NombreProyecto = postulacion.NombreProyecto,
                        Estado = postulacion.Estado,
                        FechaPostulacion = postulacion.FechaPostulacion

                    });
                }
                return View(postulaciones);
            }
        }

        [HttpGet]
        public ActionResult EliminarPostulacion(long t)
        {
            using (var context = new EncuentraTCUEntities())
            {
                var respuesta = context.EliminarPostulacion(t);

                if (respuesta == 1)
                {
                    return RedirectToAction("BuscarPostulaciones", "Postulacion");
                }
                else
                {
                    ViewBag.MensajeError = "No se ha podido eliminar la postulación, intente de nuevo";
                    return View();
                }
            }
        }
    }
}