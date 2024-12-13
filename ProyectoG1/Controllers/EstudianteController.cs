using ProyectoG1.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProyectoG1.Controllers
{
    [Filtros]
    public class EstudianteController : Controller
    {

        [HttpGet]
        public ActionResult PerfilEstudiante(long q)
        {
            var IdEstudiante = q;
            using (var context = new EncuentraTCUEntities())
            {
                var respuesta = context.DatosEstudiante(IdEstudiante).FirstOrDefault();

                var habilidadesEstudiante = context.ObtenerHabilidadesEstudiante(IdEstudiante).ToList();
                var listaHabilidades = new List<HabilidadModel>();
                foreach (var habilidad in habilidadesEstudiante)
                {
                    listaHabilidades.Add(new HabilidadModel
                    {
                        Nombre = habilidad
                    });
                }

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
                        NombreUniversidad = respuesta.NombreUniversidad,
                        Habilidades = listaHabilidades
                    };

                    return View(model);
                }

                return View();
            }
        }

        [HttpGet]
        public ActionResult EditarPerfilEstudiante()
        {
            long idEstudiante = long.Parse(Session["Id"].ToString());
            using (var context = new EncuentraTCUEntities())
            {
                var respuesta = context.DatosEstudiante(idEstudiante).FirstOrDefault();

                if (respuesta != null)
                {
                    EstudianteModel model = new EstudianteModel
                    {
                        IdEstudiante = idEstudiante,
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
                    ConsultarUniversidades();
                    //------------------------------------
                    ObtenerHabilidadesParaEditar(idEstudiante);
                    //---------------------------------------
                    return View(model);
                }
                return View();
            }
        }

        [HttpPost]
        public ActionResult EditarPerfilEstudiante(EstudianteModel model, HttpPostedFileBase ImagenEstudiante)
        {
            using (var context = new EncuentraTCUEntities())
            {
                var idEstudiante = long.Parse(Session["Id"].ToString());
                model.Imagen = Session["Imagen"].ToString();

                if (ImagenEstudiante != null)
                {

                    if (!(model.Imagen == "https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png"))
                    {
                        System.IO.File.Delete(AppDomain.CurrentDomain.BaseDirectory + model.Imagen);
                    }
                    string extension = Path.GetExtension(ImagenEstudiante.FileName);
                    string rutaLocal = AppDomain.CurrentDomain.BaseDirectory + "Imagenes\\Estudiantes\\" + idEstudiante + extension;
                    ImagenEstudiante.SaveAs(rutaLocal);
                    model.Imagen = "/Imagenes/Estudiantes/" + idEstudiante + extension;
                }

                var respuesta = context.ActualizarPerfilEstudiante(idEstudiante, model.IdUniversidad, model.Carrera, model.Email, model.Descripcion, model.Imagen);

                if (respuesta > 0)
                {   
                    context.EliminarHabilidadesEstudiante(model.IdEstudiante);
                    foreach (var item in model.HabilidadesSeleccionadas)
                    {
                        context.RegistrarHabilidadEstudiante(model.IdEstudiante, item);
                    }
                    return RedirectToAction("PerfilEstudiante", "Estudiante", new { q = idEstudiante });
                }

                ViewBag.MensajeError = "Error al actualizar la información";
                //-------
                ObtenerHabilidadesParaEditar(idEstudiante);
                //-------
                return View(model);
            }
        }

        //--------------------------------------------------------------------------------
        public void ObtenerHabilidadesParaEditar(long IdEstudiante)
        {
            using (var context = new EncuentraTCUEntities())
            {
                var habilidadesGeneralesBD = context.Habilidad.ToList();

                var habilidadesEstudianteBD = context.ObtenerHabilidadesParaEditar(IdEstudiante).ToList();

                var habilidadesEstudiante = new List<SelectListItem>();

                foreach (var habilidadGeneral in habilidadesGeneralesBD)
                {
                    bool isSelected = habilidadesEstudianteBD.Any(h => h.IdHabilidad == habilidadGeneral.IdHabilidad);

                    habilidadesEstudiante.Add(new SelectListItem
                    {
                        Text = habilidadGeneral.Nombre,
                        Value = habilidadGeneral.IdHabilidad.ToString(),
                        Selected = isSelected
                    });
                }

                ViewBag.Habilidades = habilidadesEstudiante;
            }
        }
        //----------------------------------------------------------------------------------

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