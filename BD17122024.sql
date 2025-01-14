USE [EncuentraTCU]
GO
/****** Object:  Table [dbo].[Auditoria]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Auditoria](
	[IdAuditoria] [bigint] IDENTITY(1,1) NOT NULL,
	[Mensaje] [varchar](1000) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Origen] [varchar](100) NOT NULL,
	[IdEstudiante] [bigint] NULL,
	[IdInstitucion] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdAuditoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[IdCategoria] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Conexion]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conexion](
	[IdConexion] [bigint] IDENTITY(1,1) NOT NULL,
	[IdEstudianteSolicitante] [bigint] NOT NULL,
	[IdEstudianteReceptor] [bigint] NOT NULL,
	[FechaSolicitud] [datetime] NOT NULL,
	[Estado] [varchar](20) NOT NULL,
	[MensajeSolicitud] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdConexion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estudiante]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estudiante](
	[IdEstudiante] [bigint] IDENTITY(1,1) NOT NULL,
	[Cedula] [varchar](9) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Contrasenna] [varchar](10) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Apellidos] [varchar](100) NOT NULL,
	[Descripcion] [varchar](1000) NOT NULL,
	[Carrera] [varchar](100) NOT NULL,
	[Imagen] [varchar](255) NULL,
	[Activo] [bit] NOT NULL,
	[IdRol] [bigint] NOT NULL,
	[IdGenero] [bigint] NOT NULL,
	[IdUniversidad] [bigint] NOT NULL,
	[TieneContrasennaTemp] [bit] NOT NULL,
	[FechaVencimientoTemp] [datetime] NOT NULL,
 CONSTRAINT [PK_Estudiante] PRIMARY KEY CLUSTERED 
(
	[IdEstudiante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstudianteHabilidad]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstudianteHabilidad](
	[IdEstudiante] [bigint] NOT NULL,
	[IdHabilidad] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEstudiante] ASC,
	[IdHabilidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genero]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genero](
	[IdGenero] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK__Genero__0F8349887B3FE459] PRIMARY KEY CLUSTERED 
(
	[IdGenero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Habilidad]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Habilidad](
	[IdHabilidad] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Habilidad] PRIMARY KEY CLUSTERED 
(
	[IdHabilidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Institucion]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Institucion](
	[IdInstitucion] [bigint] IDENTITY(1,1) NOT NULL,
	[Cedula] [varchar](11) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Contrasenna] [varchar](10) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Descripcion] [varchar](1000) NOT NULL,
	[Telefono] [varchar](15) NOT NULL,
	[PaginaWeb] [varchar](100) NULL,
	[Activo] [bit] NOT NULL,
	[Imagen] [varchar](255) NULL,
	[IdRol] [bigint] NOT NULL,
	[IdTipoInstitucion] [bigint] NOT NULL,
	[TieneContrasennaTemp] [bit] NOT NULL,
	[FechaVencimientoTemp] [datetime] NOT NULL,
 CONSTRAINT [PK_Institucion] PRIMARY KEY CLUSTERED 
(
	[IdInstitucion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notificacion]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notificacion](
	[IdNotificacion] [bigint] IDENTITY(1,1) NOT NULL,
	[IdEstudiante] [bigint] NOT NULL,
	[IdInstitucion] [bigint] NOT NULL,
	[IdPostulacion] [bigint] NOT NULL,
	[IdProyecto] [bigint] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Contenido] [varchar](8000) NOT NULL,
	[TipoNotificacion] [bit] NOT NULL,
 CONSTRAINT [PK_Notifica_F6CA0A857C731474] PRIMARY KEY CLUSTERED 
(
	[IdNotificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Postulacion]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Postulacion](
	[IdPostulacion] [bigint] IDENTITY(1,1) NOT NULL,
	[IdEstudiante] [bigint] NOT NULL,
	[IdProyecto] [bigint] NOT NULL,
	[FechaPostulacion] [datetime] NOT NULL,
	[Estado] [varchar](20) NOT NULL,
	[ConfirmacionEstudiante] [bit] NOT NULL,
 CONSTRAINT [PK_Postulacion] PRIMARY KEY CLUSTERED 
(
	[IdPostulacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provincia]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provincia](
	[IdProvincia] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProvincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proyecto]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proyecto](
	[IdProyecto] [bigint] IDENTITY(1,1) NOT NULL,
	[IdInstitucion] [bigint] NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Descripcion] [varchar](8000) NOT NULL,
	[Cupo] [int] NOT NULL,
	[Estado] [varchar](20) NOT NULL,
	[CreadoPor] [varchar](20) NOT NULL,
	[Imagen] [varchar](255) NULL,
	[Contacto] [varchar](10) NULL,
	[Direccion] [varchar](1000) NULL,
	[CorreoAsociado] [varchar](50) NULL,
	[IdProvincia] [bigint] NULL,
 CONSTRAINT [PK_Proyecto] PRIMARY KEY CLUSTERED 
(
	[IdProyecto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProyectoCategoria]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProyectoCategoria](
	[IdProyecto] [bigint] NOT NULL,
	[IdCategoria] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProyecto] ASC,
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[IdRol] [bigint] IDENTITY(1,1) NOT NULL,
	[NombreRol] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Rol] PRIMARY KEY CLUSTERED 
(
	[IdRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoInstitucion]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoInstitucion](
	[IdTipoInstitucion] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
 CONSTRAINT [PK__TipoInst__AC6141D83B93789A] PRIMARY KEY CLUSTERED 
(
	[IdTipoInstitucion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Universidad]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Universidad](
	[IdUniversidad] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](255) NOT NULL,
 CONSTRAINT [PK__Universi__3AB492510971AB04] PRIMARY KEY CLUSTERED 
(
	[IdUniversidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Auditoria] ON 

INSERT [dbo].[Auditoria] ([IdAuditoria], [Mensaje], [Fecha], [Origen], [IdEstudiante], [IdInstitucion]) VALUES (1, N'El parámetro ''address'' no puede ser una cadena vacía.
Nombre del parámetro: address', CAST(N'2024-12-16T20:08:45.640' AS DateTime), N'ActualizarEstadoPostulacion', 5, NULL)
INSERT [dbo].[Auditoria] ([IdAuditoria], [Mensaje], [Fecha], [Origen], [IdEstudiante], [IdInstitucion]) VALUES (5, N'El parámetro ''address'' no puede ser una cadena vacía.
Nombre del parámetro: address', CAST(N'2024-12-16T23:38:17.233' AS DateTime), N'ActualizarEstadoPostulacion', 5, NULL)
INSERT [dbo].[Auditoria] ([IdAuditoria], [Mensaje], [Fecha], [Origen], [IdEstudiante], [IdInstitucion]) VALUES (6, N'El parámetro ''address'' no puede ser una cadena vacía.
Nombre del parámetro: address', CAST(N'2024-12-16T23:38:35.643' AS DateTime), N'ActualizarEstadoPostulacion', 5, NULL)
INSERT [dbo].[Auditoria] ([IdAuditoria], [Mensaje], [Fecha], [Origen], [IdEstudiante], [IdInstitucion]) VALUES (7, N'El parámetro ''address'' no puede ser una cadena vacía.
Nombre del parámetro: address', CAST(N'2024-12-16T23:40:38.523' AS DateTime), N'ActualizarEstadoPostulacion', 5, NULL)
INSERT [dbo].[Auditoria] ([IdAuditoria], [Mensaje], [Fecha], [Origen], [IdEstudiante], [IdInstitucion]) VALUES (8, N'El parámetro ''address'' no puede ser una cadena vacía.
Nombre del parámetro: address', CAST(N'2024-12-16T23:40:45.957' AS DateTime), N'ActualizarEstadoPostulacion', 5, NULL)
INSERT [dbo].[Auditoria] ([IdAuditoria], [Mensaje], [Fecha], [Origen], [IdEstudiante], [IdInstitucion]) VALUES (9, N'El parámetro ''address'' no puede ser una cadena vacía.
Nombre del parámetro: address', CAST(N'2024-12-16T23:40:53.687' AS DateTime), N'ActualizarEstadoPostulacion', 5, NULL)
INSERT [dbo].[Auditoria] ([IdAuditoria], [Mensaje], [Fecha], [Origen], [IdEstudiante], [IdInstitucion]) VALUES (10, N'El parámetro ''address'' no puede ser una cadena vacía.
Nombre del parámetro: address', CAST(N'2024-12-16T23:40:57.960' AS DateTime), N'ActualizarEstadoPostulacion', 5, NULL)
INSERT [dbo].[Auditoria] ([IdAuditoria], [Mensaje], [Fecha], [Origen], [IdEstudiante], [IdInstitucion]) VALUES (11, N'An error occurred while executing the command definition. See the inner exception for details.', CAST(N'2024-12-17T15:12:51.947' AS DateTime), N'EditarPerfilEstudiante', 7, NULL)
INSERT [dbo].[Auditoria] ([IdAuditoria], [Mensaje], [Fecha], [Origen], [IdEstudiante], [IdInstitucion]) VALUES (12, N'An error occurred while executing the command definition. See the inner exception for details.', CAST(N'2024-12-17T15:45:39.440' AS DateTime), N'EditarPerfilEstudiante', 5, NULL)
INSERT [dbo].[Auditoria] ([IdAuditoria], [Mensaje], [Fecha], [Origen], [IdEstudiante], [IdInstitucion]) VALUES (15, N'An error occurred while executing the command definition. See the inner exception for details.', CAST(N'2024-12-17T15:53:06.653' AS DateTime), N'EditarPerfilEstudiante', 5, 5)
INSERT [dbo].[Auditoria] ([IdAuditoria], [Mensaje], [Fecha], [Origen], [IdEstudiante], [IdInstitucion]) VALUES (16, N'An error occurred while executing the command definition. See the inner exception for details.', CAST(N'2024-12-17T15:58:49.383' AS DateTime), N'EditarPerfilEstudiante', 5, NULL)
INSERT [dbo].[Auditoria] ([IdAuditoria], [Mensaje], [Fecha], [Origen], [IdEstudiante], [IdInstitucion]) VALUES (17, N'An error occurred while executing the command definition. See the inner exception for details.', CAST(N'2024-12-17T15:59:39.290' AS DateTime), N'EditarPerfilInstitucionPOST', NULL, 5)
INSERT [dbo].[Auditoria] ([IdAuditoria], [Mensaje], [Fecha], [Origen], [IdEstudiante], [IdInstitucion]) VALUES (18, N'El parámetro ''address'' no puede ser una cadena vacía.
Nombre del parámetro: address', CAST(N'2024-12-17T16:00:36.210' AS DateTime), N'ActualizarEstadoPostulacion', 5, NULL)
INSERT [dbo].[Auditoria] ([IdAuditoria], [Mensaje], [Fecha], [Origen], [IdEstudiante], [IdInstitucion]) VALUES (19, N'El parámetro ''address'' no puede ser una cadena vacía.
Nombre del parámetro: address', CAST(N'2024-12-17T16:01:25.790' AS DateTime), N'ActualizarEstadoPostulacion', NULL, 9)
INSERT [dbo].[Auditoria] ([IdAuditoria], [Mensaje], [Fecha], [Origen], [IdEstudiante], [IdInstitucion]) VALUES (20, N'An error occurred while executing the command definition. See the inner exception for details.', CAST(N'2024-12-17T16:01:51.557' AS DateTime), N'EditarPerfilInstitucionPOST', NULL, 9)
INSERT [dbo].[Auditoria] ([IdAuditoria], [Mensaje], [Fecha], [Origen], [IdEstudiante], [IdInstitucion]) VALUES (21, N'An error occurred while executing the command definition. See the inner exception for details.', CAST(N'2024-12-17T16:10:10.630' AS DateTime), N'EditarPerfilEstudiante', 8, NULL)
INSERT [dbo].[Auditoria] ([IdAuditoria], [Mensaje], [Fecha], [Origen], [IdEstudiante], [IdInstitucion]) VALUES (22, N'An error occurred while executing the command definition. See the inner exception for details.', CAST(N'2024-12-17T16:20:54.680' AS DateTime), N'EliminarProyecto', NULL, 5)
INSERT [dbo].[Auditoria] ([IdAuditoria], [Mensaje], [Fecha], [Origen], [IdEstudiante], [IdInstitucion]) VALUES (23, N'An error occurred while executing the command definition. See the inner exception for details.', CAST(N'2024-12-17T16:20:57.653' AS DateTime), N'EliminarProyecto', NULL, 5)
INSERT [dbo].[Auditoria] ([IdAuditoria], [Mensaje], [Fecha], [Origen], [IdEstudiante], [IdInstitucion]) VALUES (24, N'An error occurred while executing the command definition. See the inner exception for details.', CAST(N'2024-12-17T16:21:10.360' AS DateTime), N'EliminarProyecto', NULL, 5)
INSERT [dbo].[Auditoria] ([IdAuditoria], [Mensaje], [Fecha], [Origen], [IdEstudiante], [IdInstitucion]) VALUES (25, N'An error occurred while executing the command definition. See the inner exception for details.', CAST(N'2024-12-17T16:22:39.237' AS DateTime), N'EliminarProyecto', NULL, 5)
SET IDENTITY_INSERT [dbo].[Auditoria] OFF
GO
SET IDENTITY_INSERT [dbo].[Categoria] ON 

INSERT [dbo].[Categoria] ([IdCategoria], [Nombre]) VALUES (1, N'Tecnología')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre]) VALUES (2, N'Salud')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre]) VALUES (3, N'Educación')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre]) VALUES (4, N'Medio Ambiente')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre]) VALUES (5, N'Deporte')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre]) VALUES (6, N'Emprendimiento')
SET IDENTITY_INSERT [dbo].[Categoria] OFF
GO
SET IDENTITY_INSERT [dbo].[Conexion] ON 

INSERT [dbo].[Conexion] ([IdConexion], [IdEstudianteSolicitante], [IdEstudianteReceptor], [FechaSolicitud], [Estado], [MensajeSolicitud]) VALUES (4, 2, 6, CAST(N'2024-12-15T23:01:30.253' AS DateTime), N'Rechazada', N'123123')
INSERT [dbo].[Conexion] ([IdConexion], [IdEstudianteSolicitante], [IdEstudianteReceptor], [FechaSolicitud], [Estado], [MensajeSolicitud]) VALUES (6, 1, 5, CAST(N'2024-12-15T23:11:29.147' AS DateTime), N'Rechazada', N'124123')
INSERT [dbo].[Conexion] ([IdConexion], [IdEstudianteSolicitante], [IdEstudianteReceptor], [FechaSolicitud], [Estado], [MensajeSolicitud]) VALUES (9, 5, 6, CAST(N'2024-12-15T23:33:42.580' AS DateTime), N'Rechazada', N'hola')
INSERT [dbo].[Conexion] ([IdConexion], [IdEstudianteSolicitante], [IdEstudianteReceptor], [FechaSolicitud], [Estado], [MensajeSolicitud]) VALUES (10, 5, 6, CAST(N'2024-12-15T23:42:42.690' AS DateTime), N'Rechazada', N'HOLA')
INSERT [dbo].[Conexion] ([IdConexion], [IdEstudianteSolicitante], [IdEstudianteReceptor], [FechaSolicitud], [Estado], [MensajeSolicitud]) VALUES (11, 5, 6, CAST(N'2024-12-15T23:45:49.437' AS DateTime), N'Rechazada', N'12123123')
INSERT [dbo].[Conexion] ([IdConexion], [IdEstudianteSolicitante], [IdEstudianteReceptor], [FechaSolicitud], [Estado], [MensajeSolicitud]) VALUES (14, 5, 2, CAST(N'2024-12-16T00:13:57.423' AS DateTime), N'Rechazada', N'qweqwasdasd')
INSERT [dbo].[Conexion] ([IdConexion], [IdEstudianteSolicitante], [IdEstudianteReceptor], [FechaSolicitud], [Estado], [MensajeSolicitud]) VALUES (15, 6, 5, CAST(N'2024-12-16T00:24:21.063' AS DateTime), N'Rechazada', N'24123')
INSERT [dbo].[Conexion] ([IdConexion], [IdEstudianteSolicitante], [IdEstudianteReceptor], [FechaSolicitud], [Estado], [MensajeSolicitud]) VALUES (16, 2, 5, CAST(N'2024-12-16T00:25:29.250' AS DateTime), N'Rechazada', N'1eq')
INSERT [dbo].[Conexion] ([IdConexion], [IdEstudianteSolicitante], [IdEstudianteReceptor], [FechaSolicitud], [Estado], [MensajeSolicitud]) VALUES (17, 5, 2, CAST(N'2024-12-16T00:30:48.220' AS DateTime), N'Rechazada', N'hola')
INSERT [dbo].[Conexion] ([IdConexion], [IdEstudianteSolicitante], [IdEstudianteReceptor], [FechaSolicitud], [Estado], [MensajeSolicitud]) VALUES (18, 2, 1, CAST(N'2024-12-16T01:02:48.637' AS DateTime), N'Pendiente', N'21123')
INSERT [dbo].[Conexion] ([IdConexion], [IdEstudianteSolicitante], [IdEstudianteReceptor], [FechaSolicitud], [Estado], [MensajeSolicitud]) VALUES (19, 5, 6, CAST(N'2024-12-16T01:06:58.543' AS DateTime), N'Rechazada', N'123123')
INSERT [dbo].[Conexion] ([IdConexion], [IdEstudianteSolicitante], [IdEstudianteReceptor], [FechaSolicitud], [Estado], [MensajeSolicitud]) VALUES (21, 7, 5, CAST(N'2024-12-17T15:18:53.960' AS DateTime), N'Rechazada', N'Hola, quieres conectar?')
INSERT [dbo].[Conexion] ([IdConexion], [IdEstudianteSolicitante], [IdEstudianteReceptor], [FechaSolicitud], [Estado], [MensajeSolicitud]) VALUES (23, 8, 6, CAST(N'2024-12-17T16:11:16.120' AS DateTime), N'Rechazada', N'hola')
SET IDENTITY_INSERT [dbo].[Conexion] OFF
GO
SET IDENTITY_INSERT [dbo].[Estudiante] ON 

INSERT [dbo].[Estudiante] ([IdEstudiante], [Cedula], [Email], [Contrasenna], [Nombre], [Apellidos], [Descripcion], [Carrera], [Imagen], [Activo], [IdRol], [IdGenero], [IdUniversidad], [TieneContrasennaTemp], [FechaVencimientoTemp]) VALUES (1, N'117310079', N'jvega10079@ufide.ac.cr', N'12345', N'JESUS DANIEL', N'VEGA MARVEZ', N'Hola! Estoy buscando lugares para hacer mi TCU!', N'Sistemas', N'https://us.123rf.com/450wm/arhimicrostok/arhimicrostok1705/arhimicrostok170504136/78019673-user-sign-icon-person-symbol-human-avatar-flat-style.jpg?ver=6', 1, 1, 1, 1, 0, CAST(N'2024-11-17T00:00:00.000' AS DateTime))
INSERT [dbo].[Estudiante] ([IdEstudiante], [Cedula], [Email], [Contrasenna], [Nombre], [Apellidos], [Descripcion], [Carrera], [Imagen], [Activo], [IdRol], [IdGenero], [IdUniversidad], [TieneContrasennaTemp], [FechaVencimientoTemp]) VALUES (2, N'117890989', N'amata90989@ufide.ac.cr', N'123', N'ARIANNA DE JESUS', N'MATA RETANA', N'Hola! Estoy buscando lugares para hacer mi TCU!', N'Sistemas', N'https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png', 1, 1, 2, 1, 0, CAST(N'2024-12-12T05:46:52.320' AS DateTime))
INSERT [dbo].[Estudiante] ([IdEstudiante], [Cedula], [Email], [Contrasenna], [Nombre], [Apellidos], [Descripcion], [Carrera], [Imagen], [Activo], [IdRol], [IdGenero], [IdUniversidad], [TieneContrasennaTemp], [FechaVencimientoTemp]) VALUES (4, N'401230456', N'ana@prueba.com', N'123', N'ANA LUCIA', N'CHAVARRIA MADRIGAL', N'Hola! Estoy buscando lugares para hacer mi TCU!', N'Ingeniería en Sistemas', NULL, 1, 1, 1, 1, 0, CAST(N'2024-11-19T13:35:09.047' AS DateTime))
INSERT [dbo].[Estudiante] ([IdEstudiante], [Cedula], [Email], [Contrasenna], [Nombre], [Apellidos], [Descripcion], [Carrera], [Imagen], [Activo], [IdRol], [IdGenero], [IdUniversidad], [TieneContrasennaTemp], [FechaVencimientoTemp]) VALUES (5, N'402620226', N'aaronvm09@gmail.com', N'123', N'Ricardo Aaron', N'Vargas Montero', N'Hola, me interesa conseguir un buen TCU', N'Ingeniería en Sistemas', N'/Imagenes/Estudiantes/5.jpg', 1, 1, 1, 1, 0, CAST(N'2024-12-12T13:54:13.443' AS DateTime))
INSERT [dbo].[Estudiante] ([IdEstudiante], [Cedula], [Email], [Contrasenna], [Nombre], [Apellidos], [Descripcion], [Carrera], [Imagen], [Activo], [IdRol], [IdGenero], [IdUniversidad], [TieneContrasennaTemp], [FechaVencimientoTemp]) VALUES (6, N'402300855', N'fiorellah0996@gmail.com', N'123456', N'Fiorella', N'Hernandez Miranda', N'Hola! Estoy buscando lugares para hacer mi TCU!', N'Sistemas', N'https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png', 1, 1, 2, 1, 0, CAST(N'2024-11-25T09:04:51.307' AS DateTime))
INSERT [dbo].[Estudiante] ([IdEstudiante], [Cedula], [Email], [Contrasenna], [Nombre], [Apellidos], [Descripcion], [Carrera], [Imagen], [Activo], [IdRol], [IdGenero], [IdUniversidad], [TieneContrasennaTemp], [FechaVencimientoTemp]) VALUES (7, N'401540673', N'123hijo36@gmail.com', N'123', N'Kattia Elena', N'Montero Cambronero', N'Hola! Estoy buscando lugares para hacer mi TCU!', N'Arquitectura', N'/Imagenes/Estudiantes/7.png', 1, 1, 1, 1, 0, CAST(N'2024-12-17T15:15:41.867' AS DateTime))
INSERT [dbo].[Estudiante] ([IdEstudiante], [Cedula], [Email], [Contrasenna], [Nombre], [Apellidos], [Descripcion], [Carrera], [Imagen], [Activo], [IdRol], [IdGenero], [IdUniversidad], [TieneContrasennaTemp], [FechaVencimientoTemp]) VALUES (8, N'401670256', N'pri@gmail.com', N'123', N'Priscilla Maria', N'Valerio Herrera', N'Hola! Estoy buscando lugares para hacer mi TCU!', N'Sistemas', N'https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png', 1, 1, 1, 1, 0, CAST(N'2024-12-17T16:09:08.837' AS DateTime))
SET IDENTITY_INSERT [dbo].[Estudiante] OFF
GO
INSERT [dbo].[EstudianteHabilidad] ([IdEstudiante], [IdHabilidad]) VALUES (1, 2)
INSERT [dbo].[EstudianteHabilidad] ([IdEstudiante], [IdHabilidad]) VALUES (1, 3)
INSERT [dbo].[EstudianteHabilidad] ([IdEstudiante], [IdHabilidad]) VALUES (1, 4)
INSERT [dbo].[EstudianteHabilidad] ([IdEstudiante], [IdHabilidad]) VALUES (5, 1)
INSERT [dbo].[EstudianteHabilidad] ([IdEstudiante], [IdHabilidad]) VALUES (5, 2)
INSERT [dbo].[EstudianteHabilidad] ([IdEstudiante], [IdHabilidad]) VALUES (5, 5)
INSERT [dbo].[EstudianteHabilidad] ([IdEstudiante], [IdHabilidad]) VALUES (7, 3)
INSERT [dbo].[EstudianteHabilidad] ([IdEstudiante], [IdHabilidad]) VALUES (7, 4)
INSERT [dbo].[EstudianteHabilidad] ([IdEstudiante], [IdHabilidad]) VALUES (7, 5)
INSERT [dbo].[EstudianteHabilidad] ([IdEstudiante], [IdHabilidad]) VALUES (7, 17)
INSERT [dbo].[EstudianteHabilidad] ([IdEstudiante], [IdHabilidad]) VALUES (8, 1)
INSERT [dbo].[EstudianteHabilidad] ([IdEstudiante], [IdHabilidad]) VALUES (8, 2)
INSERT [dbo].[EstudianteHabilidad] ([IdEstudiante], [IdHabilidad]) VALUES (8, 3)
INSERT [dbo].[EstudianteHabilidad] ([IdEstudiante], [IdHabilidad]) VALUES (8, 4)
INSERT [dbo].[EstudianteHabilidad] ([IdEstudiante], [IdHabilidad]) VALUES (8, 8)
GO
SET IDENTITY_INSERT [dbo].[Genero] ON 

INSERT [dbo].[Genero] ([IdGenero], [Nombre]) VALUES (1, N'Masculino')
INSERT [dbo].[Genero] ([IdGenero], [Nombre]) VALUES (2, N'Femenino')
INSERT [dbo].[Genero] ([IdGenero], [Nombre]) VALUES (3, N'Prefiero no decir')
SET IDENTITY_INSERT [dbo].[Genero] OFF
GO
SET IDENTITY_INSERT [dbo].[Habilidad] ON 

INSERT [dbo].[Habilidad] ([IdHabilidad], [Nombre]) VALUES (1, N'Análisis de datos')
INSERT [dbo].[Habilidad] ([IdHabilidad], [Nombre]) VALUES (2, N'Animación')
INSERT [dbo].[Habilidad] ([IdHabilidad], [Nombre]) VALUES (3, N'Artes visuales')
INSERT [dbo].[Habilidad] ([IdHabilidad], [Nombre]) VALUES (4, N'Ciberseguridad')
INSERT [dbo].[Habilidad] ([IdHabilidad], [Nombre]) VALUES (5, N'Computación en la nube')
INSERT [dbo].[Habilidad] ([IdHabilidad], [Nombre]) VALUES (6, N'Contabilidad')
INSERT [dbo].[Habilidad] ([IdHabilidad], [Nombre]) VALUES (7, N'Desarrollo de aplicaciones móviles')
INSERT [dbo].[Habilidad] ([IdHabilidad], [Nombre]) VALUES (8, N'Desarrollo web')
INSERT [dbo].[Habilidad] ([IdHabilidad], [Nombre]) VALUES (9, N'Diseño gráfico')
INSERT [dbo].[Habilidad] ([IdHabilidad], [Nombre]) VALUES (10, N'Diseño industrial')
INSERT [dbo].[Habilidad] ([IdHabilidad], [Nombre]) VALUES (11, N'Diseño UX/UI')
INSERT [dbo].[Habilidad] ([IdHabilidad], [Nombre]) VALUES (12, N'Edición de fotografía y/o video')
INSERT [dbo].[Habilidad] ([IdHabilidad], [Nombre]) VALUES (13, N'Fotografía')
INSERT [dbo].[Habilidad] ([IdHabilidad], [Nombre]) VALUES (14, N'Internet de las Cosas')
INSERT [dbo].[Habilidad] ([IdHabilidad], [Nombre]) VALUES (15, N'Investigación')
INSERT [dbo].[Habilidad] ([IdHabilidad], [Nombre]) VALUES (16, N'Marketing digital')
INSERT [dbo].[Habilidad] ([IdHabilidad], [Nombre]) VALUES (17, N'Pedagogía')
INSERT [dbo].[Habilidad] ([IdHabilidad], [Nombre]) VALUES (18, N'Programación')
INSERT [dbo].[Habilidad] ([IdHabilidad], [Nombre]) VALUES (19, N'Testing de software')
INSERT [dbo].[Habilidad] ([IdHabilidad], [Nombre]) VALUES (20, N'Visualización de datos')
SET IDENTITY_INSERT [dbo].[Habilidad] OFF
GO
SET IDENTITY_INSERT [dbo].[Institucion] ON 

INSERT [dbo].[Institucion] ([IdInstitucion], [Cedula], [Email], [Contrasenna], [Nombre], [Descripcion], [Telefono], [PaginaWeb], [Activo], [Imagen], [IdRol], [IdTipoInstitucion], [TieneContrasennaTemp], [FechaVencimientoTemp]) VALUES (4, N'3002602052', N'bomberos@gmail.com', N'DM357K3QR4', N'ASOCIACION SOLIDARISTA DE EMPLEADOS DEL BENEMERITO CUERPO DE BOMBEROS DE COSTA RICA', N'ASOCIACIONES SOLIDARISTAS', N'3414123123', N'https://www.bomberos.go.cr/', 1, N'https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png', 2, 2, 0, CAST(N'2024-11-19T15:20:05.723' AS DateTime))
INSERT [dbo].[Institucion] ([IdInstitucion], [Cedula], [Email], [Contrasenna], [Nombre], [Descripcion], [Telefono], [PaginaWeb], [Activo], [Imagen], [IdRol], [IdTipoInstitucion], [TieneContrasennaTemp], [FechaVencimientoTemp]) VALUES (5, N'3002045433', N'amata90989@ufide.ac.cr', N'123', N'ASOCIACION CRUZ ROJA COSTARRICENSE', N'ASOCIACIONES O ENTIDADES CON FINES CULTURALES, SOCIALES, RECREATIVOS, ARTESANALES', N'84622823', N'https://cruzroja.or.cr/', 1, N'/Imagenes/Instituciones/5.png', 2, 2, 0, CAST(N'2024-11-20T11:34:36.130' AS DateTime))
INSERT [dbo].[Institucion] ([IdInstitucion], [Cedula], [Email], [Contrasenna], [Nombre], [Descripcion], [Telefono], [PaginaWeb], [Activo], [Imagen], [IdRol], [IdTipoInstitucion], [TieneContrasennaTemp], [FechaVencimientoTemp]) VALUES (6, N'3008051814', N'centroeducativo@gmail.com', N'123', N'CENTRO EDUCATIVO DR. CARLOS SAENZ HERRERA', N'JUNTAS DE EDUCACION, COMEDORES ESCOLARES, PATRONATOS, COOPERATIVAS ESCOLARES, COLEGIALES, VOCACIONALES', N'123123123123112', N'prueba', 1, N'/Imagenes/Instituciones/6.png', 2, 1, 0, CAST(N'2024-12-13T10:56:18.780' AS DateTime))
INSERT [dbo].[Institucion] ([IdInstitucion], [Cedula], [Email], [Contrasenna], [Nombre], [Descripcion], [Telefono], [PaginaWeb], [Activo], [Imagen], [IdRol], [IdTipoInstitucion], [TieneContrasennaTemp], [FechaVencimientoTemp]) VALUES (8, N'3007566209', N'sutel@gmail.com', N'123', N'SUPERINTENDENCIA DE TELECOMUNICACIONES (SUTEL)', N'ACTIVIDADES DE LA ADMINISTRACION PUBLICA EN GENERAL, NO SUJETAS A IMPUESTO SOBRE LAS UTILIDADES Y SOBRE EL VALOR AGREGADO', N'1241312331', NULL, 1, N'/Imagenes/Instituciones/8.png', 2, 2, 0, CAST(N'2024-12-13T11:06:52.550' AS DateTime))
INSERT [dbo].[Institucion] ([IdInstitucion], [Cedula], [Email], [Contrasenna], [Nombre], [Descripcion], [Telefono], [PaginaWeb], [Activo], [Imagen], [IdRol], [IdTipoInstitucion], [TieneContrasennaTemp], [FechaVencimientoTemp]) VALUES (9, N'4000042139', N'ice@gmail.com', N'123', N'INSTITUTO COSTARRICENSE DE ELECTRICIDAD', N'Actividades Eléctricas', N'24412313', N'https://www.grupoice.com/', 1, N'/Imagenes/Instituciones/9.jpeg', 2, 2, 0, CAST(N'2024-12-16T13:29:49.637' AS DateTime))
INSERT [dbo].[Institucion] ([IdInstitucion], [Cedula], [Email], [Contrasenna], [Nombre], [Descripcion], [Telefono], [PaginaWeb], [Activo], [Imagen], [IdRol], [IdTipoInstitucion], [TieneContrasennaTemp], [FechaVencimientoTemp]) VALUES (10, N'3008092243', N'aaronvm09@gmail.com', N'123', N'JUNTA EDUCACION ESCUELA ARTURO QUIROS CARRANZA COYOLAR OROTINA', N'Educación, Somos una escuela', N'51123132', NULL, 1, N'/Imagenes/Instituciones/10.jpg', 2, 2, 0, CAST(N'2024-12-17T15:24:44.247' AS DateTime))
SET IDENTITY_INSERT [dbo].[Institucion] OFF
GO
SET IDENTITY_INSERT [dbo].[Notificacion] ON 

INSERT [dbo].[Notificacion] ([IdNotificacion], [IdEstudiante], [IdInstitucion], [IdPostulacion], [IdProyecto], [Fecha], [Contenido], [TipoNotificacion]) VALUES (10, 2, 5, 10035, 10024, CAST(N'2024-12-16T15:57:04.360' AS DateTime), N'Tu proyecto Trabajo Social Hogar de Ancianos. ha recibido una nueva postulación de parte de el/la estudiante ARIANNA DE JESUS. Revisa en las postulaciones de tus proyectos para gestionar la postulación.', 0)
INSERT [dbo].[Notificacion] ([IdNotificacion], [IdEstudiante], [IdInstitucion], [IdPostulacion], [IdProyecto], [Fecha], [Contenido], [TipoNotificacion]) VALUES (11, 2, 5, 10035, 10024, CAST(N'2024-12-16T15:57:55.140' AS DateTime), N'Tu postulación al proyecto Trabajo Social Hogar de Ancianos. ha sido aceptado por la institución ASOCIACION CRUZ ROJA COSTARRICENSE.', 1)
INSERT [dbo].[Notificacion] ([IdNotificacion], [IdEstudiante], [IdInstitucion], [IdPostulacion], [IdProyecto], [Fecha], [Contenido], [TipoNotificacion]) VALUES (16, 5, 5, 10039, 10024, CAST(N'2024-12-16T20:34:04.083' AS DateTime), N'Tu proyecto Trabajo Social Hogar de Ancianos. ha recibido una nueva postulación de parte de el/la estudiante Ricardo Aaron. Revisa en las postulaciones de tus proyectos para gestionar la postulación.', 0)
INSERT [dbo].[Notificacion] ([IdNotificacion], [IdEstudiante], [IdInstitucion], [IdPostulacion], [IdProyecto], [Fecha], [Contenido], [TipoNotificacion]) VALUES (17, 5, 5, 10039, 10024, CAST(N'2024-12-16T20:41:57.263' AS DateTime), N'Tu postulación al proyecto Trabajo Social Hogar de Ancianos. a cargo de la institución ASOCIACION CRUZ ROJA COSTARRICENSE ha sido rechazado.', 1)
INSERT [dbo].[Notificacion] ([IdNotificacion], [IdEstudiante], [IdInstitucion], [IdPostulacion], [IdProyecto], [Fecha], [Contenido], [TipoNotificacion]) VALUES (18, 5, 5, 10039, 10024, CAST(N'2024-12-16T20:43:14.230' AS DateTime), N'Tu postulación al proyecto Trabajo Social Hogar de Ancianos. a cargo de la institución ASOCIACION CRUZ ROJA COSTARRICENSE ha sido aceptado.', 1)
SET IDENTITY_INSERT [dbo].[Notificacion] OFF
GO
SET IDENTITY_INSERT [dbo].[Postulacion] ON 

INSERT [dbo].[Postulacion] ([IdPostulacion], [IdEstudiante], [IdProyecto], [FechaPostulacion], [Estado], [ConfirmacionEstudiante]) VALUES (23, 1, 10024, CAST(N'2024-12-15T03:06:05.570' AS DateTime), N'Aceptado', 0)
INSERT [dbo].[Postulacion] ([IdPostulacion], [IdEstudiante], [IdProyecto], [FechaPostulacion], [Estado], [ConfirmacionEstudiante]) VALUES (25, 1, 10047, CAST(N'2024-12-15T19:19:03.917' AS DateTime), N'Aceptado', 0)
INSERT [dbo].[Postulacion] ([IdPostulacion], [IdEstudiante], [IdProyecto], [FechaPostulacion], [Estado], [ConfirmacionEstudiante]) VALUES (10035, 2, 10024, CAST(N'2024-12-16T15:56:59.627' AS DateTime), N'Aceptado', 0)
INSERT [dbo].[Postulacion] ([IdPostulacion], [IdEstudiante], [IdProyecto], [FechaPostulacion], [Estado], [ConfirmacionEstudiante]) VALUES (10039, 5, 10024, CAST(N'2024-12-16T20:34:01.537' AS DateTime), N'Aceptado', 0)
SET IDENTITY_INSERT [dbo].[Postulacion] OFF
GO
SET IDENTITY_INSERT [dbo].[Provincia] ON 

INSERT [dbo].[Provincia] ([IdProvincia], [Nombre]) VALUES (1, N'San José')
INSERT [dbo].[Provincia] ([IdProvincia], [Nombre]) VALUES (2, N'Alajuela')
INSERT [dbo].[Provincia] ([IdProvincia], [Nombre]) VALUES (3, N'Cartago')
INSERT [dbo].[Provincia] ([IdProvincia], [Nombre]) VALUES (4, N'Heredia')
INSERT [dbo].[Provincia] ([IdProvincia], [Nombre]) VALUES (5, N'Guanacaste')
INSERT [dbo].[Provincia] ([IdProvincia], [Nombre]) VALUES (6, N'Puntarenas')
INSERT [dbo].[Provincia] ([IdProvincia], [Nombre]) VALUES (7, N'Limón')
SET IDENTITY_INSERT [dbo].[Provincia] OFF
GO
SET IDENTITY_INSERT [dbo].[Proyecto] ON 

INSERT [dbo].[Proyecto] ([IdProyecto], [IdInstitucion], [Nombre], [Descripcion], [Cupo], [Estado], [CreadoPor], [Imagen], [Contacto], [Direccion], [CorreoAsociado], [IdProvincia]) VALUES (10024, 5, N'Trabajo Social Hogar de Ancianos.', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', 3, N'Pendiente', N'Institucion', N'/Imagenes/Proyectos/10024.jpeg', N'11223344', N'Ejemplo dirección', N'prueba@gmail.com', 4)
INSERT [dbo].[Proyecto] ([IdProyecto], [IdInstitucion], [Nombre], [Descripcion], [Cupo], [Estado], [CreadoPor], [Imagen], [Contacto], [Direccion], [CorreoAsociado], [IdProvincia]) VALUES (10026, 6, N'PRUEBA PROYECTIO', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 4, N'Pendiente', N'Institucion', N'/Imagenes/Proyectos/10026.png', N'413123312', N'100 mts oeste de la ferretería el buen nivel', N'prueba@gmail.com', 4)
INSERT [dbo].[Proyecto] ([IdProyecto], [IdInstitucion], [Nombre], [Descripcion], [Cupo], [Estado], [CreadoPor], [Imagen], [Contacto], [Direccion], [CorreoAsociado], [IdProvincia]) VALUES (10047, 4, N'Proyecto Institución Test', N'a', 5, N'Pendiente', N'Institucion', N'/Imagenes/Proyectos/10047.jpg', N'12345678', N'a', N'a@a.com', 2)
SET IDENTITY_INSERT [dbo].[Proyecto] OFF
GO
INSERT [dbo].[ProyectoCategoria] ([IdProyecto], [IdCategoria]) VALUES (10024, 1)
INSERT [dbo].[ProyectoCategoria] ([IdProyecto], [IdCategoria]) VALUES (10024, 2)
INSERT [dbo].[ProyectoCategoria] ([IdProyecto], [IdCategoria]) VALUES (10024, 4)
INSERT [dbo].[ProyectoCategoria] ([IdProyecto], [IdCategoria]) VALUES (10026, 2)
INSERT [dbo].[ProyectoCategoria] ([IdProyecto], [IdCategoria]) VALUES (10026, 4)
INSERT [dbo].[ProyectoCategoria] ([IdProyecto], [IdCategoria]) VALUES (10026, 5)
INSERT [dbo].[ProyectoCategoria] ([IdProyecto], [IdCategoria]) VALUES (10047, 1)
INSERT [dbo].[ProyectoCategoria] ([IdProyecto], [IdCategoria]) VALUES (10047, 5)
GO
SET IDENTITY_INSERT [dbo].[Rol] ON 

INSERT [dbo].[Rol] ([IdRol], [NombreRol]) VALUES (1, N'Usuario')
INSERT [dbo].[Rol] ([IdRol], [NombreRol]) VALUES (2, N'Institucion')
SET IDENTITY_INSERT [dbo].[Rol] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoInstitucion] ON 

INSERT [dbo].[TipoInstitucion] ([IdTipoInstitucion], [Nombre]) VALUES (1, N'ONG')
INSERT [dbo].[TipoInstitucion] ([IdTipoInstitucion], [Nombre]) VALUES (2, N'Gubernamental')
INSERT [dbo].[TipoInstitucion] ([IdTipoInstitucion], [Nombre]) VALUES (3, N'Empresa')
INSERT [dbo].[TipoInstitucion] ([IdTipoInstitucion], [Nombre]) VALUES (4, N'Otro')
SET IDENTITY_INSERT [dbo].[TipoInstitucion] OFF
GO
SET IDENTITY_INSERT [dbo].[Universidad] ON 

INSERT [dbo].[Universidad] ([IdUniversidad], [Nombre]) VALUES (1, N'Fidélitas')
INSERT [dbo].[Universidad] ([IdUniversidad], [Nombre]) VALUES (2, N'TEC')
SET IDENTITY_INSERT [dbo].[Universidad] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Cedula_Estudiante]    Script Date: 17/12/2024 04:34:33 p. m. ******/
ALTER TABLE [dbo].[Estudiante] ADD  CONSTRAINT [UQ_Cedula_Estudiante] UNIQUE NONCLUSTERED 
(
	[Cedula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Email_Estudiante]    Script Date: 17/12/2024 04:34:33 p. m. ******/
ALTER TABLE [dbo].[Estudiante] ADD  CONSTRAINT [UQ_Email_Estudiante] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Cedula_Institucion]    Script Date: 17/12/2024 04:34:33 p. m. ******/
ALTER TABLE [dbo].[Institucion] ADD  CONSTRAINT [UQ_Cedula_Institucion] UNIQUE NONCLUSTERED 
(
	[Cedula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Email_Institucion]    Script Date: 17/12/2024 04:34:33 p. m. ******/
ALTER TABLE [dbo].[Institucion] ADD  CONSTRAINT [UQ_Email_Institucion] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Telefono_Institucion]    Script Date: 17/12/2024 04:34:33 p. m. ******/
ALTER TABLE [dbo].[Institucion] ADD  CONSTRAINT [UQ_Telefono_Institucion] UNIQUE NONCLUSTERED 
(
	[Telefono] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Conexion] ADD  DEFAULT (getdate()) FOR [FechaSolicitud]
GO
ALTER TABLE [dbo].[Estudiante] ADD  CONSTRAINT [DF__Estudiant__Tiene__4E88ABD4]  DEFAULT ((0)) FOR [TieneContrasennaTemp]
GO
ALTER TABLE [dbo].[Institucion] ADD  CONSTRAINT [DF__Instituci__Tiene__4F7CD00D]  DEFAULT ((0)) FOR [TieneContrasennaTemp]
GO
ALTER TABLE [dbo].[Notificacion] ADD  CONSTRAINT [DF_NotificacFecha_123EB7A3]  DEFAULT (getdate()) FOR [Fecha]
GO
ALTER TABLE [dbo].[Auditoria]  WITH CHECK ADD  CONSTRAINT [FK_Auditoria_Estudiante] FOREIGN KEY([IdEstudiante])
REFERENCES [dbo].[Estudiante] ([IdEstudiante])
GO
ALTER TABLE [dbo].[Auditoria] CHECK CONSTRAINT [FK_Auditoria_Estudiante]
GO
ALTER TABLE [dbo].[Auditoria]  WITH CHECK ADD  CONSTRAINT [FK_Auditoria_Institucion] FOREIGN KEY([IdInstitucion])
REFERENCES [dbo].[Institucion] ([IdInstitucion])
GO
ALTER TABLE [dbo].[Auditoria] CHECK CONSTRAINT [FK_Auditoria_Institucion]
GO
ALTER TABLE [dbo].[Conexion]  WITH CHECK ADD  CONSTRAINT [FK_Conexion_EstudianteReceptor] FOREIGN KEY([IdEstudianteReceptor])
REFERENCES [dbo].[Estudiante] ([IdEstudiante])
GO
ALTER TABLE [dbo].[Conexion] CHECK CONSTRAINT [FK_Conexion_EstudianteReceptor]
GO
ALTER TABLE [dbo].[Conexion]  WITH CHECK ADD  CONSTRAINT [FK_Conexion_EstudianteSolicitante] FOREIGN KEY([IdEstudianteSolicitante])
REFERENCES [dbo].[Estudiante] ([IdEstudiante])
GO
ALTER TABLE [dbo].[Conexion] CHECK CONSTRAINT [FK_Conexion_EstudianteSolicitante]
GO
ALTER TABLE [dbo].[Estudiante]  WITH CHECK ADD  CONSTRAINT [FK_Estudiante_Genero] FOREIGN KEY([IdGenero])
REFERENCES [dbo].[Genero] ([IdGenero])
GO
ALTER TABLE [dbo].[Estudiante] CHECK CONSTRAINT [FK_Estudiante_Genero]
GO
ALTER TABLE [dbo].[Estudiante]  WITH CHECK ADD  CONSTRAINT [FK_Estudiante_Rol] FOREIGN KEY([IdRol])
REFERENCES [dbo].[Rol] ([IdRol])
GO
ALTER TABLE [dbo].[Estudiante] CHECK CONSTRAINT [FK_Estudiante_Rol]
GO
ALTER TABLE [dbo].[Estudiante]  WITH CHECK ADD  CONSTRAINT [FK_Estudiante_Universidad] FOREIGN KEY([IdUniversidad])
REFERENCES [dbo].[Universidad] ([IdUniversidad])
GO
ALTER TABLE [dbo].[Estudiante] CHECK CONSTRAINT [FK_Estudiante_Universidad]
GO
ALTER TABLE [dbo].[EstudianteHabilidad]  WITH CHECK ADD FOREIGN KEY([IdEstudiante])
REFERENCES [dbo].[Estudiante] ([IdEstudiante])
GO
ALTER TABLE [dbo].[EstudianteHabilidad]  WITH CHECK ADD FOREIGN KEY([IdHabilidad])
REFERENCES [dbo].[Habilidad] ([IdHabilidad])
GO
ALTER TABLE [dbo].[Institucion]  WITH CHECK ADD  CONSTRAINT [FK_Institucion_Rol] FOREIGN KEY([IdRol])
REFERENCES [dbo].[Rol] ([IdRol])
GO
ALTER TABLE [dbo].[Institucion] CHECK CONSTRAINT [FK_Institucion_Rol]
GO
ALTER TABLE [dbo].[Institucion]  WITH CHECK ADD  CONSTRAINT [FK_Institucion_TipoInstitucion] FOREIGN KEY([IdTipoInstitucion])
REFERENCES [dbo].[TipoInstitucion] ([IdTipoInstitucion])
GO
ALTER TABLE [dbo].[Institucion] CHECK CONSTRAINT [FK_Institucion_TipoInstitucion]
GO
ALTER TABLE [dbo].[Notificacion]  WITH CHECK ADD  CONSTRAINT [FK_Notificacion_Estudiante] FOREIGN KEY([IdEstudiante])
REFERENCES [dbo].[Estudiante] ([IdEstudiante])
GO
ALTER TABLE [dbo].[Notificacion] CHECK CONSTRAINT [FK_Notificacion_Estudiante]
GO
ALTER TABLE [dbo].[Notificacion]  WITH CHECK ADD  CONSTRAINT [FK_Notificacion_Institucion] FOREIGN KEY([IdInstitucion])
REFERENCES [dbo].[Institucion] ([IdInstitucion])
GO
ALTER TABLE [dbo].[Notificacion] CHECK CONSTRAINT [FK_Notificacion_Institucion]
GO
ALTER TABLE [dbo].[Notificacion]  WITH CHECK ADD  CONSTRAINT [FK_Notificacion_Postulacion] FOREIGN KEY([IdPostulacion])
REFERENCES [dbo].[Postulacion] ([IdPostulacion])
GO
ALTER TABLE [dbo].[Notificacion] CHECK CONSTRAINT [FK_Notificacion_Postulacion]
GO
ALTER TABLE [dbo].[Notificacion]  WITH CHECK ADD  CONSTRAINT [FK_Notificacion_Proyecto] FOREIGN KEY([IdProyecto])
REFERENCES [dbo].[Proyecto] ([IdProyecto])
GO
ALTER TABLE [dbo].[Notificacion] CHECK CONSTRAINT [FK_Notificacion_Proyecto]
GO
ALTER TABLE [dbo].[Postulacion]  WITH CHECK ADD  CONSTRAINT [FK_Postulacion_Estudiante] FOREIGN KEY([IdEstudiante])
REFERENCES [dbo].[Estudiante] ([IdEstudiante])
GO
ALTER TABLE [dbo].[Postulacion] CHECK CONSTRAINT [FK_Postulacion_Estudiante]
GO
ALTER TABLE [dbo].[Postulacion]  WITH CHECK ADD  CONSTRAINT [FK_Postulacion_Proyecto] FOREIGN KEY([IdProyecto])
REFERENCES [dbo].[Proyecto] ([IdProyecto])
GO
ALTER TABLE [dbo].[Postulacion] CHECK CONSTRAINT [FK_Postulacion_Proyecto]
GO
ALTER TABLE [dbo].[Proyecto]  WITH CHECK ADD  CONSTRAINT [FK_Proyecto_Institucion] FOREIGN KEY([IdInstitucion])
REFERENCES [dbo].[Institucion] ([IdInstitucion])
GO
ALTER TABLE [dbo].[Proyecto] CHECK CONSTRAINT [FK_Proyecto_Institucion]
GO
ALTER TABLE [dbo].[Proyecto]  WITH CHECK ADD  CONSTRAINT [FK_Proyecto_Provincia] FOREIGN KEY([IdProvincia])
REFERENCES [dbo].[Provincia] ([IdProvincia])
GO
ALTER TABLE [dbo].[Proyecto] CHECK CONSTRAINT [FK_Proyecto_Provincia]
GO
ALTER TABLE [dbo].[ProyectoCategoria]  WITH CHECK ADD FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categoria] ([IdCategoria])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProyectoCategoria]  WITH CHECK ADD FOREIGN KEY([IdProyecto])
REFERENCES [dbo].[Proyecto] ([IdProyecto])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Conexion]  WITH CHECK ADD CHECK  (([Estado]='Rechazada' OR [Estado]='Aceptada' OR [Estado]='Pendiente'))
GO
ALTER TABLE [dbo].[Postulacion]  WITH CHECK ADD  CONSTRAINT [CHK_Estado_Valid] CHECK  (([Estado]='En Revisión' OR [Estado]='Pendiente' OR [Estado]='Aceptado' OR [Estado]='Rechazado'))
GO
ALTER TABLE [dbo].[Postulacion] CHECK CONSTRAINT [CHK_Estado_Valid]
GO
ALTER TABLE [dbo].[Proyecto]  WITH CHECK ADD CHECK  (([CreadoPor]='Estudiante' OR [CreadoPor]='Institucion'))
GO
ALTER TABLE [dbo].[Proyecto]  WITH CHECK ADD CHECK  (([Estado]='Rechazado' OR [Estado]='Confirmado' OR [Estado]='En revision' OR [Estado]='Pendiente'))
GO
/****** Object:  StoredProcedure [dbo].[AceptarSolicitud]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AceptarSolicitud]
    @IdConexion BIGINT
AS
BEGIN
    UPDATE Conexion
    SET Estado = 'Aceptada'
    WHERE IdConexion = @IdConexion;
END;
GO
/****** Object:  StoredProcedure [dbo].[ActualizarContrasenna]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarContrasenna]
    @Cedula VARCHAR(50),
    @TipoCedula INT,
    @ContrasennaTemp VARCHAR(80),
    @TieneContrasennaTemp BIT,
    @FechaVencimientoTemp DATETIME
AS
BEGIN
    IF @TipoCedula = 1
    BEGIN
        UPDATE Estudiante
        SET Contrasenna = @ContrasennaTemp,
            TieneContrasennaTemp = @TieneContrasennaTemp,
            FechaVencimientoTemp = @FechaVencimientoTemp
        WHERE Cedula = @Cedula;
    END
    ELSE IF @TipoCedula = 2
    BEGIN
        UPDATE Institucion
        SET Contrasenna = @ContrasennaTemp,
            TieneContrasennaTemp = @TieneContrasennaTemp,
            FechaVencimientoTemp = @FechaVencimientoTemp
        WHERE Cedula = @Cedula;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[ActualizarEstadoPostulacion]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarEstadoPostulacion]
    @IdPostulacion BIGINT,
    @NuevoEstado VARCHAR(20)
AS
BEGIN
    UPDATE dbo.Postulacion
    SET Estado = @NuevoEstado
    WHERE IdPostulacion = @IdPostulacion;
END
GO
/****** Object:  StoredProcedure [dbo].[ActualizarImagenEstudiante]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarImagenEstudiante]
    @IdEstudiante BIGINT,
    @Imagen VARCHAR(255)
AS
BEGIN
    UPDATE [dbo].[Estudiante]
        SET
        Imagen = @Imagen
        WHERE IdEstudiante = @IdEstudiante;
END
GO
/****** Object:  StoredProcedure [dbo].[ActualizarImagenInstitucion]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarImagenInstitucion]
    @IdInstitucion BIGINT,
	@Imagen VARCHAR(255)
AS
BEGIN
    UPDATE [dbo].[Institucion]
        SET
		Imagen = @Imagen
        WHERE IdInstitucion = @IdInstitucion; 
END
GO
/****** Object:  StoredProcedure [dbo].[ActualizarImagenProyecto]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ActualizarImagenProyecto]
    @IdProyecto BIGINT,
	@Imagen VARCHAR(255)
AS
BEGIN
    UPDATE [dbo].Proyecto
        SET
		Imagen = @Imagen
        WHERE IdProyecto = @IdProyecto; 
END
GO
/****** Object:  StoredProcedure [dbo].[ActualizarPerfilEstudiante]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ActualizarPerfilEstudiante]
    @IdEstudiante BIGINT,        
    @IdUniversidad BIGINT,       
    @Carrera VARCHAR(100),       
    @Email VARCHAR(50),          
    @Descripcion VARCHAR(1000),
	@Imagen VARCHAR(255)
AS
BEGIN
    UPDATE [dbo].[Estudiante]
    SET 
        IdUniversidad = @IdUniversidad,    
        Carrera = @Carrera,                
        Email = @Email,                    
        Descripcion = @Descripcion,
		Imagen = @Imagen
    WHERE IdEstudiante = @IdEstudiante  
END

GO
/****** Object:  StoredProcedure [dbo].[ActualizarPerfilInstitucion]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[ActualizarPerfilInstitucion]
    @IdInstitucion BIGINT,
	@Nombre varchar(100), 
    @Telefono VARCHAR(15),       
    @Email VARCHAR(50),          
    @Descripcion VARCHAR(1000),
	@PaginaWeb VARCHAR(100),
	@Imagen VARCHAR(255),
	@IdTipoInstitucion BIGINT
AS
BEGIN
    UPDATE [dbo].[Institucion]
        SET 
            Nombre = @Nombre,
            Telefono = @Telefono,
            Email = @Email,
            Descripcion = @Descripcion,
            PaginaWeb = @PaginaWeb,
			Imagen = @Imagen,
            IdTipoInstitucion = @IdTipoInstitucion
        WHERE IdInstitucion = @IdInstitucion; 
END

GO
/****** Object:  StoredProcedure [dbo].[ActualizarProyecto]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[ActualizarProyecto]
	@IdProyecto bigint,
    @Nombre varchar(100),
    @Descripcion varchar(1000),
    @Cupo int,
	@Imagen varchar(255),
	@Contacto varchar(10),
	@Direccion varchar(1000),
	@CorreoAsociado varchar(50),
	@IdProvincia bigint
AS
BEGIN
    UPDATE Proyecto SET
	Nombre = @Nombre,
	Descripcion = @Descripcion,
	Cupo = @Cupo,
	Imagen = @Imagen,
	Contacto = @Contacto,
	Direccion = @Direccion,
	CorreoAsociado = @CorreoAsociado,
	IdProvincia = @IdProvincia
	WHERE IdProyecto = @IdProyecto;
END
GO
/****** Object:  StoredProcedure [dbo].[CambiarContrasennaTemp]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CambiarContrasennaTemp]
    @Cedula VARCHAR(50),
    @TipoCedula INT,
    @NuevaContrasenna VARCHAR(80)
AS
BEGIN
    IF @TipoCedula = 1
    BEGIN
        UPDATE Estudiante
        SET Contrasenna = @NuevaContrasenna,
            TieneContrasennaTemp = 0,
            FechaVencimientoTemp = GETDATE()
        WHERE Cedula = @Cedula;
    END
    ELSE IF @TipoCedula = 2
    BEGIN
        UPDATE Institucion
        SET Contrasenna = @NuevaContrasenna,
            TieneContrasennaTemp = 0,
            FechaVencimientoTemp = GETDATE()
        WHERE Cedula = @Cedula;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarConexiones]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ConsultarConexiones]
    @IdEstudiante BIGINT
AS
BEGIN
    SELECT 
        C.IdConexion,
        C.IdEstudianteSolicitante,
        ES.Nombre + ' ' + ES.Apellidos AS NombreEstudianteSolicitante,
        ES.Email AS EmailEstudianteSolicitante,
        U.Nombre AS Universidad,
        C.MensajeSolicitud,
        C.FechaSolicitud,
        C.Estado
    FROM 
        Conexion C
    INNER JOIN 
        Estudiante ES ON C.IdEstudianteSolicitante = ES.IdEstudiante
    INNER JOIN 
        Universidad U ON ES.IdUniversidad = U.IdUniversidad
    WHERE 
        C.IdEstudianteReceptor = @IdEstudiante
    ORDER BY 
        C.FechaSolicitud DESC;
END;
GO
/****** Object:  StoredProcedure [dbo].[ConsultarDetallesPostulacion]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarDetallesPostulacion]
    @IdPostulacion BIGINT
AS
BEGIN
    SELECT 
        e.IdEstudiante,
        e.Imagen AS ImagenEstudiante,
        e.Nombre + ' ' + e.Apellidos AS NombreCompletoEstudiante,
        u.Nombre AS UniversidadEstudiante,
        e.Carrera AS CarreraEstudiante,
        e.Email AS CorreoEstudiante,
		e.Descripcion AS DescripcionEstudiante,
        p.FechaPostulacion
    FROM 
        dbo.Postulacion p
    INNER JOIN 
        dbo.Estudiante e ON p.IdEstudiante = e.IdEstudiante
    INNER JOIN 
        dbo.Universidad u ON e.IdUniversidad = u.IdUniversidad
    WHERE 
        p.IdPostulacion = @IdPostulacion;
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarNotificaciones]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ConsultarNotificaciones]
    @IdUsuario BIGINT,
    @TipoUsuario INT
AS
BEGIN

    IF @TipoUsuario = 1 -- Estudiante
    BEGIN
        SELECT 
            N.IdNotificacion,
			N.Fecha,
            N.Contenido,
            Pr.Nombre AS NombreProyecto,
			N.IdProyecto,
            N.IdEstudiante
        FROM 
            Notificacion N
        INNER JOIN 
            Proyecto Pr ON N.IdProyecto = Pr.IdProyecto
        WHERE
            N.IdEstudiante = @IdUsuario 
            AND N.TipoNotificacion = 1
        ORDER BY 
            N.Fecha DESC;
    END
    ELSE IF @TipoUsuario = 2 -- Institución
    BEGIN
        SELECT 
            N.IdNotificacion,
			N.Fecha,
            N.Contenido,
            Pr.Nombre AS NombreProyecto,
			N.IdProyecto,
            N.IdEstudiante
        FROM 
            Notificacion N
        INNER JOIN 
            Proyecto Pr ON N.IdProyecto = Pr.IdProyecto
        WHERE
            N.IdInstitucion = @IdUsuario
            AND N.TipoNotificacion = 0
        ORDER BY 
            N.Fecha DESC;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[ConsultarPostulaciones]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ConsultarPostulaciones]
	@IdEstudiante BIGINT
AS
BEGIN
   SELECT 
        P.IdPostulacion,
        P.IdEstudiante,
        P.IdProyecto,
        P.FechaPostulacion,
        P.Estado,
        P.ConfirmacionEstudiante,
        I.Nombre AS NombreInstitucion, 
        Pr.Nombre AS NombreProyecto 
    FROM 
        Postulacion P
    INNER JOIN 
        Proyecto Pr ON P.IdProyecto = Pr.IdProyecto 
    INNER JOIN 
        Institucion I ON Pr.IdInstitucion = I.IdInstitucion 
	Where
	P.IdEstudiante = @IdEstudiante
    ORDER BY 
        P.FechaPostulacion; 
END;
GO
/****** Object:  StoredProcedure [dbo].[ConsultarPostulacionesProyecto]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarPostulacionesProyecto]
    @IdProyecto BIGINT
AS
BEGIN
    SELECT 
        p.IdPostulacion,
        e.Nombre AS NombreEstudiante,
		pr.Nombre AS NombreProyecto,
        e.Apellidos AS ApellidosEstudiante,
		e.Carrera AS CarreraEstudiante,
        p.FechaPostulacion,
        p.Estado
    FROM 
        dbo.Postulacion p
    JOIN 
        dbo.Estudiante e ON p.IdEstudiante = e.IdEstudiante
	JOIN
		dbo.Proyecto pr ON pr.IdProyecto = p.IdProyecto
    WHERE 
        p.IdProyecto = @IdProyecto
    AND 
        p.Estado IN ('En Revisión', 'Pendiente', 'Aceptado', 'Rechazado');
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarProyectos]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarProyectos]
AS
BEGIN
    SELECT 
        P.IdProyecto,
        P.IdInstitucion,
        P.Nombre,
        P.Descripcion,
        P.Imagen,
        P.Cupo,
        I.Nombre AS NombreInstitucion
    FROM 
        Proyecto P
    INNER JOIN 
        Institucion I ON P.IdInstitucion = I.IdInstitucion
    ORDER BY 
        P.Nombre; 
END;
GO
/****** Object:  StoredProcedure [dbo].[ConsultarProyectosConPostulaciones]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarProyectosConPostulaciones]
	@IdInstitucion BIGINT
AS
BEGIN
    SELECT 
		p.IdProyecto,
        p.Imagen,
        p.Nombre,
        p.Cupo,
        COUNT(pt.IdPostulacion) AS Postulaciones
    FROM 
        dbo.Proyecto p
    LEFT JOIN 
        dbo.Postulacion pt ON p.IdProyecto = pt.IdProyecto
	JOIN 
        dbo.Institucion i ON p.IdInstitucion = i.IdInstitucion
	WHERE 
        i.IdInstitucion = @IdInstitucion
    GROUP BY 
		p.IdProyecto,
        p.Imagen, 
        p.Nombre, 
        p.Cupo;
END

GO
/****** Object:  StoredProcedure [dbo].[ConsultarProyectosEnCurso]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarProyectosEnCurso]
    @IdEstudiante BIGINT
AS
BEGIN
    SELECT 
		pr.IdProyecto,
		pr.Nombre AS NombreProyecto,
		pr.Descripcion
    FROM 
        dbo.Postulacion p
	JOIN
		dbo.Proyecto pr ON pr.IdProyecto = p.IdProyecto
    WHERE 
        p.IdEstudiante = @IdEstudiante
    AND 
        p.Estado IN ('En Revisión', 'Pendiente', 'Aceptado');
END
GO
/****** Object:  StoredProcedure [dbo].[DatosEstudiante]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DatosEstudiante]
    @IdEstudiante BIGINT
AS
BEGIN
    SELECT 
        e.Nombre,
		e.Apellidos,
        e.Email,
        e.Descripcion,
        e.Carrera,
        e.Imagen,
        r.NombreRol,         
        g.Nombre AS NombreGenero,      
        u.Nombre AS NombreUniversidad  
    FROM 
        dbo.Estudiante e
    INNER JOIN 
        dbo.Rol r ON e.IdRol = r.IdRol
    INNER JOIN 
        dbo.Genero g ON e.IdGenero = g.IdGenero
    INNER JOIN 
        dbo.Universidad u ON e.IdUniversidad = u.IdUniversidad
    WHERE 
        e.IdEstudiante = @IdEstudiante
END
GO
/****** Object:  StoredProcedure [dbo].[DatosInstitucion]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DatosInstitucion]
    @IdInstitucion BIGINT
AS
BEGIN
    SELECT 
        i.Nombre,
		i.Telefono,
        i.Email,
        i.Descripcion,
        i.PaginaWeb,
        i.Imagen,
        r.NombreRol,         
        t.IdTipoInstitucion,
		t.Nombre AS TipoInstitucion
    FROM 
        dbo.Institucion i
    INNER JOIN 
        dbo.Rol r ON i.IdRol = r.IdRol
    INNER JOIN 
        dbo.TipoInstitucion t ON i.IdTipoInstitucion = t.IdTipoInstitucion
    WHERE 
        i.IdInstitucion = @IdInstitucion
END
GO
/****** Object:  StoredProcedure [dbo].[EliminarCategoriasProyecto]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[EliminarCategoriasProyecto]
	@IdProyecto bigint
AS
BEGIN
    DELETE FROM ProyectoCategoria
	WHERE IdProyecto = @IdProyecto;
END
GO
/****** Object:  StoredProcedure [dbo].[EliminarConexion]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EliminarConexion]
    @IdConexion BIGINT
AS
BEGIN
    DELETE FROM Conexion
    WHERE IdConexion = @IdConexion;
END
GO
/****** Object:  StoredProcedure [dbo].[EliminarHabilidadesEstudiante]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarHabilidadesEstudiante]
    @IdEstudiante BIGINT
AS
BEGIN
    DELETE FROM EstudianteHabilidad
    WHERE IdEstudiante = @IdEstudiante;
END
GO
/****** Object:  StoredProcedure [dbo].[EliminarPostulacion]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[EliminarPostulacion]
    @IdPostulacion bigint
AS
BEGIN
	DELETE FROM Notificacion
	WHERE IdPostulacion = @IdPostulacion

    DELETE FROM Postulacion
	WHERE IdPostulacion = @IdPostulacion
END
GO
/****** Object:  StoredProcedure [dbo].[EliminarProyecto]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarProyecto]
    @IdProyecto bigint
AS
BEGIN
    BEGIN TRANSACTION;

    BEGIN TRY

		DELETE FROM Notificacion
		WHERE IdProyecto = @IdProyecto;

        DELETE FROM Postulacion
        WHERE IdProyecto = @IdProyecto;

        DELETE FROM Proyecto
        WHERE IdProyecto = @IdProyecto;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[IngresoSistema]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[IngresoSistema]
    @Cedula VARCHAR(50),
    @Contrasenna VARCHAR(10),
    @TipoCedula int
AS
BEGIN
    IF @TipoCedula = '2'
    BEGIN
        SELECT 
            IdInstitucion AS Id,
            Nombre,
			Cedula,
            Email,
			Imagen,
            Contrasenna,
            Activo,
            IdRol,
			TieneContrasennaTemp,
			FechaVencimientoTemp
        FROM Institucion
        WHERE Cedula = @Cedula AND Contrasenna = @Contrasenna AND Activo = 1;
    END
    ELSE IF @TipoCedula = '1'
    BEGIN
        SELECT 
            IdEstudiante AS Id,
            Nombre,
			Cedula,
            Email,
			Imagen,
            Contrasenna,
            Activo,
            IdRol,
			TieneContrasennaTemp,
			FechaVencimientoTemp
        FROM Estudiante
        WHERE Cedula = @Cedula AND Contrasenna = @Contrasenna AND Activo = 1;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertarPostulacion]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertarPostulacion]
  
    @IdEstudiante BIGINT,
    @IdProyecto BIGINT
  
AS
BEGIN
    INSERT INTO Postulacion (IdEstudiante, IdProyecto, FechaPostulacion, ConfirmacionEstudiante, Estado)
    VALUES (@IdEstudiante, @IdProyecto, GETDATE(), '0', 'Pendiente');
END;
GO
/****** Object:  StoredProcedure [dbo].[ObtenerCantidadNotificacionesInstitucion]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE PROCEDURE [dbo].[ObtenerCantidadNotificacionesInstitucion]
  @IdInstitucion Bigint
  AS
  BEGIN
	  SELECT COUNT(*) AS CantidadNotificaciones
	  FROM Notificacion
	  WHERE IdInstitucion = @IdInstitucion
	  AND TipoNotificacion = 0
  END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerCantidadPostulacionesAceptadasInstitucion]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ObtenerCantidadPostulacionesAceptadasInstitucion]
	@IdInstitucion BIGINT
AS
BEGIN
	SELECT COUNT(*) AS TotalPostulacionesPendientes
	FROM dbo.Postulacion p
	JOIN dbo.Proyecto pr ON p.IdProyecto = pr.IdProyecto
	WHERE pr.IdInstitucion = @IdInstitucion
	AND p.Estado = 'Aceptado';
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerCantidadPostulacionesPendientesInstitucion]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerCantidadPostulacionesPendientesInstitucion]
	@IdInstitucion BIGINT
AS
BEGIN
	SELECT COUNT(*) AS TotalPostulacionesPendientes
	FROM dbo.Postulacion p
	JOIN dbo.Proyecto pr ON p.IdProyecto = pr.IdProyecto
	WHERE pr.IdInstitucion = @IdInstitucion
	AND p.Estado = 'Pendiente';
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerCantidadProyectosLlenosInstitucion]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerCantidadProyectosLlenosInstitucion]
@IdInstitucion BIGINT
AS
BEGIN
	SELECT COUNT(DISTINCT pr.IdProyecto) AS TotalProyectosLlenos
	FROM dbo.Proyecto pr
	JOIN dbo.Postulacion p ON pr.IdProyecto = p.IdProyecto
	WHERE pr.IdInstitucion = @IdInstitucion
	AND p.Estado = 'Aceptado'
	GROUP BY pr.IdProyecto
	HAVING COUNT(p.IdPostulacion) = (SELECT pr2.Cupo FROM dbo.Proyecto pr2 WHERE pr2.IdProyecto = pr.IdProyecto);
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerCategoriasAleatorias]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerCategoriasAleatorias]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT TOP 4
	IdCategoria,
	Nombre
	FROM Categoria
	ORDER BY NEWID();
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerCategoriasProyecto]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ObtenerCategoriasProyecto]
    @IdProyecto BIGINT
AS
BEGIN
    SELECT DISTINCT(C.Nombre), C.IdCategoria,	PC.IdProyecto
	FROM ProyectoCategoria PC
	JOIN Categoria C ON C.IdCategoria = PC.IdCategoria
	WHERE PC.IdProyecto = @IdProyecto
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerCategoriasUsadasEnInstitucion]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[ObtenerCategoriasUsadasEnInstitucion]
    @IdInstitucion bigint
AS
BEGIN
    SELECT DISTINCT(C.Nombre) AS Nombre
	FROM Proyecto P
	JOIN ProyectoCategoria PC ON P.IdProyecto = PC.IdProyecto
	JOIN Categoria C ON C.IdCategoria = PC.IdCategoria
	WHERE P.IdInstitucion = @IdInstitucion
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerConexionesAceptadas]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerConexionesAceptadas]
    @IdEstudianteSolicitante BIGINT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        C.IdConexion, -- Agregado para incluir el IdConexion
        CASE 
            WHEN C.IdEstudianteSolicitante = @IdEstudianteSolicitante THEN EReceptor.Nombre + ' ' + EReceptor.Apellidos
            ELSE ESolicitante.Nombre + ' ' + ESolicitante.Apellidos
        END AS NombreEstudiante,
        CASE 
            WHEN C.IdEstudianteSolicitante = @IdEstudianteSolicitante THEN UReceptor.Nombre
            ELSE USolicitante.Nombre
        END AS Universidad,
        C.FechaSolicitud,
        CASE 
            WHEN C.IdEstudianteSolicitante = @IdEstudianteSolicitante THEN C.IdEstudianteReceptor
            ELSE C.IdEstudianteSolicitante
        END AS IdEstudianteOtro
    FROM 
        dbo.Conexion C
    INNER JOIN 
        dbo.Estudiante ESolicitante ON C.IdEstudianteSolicitante = ESolicitante.IdEstudiante
    INNER JOIN 
        dbo.Estudiante EReceptor ON C.IdEstudianteReceptor = EReceptor.IdEstudiante
    INNER JOIN 
        dbo.Universidad USolicitante ON ESolicitante.IdUniversidad = USolicitante.IdUniversidad
    INNER JOIN 
        dbo.Universidad UReceptor ON EReceptor.IdUniversidad = UReceptor.IdUniversidad
    WHERE 
        C.Estado = 'Aceptada' 
        AND (C.IdEstudianteSolicitante = @IdEstudianteSolicitante OR C.IdEstudianteReceptor = @IdEstudianteSolicitante);
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerConexionesBusqueda]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerConexionesBusqueda]
    @Query VARCHAR(200)
AS
BEGIN
    SELECT DISTINCT 
        e.IdEstudiante,
        e.Nombre,
        e.Apellidos,
        e.Carrera,
        e.Imagen,
        u.Nombre AS NombreUniversidad
    FROM 
        Estudiante e
    LEFT JOIN Universidad u ON e.IdUniversidad = u.IdUniversidad
    WHERE 
        CONCAT(e.Nombre, ' ', e.Apellidos) LIKE '%' + @Query + '%'
        OR u.Nombre LIKE '%' + @Query + '%'
        OR e.Carrera LIKE '%' + @Query + '%';
END;
GO
/****** Object:  StoredProcedure [dbo].[ObtenerEstudiantesAceptados]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ObtenerEstudiantesAceptados]
@IdProyecto BIGINT
AS
BEGIN
    SET NOCOUNT ON;

	SELECT e.IdEstudiante, e.Nombre AS NombreEstudiante
	FROM Postulacion p
	JOIN Estudiante e ON e.IdEstudiante = p.IdEstudiante
	WHERE p.Estado = 'Aceptado' AND p.IdProyecto = @IdProyecto
END;
GO
/****** Object:  StoredProcedure [dbo].[ObtenerEstudiantesPostulados]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerEstudiantesPostulados]
@IdProyecto BIGINT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT DISTINCT IdEstudiante
    FROM Postulacion
	Where IdProyecto = @IdProyecto
  
END;
GO
/****** Object:  StoredProcedure [dbo].[ObtenerHabilidadesEstudiante]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerHabilidadesEstudiante]
    @IdEstudiante bigint
AS
BEGIN
    SELECT DISTINCT(H.Nombre) AS Nombre
    FROM EstudianteHabilidad EH
    JOIN Habilidad H ON EH.IdHabilidad = H.IdHabilidad
    WHERE EH.IdEstudiante = @IdEstudiante
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerHabilidadesParaEditar]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerHabilidadesParaEditar]
    @IdEstudiante BIGINT
AS
BEGIN
    SELECT H.Nombre, H.IdHabilidad
    FROM EstudianteHabilidad EH
    JOIN Habilidad H ON EH.IdHabilidad = H.IdHabilidad
    WHERE EH.IdEstudiante = @IdEstudiante;
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerIdsConexiones]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerIdsConexiones]
    @IdUsuario BIGINT 
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        CASE 
            WHEN C.IdEstudianteSolicitante = @IdUsuario THEN C.IdEstudianteReceptor
            ELSE C.IdEstudianteSolicitante
        END AS IdConexion
    FROM 
        dbo.Conexion C
    WHERE 
        (C.IdEstudianteSolicitante = @IdUsuario OR C.IdEstudianteReceptor = @IdUsuario)
        AND C.Estado = 'Aceptada';
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerIdsSolicitudesEnviadas]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerIdsSolicitudesEnviadas]
    @IdUsuario BIGINT 
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        C.IdEstudianteReceptor AS IdConexion
    FROM 
        dbo.Conexion C
    WHERE 
        C.IdEstudianteSolicitante = @IdUsuario
        AND C.Estado = 'Pendiente';
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerIdsSolicitudesPendientes]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ObtenerIdsSolicitudesPendientes]
    @IdUsuario BIGINT 
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        CASE 
            WHEN C.IdEstudianteSolicitante = @IdUsuario THEN C.IdEstudianteReceptor
            ELSE C.IdEstudianteSolicitante
        END AS IdConexion
    FROM 
        dbo.Conexion C
    WHERE 
        (C.IdEstudianteSolicitante = @IdUsuario OR C.IdEstudianteReceptor = @IdUsuario)
        AND C.Estado = 'Pendiente';
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerIdsSolicitudesRecibidas]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerIdsSolicitudesRecibidas]
    @IdUsuario BIGINT 
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        C.IdEstudianteSolicitante AS IdConexion
    FROM 
        dbo.Conexion C
    WHERE 
        C.IdEstudianteReceptor = @IdUsuario
        AND C.Estado = 'Pendiente';
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerInfoParaNotiEstudiante]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerInfoParaNotiEstudiante]
    @idPostulacion BIGINT
AS
BEGIN
    SELECT 
        e.Nombre AS NombreEstudiante,
        pr.Nombre AS NombreProyecto,
        p.Estado AS estado,
        i.Nombre AS NombreInstitucion,
        e.Email AS EmailEstudiante,
        e.IdEstudiante,
        i.IdInstitucion,
        p.IdPostulacion,
        pr.IdProyecto
    FROM 
        Postulacion p
    JOIN 
        Estudiante e ON e.IdEstudiante = p.IdEstudiante
    JOIN 
        Proyecto pr ON pr.IdProyecto = p.IdProyecto
    JOIN 
        Institucion i ON i.IdInstitucion = pr.IdInstitucion
    WHERE 
        p.IdPostulacion = @idPostulacion;
END;
GO
/****** Object:  StoredProcedure [dbo].[ObtenerInfoParaNotiInstitucion]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerInfoParaNotiInstitucion]
    @idEstudiante BIGINT,
    @idProyecto BIGINT
AS
BEGIN
    SELECT 
        e.Nombre AS NombreEstudiante,
        pr.Nombre AS NombreProyecto,
        i.Nombre AS NombreInstitucion,
        i.Email AS EmailInstitucion,
        i.IdInstitucion,
        p.IdPostulacion
    FROM 
        Postulacion p
    JOIN 
        Estudiante e ON e.IdEstudiante = p.IdEstudiante
    JOIN 
        Proyecto pr ON pr.IdProyecto = p.IdProyecto
    JOIN 
        Institucion i ON i.IdInstitucion = pr.IdInstitucion
    WHERE 
        p.IdEstudiante = @idEstudiante 
        AND p.IdProyecto = @idProyecto;
END;




GO
/****** Object:  StoredProcedure [dbo].[ObtenerInstitucionesAleatorias]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ObtenerInstitucionesAleatorias]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT TOP 5 
        IdInstitucion,
        Cedula,
        Email,
        Nombre,
        Descripcion,
        Telefono,
        PaginaWeb,
        Activo,
        Imagen,
        IdRol,
        IdTipoInstitucion,
        TieneContrasennaTemp,
        FechaVencimientoTemp
    FROM [dbo].[Institucion]
    WHERE Activo = 1 
    ORDER BY NEWID(); 
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerProyectoReciente]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ObtenerProyectoReciente]
    @IdInstitucion bigint,
    @Nombre varchar(100),
    @Descripcion varchar(1000),
    @Cupo int
AS
BEGIN
    SET NOCOUNT ON;

    -- Select the most recent project that matches the provided parameters
    SELECT TOP 1 IdProyecto
    FROM dbo.Proyecto
    WHERE IdInstitucion = @IdInstitucion
        AND Nombre = @Nombre
        AND Descripcion = @Descripcion
        AND Cupo = @Cupo
        AND Estado = 'Pendiente'
    ORDER BY IdProyecto DESC;
    
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerProyectosAleatorios]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerProyectosAleatorios]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT TOP 5
        IdProyecto,
        Nombre,
        Imagen,
        Descripcion
    FROM dbo.Proyecto
	ORDER BY NEWID();
END

GO
/****** Object:  StoredProcedure [dbo].[ObtenerProyectosBusqueda]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[ObtenerProyectosBusqueda]
    @Query varchar(200)
AS
BEGIN
	SELECT DISTINCT p.*, pr.Nombre AS NombreProvincia, i.Nombre AS NombreInstitucion
	FROM Proyecto p
	JOIN Provincia pr ON p.IdProvincia = pr.IdProvincia
	JOIN Institucion i ON i.IdInstitucion = p.IdInstitucion
	LEFT JOIN ProyectoCategoria pc ON p.IdProyecto = pc.IdProyecto
	LEFT JOIN Categoria c ON pc.IdCategoria = c.IdCategoria
	WHERE p.Nombre LIKE '%' + @Query + '%'
	OR c.Nombre LIKE '%' + @Query + '%'
	OR i.Nombre LIKE '%' + @Query + '%'
	OR pr.Nombre LIKE '%' + @Query + '%';
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerProyectosEspecifico]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[ObtenerProyectosEspecifico]
    @IdProyecto bigint
AS
BEGIN
	SELECT p.IdProyecto
		,p.IdInstitucion
		,p.Nombre
		,p.Descripcion
		,p.Cupo
		,p.Estado
		,p.CreadoPor
		,p.Imagen
		,p.Contacto
		,p.Direccion
		,p.CorreoAsociado
		,pr.IdProvincia
		,pr.Nombre AS NombreProvincia
		,i.Nombre AS NombreInstitucion
	FROM Proyecto p
	JOIN Provincia pr ON p.IdProvincia = pr.IdProvincia
	JOIN Institucion i ON i.IdInstitucion = p.IdInstitucion
	WHERE IdProyecto = @IdProyecto
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerProyectosEstudianteAceptado]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ObtenerProyectosEstudianteAceptado]
    @IdEstudiante BIGINT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        p.IdProyecto,
		p.Nombre,
		p.Descripcion,
		p.Cupo,
		p.Estado,
		p.CreadoPor,
		p.Imagen,
		pr.Nombre as NombreProvincia,
		po.IdPostulacion
    FROM 
        Proyecto p
    INNER JOIN 
        Postulacion po ON p.IdProyecto = po.IdProyecto
	INNER JOIN 
        Provincia pr ON pr.IdProvincia = p.IdProvincia
    WHERE 
        po.IdEstudiante = @IdEstudiante
        AND po.Estado = 'Aceptado';
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerProyectosInstitucion]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[ObtenerProyectosInstitucion]
    @IdInstitucion bigint
AS
BEGIN
	SELECT TOP (1000) [IdProyecto]
		,p.IdInstitucion
		,p.Nombre
		,p.Descripcion
		,p.Cupo
		,p.Estado
		,p.CreadoPor
		,p.Imagen
		,pr.Nombre AS NombreProvincia
	FROM Proyecto p
	JOIN Provincia pr ON pr.IdProvincia = p.IdProvincia
	WHERE IdInstitucion = @IdInstitucion
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerSolicitudesEnviadas]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerSolicitudesEnviadas]
    @IdEstudianteSolicitante BIGINT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        C.IdConexion, -- Identificador único de la solicitud
        EReceptor.Nombre + ' ' + EReceptor.Apellidos AS NombreEstudianteReceptor,
        UReceptor.Nombre AS Universidad,
		EReceptor.IdEstudiante AS IdEstudianteReceptor,
        C.MensajeSolicitud, 
        C.FechaSolicitud,
        C.Estado 
    FROM 
        dbo.Conexion C
    INNER JOIN 
        dbo.Estudiante EReceptor ON C.IdEstudianteReceptor = EReceptor.IdEstudiante
    INNER JOIN 
        dbo.Universidad UReceptor ON EReceptor.IdUniversidad = UReceptor.IdUniversidad
    WHERE 
        C.IdEstudianteSolicitante = @IdEstudianteSolicitante 
	AND C.Estado = 'Pendiente';
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerSolicitudesPendientes]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerSolicitudesPendientes]
    @IdEstudianteReceptor BIGINT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        C.IdConexion, -- Identificador único de la solicitud
        ESolicitante.Nombre + ' ' + ESolicitante.Apellidos AS NombreEstudianteSolicitante,
		ESolicitante.IdEstudiante AS IdEstudianteSolicitante,
        USolicitante.Nombre AS Universidad, 
        C.MensajeSolicitud, 
        C.FechaSolicitud, 
        C.Estado 
    FROM 
        dbo.Conexion C
    INNER JOIN 
        dbo.Estudiante ESolicitante ON C.IdEstudianteSolicitante = ESolicitante.IdEstudiante
    INNER JOIN 
        dbo.Universidad USolicitante ON ESolicitante.IdUniversidad = USolicitante.IdUniversidad
    WHERE 
        C.Estado = 'Pendiente'
        AND C.IdEstudianteReceptor = @IdEstudianteReceptor;
END
GO
/****** Object:  StoredProcedure [dbo].[RechazarSolicitud]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RechazarSolicitud]
    @IdConexion BIGINT
AS
BEGIN
    UPDATE Conexion
    SET Estado = 'Rechazada'
    WHERE IdConexion = @IdConexion;
END;
GO
/****** Object:  StoredProcedure [dbo].[RegistrarCategoriaProyecto]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RegistrarCategoriaProyecto]
    @IdProyecto bigint,
    @IdCategoria bigint
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO dbo.ProyectoCategoria(IdProyecto, IdCategoria)
    VALUES 
    (
        @IdProyecto, 
        @IdCategoria
    );
END

GO
/****** Object:  StoredProcedure [dbo].[RegistrarEstudiante]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[RegistrarEstudiante]
	@IdGenero	bigint,
	@IdUniversidad	bigint,
	@Cedula	varchar(9),
	@Email	varchar(50),
	@Contrasenna	varchar(10),
	@Nombre	varchar(100),
	@Apellidos	varchar(100),
	@Descripcion	varchar(1000),
	@Carrera	varchar(100)
AS
BEGIN
		
		IF (EXISTS(SELECT Cedula FROM dbo.Estudiante WHERE Cedula = @Cedula) 
		    OR EXISTS(SELECT Email FROM dbo.Estudiante WHERE Email = @Email))
			RETURN 0;
		ELSE
			BEGIN
				INSERT INTO dbo.Estudiante(IdRol, IdGenero, IdUniversidad, Cedula, Email, Contrasenna, Nombre, Apellidos, Descripcion, Carrera, Activo,TieneContrasennaTemp,FechaVencimientoTemp, Imagen)
				VALUES (1, @IdGenero, @IdUniversidad, @Cedula, @Email, @Contrasenna, @Nombre, @Apellidos, @Descripcion, @Carrera, 1,0,GETDATE(), 'https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png');
			END
END

GO
/****** Object:  StoredProcedure [dbo].[RegistrarHabilidadEstudiante]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RegistrarHabilidadEstudiante]
    @IdEstudiante BIGINT,
    @IdHabilidad BIGINT
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO dbo.EstudianteHabilidad(IdEstudiante, IdHabilidad)
    VALUES 
    (
        @IdEstudiante, 
        @IdHabilidad
    );
END
GO
/****** Object:  StoredProcedure [dbo].[RegistrarInstitucion]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[RegistrarInstitucion]
	@IdTipoInstitucion	bigint,
	@Cedula	varchar(11),
	@Email	varchar(50),
	@Contrasenna	varchar(10),
	@Nombre	varchar(100),
	@Descripcion	varchar(1000),
	@Telefono	varchar(15),
	@PaginaWeb	varchar(100)
AS
BEGIN
		IF (EXISTS(SELECT Cedula FROM dbo.Institucion WHERE Cedula = @Cedula) 
		    OR EXISTS(SELECT Email FROM dbo.Institucion WHERE Email = @Email)
			OR EXISTS(SELECT Telefono FROM dbo.Institucion WHERE Telefono = @Telefono))
			RETURN 0;
		ELSE
			BEGIN
				INSERT INTO dbo.Institucion(IdRol, IdTipoInstitucion, Cedula, Email, Contrasenna, Nombre, Descripcion, Telefono, PaginaWeb, Activo, TieneContrasennaTemp,FechaVencimientoTemp, Imagen)
				VALUES (2, @IdTipoInstitucion, @Cedula, @Email, @Contrasenna, @Nombre, @Descripcion, @Telefono, @PaginaWeb, 1, 0,GETDATE(), 'https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png');
			END
END
GO
/****** Object:  StoredProcedure [dbo].[RegistrarNotificacion]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RegistrarNotificacion]
    @IdEstudiante BIGINT,
    @IdInstitucion BIGINT,
    @IdPostulacion BIGINT,
    @IdProyecto BIGINT,
    @Contenido VARCHAR(8000),
    @TipoNotificacion BIT
AS
BEGIN
    INSERT INTO [dbo].[Notificacion] (IdEstudiante, IdInstitucion, IdPostulacion, IdProyecto, Fecha, Contenido, TipoNotificacion)
    VALUES (@IdEstudiante, @IdInstitucion, @IdPostulacion, @IdProyecto, GETDATE(), @Contenido, @TipoNotificacion);
END;
GO
/****** Object:  StoredProcedure [dbo].[RegistrarProyecto]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RegistrarProyecto]
    @IdInstitucion bigint,
    @Nombre varchar(100),
    @Descripcion varchar(1000),
    @Cupo int,
    @CreadoPorInstitucion bit,
	@Contacto varchar(10),
	@Direccion varchar(1000),
	@CorreoAsociado varchar(50),
	@IdProvincia bigint
AS
BEGIN
        INSERT INTO dbo.Proyecto (IdInstitucion, Nombre, Descripcion, Cupo, Contacto, Direccion, CorreoAsociado, Estado, CreadoPor, IdProvincia)
        VALUES 
        (
            @IdInstitucion, 
            @Nombre, 
            @Descripcion, 
            @Cupo,
			@Contacto,
			@Direccion,
			@CorreoAsociado,
            'Pendiente', 
            CASE 
                WHEN @CreadoPorInstitucion = 1 THEN 'Institucion' 
                ELSE 'Estudiante' 
            END,
			@IdProvincia
        );

		RETURN SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[SolicitarConexion]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SolicitarConexion]
    @IdEstudianteSolicitante BIGINT,
    @IdEstudianteReceptor BIGINT,
    @MensajeSolicitud VARCHAR(500)
AS
BEGIN
    INSERT INTO [dbo].[Conexion] 
    ([IdEstudianteSolicitante], [IdEstudianteReceptor], [FechaSolicitud], [Estado], [MensajeSolicitud])
    VALUES 
    (@IdEstudianteSolicitante, @IdEstudianteReceptor, GETDATE(), 'Pendiente', @MensajeSolicitud);
    
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_RegistrarError]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_RegistrarError]
   @Mensaje VARCHAR(1000),
    @Fecha DATETIME,
    @Origen VARCHAR(100),
    @IdEstudiante BIGINT = NULL,
    @IdInstitucion BIGINT = NULL
AS
BEGIN
    BEGIN TRY
        INSERT INTO [dbo].[Auditoria] -- Cambia el nombre según tu tabla
            (Mensaje, Fecha, Origen, IdEstudiante, IdInstitucion)
        VALUES
            (@Mensaje, @Fecha, @Origen, @IdEstudiante, @IdInstitucion);
    END TRY
    BEGIN CATCH
        -- Manejo de errores si falla el procedimiento
        PRINT 'Error al insertar en la tabla de auditoría: ' + ERROR_MESSAGE();
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[SugerenciasConexiones]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SugerenciasConexiones]
    @Query VARCHAR(200)
AS
BEGIN
    SELECT DISTINCT 
        CONCAT(e.Nombre, ' ', e.Apellidos) AS NombreCompleto
    FROM 
        Estudiante e
    LEFT JOIN Universidad u ON e.IdUniversidad = u.IdUniversidad
    WHERE 
        CONCAT(e.Nombre, ' ', e.Apellidos) LIKE '%' + @Query + '%'
        OR e.Carrera LIKE '%' + @Query + '%'
        OR u.Nombre LIKE '%' + @Query + '%';
END;
GO
/****** Object:  StoredProcedure [dbo].[SugerenciasProyectos]    Script Date: 17/12/2024 04:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SugerenciasProyectos]
	@Query VARCHAR(200)
AS
BEGIN
	SELECT DISTINCT 
		p.Nombre
	FROM 
		Proyecto p
	LEFT JOIN ProyectoCategoria pc ON p.IdProyecto = pc.IdProyecto
	LEFT JOIN Categoria c ON pc.IdCategoria = c.IdCategoria
	LEFT JOIN Provincia pr ON p.IdProvincia = pr.IdProvincia
	LEFT JOIN Institucion i ON i.IdInstitucion = p.IdInstitucion
	WHERE 
		p.Nombre LIKE '%' + @Query + '%'
		OR c.Nombre LIKE '%' + @Query + '%'
		OR i.Nombre LIKE '%' + @Query + '%'
		OR pr.Nombre LIKE '%' + @Query + '%';
END;
GO
