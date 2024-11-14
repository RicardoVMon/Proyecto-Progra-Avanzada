using ProyectoG1.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProyectoG1.Controllers
{
    public class AutenticacionController : Controller
    {
        public ActionResult RecuperarContrasenna()
        {
            return View();
        }

        public ActionResult Ingresar()
        {
            return View();
        }

        [HttpGet]
        public ActionResult RegistroEstudiante()
        {
            ConsultarGeneros();
            ConsultarUniversidades();
            return View();
        }

        [HttpPost]
        public ActionResult RegistroEstudiante(EstudianteModel model)
        {
            using (var context = new EncuentraTCUEntities())
            {
                var respuesta = context.RegistrarEstudiante(model.IdGenero, model.IdUniversidad, model.Cedula, model.Email, model.Contrasenna, model.Nombre, model.Apellidos, "Hola! Estoy buscando lugares para hacer mi TCU!", model.Carrera);

                if (respuesta > 0)
                    return RedirectToAction("Ingresar", "Autenticacion");

                ViewBag.Mensaje = "Su información no se ha podido registrar correctamente";
                ConsultarGeneros();
                ConsultarUniversidades();
                return View();
            }
        }
        [HttpGet]
        public ActionResult RegistroInstitucion()
        {
            ConsultarTipoInstitucion();
            return View();
        }

        [HttpPost]
        public ActionResult RegistroInstitucion(InstitucionModel model)
        {
            using (var context = new EncuentraTCUEntities())
            {
                var respuesta = context.RegistrarInstitucion(model.IdTipoInstitucion, model.Cedula, model.Email, model.Contrasenna, model.Nombre, model.Descripcion, model.Telefono, model.PaginaWeb);

                if (respuesta > 0)
                    return RedirectToAction("Ingresar", "Autenticacion");

                ViewBag.Mensaje = "Su información no se ha podido registrar correctamente";
                ConsultarTipoInstitucion();
                return View();
            }
        }

        private void ConsultarGeneros()
        {
            using (var context = new EncuentraTCUEntities())
            {
                var datos = context.Genero.ToList();
                var generos = new List<SelectListItem>();

                generos.Add(new SelectListItem
                {
                    Text = "Seleccione un genero",
                    Value = null,
                    Disabled = true,
                    Selected = true
                });

                foreach (var item in datos)
                {
                    generos.Add(new SelectListItem
                    {
                        Text = item.Nombre,
                        Value = item.IdGenero.ToString()
                    });
                }

                ViewBag.Generos = generos;
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

        private void ConsultarTipoInstitucion()
        {
            using (var context = new EncuentraTCUEntities())
            {
                var datos = context.TipoInstitucion.ToList();
                var tipoInstituciones = new List<SelectListItem>();

                tipoInstituciones.Add(new SelectListItem
                {
                    Text = "Seleccione su tipo de institución",
                    Value = null,
                    Disabled = true,
                    Selected = true
                });

                foreach (var item in datos)
                {
                    tipoInstituciones.Add(new SelectListItem
                    {
                        Text = item.Nombre,
                        Value = item.IdTipoInstitucion.ToString()
                    });
                }

                ViewBag.TipoInstituciones = tipoInstituciones;
            }
        }

    }
}