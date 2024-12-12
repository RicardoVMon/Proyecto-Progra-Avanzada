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
                        return ProcesarRecuperacion(context, model.TipoCedula, estudiante.Cedula, estudiante.Nombre, estudiante.Email);
                }
                else if (model.TipoCedula == 2) // Institución
                {
                    var institucion = context.Institucion.Where(x => x.Cedula == model.Cedula).FirstOrDefault();
                    if (institucion != null)
                        return ProcesarRecuperacion(context, model.TipoCedula, institucion.Cedula, institucion.Nombre, institucion.Email);
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

        private string GenerarContenidoCorreo(string nombre, string contrasenna, DateTime fechaVencimiento)
        {
            string ruta = AppDomain.CurrentDomain.BaseDirectory + "\\Styles\\TemplateRecuperarContra.html";
            string contenido = System.IO.File.ReadAllText(ruta);

            contenido = contenido.Replace("@@Nombre", nombre);
            contenido = contenido.Replace("@@Contrasenna", contrasenna);
            contenido = contenido.Replace("@@Vencimiento", fechaVencimiento.ToString("dd/MM/yyyy hh:mm tt"));

            return contenido;
        }

        private ActionResult ProcesarRecuperacion(EncuentraTCUEntities context, int tipoCedula, string cedula, string nombre, string email)
        {
            var contrasenna = CrearContrasenna();
            var tieneContrasennaTemp = true;
            var fechaVencimientoTemp = DateTime.Now.AddMinutes(double.Parse(ConfigurationManager.AppSettings["MinutosVigenciaTemporal"]));

            context.ActualizarContrasenna(cedula, tipoCedula, contrasenna, tieneContrasennaTemp, fechaVencimientoTemp);

            var contenido = GenerarContenidoCorreo(nombre, contrasenna, fechaVencimientoTemp);

            EnviarCorreo(email, "Contraseña Temporal", contenido);

            return RedirectToAction("Ingresar", "Autenticacion");
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
                    else if (respuesta.TieneContrasennaTemp && respuesta.FechaVencimientoTemp > DateTime.Now)
                    {
                        ViewBag.MensajePantalla = "Debe actualizar su contraseña antes de ingresar.";
                        TempData["Cedula"] = model.Cedula;
                        TempData["TipoCedula"] = model.TipoCedula;
                        return RedirectToAction("CambiarContrasennaTemp", "Autenticacion");
                    }

                    Session["Id"] = respuesta.Id;
                    Session["Nombre"] = respuesta.Nombre;
                    Session["Email"] = respuesta.Email;
                    Session["Rol"] = respuesta.IdRol;
                    Session["Imagen"] = respuesta.Imagen;
                    return RedirectToAction("Index", "Home");
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

            // TitleCase para nombre y apellido
            model.Nombre = System.Globalization.CultureInfo.CurrentCulture.TextInfo.ToTitleCase(model.Nombre.ToLower());
            model.Apellidos = System.Globalization.CultureInfo.CurrentCulture.TextInfo.ToTitleCase(model.Apellidos.ToLower());

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

        [HttpGet]
        public ActionResult CambiarContrasennaTemp()
        {
            return View();
        }

        /*[HttpPost]
        public ActionResult CambiarContrasennaTempxxxxxx(LoginModel model)
        {
            if (model.ContrasennaAnterior == model.Contrasenna)
            {
                ViewBag.MensajePantalla = "Debe ingresar una contraseña nueva";
                return View();
            }
            else if (model.Contrasenna != model.ConfirmarContrasenna)
            {
                ViewBag.MensajePantalla = "Las nuevas contraseñas no coinciden";
                return View();
            }

            using (var context = new KDataBaseEntities())
            {
                long Consecutivo = long.Parse(Session["Consecutivo"].ToString());
                var datos = context.tUsuario.Where(x => x.Consecutivo == Consecutivo).FirstOrDefault();

                if (datos != null)
                {
                    if (datos.Contrasenna != model.ContrasennaAnterior)
                    {
                        ViewBag.MensajePantalla = "La contraseña anterior no coincide";
                        return View();
                    }

                    datos.Contrasenna = model.Contrasenna;
                    datos.TieneContrasennaTemp = false;
                    datos.FechaVencimientoTemp = DateTime.Now;
                    context.SaveChanges();
                    return RedirectToAction("Index", "Home");
                }

                ViewBag.MensajePantalla = "Sus credenciales no se han podido actualizar correctamente";
                return View();
            }
        }*/

        [HttpPost]
        public ActionResult CambiarContrasennaTemp(LoginModel model)
        {
            using (var context = new EncuentraTCUEntities())
            {
                if (model.TipoCedula == 1) // Estudiante
                {
                    var estudiante = context.Estudiante.Where(x => x.Cedula == model.Cedula).FirstOrDefault();
                    if (estudiante != null)
                        return ProcesarCambiarContrasenna(context, model.TipoCedula, estudiante.Cedula, model.NuevaContrasenna, model.ConfirmarContrasenna);
                }
                else if (model.TipoCedula == 2) // Institución
                {
                    var institucion = context.Institucion.Where(x => x.Cedula == model.Cedula).FirstOrDefault();
                    if (institucion != null)
                        return ProcesarCambiarContrasenna(context, model.TipoCedula, institucion.Cedula, model.NuevaContrasenna, model.ConfirmarContrasenna);
                }

                ViewBag.MensajePantalla = "La información no se ha podido validar correctamente.";
                return View();
            }

        }

        private ActionResult ProcesarCambiarContrasenna(EncuentraTCUEntities context, int tipoCedula, string cedula, string NuevaContrasenna, string ConfirmarContrasenna)
        {

            if (NuevaContrasenna != ConfirmarContrasenna)
            {
                ViewBag.MensajePantalla = "Las contraseñas no coinciden.";
                return View();
            }

            context.CambiarContrasennaTemp(cedula, tipoCedula, NuevaContrasenna);

            return RedirectToAction("Ingresar", "Autenticacion");

        }
    }
}