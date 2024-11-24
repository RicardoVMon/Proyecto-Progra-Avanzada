using System;
using ProyectoG1.Models;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.IO;

namespace ProyectoG1.Controllers
{
    [Filtros]
    public class ProyectosController : Controller
    {
        [HttpGet]
        public ActionResult GestionProyectos()
        {
            long IdInstitucion = long.Parse(Session["Id"].ToString());
            using (var context = new EncuentraTCUEntities())
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

                    proyectos.Add(new ProyectoModel
                    {
                        IdProyecto = proyecto.IdProyecto,
                        Nombre = proyecto.Nombre,
                        Descripcion = proyecto.Descripcion,
                        Cupo = proyecto.Cupo,
                        Estado = proyecto.Estado,
                        CreadoPor = proyecto.CreadoPor,
                        Imagen = proyecto.Imagen,
                        Categorias = categorias

                    });
                }

                return View(proyectos);

            }
        }
        [HttpGet]
        public ActionResult CrearProyecto()
        {
            ObtenerCategorias();
            return View();
        }
        [HttpPost]
        public ActionResult CrearProyecto(ProyectoModel model, HttpPostedFileBase ImagenProyecto)
        {
            using (var context = new EncuentraTCUEntities())
            {
                long IdInstitucion = long.Parse(Session["Id"].ToString());

                var respuestaRegistroProyecto = context.RegistrarProyecto(IdInstitucion, model.Nombre, model.Descripcion, model.Cupo, true, model.Contacto, model.Direccion, model.CorreoAsociado);

                if (respuestaRegistroProyecto > 0)
                {

                    var IdNuevoProyecto = context.ObtenerProyectoReciente(IdInstitucion, model.Nombre, model.Descripcion, model.Cupo).FirstOrDefault();

                    if (ImagenProyecto != null)
                    {
                        //System.IO.File.Delete(AppDomain.CurrentDomain.BaseDirectory + model.Imagen);
                        string extension = Path.GetExtension(ImagenProyecto.FileName);
                        string rutaLocal = AppDomain.CurrentDomain.BaseDirectory + "Imagenes\\Proyectos\\" + IdNuevoProyecto + extension;
                        ImagenProyecto.SaveAs(rutaLocal);
                        model.Imagen = "/Imagenes/Proyectos/" + IdNuevoProyecto + extension;
                        context.ActualizarImagenProyecto(IdNuevoProyecto, model.Imagen);
                    }

                    foreach (var item in model.CategoriasSeleccionadas)
                    {
                        context.RegistrarCategoriaProyecto(IdNuevoProyecto, item);
                    }
                    ObtenerCategorias();
                    return RedirectToAction("GestionProyectos", "Proyectos");
                }
                ObtenerCategorias();
                ViewBag.MensajeError = "Su información no se ha podido validar correctamente";
                return View(model);
            }
        }
        [HttpGet]
        public ActionResult EliminarProyecto()
        {
            using (var context = new EncuentraTCUEntities())
            {
                long IdProyecto = long.Parse(Request.QueryString["p"]);
                var respuestaProyecto = context.EliminarProyecto(IdProyecto);
                var respuestaCategorias = context.EliminarCategoriasProyecto(IdProyecto);
                if (respuestaProyecto > 0 && respuestaCategorias > 0)
                {
                    return RedirectToAction("GestionProyectos", "Proyectos");
                }
                ViewBag.MensajeError = "El proyecto no se ha podido eliminar correctamente";
                return RedirectToAction("GestionProyectos", "Proyectos");
            }
        }
        [HttpGet]
        public ActionResult EditarProyecto()
        {
            long IdProyecto = long.Parse(Request.QueryString["p"]);
            using (var context = new EncuentraTCUEntities())
            {
                var respuesta = context.ObtenerProyectosEspecifico(IdProyecto).FirstOrDefault();
                
                if (respuesta != null)
                {
                    ProyectoModel model = new ProyectoModel
                    {
                        IdProyecto = respuesta.IdProyecto,
                        IdInstitucion = respuesta.IdInstitucion,
                        Nombre = respuesta.Nombre,
                        Descripcion = respuesta.Descripcion,
                        Cupo = respuesta.Cupo,
                        Estado = respuesta.Estado,
                        CreadoPor = respuesta.CreadoPor,
                        Imagen = respuesta.Imagen,
                        Contacto = respuesta.Contacto,
                        Direccion = respuesta.Direccion,
                        CorreoAsociado = respuesta.CorreoAsociado
                    };

                    ObtenerCategoriasProyecto(IdProyecto);
                    return View(model);
                }

                return View();
            }
        }
        [HttpPost]
        public ActionResult EditarProyecto(ProyectoModel model, HttpPostedFileBase ImagenProyecto)
        {
            using (var context = new EncuentraTCUEntities())
            {

                if (ImagenProyecto != null)
                {
                    System.IO.File.Delete(AppDomain.CurrentDomain.BaseDirectory + model.Imagen);
                    string extension = Path.GetExtension(ImagenProyecto.FileName);
                    string rutaLocal = AppDomain.CurrentDomain.BaseDirectory + "Imagenes\\Proyectos\\" + model.IdProyecto + extension;
                    ImagenProyecto.SaveAs(rutaLocal);
                    model.Imagen = "/Imagenes/Proyectos/" + model.IdProyecto + extension;
                }

                var respuesta = context.ActualizarProyecto(model.IdProyecto, model.Nombre, model.Descripcion, model.Cupo, model.Imagen, model.Contacto, model.Direccion, model.CorreoAsociado);

                if (respuesta > 0)
                {
                    
                    context.EliminarCategoriasProyecto(model.IdProyecto);
                    foreach (var item in model.CategoriasSeleccionadas)
                    {
                        context.RegistrarCategoriaProyecto(model.IdProyecto, item);
                    }
                    return RedirectToAction("GestionProyectos", "Proyectos");
                }
                ViewBag.MensajeError = "Error al actualizar la información";
                ObtenerCategoriasProyecto(model.IdProyecto);
                return View(model);
            }
        }
        [HttpGet]
        public ActionResult DetallesProyecto()
        {
            long IdProyecto = long.Parse(Request.QueryString["p"]);
            using (var context = new EncuentraTCUEntities())
            {
                var respuesta = context.ObtenerProyectosEspecifico(IdProyecto).FirstOrDefault();
                if (respuesta != null)
                {
                    ProyectoModel model = new ProyectoModel
                    {
                        IdProyecto = respuesta.IdProyecto,
                        IdInstitucion = respuesta.IdInstitucion,
                        Nombre = respuesta.Nombre,
                        Descripcion = respuesta.Descripcion,
                        Cupo = respuesta.Cupo,
                        Estado = respuesta.Estado,
                        CreadoPor = respuesta.CreadoPor,
                        Imagen = respuesta.Imagen,
                        Contacto = respuesta.Contacto,
                        Direccion = respuesta.Direccion,
                        CorreoAsociado = respuesta.CorreoAsociado
                    };
                    var listaCategoriasBD = context.ObtenerCategoriasProyecto(IdProyecto);
                    var categorias = new List<CategoriaModel>();
                    foreach (var categoria in listaCategoriasBD)
                    {
                        categorias.Add(new CategoriaModel
                        {
                            IdCategoria = categoria.IdCategoria,
                            Nombre = categoria.Nombre
                        });
                    }
                    model.Categorias = categorias;
                    return View(model);
                }
                return View();
            }
        }
        public void ObtenerCategorias()
        {
            using (var context = new EncuentraTCUEntities())
            {
                var datos = context.Categoria.ToList();
                var tipoInstituciones = new List<SelectListItem>();

                foreach (var item in datos)
                {
                    tipoInstituciones.Add(new SelectListItem
                    {
                        Text = item.Nombre,
                        Value = item.IdCategoria.ToString()
                    });
                }

                ViewBag.Categorias = tipoInstituciones;
            }
        }
        public void ObtenerCategoriasProyecto(long IdProyecto)
        {
            using (var context = new EncuentraTCUEntities())
            {
                var categoriasGeneralesBD = context.Categoria.ToList();

                var categoriasProyectoBD = context.ObtenerCategoriasProyecto(IdProyecto).ToList();

                var categoriasProyecto = new List<SelectListItem>();

                foreach (var categoriaGeneral in categoriasGeneralesBD)
                {
                    bool isSelected = categoriasProyectoBD.Any(c => c.IdCategoria == categoriaGeneral.IdCategoria);

                    categoriasProyecto.Add(new SelectListItem
                    {
                        Text = categoriaGeneral.Nombre,
                        Value = categoriaGeneral.IdCategoria.ToString(),
                        Selected = isSelected
                    });
                }

                ViewBag.Categorias = categoriasProyecto;
            }
        }
    }
}