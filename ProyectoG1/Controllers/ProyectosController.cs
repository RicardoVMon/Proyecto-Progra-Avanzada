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
        MetodosPublicos MP = new MetodosPublicos();
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
                        Categorias = categorias,
                        NombreProvincia = proyecto.NombreProvincia

                    });
                }

                return View(proyectos);

            }
        }

        [HttpGet]
        public ActionResult MisProyectos()
        {
            long IdEstudiante = long.Parse(Session["Id"].ToString());
            using (var context = new EncuentraTCUEntities())
            {
                var listaProyectosBD = context.ObtenerProyectosEstudiante(IdEstudiante).ToList();
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
                        IdEstudiante = proyecto.IdEstudiante,
                        IdProyecto = proyecto.IdProyecto,
                        Nombre = proyecto.Nombre,
                        Descripcion = proyecto.Descripcion,
                        Cupo = proyecto.Cupo,
                        Estado = proyecto.Estado,
                        CreadoPor = proyecto.CreadoPor,
                        Imagen = proyecto.Imagen,
                        Categorias = categorias,
                        NombreProvincia = proyecto.NombreProvincia

                    });
                }

                return View(proyectos);

            }
        }

        [HttpGet]
        public ActionResult CrearProyecto()
        {
            ObtenerCategorias();
            ObtenerProvincias();
            return View();
        }
        [HttpPost]
        public ActionResult CrearProyecto(ProyectoModel model, HttpPostedFileBase ImagenProyecto)
        {
            using (var context = new EncuentraTCUEntities())
            {
                long IdCreador = long.Parse(Session["Id"].ToString());
                bool creadoPorInstitucion = false;

                if ((long)Session["Rol"] == 2)
                {
                    creadoPorInstitucion = true;
                }

                var respuestaRegistroProyecto = context.RegistrarProyecto(
                    creadoPorInstitucion ? (long?)IdCreador : null, 
                    creadoPorInstitucion ? null : (long?)IdCreador, 
                    model.Nombre,
                    model.Descripcion,
                    model.Cupo,
                    creadoPorInstitucion,
                    model.Contacto,
                    model.Direccion,
                    model.CorreoAsociado,
                    model.IdProvincia
                    );

                if (respuestaRegistroProyecto > 0)
                {

                    var IdNuevoProyecto = context.ObtenerProyectoReciente(IdCreador, model.Nombre, model.Descripcion, model.Cupo).FirstOrDefault();

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

                    if (creadoPorInstitucion)
                    {
                        return RedirectToAction("GestionProyectos", "Proyectos");
                    }
                    else
                    {
                        return RedirectToAction("MisProyectos", "Proyectos");
                    }
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

                bool creadoPorInstitucion = false;
                if ((long)Session["Rol"] == 2)
                {
                    creadoPorInstitucion = true;
                }

                long IdProyecto = long.Parse(Request.QueryString["p"]);
                string RutaImagen = Request.QueryString["i"].ToString();
                System.IO.File.Delete(AppDomain.CurrentDomain.BaseDirectory + RutaImagen);
                var respuestaProyecto = context.EliminarProyecto(IdProyecto);
                if (respuestaProyecto > 0)
                {
                    if (creadoPorInstitucion)
                    {
                        return RedirectToAction("GestionProyectos", "Proyectos");
                    }
                    else
                    {
                        return RedirectToAction("MisProyectos", "Proyectos");
                    }
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
                        CorreoAsociado = respuesta.CorreoAsociado,
                        IdProvincia = respuesta.IdProvincia
                    };

                    ObtenerProvincias();
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
                bool creadoPorInstitucion = false;
                if ((long)Session["Rol"] == 2)
                {
                    creadoPorInstitucion = true;
                }

                if (ImagenProyecto != null)
                {
                    System.IO.File.Delete(AppDomain.CurrentDomain.BaseDirectory + model.Imagen);
                    string extension = Path.GetExtension(ImagenProyecto.FileName);
                    string rutaLocal = AppDomain.CurrentDomain.BaseDirectory + "Imagenes\\Proyectos\\" + model.IdProyecto + extension;
                    ImagenProyecto.SaveAs(rutaLocal);
                    model.Imagen = "/Imagenes/Proyectos/" + model.IdProyecto + extension;
                }

                var respuesta = context.ActualizarProyecto(model.IdProyecto, model.Nombre, model.Descripcion, model.Cupo, model.Imagen, model.Contacto, model.Direccion, model.CorreoAsociado, model.IdProvincia);

                if (respuesta > 0)
                {

                    context.EliminarCategoriasProyecto(model.IdProyecto);
                    foreach (var item in model.CategoriasSeleccionadas)
                    {
                        context.RegistrarCategoriaProyecto(model.IdProyecto, item);
                    }


                    if (creadoPorInstitucion)
                    {
                        return RedirectToAction("GestionProyectos", "Proyectos");
                    }
                    else
                    {
                        return RedirectToAction("MisProyectos", "Proyectos");
                    }
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
                        CorreoAsociado = respuesta.CorreoAsociado,
                        IdProvincia = respuesta.IdProvincia,
                        NombreProvincia = respuesta.NombreProvincia,
                        NombreInstitucion = respuesta.NombreInstitucion
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
                    var listaEstudiantesAceptados = context.ObtenerEstudiantesAceptados(IdProyecto).ToList();
                    var estudiantesAceptados = new List<EstudianteModel>();
                    
                    foreach (var estudiante in listaEstudiantesAceptados)
                    {
                        estudiantesAceptados.Add(new EstudianteModel
                        {
                            IdEstudiante = estudiante.IdEstudiante,
                            Nombre = estudiante.NombreEstudiante
                        });
                    }
                    var listaEstudiantesPostuladosBD = context.ObtenerEstudiantesPostulados(IdProyecto);
                    var estudiantesPostulados = listaEstudiantesPostuladosBD.Select(idEstudiante => (long)idEstudiante).ToList();
                    
                    model.IdUsuariosPostulados = estudiantesPostulados;
                    model.Categorias = categorias;
                    model.EstudiantesAceptados = estudiantesAceptados;
                    return View(model);
                }
                return View();
            }
        }

        [HttpGet]
        public ActionResult BuscarProyecto()
        {
            using (var context = new EncuentraTCUEntities())
            {
                var datos = context.ConsultarProyectos().ToList();
                var proyectos = new List<ProyectoModel>();
                foreach (var proyecto in datos)
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
                        IdInstitucion = proyecto.IdInstitucion,
                        Nombre = proyecto.Nombre,
                        NombreInstitucion = proyecto.NombreInstitucion,
                        Descripcion = proyecto.Descripcion,
                        Cupo = proyecto.Cupo,
                        Imagen = proyecto.Imagen,
                        Categorias = categorias

                    });
                    
                }
                return View(proyectos);
            }
        }

        [HttpGet]
        public ActionResult ResultadosBusqueda(string query)
        {
            using (var context = new EncuentraTCUEntities())
            {
                var listaProyectosBD = context.ObtenerProyectosBusqueda(query).ToList();
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
                        IdInstitucion = proyecto.IdInstitucion,
                        NombreInstitucion = proyecto.NombreInstitucion,
                        IdProyecto = proyecto.IdProyecto,
                        Nombre = proyecto.Nombre,
                        Descripcion = proyecto.Descripcion,
                        Cupo = proyecto.Cupo,
                        Estado = proyecto.Estado,
                        CreadoPor = proyecto.CreadoPor,
                        Imagen = proyecto.Imagen,
                        Categorias = categorias,
                        NombreProvincia = proyecto.NombreProvincia

                    });
                }

                return View(proyectos);

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
        public void ObtenerProvincias()
        {
            using (var context = new EncuentraTCUEntities())
            {
                var datos = context.Provincia.ToList();
                var provincias = new List<SelectListItem>();

                provincias.Add(new SelectListItem
                {
                    Text = "Seleccione una provincia",
                    Value = null,
                    Disabled = true,
                    Selected = true
                });

                foreach (var item in datos)
                {
                    
                    provincias.Add(new SelectListItem
                    {
                        Text = item.Nombre,
                        Value = item.IdProvincia.ToString()
                    });
                }

                ViewBag.Provincias = provincias;
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

        [HttpGet]
        public ActionResult SugerenciasProyectos(string query)
        {
            using (var context = new EncuentraTCUEntities())
            {
                var resultados = context.SugerenciasProyectos(query).ToList();
                return Json(resultados, JsonRequestBehavior.AllowGet);
            }
        }
    }
}