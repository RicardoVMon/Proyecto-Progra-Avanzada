using ProyectoG1.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProyectoG1.Controllers
{
    [Filtros]
    public class EstudianteController : Controller
    {
        [HttpGet]
        public ActionResult PerfilEstudiante()
        {
            long idEstudiante = long.Parse(Session["IdEstudiante"].ToString());

            using (var context = new EncuentraTCUEntities())
            {
                var respuesta = context.DatosEstudiante(idEstudiante).FirstOrDefault();

                if (respuesta != null)
                {
                    EstudianteModel model = new EstudianteModel
                    {
                        Nombre = respuesta.Nombre,
                        Apellidos = respuesta.Apellidos,
                        Email = respuesta.Email,
                        Descripcion = respuesta.Descripcion,  
                        Carrera = respuesta.Carrera,
                        Imagen = respuesta.Imagen,
                        NombreRol = respuesta.NombreRol,
                        NombreGenero = respuesta.NombreGenero,
                        NombreUniversidad = respuesta.NombreUniversidad
                    };

                    return View(model);
                }

                return View();
            }
        }

        [HttpGet]
        public ActionResult EditarPerfilEstudiante()
        {
            long idEstudiante = long.Parse(Session["IdEstudiante"].ToString());

            using (var context = new EncuentraTCUEntities())
            {
                var respuesta = context.DatosEstudiante(idEstudiante).FirstOrDefault();

                ConsultarUniversidades();

                if (respuesta != null)
                {
                    EstudianteModel model = new EstudianteModel
                    {
                        Nombre = respuesta.Nombre,
                        Apellidos = respuesta.Apellidos,
                        Email = respuesta.Email,
                        Descripcion = respuesta.Descripcion,
                        Carrera = respuesta.Carrera,
                        Imagen = respuesta.Imagen,
                        NombreRol = respuesta.NombreRol,
                        NombreGenero = respuesta.NombreGenero,
                        NombreUniversidad = respuesta.NombreUniversidad
                    };

                    return View(model);
                }

                return View();
            }
        }

        [HttpPost]
        public ActionResult EditarPerfilEstudiante(EstudianteModel model)
        {
            using (var context = new EncuentraTCUEntities())
            {
                long idEstudiante = long.Parse(Session["IdEstudiante"].ToString());
                var respuesta = context.ActualizarPerfilEstudiante(idEstudiante, model.IdUniversidad, model.Carrera, model.Email, model.Descripcion);

                if (respuesta == 1)
                {
                    return RedirectToAction("PerfilEstudiante", "Estudiante");
                }
                else
                {
                    ViewBag.MensajeError = "Su información no se ha podido validar correctamente";
                    return View(model);
                }
            }
        }
        private void ConsultarUniversidades()
        {
            using (var context = new EncuentraTCUEntities())
            {
                var datos = context.Universidad.ToList();
                var universidades = new List<SelectListItem>();

                universidades.Add(new SelectListItem
                {
                    Text = "Seleccione su universidad",
                    Value = null,
                    Disabled = true,
                    Selected = true
                });

                foreach (var item in datos)
                {
                    universidades.Add(new SelectListItem
                    {
                        Text = item.Nombre,
                        Value = item.IdUniversidad.ToString()
                    });
                }

                ViewBag.Universidades = universidades;
            }
        }
        [HttpGet]
        public ActionResult BuscarProyecto()
        {
            using (var context = new EncuentraTCUEntities())
            {
                var datos = context.Database.SqlQuery<ProyectoModel>("ConsultarProyectos").ToList();
                return View(datos);
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
                        NombreInstitucion = postulacion.NombreInstitucion,
                        NombreProyecto = postulacion.NombreInstitucion,
                        Estado = postulacion.Estado,
                        FechaPostulacion = postulacion.FechaPostulacion

                    });
                }
                return View(postulaciones);
            }
        }
    }
}