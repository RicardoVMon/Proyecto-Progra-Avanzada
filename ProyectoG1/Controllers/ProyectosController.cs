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

        public ActionResult CrearProyecto()
        {
            return View();
        }
    }
}