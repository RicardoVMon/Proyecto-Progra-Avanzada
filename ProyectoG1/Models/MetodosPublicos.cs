using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
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
                    // Parámetros del procedimiento almacenado
                    var fechaActual = DateTime.Now;
                    var idEstudiante = id is long ? id : DBNull.Value; // Valida si es Estudiante
                    var idInstitucion = id is string ? id : DBNull.Value; // Valida si es Institución

                    context.Database.ExecuteSqlCommand(
                        "EXEC sp_RegistrarError @Mensaje, @Fecha, @Origen, @IdEstudiante, @IdInstitucion",
                        new SqlParameter("@Mensaje", mensaje),
                        new SqlParameter("@Fecha", fechaActual),
                        new SqlParameter("@Origen", origen),
                        new SqlParameter("@IdEstudiante", idEstudiante ?? (object)DBNull.Value),
                        new SqlParameter("@IdInstitucion", idInstitucion ?? (object)DBNull.Value)
                    );
                }
                catch (Exception ex)
                {
                    // Manejo adicional de errores
                    Console.WriteLine("Error al registrar: " + ex.Message);
                }
            }
        }
    }
}