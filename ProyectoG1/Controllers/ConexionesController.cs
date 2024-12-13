using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ProyectoG1.Models;

namespace ProyectoG1.Controllers
{
    [Filtros]
    public class ConexionesController : Controller
    {
        [HttpGet]
        public ActionResult GestionarConexiones()
        {
            return View();
        }
        [HttpGet]
        public ActionResult ResultadosBusqueda(string query)
        {
            using (var context = new EncuentraTCUEntities())
            {
                var resultado = context.ObtenerConexionesBusqueda(query).ToList();
                var estudiantes = new List<EstudianteModel>();
                foreach (var estudiante in resultado)
                {

                    estudiantes.Add(new EstudianteModel
                    {
                        IdEstudiante = estudiante.IdEstudiante,
                        Nombre = estudiante.Nombre,
                        Apellidos = estudiante.Apellidos,
                        Carrera = estudiante.Carrera,
                        Imagen = estudiante.Imagen,
                        NombreUniversidad = estudiante.NombreUniversidad

                    });
                }

                return View(estudiantes);

            }
        }

        [HttpGet]
        public ActionResult SugerenciasConexiones(string query)
        {
            using (var context = new EncuentraTCUEntities())
            {
                var resultados = context.SugerenciasConexiones(query).ToList();
                return Json(resultados, JsonRequestBehavior.AllowGet);
            }
        }
    }
}