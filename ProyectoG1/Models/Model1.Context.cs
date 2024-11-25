﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ProyectoG1.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class EncuentraTCUEntities : DbContext
    {
        public EncuentraTCUEntities()
            : base("name=EncuentraTCUEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Auditoria> Auditoria { get; set; }
        public virtual DbSet<Categoria> Categoria { get; set; }
        public virtual DbSet<Conexion> Conexion { get; set; }
        public virtual DbSet<Estudiante> Estudiante { get; set; }
        public virtual DbSet<Genero> Genero { get; set; }
        public virtual DbSet<Institucion> Institucion { get; set; }
        public virtual DbSet<Postulacion> Postulacion { get; set; }
        public virtual DbSet<Proyecto> Proyecto { get; set; }
        public virtual DbSet<Rol> Rol { get; set; }
        public virtual DbSet<TipoInstitucion> TipoInstitucion { get; set; }
        public virtual DbSet<Universidad> Universidad { get; set; }
    
        public virtual int ActualizarContrasenna(string cedula, Nullable<int> tipoCedula, string contrasennaTemp, Nullable<bool> tieneContrasennaTemp, Nullable<System.DateTime> fechaVencimientoTemp)
        {
            var cedulaParameter = cedula != null ?
                new ObjectParameter("Cedula", cedula) :
                new ObjectParameter("Cedula", typeof(string));
    
            var tipoCedulaParameter = tipoCedula.HasValue ?
                new ObjectParameter("TipoCedula", tipoCedula) :
                new ObjectParameter("TipoCedula", typeof(int));
    
            var contrasennaTempParameter = contrasennaTemp != null ?
                new ObjectParameter("ContrasennaTemp", contrasennaTemp) :
                new ObjectParameter("ContrasennaTemp", typeof(string));
    
            var tieneContrasennaTempParameter = tieneContrasennaTemp.HasValue ?
                new ObjectParameter("TieneContrasennaTemp", tieneContrasennaTemp) :
                new ObjectParameter("TieneContrasennaTemp", typeof(bool));
    
            var fechaVencimientoTempParameter = fechaVencimientoTemp.HasValue ?
                new ObjectParameter("FechaVencimientoTemp", fechaVencimientoTemp) :
                new ObjectParameter("FechaVencimientoTemp", typeof(System.DateTime));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("ActualizarContrasenna", cedulaParameter, tipoCedulaParameter, contrasennaTempParameter, tieneContrasennaTempParameter, fechaVencimientoTempParameter);
        }
    
        public virtual int ActualizarImagenInstitucion(Nullable<long> idInstitucion, string imagen)
        {
            var idInstitucionParameter = idInstitucion.HasValue ?
                new ObjectParameter("IdInstitucion", idInstitucion) :
                new ObjectParameter("IdInstitucion", typeof(long));
    
            var imagenParameter = imagen != null ?
                new ObjectParameter("Imagen", imagen) :
                new ObjectParameter("Imagen", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("ActualizarImagenInstitucion", idInstitucionParameter, imagenParameter);
        }
    
        public virtual int ActualizarImagenProyecto(Nullable<long> idProyecto, string imagen)
        {
            var idProyectoParameter = idProyecto.HasValue ?
                new ObjectParameter("IdProyecto", idProyecto) :
                new ObjectParameter("IdProyecto", typeof(long));
    
            var imagenParameter = imagen != null ?
                new ObjectParameter("Imagen", imagen) :
                new ObjectParameter("Imagen", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("ActualizarImagenProyecto", idProyectoParameter, imagenParameter);
        }
    
        public virtual int ActualizarPerfilEstudiante(Nullable<long> idEstudiante, Nullable<long> idUniversidad, string carrera, string email, string descripcion)
        {
            var idEstudianteParameter = idEstudiante.HasValue ?
                new ObjectParameter("IdEstudiante", idEstudiante) :
                new ObjectParameter("IdEstudiante", typeof(long));
    
            var idUniversidadParameter = idUniversidad.HasValue ?
                new ObjectParameter("IdUniversidad", idUniversidad) :
                new ObjectParameter("IdUniversidad", typeof(long));
    
            var carreraParameter = carrera != null ?
                new ObjectParameter("Carrera", carrera) :
                new ObjectParameter("Carrera", typeof(string));
    
            var emailParameter = email != null ?
                new ObjectParameter("Email", email) :
                new ObjectParameter("Email", typeof(string));
    
            var descripcionParameter = descripcion != null ?
                new ObjectParameter("Descripcion", descripcion) :
                new ObjectParameter("Descripcion", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("ActualizarPerfilEstudiante", idEstudianteParameter, idUniversidadParameter, carreraParameter, emailParameter, descripcionParameter);
        }
    
        public virtual int ActualizarPerfilInstitucion(Nullable<long> idInstitucion, string nombre, string telefono, string email, string descripcion, string paginaWeb, string imagen, Nullable<long> idTipoInstitucion)
        {
            var idInstitucionParameter = idInstitucion.HasValue ?
                new ObjectParameter("IdInstitucion", idInstitucion) :
                new ObjectParameter("IdInstitucion", typeof(long));
    
            var nombreParameter = nombre != null ?
                new ObjectParameter("Nombre", nombre) :
                new ObjectParameter("Nombre", typeof(string));
    
            var telefonoParameter = telefono != null ?
                new ObjectParameter("Telefono", telefono) :
                new ObjectParameter("Telefono", typeof(string));
    
            var emailParameter = email != null ?
                new ObjectParameter("Email", email) :
                new ObjectParameter("Email", typeof(string));
    
            var descripcionParameter = descripcion != null ?
                new ObjectParameter("Descripcion", descripcion) :
                new ObjectParameter("Descripcion", typeof(string));
    
            var paginaWebParameter = paginaWeb != null ?
                new ObjectParameter("PaginaWeb", paginaWeb) :
                new ObjectParameter("PaginaWeb", typeof(string));
    
            var imagenParameter = imagen != null ?
                new ObjectParameter("Imagen", imagen) :
                new ObjectParameter("Imagen", typeof(string));
    
            var idTipoInstitucionParameter = idTipoInstitucion.HasValue ?
                new ObjectParameter("IdTipoInstitucion", idTipoInstitucion) :
                new ObjectParameter("IdTipoInstitucion", typeof(long));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("ActualizarPerfilInstitucion", idInstitucionParameter, nombreParameter, telefonoParameter, emailParameter, descripcionParameter, paginaWebParameter, imagenParameter, idTipoInstitucionParameter);
        }
    
        public virtual int ActualizarProyecto(Nullable<long> idProyecto, string nombre, string descripcion, Nullable<int> cupo, string imagen, string contacto, string direccion, string correoAsociado)
        {
            var idProyectoParameter = idProyecto.HasValue ?
                new ObjectParameter("IdProyecto", idProyecto) :
                new ObjectParameter("IdProyecto", typeof(long));
    
            var nombreParameter = nombre != null ?
                new ObjectParameter("Nombre", nombre) :
                new ObjectParameter("Nombre", typeof(string));
    
            var descripcionParameter = descripcion != null ?
                new ObjectParameter("Descripcion", descripcion) :
                new ObjectParameter("Descripcion", typeof(string));
    
            var cupoParameter = cupo.HasValue ?
                new ObjectParameter("Cupo", cupo) :
                new ObjectParameter("Cupo", typeof(int));
    
            var imagenParameter = imagen != null ?
                new ObjectParameter("Imagen", imagen) :
                new ObjectParameter("Imagen", typeof(string));
    
            var contactoParameter = contacto != null ?
                new ObjectParameter("Contacto", contacto) :
                new ObjectParameter("Contacto", typeof(string));
    
            var direccionParameter = direccion != null ?
                new ObjectParameter("Direccion", direccion) :
                new ObjectParameter("Direccion", typeof(string));
    
            var correoAsociadoParameter = correoAsociado != null ?
                new ObjectParameter("CorreoAsociado", correoAsociado) :
                new ObjectParameter("CorreoAsociado", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("ActualizarProyecto", idProyectoParameter, nombreParameter, descripcionParameter, cupoParameter, imagenParameter, contactoParameter, direccionParameter, correoAsociadoParameter);
        }
    
        public virtual ObjectResult<DatosEstudiante_Result> DatosEstudiante(Nullable<long> idEstudiante)
        {
            var idEstudianteParameter = idEstudiante.HasValue ?
                new ObjectParameter("IdEstudiante", idEstudiante) :
                new ObjectParameter("IdEstudiante", typeof(long));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<DatosEstudiante_Result>("DatosEstudiante", idEstudianteParameter);
        }
    
        public virtual ObjectResult<DatosInstitucion_Result> DatosInstitucion(Nullable<long> idInstitucion)
        {
            var idInstitucionParameter = idInstitucion.HasValue ?
                new ObjectParameter("IdInstitucion", idInstitucion) :
                new ObjectParameter("IdInstitucion", typeof(long));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<DatosInstitucion_Result>("DatosInstitucion", idInstitucionParameter);
        }
    
        public virtual int EliminarCategoriasProyecto(Nullable<long> idProyecto)
        {
            var idProyectoParameter = idProyecto.HasValue ?
                new ObjectParameter("IdProyecto", idProyecto) :
                new ObjectParameter("IdProyecto", typeof(long));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("EliminarCategoriasProyecto", idProyectoParameter);
        }
    
        public virtual int EliminarProyecto(Nullable<long> idProyecto)
        {
            var idProyectoParameter = idProyecto.HasValue ?
                new ObjectParameter("IdProyecto", idProyecto) :
                new ObjectParameter("IdProyecto", typeof(long));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("EliminarProyecto", idProyectoParameter);
        }
    
        public virtual ObjectResult<IngresoSistema_Result> IngresoSistema(string cedula, string contrasenna, Nullable<int> tipoCedula)
        {
            var cedulaParameter = cedula != null ?
                new ObjectParameter("Cedula", cedula) :
                new ObjectParameter("Cedula", typeof(string));
    
            var contrasennaParameter = contrasenna != null ?
                new ObjectParameter("Contrasenna", contrasenna) :
                new ObjectParameter("Contrasenna", typeof(string));
    
            var tipoCedulaParameter = tipoCedula.HasValue ?
                new ObjectParameter("TipoCedula", tipoCedula) :
                new ObjectParameter("TipoCedula", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<IngresoSistema_Result>("IngresoSistema", cedulaParameter, contrasennaParameter, tipoCedulaParameter);
        }
    
        public virtual ObjectResult<ObtenerCategoriasProyecto_Result> ObtenerCategoriasProyecto(Nullable<long> idProyecto)
        {
            var idProyectoParameter = idProyecto.HasValue ?
                new ObjectParameter("IdProyecto", idProyecto) :
                new ObjectParameter("IdProyecto", typeof(long));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<ObtenerCategoriasProyecto_Result>("ObtenerCategoriasProyecto", idProyectoParameter);
        }
    
        public virtual ObjectResult<string> ObtenerCategoriasUsadasEnInstitucion(Nullable<long> idInstitucion)
        {
            var idInstitucionParameter = idInstitucion.HasValue ?
                new ObjectParameter("IdInstitucion", idInstitucion) :
                new ObjectParameter("IdInstitucion", typeof(long));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<string>("ObtenerCategoriasUsadasEnInstitucion", idInstitucionParameter);
        }
    
        public virtual ObjectResult<Nullable<long>> ObtenerProyectoReciente(Nullable<long> idInstitucion, string nombre, string descripcion, Nullable<int> cupo)
        {
            var idInstitucionParameter = idInstitucion.HasValue ?
                new ObjectParameter("IdInstitucion", idInstitucion) :
                new ObjectParameter("IdInstitucion", typeof(long));
    
            var nombreParameter = nombre != null ?
                new ObjectParameter("Nombre", nombre) :
                new ObjectParameter("Nombre", typeof(string));
    
            var descripcionParameter = descripcion != null ?
                new ObjectParameter("Descripcion", descripcion) :
                new ObjectParameter("Descripcion", typeof(string));
    
            var cupoParameter = cupo.HasValue ?
                new ObjectParameter("Cupo", cupo) :
                new ObjectParameter("Cupo", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Nullable<long>>("ObtenerProyectoReciente", idInstitucionParameter, nombreParameter, descripcionParameter, cupoParameter);
        }
    
        public virtual ObjectResult<ObtenerProyectosEspecifico_Result> ObtenerProyectosEspecifico(Nullable<long> idProyecto)
        {
            var idProyectoParameter = idProyecto.HasValue ?
                new ObjectParameter("IdProyecto", idProyecto) :
                new ObjectParameter("IdProyecto", typeof(long));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<ObtenerProyectosEspecifico_Result>("ObtenerProyectosEspecifico", idProyectoParameter);
        }
    
        public virtual ObjectResult<ObtenerProyectosInstitucion_Result> ObtenerProyectosInstitucion(Nullable<long> idInstitucion)
        {
            var idInstitucionParameter = idInstitucion.HasValue ?
                new ObjectParameter("IdInstitucion", idInstitucion) :
                new ObjectParameter("IdInstitucion", typeof(long));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<ObtenerProyectosInstitucion_Result>("ObtenerProyectosInstitucion", idInstitucionParameter);
        }
    
        public virtual int RegistrarCategoriaProyecto(Nullable<long> idProyecto, Nullable<long> idCategoria)
        {
            var idProyectoParameter = idProyecto.HasValue ?
                new ObjectParameter("IdProyecto", idProyecto) :
                new ObjectParameter("IdProyecto", typeof(long));
    
            var idCategoriaParameter = idCategoria.HasValue ?
                new ObjectParameter("IdCategoria", idCategoria) :
                new ObjectParameter("IdCategoria", typeof(long));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("RegistrarCategoriaProyecto", idProyectoParameter, idCategoriaParameter);
        }
    
        public virtual int RegistrarEstudiante(Nullable<long> idGenero, Nullable<long> idUniversidad, string cedula, string email, string contrasenna, string nombre, string apellidos, string descripcion, string carrera)
        {
            var idGeneroParameter = idGenero.HasValue ?
                new ObjectParameter("IdGenero", idGenero) :
                new ObjectParameter("IdGenero", typeof(long));
    
            var idUniversidadParameter = idUniversidad.HasValue ?
                new ObjectParameter("IdUniversidad", idUniversidad) :
                new ObjectParameter("IdUniversidad", typeof(long));
    
            var cedulaParameter = cedula != null ?
                new ObjectParameter("Cedula", cedula) :
                new ObjectParameter("Cedula", typeof(string));
    
            var emailParameter = email != null ?
                new ObjectParameter("Email", email) :
                new ObjectParameter("Email", typeof(string));
    
            var contrasennaParameter = contrasenna != null ?
                new ObjectParameter("Contrasenna", contrasenna) :
                new ObjectParameter("Contrasenna", typeof(string));
    
            var nombreParameter = nombre != null ?
                new ObjectParameter("Nombre", nombre) :
                new ObjectParameter("Nombre", typeof(string));
    
            var apellidosParameter = apellidos != null ?
                new ObjectParameter("Apellidos", apellidos) :
                new ObjectParameter("Apellidos", typeof(string));
    
            var descripcionParameter = descripcion != null ?
                new ObjectParameter("Descripcion", descripcion) :
                new ObjectParameter("Descripcion", typeof(string));
    
            var carreraParameter = carrera != null ?
                new ObjectParameter("Carrera", carrera) :
                new ObjectParameter("Carrera", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("RegistrarEstudiante", idGeneroParameter, idUniversidadParameter, cedulaParameter, emailParameter, contrasennaParameter, nombreParameter, apellidosParameter, descripcionParameter, carreraParameter);
        }
    
        public virtual int RegistrarInstitucion(Nullable<long> idTipoInstitucion, string cedula, string email, string contrasenna, string nombre, string descripcion, string telefono, string paginaWeb)
        {
            var idTipoInstitucionParameter = idTipoInstitucion.HasValue ?
                new ObjectParameter("IdTipoInstitucion", idTipoInstitucion) :
                new ObjectParameter("IdTipoInstitucion", typeof(long));
    
            var cedulaParameter = cedula != null ?
                new ObjectParameter("Cedula", cedula) :
                new ObjectParameter("Cedula", typeof(string));
    
            var emailParameter = email != null ?
                new ObjectParameter("Email", email) :
                new ObjectParameter("Email", typeof(string));
    
            var contrasennaParameter = contrasenna != null ?
                new ObjectParameter("Contrasenna", contrasenna) :
                new ObjectParameter("Contrasenna", typeof(string));
    
            var nombreParameter = nombre != null ?
                new ObjectParameter("Nombre", nombre) :
                new ObjectParameter("Nombre", typeof(string));
    
            var descripcionParameter = descripcion != null ?
                new ObjectParameter("Descripcion", descripcion) :
                new ObjectParameter("Descripcion", typeof(string));
    
            var telefonoParameter = telefono != null ?
                new ObjectParameter("Telefono", telefono) :
                new ObjectParameter("Telefono", typeof(string));
    
            var paginaWebParameter = paginaWeb != null ?
                new ObjectParameter("PaginaWeb", paginaWeb) :
                new ObjectParameter("PaginaWeb", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("RegistrarInstitucion", idTipoInstitucionParameter, cedulaParameter, emailParameter, contrasennaParameter, nombreParameter, descripcionParameter, telefonoParameter, paginaWebParameter);
        }
    
        public virtual int RegistrarProyecto(Nullable<long> idInstitucion, string nombre, string descripcion, Nullable<int> cupo, Nullable<bool> creadoPorInstitucion, string contacto, string direccion, string correoAsociado)
        {
            var idInstitucionParameter = idInstitucion.HasValue ?
                new ObjectParameter("IdInstitucion", idInstitucion) :
                new ObjectParameter("IdInstitucion", typeof(long));
    
            var nombreParameter = nombre != null ?
                new ObjectParameter("Nombre", nombre) :
                new ObjectParameter("Nombre", typeof(string));
    
            var descripcionParameter = descripcion != null ?
                new ObjectParameter("Descripcion", descripcion) :
                new ObjectParameter("Descripcion", typeof(string));
    
            var cupoParameter = cupo.HasValue ?
                new ObjectParameter("Cupo", cupo) :
                new ObjectParameter("Cupo", typeof(int));
    
            var creadoPorInstitucionParameter = creadoPorInstitucion.HasValue ?
                new ObjectParameter("CreadoPorInstitucion", creadoPorInstitucion) :
                new ObjectParameter("CreadoPorInstitucion", typeof(bool));
    
            var contactoParameter = contacto != null ?
                new ObjectParameter("Contacto", contacto) :
                new ObjectParameter("Contacto", typeof(string));
    
            var direccionParameter = direccion != null ?
                new ObjectParameter("Direccion", direccion) :
                new ObjectParameter("Direccion", typeof(string));
    
            var correoAsociadoParameter = correoAsociado != null ?
                new ObjectParameter("CorreoAsociado", correoAsociado) :
                new ObjectParameter("CorreoAsociado", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("RegistrarProyecto", idInstitucionParameter, nombreParameter, descripcionParameter, cupoParameter, creadoPorInstitucionParameter, contactoParameter, direccionParameter, correoAsociadoParameter);
        }
    }
}
