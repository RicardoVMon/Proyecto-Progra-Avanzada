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
        MetodosPublicos MP = new MetodosPublicos();

        [HttpGet]
        public ActionResult PerfilInstitucion(long q)
        {
            try
            {
                var IdInstitucion = q;
            using (var context = new EncuentraTCUEntities())
            {
                var datosInstitucion = context.DatosInstitucion(IdInstitucion).FirstOrDefault();

                var categoriasUsadas = context.ObtenerCategoriasUsadasEnInstitucion(IdInstitucion).ToList();
                var listaCategoriasUsadas = new List<CategoriaModel>();
                foreach (var categoria in categoriasUsadas)
                {
                    listaCategoriasUsadas.Add(new CategoriaModel
                    {
                        Nombre = categoria
                    });
                }

                if (datosInstitucion != null)
                {
                    var proyectos = ObtenerProyectos(IdInstitucion, context);
                    InstitucionModel model = new InstitucionModel
                    {
                        Nombre = datosInstitucion.Nombre,
                        Telefono = datosInstitucion.Telefono,
                        Email = datosInstitucion.Email,
                        Descripcion = datosInstitucion.Descripcion,
                        PaginaWeb = datosInstitucion.PaginaWeb,
                        Imagen = datosInstitucion.Imagen,
                        NombreRol = datosInstitucion.NombreRol,
                        Proyectos = proyectos,
                        TipoInstitucion = datosInstitucion.TipoInstitucion,
                        CategoriasUsadas = listaCategoriasUsadas,
                    };

                    return View(model);
                }

                return View();
             }
            }
            catch (Exception ex)
            {
                // Obtener el valor de Session["Id"] y verificar si es válido
                var idSesion = Session["Id"];

                // Llamar al método sp_RegistrarError
                MP.sp_RegistrarError(ex.Message, "PerfilInstitucion", idSesion);

                // Retornar la vista de error
                return View("Error");
            }
        }

        [HttpGet]
        public ActionResult EditarPerfilInstitucion()
        {
            try
            {
                long idInstitucion = long.Parse(Session["Id"].ToString());

            using (var context = new EncuentraTCUEntities())
            {
                var datosInstitucion = context.DatosInstitucion(idInstitucion).FirstOrDefault();

                if (datosInstitucion != null)
                {
                    InstitucionModel model = new InstitucionModel
                    {
                        Nombre = datosInstitucion.Nombre,
                        Telefono = datosInstitucion.Telefono,
                        Email = datosInstitucion.Email,
                        Descripcion = datosInstitucion.Descripcion,
                        PaginaWeb = datosInstitucion.PaginaWeb,
                        Imagen = datosInstitucion.Imagen,
                        NombreRol = datosInstitucion.NombreRol,
                        IdTipoInstitucion = datosInstitucion.IdTipoInstitucion
                    };

                    ConsultarTipoInstitucion();
                    return View(model);
                }

                return View();
            }
        }
            catch (Exception ex)
            {
                // Obtener el valor de Session["Id"] y verificar si es válido
                var idSesion = Session["Id"];

                // Llamar al método sp_RegistrarError
                MP.sp_RegistrarError(ex.Message, "EditarPerfilInstitucionGET", idSesion);

                // Retornar la vista de error
                return View("Error");
            }
        }

        [HttpPost]
        public ActionResult EditarPerfilInstitucion(InstitucionModel model, HttpPostedFileBase ImagenInstitucion)
        {
            try
            {
                using (var context = new EncuentraTCUEntities())
            {
                var idInstitucion = long.Parse(Session["Id"].ToString());
                model.Imagen = Session["Imagen"].ToString();

                if (ImagenInstitucion != null)
                {

                    if (!(model.Imagen == "https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png"))
                    {
                        System.IO.File.Delete(AppDomain.CurrentDomain.BaseDirectory + model.Imagen);
                    }
                    string extension = Path.GetExtension(ImagenInstitucion.FileName);
                    string rutaLocal = AppDomain.CurrentDomain.BaseDirectory + "Imagenes\\Instituciones\\" + idInstitucion + extension;
                    ImagenInstitucion.SaveAs(rutaLocal);
                    model.Imagen = "/Imagenes/Instituciones/" + idInstitucion + extension;
                }

                var respuesta = context.ActualizarPerfilInstitucion(idInstitucion, model.Nombre, model.Telefono, model.Email, model.Descripcion, model.PaginaWeb, model.Imagen, model.IdTipoInstitucion);

                if (respuesta > 0)
                {
                    Session["Imagen"] = model.Imagen;
                    return RedirectToAction("PerfilInstitucion", "Institucion", new { q = idInstitucion });
                }

                ViewBag.MensajeError = "Error al actualizar la información";
                ConsultarTipoInstitucion();
                return View(model);

            }
        }
            catch (Exception ex)
            {
                // Obtener el valor de Session["Id"] y verificar si es válido
                var idSesion = Session["Id"];

                // Llamar al método sp_RegistrarError
                MP.sp_RegistrarError(ex.Message, "EditarPerfilInstitucionPOST", idSesion);

                // Retornar la vista de error
                return View("Error");
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

        private List<ProyectoModel> ObtenerProyectos(long IdInstitucion, EncuentraTCUEntities context)
        {
            var listaProyectosBD = context.ObtenerProyectosInstitucion(IdInstitucion).ToList();
            var proyectos = new List<ProyectoModel>();
            foreach (var proyecto in listaProyectosBD)
            {

                var listaCategoriasBD = context.ObtenerCategoriasProyecto(proyecto.IdProyecto);
                var categorias = new List<CategoriaModel>();
                foreach (var categoria in listaCategoriasBD)
                {
                    categorias.Add(new CategoriaModel
                    {
                        IdCategoria = categoria.IdCategoria,
                        Nombre = categoria.Nombre
                    });
                }

                var listaEstudiantesAceptados = context.ObtenerEstudiantesAceptados(proyecto.IdProyecto).ToList();
                var estudiantesAceptados = new List<EstudianteModel>();

                foreach (var estudiante in listaEstudiantesAceptados)
                {
                    estudiantesAceptados.Add(new EstudianteModel
                    {
                        IdEstudiante = estudiante.IdEstudiante,
                        Nombre = estudiante.NombreEstudiante
                    });
                }

                proyectos.Add(new ProyectoModel
                {
                    IdProyecto = proyecto.IdProyecto,
                    Nombre = proyecto.Nombre,
                    Descripcion = proyecto.Descripcion,
                    Cupo = proyecto.Cupo,
                    Estado = proyecto.Estado,
                    CreadoPor = proyecto.CreadoPor,
                    Imagen = proyecto.Imagen,
                    Categorias = categorias,
                    NombreProvincia = proyecto.NombreProvincia,
                    EstudiantesAceptados = estudiantesAceptados,

                });
            }

            return proyectos;
        }
    }
}