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



        [HttpGet]
        public ActionResult ResultadosBusqueda(string query)
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

        [HttpGet]
        public ActionResult SugerenciasConexiones(string query)
        {
            using (var context = new EncuentraTCUEntities())
            {
                var resultados = context.SugerenciasConexiones(query).ToList();
                return Json(resultados, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpGet]
        public ActionResult EnviarSolicitud(long idEstudianteReceptor)
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

        [HttpPost]
        public ActionResult EnviarSolicitud(ConexionModel model)
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

        [HttpGet]
        public ActionResult AceptarSolicitud(long idConexion)
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

        [HttpGet]
        public ActionResult RechazarSolicitud(long idConexion)
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

        [HttpGet]
        public ActionResult EliminarConexion(long idConexion)
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

    }
}