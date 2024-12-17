using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ProyectoG1.Models
{
    public class MetodosPublicos
    {
        public void sp_RegistrarError(string mensaje, string origen, object id)
        {
            using (var context = new EncuentraTCUEntities())
            {
                try
                {
                    var fechaActual = DateTime.Now;
                    long? idEstudiante = null;
                    long? idInstitucion = null;

                    if (HttpContext.Current.Session["Rol"].ToString() == "1")
                    {
                        idEstudiante = long.Parse(HttpContext.Current.Session["Id"].ToString());
                    }
                    else
                    {
                        idInstitucion = long.Parse(HttpContext.Current.Session["Id"].ToString());
                    }
                    context.sp_RegistrarError(mensaje, fechaActual, origen, idEstudiante, idInstitucion);
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Error al registrar: " + ex.Message);
                }
            }
        }
    }
}