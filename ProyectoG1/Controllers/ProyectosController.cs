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

                var respuestaRegistroProyecto = context.RegistrarProyecto(IdInstitucion, model.Nombre, model.Descripcion, model.Cupo, true);

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
    }
}