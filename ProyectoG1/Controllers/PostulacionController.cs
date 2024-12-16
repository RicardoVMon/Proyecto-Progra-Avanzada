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

        [HttpGet]
        public ActionResult PostulacionesDeProyecto(long p)
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
            using (var context = new EncuentraTCUEntities())
            {
                int resultado = context.ActualizarEstadoPostulacion(id, estado);

                if (resultado > 0)
                {
                    return Json(new { success = true });
                }
                else
                {
                    return Json(new { success = false, message = "Error." });
                }
            }
        }

        [HttpGet]
        public ActionResult PostularseProyecto(long p)
        {
            using (var context = new EncuentraTCUEntities())
            {
                long idEstudiante = long.Parse(Session["Id"].ToString());
                var respuesta = context.InsertarPostulacion(idEstudiante, p);

                if (respuesta == 1)
                {
                    var estudiante = context.Estudiante.Where(x => x.IdEstudiante == idEstudiante).FirstOrDefault();
                    var proyecto = context.Proyecto.Where(x => x.IdProyecto == p).FirstOrDefault();
                    var institucion = context.Institucion.Where(x => x.IdInstitucion == proyecto.IdInstitucion).FirstOrDefault();
                    var postulacion = context.Postulacion.Where(x => x.IdEstudiante == idEstudiante && x.IdProyecto == p).FirstOrDefault();

                    if (estudiante != null && proyecto != null && institucion != null)
                    {
                        //correo
                        var contenidoCorreo = GenerarContenidoCorreoPostulacion(estudiante.Nombre,proyecto.Nombre,institucion.Nombre);
                        EnviarCorreoPostulacion(institucion.Email,"Nueva postulación",contenidoCorreo);

                        //notificación
                        var contenidoNotificacion = $"Tu proyecto {proyecto.Nombre} ha recibido una nueva postulación de parte de el/la estudiante {estudiante.Nombre}. Revisa en las postulaciones de tus proyectos para gestionar la postulación.";
                        var resultadoNotificacion = GuardarNotificacion(idEstudiante, proyecto.IdInstitucion, postulacion.IdPostulacion, p, contenidoNotificacion, false);

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

        [HttpGet]
        public ActionResult BuscarPostulaciones()
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

        [HttpGet]
        public ActionResult EliminarPostulacion(long t)
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

        [HttpGet]
        public ActionResult CancelarProceso(long t)
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

        private string GenerarContenidoCorreoPostulacion(string nombreEstudiante, string nombreProyecto, string nombreInstitucion)
        {
            string ruta = AppDomain.CurrentDomain.BaseDirectory + "\\Styles\\TemplateCorreoPostulacion.html";
            string contenido = System.IO.File.ReadAllText(ruta);

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