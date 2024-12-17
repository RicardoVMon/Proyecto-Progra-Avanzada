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
                using (var context = new EncuentraTCUEntities()) {

                    var homeModel = new HomeModel();

                    if (Session["Rol"].ToString() == "1")
                    {
                        LlenarInformacionEstudiante(homeModel, context);
                    }
                    else
                    {
                        LlenarInformacionInstitucion(homeModel, context);
                    }

                return View(homeModel);
                }
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

        private void LlenarInformacionEstudiante(HomeModel homeModel, EncuentraTCUEntities context)
        {
            // Obtener los proyectos recomendados
            var resultadoProyectos = context.ObtenerProyectosAleatorios();
            var proyectos = new List<ProyectoModel>();
            foreach (var proyecto in resultadoProyectos)
            {
                proyectos.Add(new ProyectoModel
                {
                    IdProyecto = proyecto.IdProyecto,
                    Nombre = proyecto.Nombre,
                    Descripcion = proyecto.Descripcion,
                    Imagen = proyecto.Imagen,
                });
            }

            homeModel.ProyectosRecomendados = proyectos;

            // Obtener las categorias recomendadas
            var resultadoCategorias = context.ObtenerCategoriasAleatorias();
            var categorias = new List<CategoriaModel>();
            foreach (var categoria in resultadoCategorias)
            {
                categorias.Add(new CategoriaModel
                {
                    IdCategoria = categoria.IdCategoria,
                    Nombre = categoria.Nombre,
                });
            }

            homeModel.CategoriasRecomendadas = categorias;

            // Obtener las instituciones recomendadas
            var resultadoInstituciones = context.ObtenerInstitucionesAleatorias();
            var instituciones = new List<InstitucionModel>();
            foreach (var institucion in resultadoInstituciones)
            {
                instituciones.Add(new InstitucionModel
                {
                    IdInstitucion = institucion.IdInstitucion,
                    Nombre = institucion.Nombre,
                    Descripcion = institucion.Descripcion,
                    Imagen = institucion.Imagen,
                });
            }

            homeModel.InstitucionesRecomendadas = instituciones;
        }

        private void LlenarInformacionInstitucion(HomeModel homeModel, EncuentraTCUEntities context)
        {
            var IdInstitucion = long.Parse(Session["Id"].ToString());

            // Obtener el conteo de proyectos activos
            var resultadoProyectos = context.ObtenerProyectosInstitucion(IdInstitucion);
            var conteoProyectos = resultadoProyectos.Count();
            homeModel.ProyectoActivos = conteoProyectos;

            // Obtener el conteo de notificaciones
            var resultadoNotificaciones = context.ObtenerCantidadNotificacionesInstitucion(IdInstitucion).FirstOrDefault();
            homeModel.Notificaciones = resultadoNotificaciones.HasValue ? resultadoNotificaciones.Value : 0;

            // Obtener el conteo de postulaciones pendientes
            var resultadoPostulaciones = context.ObtenerCantidadPostulacionesPendientesInstitucion(IdInstitucion).FirstOrDefault();
            homeModel.PostulacionesPendientes = resultadoPostulaciones.HasValue ? resultadoPostulaciones.Value : 0;

            // Obtener el conteo de usuarios aceptados
            var resultadoUsuarios = context.ObtenerCantidadPostulacionesAceptadasInstitucion(IdInstitucion).FirstOrDefault();
            homeModel.UsuarioAceptados = resultadoUsuarios.HasValue ? resultadoUsuarios.Value : 0;

            // Obtener el conteo de proyectos llenos
            var resultadoProyectosLlenos = context.ObtenerCantidadProyectosLlenosInstitucion(IdInstitucion);
            var conteoProyectosLlenos = resultadoProyectosLlenos.Count();
            homeModel.ProyectosLlenos = conteoProyectosLlenos;

        }
    }
}