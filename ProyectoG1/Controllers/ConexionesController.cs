using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Microsoft.Ajax.Utilities;
using ProyectoG1.Models;

namespace ProyectoG1.Controllers
{
    [Filtros]
    public class ConexionesController : Controller
    {
        MetodosPublicos MP = new MetodosPublicos();

        [HttpGet]
        public ActionResult GestionarConexiones()
        {
            try
            {
                using (var context = new EncuentraTCUEntities())
            {
                long idEstudiante = long.Parse(Session["Id"].ToString());
                var conexiones = new ConexionModel();

                // Para conexiones aceptadas
                var resultadoConexionesAceptadas = context.ObtenerConexionesAceptadas(idEstudiante).ToList();
                var conexionesAceptadas = new List<ConexionModel>();
                foreach (var conexionAceptada in resultadoConexionesAceptadas)
                {

                    conexionesAceptadas.Add(new ConexionModel
                    {
                        IdConexion = conexionAceptada.IdConexion,
                        IdEstudianteOtro = conexionAceptada.IdEstudianteOtro,
                        NombreEstudiante = conexionAceptada.NombreEstudiante,
                        FechaSolicitud = conexionAceptada.FechaSolicitud,
                        Universidad = conexionAceptada.Universidad
                    });

                }
                conexiones.ConexionesAceptadas = conexionesAceptadas;


                // Para solicitudes de conexion pendientes
                var resultadoSolicitudesPendientes = context.ObtenerSolicitudesPendientes(idEstudiante).ToList();
                var solicitudesPendientes = new List<ConexionModel>();
                foreach (var solicitudPendiente in resultadoSolicitudesPendientes)
                {

                    solicitudesPendientes.Add(new ConexionModel
                    {
                        IdConexion = solicitudPendiente.IdConexion,
                        IdEstudianteSolicitante = solicitudPendiente.IdEstudianteSolicitante,
                        NombreEstudianteSolicitante = solicitudPendiente.NombreEstudianteSolicitante,
                        Universidad = solicitudPendiente.Universidad,
                        MensajeSolicitud = solicitudPendiente.MensajeSolicitud,
                        FechaSolicitud = solicitudPendiente.FechaSolicitud,
                        Estado = solicitudPendiente.Estado
                    });

                }
                conexiones.SolicitudesPendientes = solicitudesPendientes;

                // Para solicitudes de conexion enviadas
                var resultadoSolicitudesEnviadas = context.ObtenerSolicitudesEnviadas(idEstudiante).ToList();
                var solicitudesEnviadas = new List<ConexionModel>();
                foreach (var solicitudEnviada in resultadoSolicitudesEnviadas)
                {

                    solicitudesEnviadas.Add(new ConexionModel
                    {
                        IdConexion = solicitudEnviada.IdConexion,
                        IdEstudianteReceptor = solicitudEnviada.IdEstudianteReceptor,
                        NombreEstudianteReceptor = solicitudEnviada.NombreEstudianteReceptor,
                        Universidad = solicitudEnviada.Universidad,
                        MensajeSolicitud = solicitudEnviada.MensajeSolicitud,
                        FechaSolicitud = solicitudEnviada.FechaSolicitud,
                        Estado = solicitudEnviada.Estado
                    });

                }
                conexiones.SolicitudesEnviadas = solicitudesEnviadas;

                return View(conexiones);
            }
        }
            catch (Exception ex)
            {
                // Obtener el valor de Session["Id"] y verificar si es válido
                var idSesion = Session["Id"];

                // Llamar al método sp_RegistrarError
                MP.sp_RegistrarError(ex.Message, "GestionarConexiones", idSesion);

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
                    var resultado = context.ObtenerConexionesBusqueda(query).ToList();
                    var estudiantes = new List<EstudianteModel>();
                    foreach (var estudiante in resultado)
                    {

                        estudiantes.Add(new EstudianteModel
                        {
                            IdEstudiante = estudiante.IdEstudiante,
                            Nombre = estudiante.Nombre,
                            Apellidos = estudiante.Apellidos,
                            Carrera = estudiante.Carrera,
                            Imagen = estudiante.Imagen,
                            NombreUniversidad = estudiante.NombreUniversidad

                        });
                    }

                    return View(estudiantes);

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

        [HttpGet]
        public ActionResult SugerenciasConexiones(string query)
        {
            try
            {
                using (var context = new EncuentraTCUEntities())
            {
                var resultados = context.SugerenciasConexiones(query).ToList();
                return Json(resultados, JsonRequestBehavior.AllowGet);
            }
        }
            catch (Exception ex)
            {
                // Obtener el valor de Session["Id"] y verificar si es válido
                var idSesion = Session["Id"];

                // Llamar al método sp_RegistrarError
                MP.sp_RegistrarError(ex.Message, "SugerenciasConexiones", idSesion);

                // Retornar la vista de error
                return View("Error");
            }
        }

        [HttpGet]
        public ActionResult EnviarSolicitud(long idEstudianteReceptor)
        {
            try
            {
                using (var context = new EncuentraTCUEntities())
            {
                var estudianteReceptor = context.Estudiante
                    .Where(e => e.IdEstudiante == idEstudianteReceptor)
                    .FirstOrDefault();

                var model = new ConexionModel
                {
                    IdEstudianteReceptor = estudianteReceptor.IdEstudiante,
                    NombreEstudianteReceptor = estudianteReceptor.Nombre,
                    Universidad = estudianteReceptor.Universidad.Nombre
                };

                return View(model);
            }
        }
            catch (Exception ex)
            {
                // Obtener el valor de Session["Id"] y verificar si es válido
                var idSesion = Session["Id"];

                // Llamar al método sp_RegistrarError
                MP.sp_RegistrarError(ex.Message, "EnviarSolicitudGET", idSesion);

                // Retornar la vista de error
                return View("Error");
            }
        }

        [HttpPost]
        public ActionResult EnviarSolicitud(ConexionModel model)
        {
            try
            {
                long idEstudianteSolicitante = long.Parse(Session["Id"].ToString());

            using (var context = new EncuentraTCUEntities())
            {
                var respuesta = context.SolicitarConexion(idEstudianteSolicitante, model.IdEstudianteReceptor, model.MensajeSolicitud);

                if (respuesta == 1)
                {
                    return RedirectToAction("GestionarConexiones", "Conexiones");
                }
                else
                {
                    ViewBag.MensajeError = "No se logró enviar la solicitud de conexión.";
                    return View();
                }
            }
        }
            catch (Exception ex)
            {
                // Obtener el valor de Session["Id"] y verificar si es válido
                var idSesion = Session["Id"];

                // Llamar al método sp_RegistrarError
                MP.sp_RegistrarError(ex.Message, "EnviarSolicitudPOST", idSesion);

                // Retornar la vista de error
                return View("Error");
            }
        }

        [HttpGet]
        public ActionResult AceptarSolicitud(long idConexion)
        {
            try
            {
                using (var context = new EncuentraTCUEntities())
                {
                    var respuesta = context.AceptarSolicitud(idConexion);

                    if (respuesta > 0)
                    {
                        return RedirectToAction("GestionarConexiones", "Conexiones");
                    }
                    else
                    {
                        ViewBag.MensajeError = "No se logró aceptar la solicitud.";
                        return RedirectToAction("GestionarConexiones", "Conexiones");
                    }
                }
            }
            catch (Exception ex)
            {
                // Obtener el valor de Session["Id"] y verificar si es válido
                var idSesion = Session["Id"];

                // Llamar al método sp_RegistrarError
                MP.sp_RegistrarError(ex.Message, "AceptarSolicitud", idSesion);

                // Retornar la vista de error
                return View("Error");
            }
        }

            [HttpGet]
        public ActionResult RechazarSolicitud(long idConexion)
        {
            try
            {
                using (var context = new EncuentraTCUEntities())
            {
                var respuesta = context.RechazarSolicitud(idConexion);

                if (respuesta > 0)
                {
                    return RedirectToAction("GestionarConexiones", "Conexiones");
                }
                else
                {
                    ViewBag.MensajeError = "No se logró rechazar la solicitud.";
                    return RedirectToAction("GestionarConexiones", "Conexiones");
                }
            }
        }
            catch (Exception ex)
            {
                // Obtener el valor de Session["Id"] y verificar si es válido
                var idSesion = Session["Id"];

                // Llamar al método sp_RegistrarError
                MP.sp_RegistrarError(ex.Message, "RechazarSolicitud", idSesion);

                // Retornar la vista de error
                return View("Error");
            }
        }

        [HttpGet]
        public ActionResult EliminarConexion(long idConexion)
        {
            try
            {

                using (var context = new EncuentraTCUEntities())
            {
                var respuesta = context.EliminarConexion(idConexion);

                if (respuesta > 0)
                {
                    return RedirectToAction("GestionarConexiones", "Conexiones");
                }
                else
                {
                    ViewBag.MensajeError = "No se logró eliminar la conexión.";
                    return RedirectToAction("GestionarConexiones", "Conexiones");
                }
              }
            }
            catch (Exception ex)
            {
                // Obtener el valor de Session["Id"] y verificar si es válido
                var idSesion = Session["Id"];

                // Llamar al método sp_RegistrarError
                MP.sp_RegistrarError(ex.Message, "EliminarConexion", idSesion);

                // Retornar la vista de error
                return View("Error");
            }
        }

    }
}