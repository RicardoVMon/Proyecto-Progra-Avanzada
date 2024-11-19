using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace ProyectoG1.Models
{
    public class Filtros : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            var rolUsuario = filterContext.HttpContext.Session["Rol"];

            if (rolUsuario != null)
            {
                base.OnActionExecuting(filterContext);
            }
            else
            {
                filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary {
                    { "controller","Autenticacion"},
                    { "action", "Ingresar" }
                });
            }
        }
    }
}