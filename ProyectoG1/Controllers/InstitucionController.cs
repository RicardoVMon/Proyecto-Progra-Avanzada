using ProyectoG1.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProyectoG1.Controllers
{
    [Filtros]
    public class InstitucionController : Controller
    {
        [HttpGet]
        public ActionResult PerfilInstitucion()
        {
            long idEstudiante = long.Parse(Session["IdInstitucion"].ToString());

            using (var context = new EncuentraTCUEntities())
            {
                var respuesta = context.DatosInstitucion(idEstudiante).FirstOrDefault();

                if (respuesta != null)
                {
                    InstitucionModel model = new InstitucionModel
                    {
                        Nombre = respuesta.Nombre,
                        Telefono = respuesta.Telefono,
                        Email = respuesta.Email,
                        Descripcion = respuesta.Descripcion,
                        PaginaWeb = respuesta.PaginaWeb,
                        Imagen = respuesta.Imagen,
                        NombreRol = respuesta.NombreRol,
                        TipoInstitucion = respuesta.TipoInstitucion
                    };

                    return View(model);
                }

                return View();
            }
        }
    }
}