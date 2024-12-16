using ProyectoG1.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProyectoG1.Controllers
{
    public class NotificacionController : Controller
    {
        MetodosPublicos MP = new MetodosPublicos();

        [HttpGet]
        public ActionResult Notificaciones()
        {
            try
            {
                long idUsuario = long.Parse(Session["Id"].ToString());
            int tipoUsuario = int.Parse(Session["Rol"].ToString()); // 1 estudiante, 2 institución

            using (var context = new EncuentraTCUEntities())
            {
                var datos = context.ConsultarNotificaciones(idUsuario, tipoUsuario).ToList();
                var notificaciones = datos.Select(notificacion => new NotificacionModel
                {
                    NombreProyecto = notificacion.NombreProyecto,
                    Contenido = notificacion.Contenido,
                    Fecha = notificacion.Fecha,
                    IdProyecto = notificacion.IdProyecto,
                    IdEstudiante = notificacion.IdEstudiante
                }).ToList();

                return View(notificaciones);
            }
            }
            catch (Exception ex)
            {
                // Obtener el valor de Session["Id"] y verificar si es válido
                var idSesion = Session["Id"];

                // Llamar al método sp_RegistrarError
                MP.sp_RegistrarError(ex.Message, "Notificaciones", idSesion);

                // Retornar la vista de error
                return View("Error");
            }
        }

    }



}