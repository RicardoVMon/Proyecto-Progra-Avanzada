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
            try
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
                        EstudiantesAceptados = estudiantesAceptados

                    });
                }

                return View(proyectos);

            }
        }
            catch (Exception ex)
            {
                // Obtener el valor de Session["Id"] y verificar si es válido
                var idSesion = Session["Id"];

                // Llamar al método sp_RegistrarError
                MP.sp_RegistrarError(ex.Message, "GestionProyectos", idSesion);

                // Retornar la vista de error
                return View("Error");
            }
        }

        [HttpGet]
        public ActionResult MisProyectos()
        {
            try
            {
                long IdEstudiante = long.Parse(Session["Id"].ToString());
            using (var context = new EncuentraTCUEntities())
            {
                var listaProyectosBD = context.ObtenerProyectosEstudianteAceptado(IdEstudiante).ToList();
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
                        IdPostulacion = proyecto.IdPostulacion,
                        Nombre = proyecto.Nombre,
                        Descripcion = proyecto.Descripcion,
                        Cupo = proyecto.Cupo,
                        Estado = proyecto.Estado,
                        CreadoPor = proyecto.CreadoPor,
                        Imagen = proyecto.Imagen,
                        Categorias = categorias,
                        NombreProvincia = proyecto.NombreProvincia,
                        EstudiantesAceptados = estudiantesAceptados

                    });

                    

                }

                

                return View(proyectos);
            }
        }
            catch (Exception ex)
            {
                // Obtener el valor de Session["Id"] y verificar si es válido
                var idSesion = Session["Id"];

                // Llamar al método sp_RegistrarError
                MP.sp_RegistrarError(ex.Message, "MisProyectos", idSesion);

                // Retornar la vista de error
                return View("Error");
            }
        }

        [HttpGet]
        public ActionResult CrearProyecto()
        {
            try
            {
                ObtenerCategorias();
            ObtenerProvincias();
            return View();
        }
            catch (Exception ex)
            {
                // Obtener el valor de Session["Id"] y verificar si es válido
                var idSesion = Session["Id"];

                // Llamar al método sp_RegistrarError
                MP.sp_RegistrarError(ex.Message, "CrearProyectoGET", idSesion);

                // Retornar la vista de error
                return View("Error");
            }
        }
        [HttpPost]
        public ActionResult CrearProyecto(ProyectoModel model, HttpPostedFileBase ImagenProyecto)
        {
            try
            {
                using (var context = new EncuentraTCUEntities())
            {
                long IdInstitucion = long.Parse(Session["Id"].ToString());

                var respuestaRegistroProyecto = context.RegistrarProyecto(IdInstitucion, model.Nombre, model.Descripcion, model.Cupo, true, model.Contacto, model.Direccion, model.CorreoAsociado, model.IdProvincia);

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
            catch (Exception ex)
            {
                // Obtener el valor de Session["Id"] y verificar si es válido
                var idSesion = Session["Id"];

                // Llamar al método sp_RegistrarError
                MP.sp_RegistrarError(ex.Message, "CrearProyectoPOST", idSesion);

                // Retornar la vista de error
                return View("Error");
            }
        }


        [HttpGet]
        public ActionResult EliminarProyecto()
        {
            try
            {
                using (var context = new EncuentraTCUEntities())
            {
                long IdProyecto = long.Parse(Request.QueryString["p"]);
                string RutaImagen = Request.QueryString["i"].ToString();
                System.IO.File.Delete(AppDomain.CurrentDomain.BaseDirectory + RutaImagen);
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
            catch (Exception ex)
            {
                // Obtener el valor de Session["Id"] y verificar si es válido
                var idSesion = Session["Id"];

                // Llamar al método sp_RegistrarError
                MP.sp_RegistrarError(ex.Message, "EliminarProyecto", idSesion);

                // Retornar la vista de error
                return View("Error");
            }
        }

        [HttpGet]
        public ActionResult EditarProyecto()
        {
            try
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
            catch (Exception ex)
            {
                // Obtener el valor de Session["Id"] y verificar si es válido
                var idSesion = Session["Id"];

                // Llamar al método sp_RegistrarError
                MP.sp_RegistrarError(ex.Message, "EditarProyectoGET", idSesion);

                // Retornar la vista de error
                return View("Error");
            }
        }
        [HttpPost]
        public ActionResult EditarProyecto(ProyectoModel model, HttpPostedFileBase ImagenProyecto)
        {
            try
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

                var respuesta = context.ActualizarProyecto(model.IdProyecto, model.Nombre, model.Descripcion, model.Cupo, model.Imagen, model.Contacto, model.Direccion, model.CorreoAsociado, model.IdProvincia);

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
            catch (Exception ex)
            {
                // Obtener el valor de Session["Id"] y verificar si es válido
                var idSesion = Session["Id"];

                // Llamar al método sp_RegistrarError
                MP.sp_RegistrarError(ex.Message, "EditarProyectoPOST", idSesion);

                // Retornar la vista de error
                return View("Error");
            }
        }
        [HttpGet]
        public ActionResult DetallesProyecto()
        {
            try
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
            catch (Exception ex)
            {
                // Obtener el valor de Session["Id"] y verificar si es válido
                var idSesion = Session["Id"];

                // Llamar al método sp_RegistrarError
                MP.sp_RegistrarError(ex.Message, "DetallesProyecto", idSesion);

                // Retornar la vista de error
                return View("Error");
            }
        }


        [HttpGet]
        public ActionResult BuscarProyecto()
        {
            try
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
            catch (Exception ex)
            {
                // Obtener el valor de Session["Id"] y verificar si es válido
                var idSesion = Session["Id"];

                // Llamar al método sp_RegistrarError
                MP.sp_RegistrarError(ex.Message, "BuscarProyecto", idSesion);

                // Retornar la vista de error
                return View("Error");
            }
        }

        [HttpGet]
        public ActionResult ResultadosBusqueda(string query)
        {
            try
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
                        NombreProvincia = proyecto.NombreProvincia,
                        EstudiantesAceptados = estudiantesAceptados

                    });
                }

                return View(proyectos);

                }
            }
            catch (Exception ex)
            {
                // Obtener el valor de Session["Id"] y verificar si es válido
                var idSesion = Session["Id"];

                // Llamar al método sp_RegistrarError
                MP.sp_RegistrarError(ex.Message, "ResultadosBusqueda", idSesion);

                // Retornar la vista de error
                return View("Error");
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
            try
            {
                using (var context = new EncuentraTCUEntities())
            {
                var resultados = context.SugerenciasProyectos(query).ToList();
                return Json(resultados, JsonRequestBehavior.AllowGet);
            }
            }
            catch (Exception ex)
            {
                // Obtener el valor de Session["Id"] y verificar si es válido
                var idSesion = Session["Id"];

                // Llamar al método sp_RegistrarError
                MP.sp_RegistrarError(ex.Message, "SugerenciasProyectos", idSesion);

                // Retornar la vista de error
                return View("Error");
            }
        }
    }
}