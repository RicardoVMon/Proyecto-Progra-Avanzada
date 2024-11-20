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
    public class InstitucionController : Controller
    {
        [HttpGet]
        public ActionResult PerfilInstitucion(long q)
        {
            using (var context = new EncuentraTCUEntities())
            {
                var respuesta = context.DatosInstitucion(q).FirstOrDefault();

                if (respuesta != null)
                {
                    InstitucionModel model = new InstitucionModel
                    {
                        Nombre = respuesta.Nombre,
                        Telefono = respuesta.Telefono,
                        Email = respuesta.Email,
                        Descripcion = respuesta.Descripcion,
                        PaginaWeb = respuesta.PaginaWeb,
                        Imagen = respuesta.Imagen,
                        NombreRol = respuesta.NombreRol,
                        TipoInstitucion = respuesta.TipoInstitucion
                    };

                    return View(model);
                }

                return View();
            }
        }

        [HttpGet]
        public ActionResult EditarPerfilInstitucion(long q)
        {
            long idInstitucion = q;

            using (var context = new EncuentraTCUEntities())
            {
                var respuesta = context.DatosInstitucion(idInstitucion).FirstOrDefault();

                if (respuesta != null)
                {
                    InstitucionModel model = new InstitucionModel
                    {
                        Nombre = respuesta.Nombre,
                        Telefono = respuesta.Telefono,
                        Email = respuesta.Email,
                        Descripcion = respuesta.Descripcion,
                        PaginaWeb = respuesta.PaginaWeb,
                        Imagen = respuesta.Imagen,
                        NombreRol = respuesta.NombreRol,
                        TipoInstitucion = respuesta.TipoInstitucion
                    };

                    ConsultarTipoInstitucion();
                    return View(model);
                }

                return View();
            }
        }

        [HttpPost]
        public ActionResult EditarPerfilInstitucion(InstitucionModel model, HttpPostedFileBase ImagenInstitucion)
        {

            using (var context = new EncuentraTCUEntities())
            {
                long idInstitucion = long.Parse(Session["IdInstitucion"].ToString());
                model.Imagen = Session["Imagen"].ToString();

                if (ImagenInstitucion != null)
                {
                    System.IO.File.Delete(AppDomain.CurrentDomain.BaseDirectory + model.Imagen);
                    string extension = Path.GetExtension(ImagenInstitucion.FileName);
                    string rutaLocal = AppDomain.CurrentDomain.BaseDirectory + "Imagenes\\Instituciones\\" + idInstitucion + extension;
                    ImagenInstitucion.SaveAs(rutaLocal);
                    model.Imagen = "/Imagenes/Instituciones/" + idInstitucion + extension;
                }

                var respuesta = context.ActualizarPerfilInstitucion(idInstitucion, model.Nombre, model.Telefono, model.Email, model.Descripcion, model.PaginaWeb, model.Imagen, model.IdTipoInstitucion);

                if (respuesta > 0)
                {
                    return RedirectToAction("PerfilInstitucion", "Institucion");
                }

                ViewBag.MensajeError = "Error al actualizar la información";
                ConsultarTipoInstitucion();
                return View(model);

            }
        }

        // Pasar a un controlador compartido
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