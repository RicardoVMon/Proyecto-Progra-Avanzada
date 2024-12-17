using ProyectoG1.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProyectoG1.Controllers
{
    [Filtros]
    public class HomeController : Controller
    {
        MetodosPublicos MP = new MetodosPublicos();
        public ActionResult Index()
        {
            try
            {
                return View();
            }
            catch (Exception ex)
            {
                // Obtener el valor de Session["Id"] y verificar si es válido
                var idSesion = Session["Id"];

                // Llamar al método sp_RegistrarError
                MP.sp_RegistrarError(ex.Message, "Index", idSesion);

                // Retornar la vista de error
                return View("Error");
            }
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}