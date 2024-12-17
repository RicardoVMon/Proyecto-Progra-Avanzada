using System;
using System.Collections.Generic;
using ProyectoG1.Models;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Configuration;
using System.Net.Mail;
using System.Data.SqlClient;
using System.Data;

namespace ProyectoG1.Controllers
{
    [Filtros]
    public class PostulacionController : Controller
    {
        MetodosPublicos MP = new MetodosPublicos();
        [HttpGet]
        public ActionResult ListadoProyectosConPostulaciones()
        {
            try
            {
                using (var context = new EncuentraTCUEntities())
                {
                    long idInstitucion = long.Parse(Session["Id"].ToString());
                    var datos = context.ConsultarProyectosConPostulaciones(idInstitucion).ToList();
                    var proyectos = new List<ProyectoModel>();
                    foreach (var proyecto in datos)
                    {
                        proyectos.Add(new ProyectoModel
                        {
                            IdProyecto = proyecto.IdProyecto,
                            Imagen = proyecto.Imagen,
                            Nombre = proyecto.Nombre,
                            Cupo = proyecto.Cupo,
                            Postulaciones = proyecto.Postulaciones
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
                MP.sp_RegistrarError(ex.Message, "ListadoProyectosConPostulaciones", idSesion);

                // Retornar la vista de error
                return View("Error");
            }
        }

        [HttpGet]
        public ActionResult PostulacionesDeProyecto(long p)
        {
            try
            {
                using (var context = new EncuentraTCUEntities())
                {
                    var datos = context.ConsultarPostulacionesProyecto(p).ToList();
                    var postulaciones = new List<PostulacionModel>();
                    foreach (var postulacion in datos)
                    {
                        postulaciones.Add(new PostulacionModel
                        {
                            IdPostulacion = postulacion.IdPostulacion,
                            NombreProyecto = postulacion.NombreProyecto,
                            NombreEstudiante = postulacion.NombreEstudiante,
                            ApellidosEstudiante = postulacion.ApellidosEstudiante,
                            CarreraEstudiante = postulacion.CarreraEstudiante,
                            Estado = postulacion.Estado,
                            FechaPostulacion = postulacion.FechaPostulacion,

                        });
                    }
                    return View(postulaciones);
                }
            }
            catch (Exception ex)
            {
                // Obtener el valor de Session["Id"] y verificar si es válido
                var idSesion = Session["Id"];

                // Llamar al método sp_RegistrarError
                MP.sp_RegistrarError(ex.Message, "PostulacionesDeProyecto", idSesion);

                // Retornar la vista de error
                return View("Error");
            }
        }

        [HttpGet]
        public JsonResult ConsultarDetallesPostulacion(long p)
        {
            using (var context = new EncuentraTCUEntities())
            {
                var postulacion = context.ConsultarDetallesPostulacion(p).FirstOrDefault();
                return Json(new
                {
                    IdEstudiante = postulacion.IdEstudiante,
                    ImagenEstudiante = postulacion.ImagenEstudiante,
                    NombreCompletoEstudiante = postulacion.NombreCompletoEstudiante,
                    UniversidadEstudiante = postulacion.UniversidadEstudiante,
                    CarreraEstudiante = postulacion.CarreraEstudiante,
                    CorreoEstudiante = postulacion.CorreoEstudiante,
                    FechaPostulacion = postulacion.FechaPostulacion.ToString("dd/MM/yyyy"),
                    DescripcionEstudiante = postulacion.DescripcionEstudiante

                }, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpPost]
        public ActionResult ActualizarEstadoPostulacion(long id, string estado)
        {
            try
            {
                using (var context = new EncuentraTCUEntities())
                {
                    int resultado = context.ActualizarEstadoPostulacion(id, estado);

                    if (resultado > 0)
                    {
                        var datos = context.ObtenerInfoParaNotiEstudiante(id).FirstOrDefault();

                        if (datos != null)
                        {
                            var contenidoCorreo = GenerarContenidoCorreoEstado(datos.NombreEstudiante, datos.NombreProyecto, estado, datos.NombreInstitucion);
                            EnviarCorreoPostulacion(datos.EmailEstudiante, "Resultado postulación", contenidoCorreo);

                            // Procesar notificación
                            var contenidoNotificacion = $"Tu postulación al proyecto {datos.NombreProyecto} a cargo de la institución {datos.NombreInstitucion} ha sido {estado.ToLower()}.";
                            var resultadoNotificacion = GuardarNotificacion(datos.IdEstudiante, datos.IdInstitucion, datos.IdPostulacion, datos.IdProyecto, contenidoNotificacion, true);

                            if (resultadoNotificacion <= 0)
                            {
                                ViewBag.MensajeError = "No se pudo notificar a la estudiante el resultado de la postulación.";
                            }
                         }
                        return Json(new { success = true });
                    }
                    else
                    {
                        return Json(new { success = false, message = "Error." });
                    }
                }
            }
            catch (Exception ex)
            {
                // Obtener el valor de Session["Id"] y verificar si es válido
                var idSesion = Session["Id"];

                // Llamar al método sp_RegistrarError
                MP.sp_RegistrarError(ex.Message, "ActualizarEstadoPostulacion", idSesion);

                // Retornar la vista de error
                return View("Error");
            }
        }

        [HttpGet]
        public ActionResult PostularseProyecto(long p)
        {
            try
            {
                using (var context = new EncuentraTCUEntities())
                {
                    long idEstudiante = long.Parse(Session["Id"].ToString());
                    var respuesta = context.InsertarPostulacion(idEstudiante, p);

                    if (respuesta == 1)
                    {
                        var datos = context.ObtenerInfoParaNotiInstitucion(idEstudiante, p).FirstOrDefault();

                        if (datos != null)
                        {
                            var contenidoCorreo = GenerarContenidoCorreoPostulacion(datos.NombreEstudiante, datos.NombreProyecto, datos.NombreInstitucion);
                            EnviarCorreoPostulacion(datos.EmailInstitucion, "Nueva postulación", contenidoCorreo);

                            // Procesar notificación
                            var contenidoNotificacion = $"Tu proyecto {datos.NombreProyecto} ha recibido una nueva postulación de parte de el/la estudiante {datos.NombreEstudiante}. Revisa en las postulaciones de tus proyectos para gestionar la postulación.";
                            var resultadoNotificacion = GuardarNotificacion(idEstudiante, datos.IdInstitucion, datos.IdPostulacion, p, contenidoNotificacion, false);

                            if (resultadoNotificacion <= 0)
                            {
                                ViewBag.MensajeError = "No se pudo notificar a la Institucion de su postulación.";
                            }
                         
                        }
                        return RedirectToAction("BuscarPostulaciones", "Postulacion");
                    }
                    else
                    {
                        ViewBag.MensajeError = "No se ha podido postular correctamente, intente de nuevo";
                        return View();
                    }
                }
            }
            catch (Exception ex)
            {
                // Obtener el valor de Session["Id"] y verificar si es válido
                var idSesion = Session["Id"];

                // Llamar al método sp_RegistrarError
                MP.sp_RegistrarError(ex.Message, "ActualizarEstadoPostulacion", idSesion);

                // Retornar la vista de error
                return View("Error");
            }
        }

        [HttpGet]
        public ActionResult BuscarPostulaciones()
        {
            try
            {
                using (var context = new EncuentraTCUEntities())
                {
                    long idEstudiante = long.Parse(Session["Id"].ToString());
                    var datos = context.ConsultarPostulaciones(idEstudiante).ToList();
                    var postulaciones = new List<PostulacionModel>();
                    foreach (var postulacion in datos)
                    {
                        postulaciones.Add(new PostulacionModel
                        {
                            IdProyecto = postulacion.IdProyecto,
                            IdPostulacion = postulacion.IdPostulacion,
                            NombreInstitucion = postulacion.NombreInstitucion,
                            NombreProyecto = postulacion.NombreProyecto,
                            Estado = postulacion.Estado,
                            FechaPostulacion = postulacion.FechaPostulacion

                        });
                    }
                    return View(postulaciones);
                }
            }
            catch (Exception ex)
            {
                // Obtener el valor de Session["Id"] y verificar si es válido
                var idSesion = Session["Id"];

                // Llamar al método sp_RegistrarError

                MP.sp_RegistrarError(ex.Message, "BuscarPostulaciones", idSesion);

                // Retornar la vista de error
                return View("Error");
            }
        }

        [HttpGet]
        public ActionResult EliminarPostulacion(long t)
        {
            try
            {
                using (var context = new EncuentraTCUEntities())
                {
                    var respuesta = context.EliminarPostulacion(t);

                    if (respuesta > 0)
                    {
                        return RedirectToAction("BuscarPostulaciones", "Postulacion");
                    }
                    else
                    {
                        ViewBag.MensajeError = "No se ha podido eliminar la postulación, intente de nuevo";
                        return View();
                    }
                }
            }
            catch (Exception ex)
            {
                // Obtener el valor de Session["Id"] y verificar si es válido
                var idSesion = Session["Id"];

                // Llamar al método sp_RegistrarError

                MP.sp_RegistrarError(ex.Message, "EliminarPostulacion", idSesion);

                // Retornar la vista de error
                return View("Error");
            }
        }

        [HttpGet]
        public ActionResult CancelarProceso(long t)
        {
            try
            {
                using (var context = new EncuentraTCUEntities())
                {
                    var respuesta = context.EliminarPostulacion(t);

                    if (respuesta > 0)
                    {
                        return RedirectToAction("MisProyectos", "Proyectos");
                    }
                    else
                    {
                        ViewBag.MensajeError = "No se ha podido eliminar la postulación, intente de nuevo";
                        return View();
                    }
                }
            }
            catch (Exception ex)
            {
                // Obtener el valor de Session["Id"] y verificar si es válido
                var idSesion = Session["Id"];

                // Llamar al método sp_RegistrarError

                MP.sp_RegistrarError(ex.Message, "CancelarProceso", idSesion);

                // Retornar la vista de error
                return View("Error");
            }
        }

        private string GenerarContenidoCorreoPostulacion(string nombreEstudiante, string nombreProyecto, string nombreInstitucion)
        {
            string ruta = AppDomain.CurrentDomain.BaseDirectory + "\\Styles\\TemplateCorreoPostulacion.html";
            string contenido = System.IO.File.ReadAllText(ruta);

            contenido = contenido.Replace("@@NombreEstudiante", nombreEstudiante);
            contenido = contenido.Replace("@@NombreProyecto", nombreProyecto);
            contenido = contenido.Replace("@@NombreInstitucion", nombreInstitucion);

            return contenido;
        }

        public string GenerarContenidoCorreoEstado(string nombreEstudiante, string nombreProyecto, string estado, string nombreInstitucion)
        {
            string ruta = string.Empty;

            if (estado == "Aceptado")
            {
                ruta = AppDomain.CurrentDomain.BaseDirectory + "\\Styles\\TemplateCorreoEstudianteAceptado.html";
            }
            else if (estado == "Rechazado")
            {
                ruta = AppDomain.CurrentDomain.BaseDirectory + "\\Styles\\TemplateCorreoEstudianteRechazado.html";
            }
            
            string contenido;

            contenido = System.IO.File.ReadAllText(ruta);

            contenido = contenido.Replace("@@NombreEstudiante", nombreEstudiante);
            contenido = contenido.Replace("@@NombreProyecto", nombreProyecto);
            contenido = contenido.Replace("@@NombreInstitucion", nombreInstitucion);
            
            return contenido;

        }

        private void EnviarCorreoPostulacion(string destino, string asunto, string contenido)
        {
            string cuenta = ConfigurationManager.AppSettings["CorreoNotificaciones"].ToString();
            string contrasenna = ConfigurationManager.AppSettings["ContrasennaNotificaciones"].ToString();

            MailMessage message = new MailMessage();
            message.From = new MailAddress(cuenta);
            message.To.Add(new MailAddress(destino));
            message.Subject = asunto;
            message.Body = contenido;
            message.Priority = MailPriority.Normal;
            message.IsBodyHtml = true;

            SmtpClient client = new SmtpClient("smtp.office365.com", 587);
            client.Credentials = new System.Net.NetworkCredential(cuenta, contrasenna);
            client.EnableSsl = true;
            client.Send(message);
        }

        private int GuardarNotificacion(long idEstudiante, long? idInstitucion, long idPostulacion, long idProyecto, string contenido, bool tipoNotificacion)
        {
            using (var context = new EncuentraTCUEntities())
            {
                var respuesta = context.RegistrarNotificacion(
                    idEstudiante,
                    idInstitucion,
                    idPostulacion,
                    idProyecto,
                    contenido,
                    tipoNotificacion
                );

                return respuesta;
            }
        }

    }
}