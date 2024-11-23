using System;
using ProyectoG1.Models;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProyectoG1.Controllers
{
    [Filtros]
    public class ProyectosController : Controller
    {
        [HttpGet]
        public ActionResult GestionProyectos()
        {

            using (var context = new EncuentraTCUEntities())
            {
                var listaProyectosBD = context.Proyecto.ToList();
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
        public ActionResult CrearProyecto(ProyectoModel model)
        {
            using (var context = new EncuentraTCUEntities())
            {
                long IdInstitucion = long.Parse(Session["Id"].ToString());

                var respuestaRegistroProyecto = context.RegistrarProyecto(IdInstitucion, model.Nombre, model.Descripcion, model.Cupo, true);

                if (respuestaRegistroProyecto > 0)
                {

                    var nuevoProyecto = context.ObtenerProyectoReciente(IdInstitucion, model.Nombre, model.Descripcion, model.Cupo).FirstOrDefault();

                    foreach (var item in model.CategoriasSeleccionadas)
                    {
                        context.RegistrarCategoriaProyecto(nuevoProyecto, item);
                    } 
                    ObtenerCategorias();
                    return RedirectToAction("GestionProyectos", "Proyectos");
                }
                else
                {
                    ObtenerCategorias();
                    ViewBag.MensajeError = "Su información no se ha podido validar correctamente";
                    return View(model);
                }
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