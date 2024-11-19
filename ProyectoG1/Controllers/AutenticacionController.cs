using ProyectoG1.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace ProyectoG1.Controllers
{
    public class AutenticacionController : Controller
    {
        [HttpGet]
        public ActionResult RecuperarContrasenna()
        {
            return View();
        }

        [HttpPost]
        public ActionResult RecuperarContrasenna(LoginModel model)
        {
            using (var context = new EncuentraTCUEntities())
            {
                if (model.TipoCedula == 1) // Estudiante
                {
                    var estudiante = context.Estudiante.Where(x => x.Cedula == model.Cedula).FirstOrDefault();

                    if (estudiante != null)
                    {
                        var Contrasenna = CrearContrasenna();
                        var TieneContrasennaTemp = true;
                        var FechaVencimientoTemp = DateTime.Now.AddMinutes(double.Parse(ConfigurationManager.AppSettings["MinutosVigenciaTemporal"]));

                        // Llamar al procedimiento almacenado (manteniéndose fiel al ejemplo)
                        var result = context.ActualizarContrasenna(estudiante.Cedula, model.TipoCedula, Contrasenna, TieneContrasennaTemp, FechaVencimientoTemp);

                        string ruta = AppDomain.CurrentDomain.BaseDirectory + "\\Styles\\TemplateRecuperarContra.html";
                        string contenido = System.IO.File.ReadAllText(ruta);

                        contenido = contenido.Replace("@@Nombre", estudiante.Nombre);
                        contenido = contenido.Replace("@@Contrasenna", Contrasenna);
                        contenido = contenido.Replace("@@Vencimiento", estudiante.FechaVencimientoTemp.ToString("dd/MM/yyyy hh:mm tt"));

                        // Enviar correo
                        EnviarCorreo(estudiante.Email, "Contraseña Temporal", contenido);
                        return RedirectToAction("Ingresar", "Autenticacion");
                    }
                }
                else if (model.TipoCedula == 2) // Institución
                {
                    var institucion = context.Institucion.Where(x => x.Cedula == model.Cedula).FirstOrDefault();

                    if (institucion != null)
                    {
                        var Contrasenna = CrearContrasenna();
                        var TieneContrasennaTemp = true;
                        var FechaVencimientoTemp = DateTime.Now.AddMinutes(double.Parse(ConfigurationManager.AppSettings["MinutosVigenciaTemporal"]));

                        // Llamar al procedimiento almacenado (manteniéndose fiel al ejemplo)
                        var result = context.ActualizarContrasenna(institucion.Cedula, model.TipoCedula, Contrasenna, TieneContrasennaTemp, FechaVencimientoTemp);

                        string ruta = AppDomain.CurrentDomain.BaseDirectory + "\\Styles\\TemplateRecuperarContra.html";
                        string contenido = System.IO.File.ReadAllText(ruta);

                        contenido = contenido.Replace("@@Nombre", institucion.Nombre);
                        contenido = contenido.Replace("@@Contrasenna", Contrasenna);
                        contenido = contenido.Replace("@@Vencimiento", institucion.FechaVencimientoTemp.ToString("dd/MM/yyyy hh:mm tt"));

                        // Enviar correo
                        EnviarCorreo(institucion.Email, "Contraseña Temporal", contenido);
                        return RedirectToAction("Ingresar", "Autenticacion");
                    }
                }

                ViewBag.MensajePantalla = "La información no se ha podido validar correctamente.";
                return View();
            }
        }

        private string CrearContrasenna()
        {
            int length = 10;
            const string valid = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
            StringBuilder res = new StringBuilder();
            Random rnd = new Random();
            while (0 < length--)
            {
                res.Append(valid[rnd.Next(valid.Length)]);
            }
            return res.ToString();
        }

        private void EnviarCorreo(string destino, string asunto, string contenido)
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

        [HttpGet]
        public ActionResult Ingresar()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Ingresar(LoginModel model)
        {
            using (var context = new EncuentraTCUEntities())
            {
                var respuesta = context.IngresoSistema(model.Cedula, model.Contrasenna, model.TipoCedula).FirstOrDefault();

                if (respuesta != null)
                {

                    if (respuesta.TieneContrasennaTemp && respuesta.FechaVencimientoTemp < DateTime.Now)
                    {
                        ViewBag.MensajePantalla = "Su contraseña temporal ha expirado. Por favor, recupere su contraseña.";
                        return RedirectToAction("RecuperarContrasenna", "Autenticacion");
                    }

                    // Validar
                    if (model.TipoCedula == 2)
                    {
                        Session["IdInstitucion"] = respuesta.Id;
                        Session["Nombre"] = respuesta.Nombre;
                        Session["Email"] = respuesta.Email;
                        Session["Rol"] = respuesta.IdRol;
                        return RedirectToAction("Index", "Home");
                    }
                    else if (model.TipoCedula == 1)
                    {
                        Session["IdEstudiante"] = respuesta.Id;
                        Session["Nombre"] = respuesta.Nombre;
                        Session["Email"] = respuesta.Email;
                        Session["Rol"] = respuesta.IdRol;
                        return RedirectToAction("Index", "Home");
                    }
                }

                // Mensaje de error si falla
                ViewBag.MensajePantalla = "Su información no se ha podido validar correctamente";
                return View();
            }
        }

        [HttpGet]
        public ActionResult CierreSesion()
        {
            Session.Clear();
            return RedirectToAction("Ingresar", "Autenticacion");
        }


        [HttpGet]
        public ActionResult RegistroEstudiante()
        {
            ConsultarGeneros();
            ConsultarUniversidades();
            return View();
        }

        [HttpPost]
        public ActionResult RegistroEstudiante(EstudianteModel model)
        {
            using (var context = new EncuentraTCUEntities())
            {
                var respuesta = context.RegistrarEstudiante(model.IdGenero, model.IdUniversidad, model.Cedula, model.Email, model.Contrasenna, model.Nombre, model.Apellidos, "Hola! Estoy buscando lugares para hacer mi TCU!", model.Carrera);

                if (respuesta > 0)
                    return RedirectToAction("Ingresar", "Autenticacion");

                ViewBag.Mensaje = "Su información no se ha podido registrar correctamente";
                ConsultarGeneros();
                ConsultarUniversidades();
                return View();
            }
        }
        [HttpGet]
        public ActionResult RegistroInstitucion()
        {
            ConsultarTipoInstitucion();
            return View();
        }

        [HttpPost]
        public ActionResult RegistroInstitucion(InstitucionModel model)
        {
            using (var context = new EncuentraTCUEntities())
            {
                var respuesta = context.RegistrarInstitucion(model.IdTipoInstitucion, model.Cedula, model.Email, model.Contrasenna, model.Nombre, model.Descripcion, model.Telefono, model.PaginaWeb);

                if (respuesta > 0)
                    return RedirectToAction("Ingresar", "Autenticacion");

                ViewBag.Mensaje = "Su información no se ha podido registrar correctamente";
                ConsultarTipoInstitucion();
                return View();
            }
        }

        private void ConsultarGeneros()
        {
            using (var context = new EncuentraTCUEntities())
            {
                var datos = context.Genero.ToList();
                var generos = new List<SelectListItem>();

                generos.Add(new SelectListItem
                {
                    Text = "Seleccione un genero",
                    Value = null,
                    Disabled = true,
                    Selected = true
                });

                foreach (var item in datos)
                {
                    generos.Add(new SelectListItem
                    {
                        Text = item.Nombre,
                        Value = item.IdGenero.ToString()
                    });
                }

                ViewBag.Generos = generos;
            }
        }

        private void ConsultarUniversidades()
        {
            using (var context = new EncuentraTCUEntities())
            {
                var datos = context.Universidad.ToList();
                var universidades = new List<SelectListItem>();

                universidades.Add(new SelectListItem
                {
                    Text = "Seleccione su universidad",
                    Value = null,
                    Disabled = true,
                    Selected = true
                });

                foreach (var item in datos)
                {
                    universidades.Add(new SelectListItem
                    {
                        Text = item.Nombre,
                        Value = item.IdUniversidad.ToString()
                    });
                }

                ViewBag.Universidades = universidades;
            }
        }

        private void ConsultarTipoInstitucion()
        {
            using (var context = new EncuentraTCUEntities())
            {
                var datos = context.TipoInstitucion.ToList();
                var tipoInstituciones = new List<SelectListItem>();

                tipoInstituciones.Add(new SelectListItem
                {
                    Text = "Seleccione su tipo de institución",
                    Value = null,
                    Disabled = true,
                    Selected = true
                });

                foreach (var item in datos)
                {
                    tipoInstituciones.Add(new SelectListItem
                    {
                        Text = item.Nombre,
                        Value = item.IdTipoInstitucion.ToString()
                    });
                }

                ViewBag.TipoInstituciones = tipoInstituciones;
            }
        }

    }
}