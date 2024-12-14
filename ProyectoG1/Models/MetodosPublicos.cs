using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
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
                
                context.Database.ExecuteSqlCommand(
                    "EXEC sp_RegistrarError @p0, @p1, @p2",
                    mensaje, origen, id); 
            }
        }
    }
}