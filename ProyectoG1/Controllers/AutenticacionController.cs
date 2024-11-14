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
                var respuesta = context.RegistrarEstudiante(1, model.IdGenero, model.IdUniversidad, model.Cedula, model.Email, model.Contrasenna, model.Nombre, model.Apellidos, "Descripción", model.Carrera);

                if (respuesta > 0)
                    return RedirectToAction("Index", "Home");

                ViewBag.MensajePantalla = "Su información no se ha podido registrar correctamente";
                return View();
            }
        }

        public ActionResult RegistroInstitucion()
        {
            return View();
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

    }
}