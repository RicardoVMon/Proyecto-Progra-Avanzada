USE [master]
GO
/****** Object:  Database [EncuentraTCU]    Script Date: 12/15/2024 8:14:08 PM ******/
CREATE DATABASE [EncuentraTCU]
GO

USE [EncuentraTCU]
GO
/****** Object:  Table [dbo].[Auditoria]    Script Date: 12/15/2024 8:14:08 PM ******/
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
/****** Object:  Table [dbo].[Categoria]    Script Date: 12/15/2024 8:14:08 PM ******/
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
/****** Object:  Table [dbo].[Conexion]    Script Date: 12/15/2024 8:14:08 PM ******/
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
/****** Object:  Table [dbo].[Estudiante]    Script Date: 12/15/2024 8:14:08 PM ******/
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
/****** Object:  Table [dbo].[EstudianteHabilidad]    Script Date: 12/15/2024 8:14:08 PM ******/
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
/****** Object:  Table [dbo].[Genero]    Script Date: 12/15/2024 8:14:08 PM ******/
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
/****** Object:  Table [dbo].[Habilidad]    Script Date: 12/15/2024 8:14:08 PM ******/
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
/****** Object:  Table [dbo].[Institucion]    Script Date: 12/15/2024 8:14:08 PM ******/
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
/****** Object:  Table [dbo].[Notificacion]    Script Date: 12/15/2024 8:14:08 PM ******/
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
 CONSTRAINT [PK__Notifica__F6CA0A857C731474] PRIMARY KEY CLUSTERED 
(
	[IdNotificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Postulacion]    Script Date: 12/15/2024 8:14:08 PM ******/
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
/****** Object:  Table [dbo].[Provincia]    Script Date: 12/15/2024 8:14:08 PM ******/
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
/****** Object:  Table [dbo].[Proyecto]    Script Date: 12/15/2024 8:14:08 PM ******/
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
/****** Object:  Table [dbo].[ProyectoCategoria]    Script Date: 12/15/2024 8:14:08 PM ******/
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
/****** Object:  Table [dbo].[Rol]    Script Date: 12/15/2024 8:14:08 PM ******/
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
/****** Object:  Table [dbo].[TipoInstitucion]    Script Date: 12/15/2024 8:14:08 PM ******/
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
/****** Object:  Table [dbo].[Universidad]    Script Date: 12/15/2024 8:14:08 PM ******/
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
SET IDENTITY_INSERT [dbo].[Categoria] ON 
GO
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre]) VALUES (1, N'Tecnología')
GO
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre]) VALUES (2, N'Salud')
GO
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre]) VALUES (3, N'Educación')
GO
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre]) VALUES (4, N'Medio Ambiente')
GO
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre]) VALUES (5, N'Deporte')
GO
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre]) VALUES (6, N'Emprendimiento')
GO
SET IDENTITY_INSERT [dbo].[Categoria] OFF
GO
SET IDENTITY_INSERT [dbo].[Conexion] ON 
GO
INSERT [dbo].[Conexion] ([IdConexion], [IdEstudianteSolicitante], [IdEstudianteReceptor], [FechaSolicitud], [Estado], [MensajeSolicitud]) VALUES (2, 2, 5, CAST(N'2024-12-15T16:11:44.570' AS DateTime), N'Rechazada', N'porfa acpetame')
GO
SET IDENTITY_INSERT [dbo].[Conexion] OFF
GO
SET IDENTITY_INSERT [dbo].[Estudiante] ON 
GO
INSERT [dbo].[Estudiante] ([IdEstudiante], [Cedula], [Email], [Contrasenna], [Nombre], [Apellidos], [Descripcion], [Carrera], [Imagen], [Activo], [IdRol], [IdGenero], [IdUniversidad], [TieneContrasennaTemp], [FechaVencimientoTemp]) VALUES (1, N'117310079', N'jvega10079@ufide.ac.cr', N'12345', N'JESUS DANIEL', N'VEGA MARVEZ', N'Hola! Estoy buscando lugares para hacer mi TCU!', N'Sistemas', N'https://us.123rf.com/450wm/arhimicrostok/arhimicrostok1705/arhimicrostok170504136/78019673-user-sign-icon-person-symbol-human-avatar-flat-style.jpg?ver=6', 1, 1, 1, 1, 0, CAST(N'2024-11-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Estudiante] ([IdEstudiante], [Cedula], [Email], [Contrasenna], [Nombre], [Apellidos], [Descripcion], [Carrera], [Imagen], [Activo], [IdRol], [IdGenero], [IdUniversidad], [TieneContrasennaTemp], [FechaVencimientoTemp]) VALUES (2, N'117890989', N'amata90989@ufide.ac.cr', N'123', N'ARIANNA DE JESUS', N'MATA RETANA', N'Hola! Estoy buscando lugares para hacer mi TCU!', N'Sistemas', N'/Imagenes/Estudiantes/2.jpg', 1, 1, 2, 1, 0, CAST(N'2024-12-12T05:46:52.320' AS DateTime))
GO
INSERT [dbo].[Estudiante] ([IdEstudiante], [Cedula], [Email], [Contrasenna], [Nombre], [Apellidos], [Descripcion], [Carrera], [Imagen], [Activo], [IdRol], [IdGenero], [IdUniversidad], [TieneContrasennaTemp], [FechaVencimientoTemp]) VALUES (4, N'401230456', N'ana@prueba.com', N'123', N'ANA LUCIA', N'CHAVARRIA MADRIGAL', N'Hola! Estoy buscando lugares para hacer mi TCU!', N'Ingeniería en Sistemas', NULL, 1, 1, 1, 1, 0, CAST(N'2024-11-19T13:35:09.047' AS DateTime))
GO
INSERT [dbo].[Estudiante] ([IdEstudiante], [Cedula], [Email], [Contrasenna], [Nombre], [Apellidos], [Descripcion], [Carrera], [Imagen], [Activo], [IdRol], [IdGenero], [IdUniversidad], [TieneContrasennaTemp], [FechaVencimientoTemp]) VALUES (5, N'402620226', N'ricardovm2803@gmail.com', N'123', N'Ricardo Aaron', N'Vargas Montero', N'Hola! Estoy buscando lugares para hacer mi TCU!', N'Ingeniería en Sistemas', N'/Imagenes/Estudiantes/5.jpg', 1, 1, 1, 1, 0, CAST(N'2024-12-12T13:54:13.443' AS DateTime))
GO
INSERT [dbo].[Estudiante] ([IdEstudiante], [Cedula], [Email], [Contrasenna], [Nombre], [Apellidos], [Descripcion], [Carrera], [Imagen], [Activo], [IdRol], [IdGenero], [IdUniversidad], [TieneContrasennaTemp], [FechaVencimientoTemp]) VALUES (6, N'402300855', N'fiorellah0996@gmail.com', N'123456', N'Fiorella', N'Hernandez Miranda', N'Hola! Estoy buscando lugares para hacer mi TCU!', N'Sistemas', N'https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png', 1, 1, 2, 1, 0, CAST(N'2024-11-25T09:04:51.307' AS DateTime))
GO
INSERT [dbo].[Estudiante] ([IdEstudiante], [Cedula], [Email], [Contrasenna], [Nombre], [Apellidos], [Descripcion], [Carrera], [Imagen], [Activo], [IdRol], [IdGenero], [IdUniversidad], [TieneContrasennaTemp], [FechaVencimientoTemp]) VALUES (7, N'115730574', N'nela@gmail.com', N'123', N'Marianella', N'Mata Retana', N'Hola! Estoy buscando lugares para hacer mi TCU!', N'Microbiología', N'https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png', 1, 1, 2, 2, 0, CAST(N'2024-12-15T12:54:58.833' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Estudiante] OFF
GO
INSERT [dbo].[EstudianteHabilidad] ([IdEstudiante], [IdHabilidad]) VALUES (2, 6)
GO
INSERT [dbo].[EstudianteHabilidad] ([IdEstudiante], [IdHabilidad]) VALUES (5, 1)
GO
INSERT [dbo].[EstudianteHabilidad] ([IdEstudiante], [IdHabilidad]) VALUES (5, 2)
GO
INSERT [dbo].[EstudianteHabilidad] ([IdEstudiante], [IdHabilidad]) VALUES (5, 5)
GO
SET IDENTITY_INSERT [dbo].[Genero] ON 
GO
INSERT [dbo].[Genero] ([IdGenero], [Nombre]) VALUES (1, N'Masculino')
GO
INSERT [dbo].[Genero] ([IdGenero], [Nombre]) VALUES (2, N'Femenino')
GO
INSERT [dbo].[Genero] ([IdGenero], [Nombre]) VALUES (3, N'Prefiero no decir')
GO
SET IDENTITY_INSERT [dbo].[Genero] OFF
GO
SET IDENTITY_INSERT [dbo].[Habilidad] ON 
GO
INSERT [dbo].[Habilidad] ([IdHabilidad], [Nombre]) VALUES (1, N'Análisis de datos')
GO
INSERT [dbo].[Habilidad] ([IdHabilidad], [Nombre]) VALUES (2, N'Animación')
GO
INSERT [dbo].[Habilidad] ([IdHabilidad], [Nombre]) VALUES (3, N'Artes visuales')
GO
INSERT [dbo].[Habilidad] ([IdHabilidad], [Nombre]) VALUES (4, N'Ciberseguridad')
GO
INSERT [dbo].[Habilidad] ([IdHabilidad], [Nombre]) VALUES (5, N'Computación en la nube')
GO
INSERT [dbo].[Habilidad] ([IdHabilidad], [Nombre]) VALUES (6, N'Contabilidad')
GO
INSERT [dbo].[Habilidad] ([IdHabilidad], [Nombre]) VALUES (7, N'Desarrollo de aplicaciones móviles')
GO
INSERT [dbo].[Habilidad] ([IdHabilidad], [Nombre]) VALUES (8, N'Desarrollo web')
GO
INSERT [dbo].[Habilidad] ([IdHabilidad], [Nombre]) VALUES (9, N'Diseño gráfico')
GO
INSERT [dbo].[Habilidad] ([IdHabilidad], [Nombre]) VALUES (10, N'Diseño industrial')
GO
INSERT [dbo].[Habilidad] ([IdHabilidad], [Nombre]) VALUES (11, N'Diseño UX/UI')
GO
INSERT [dbo].[Habilidad] ([IdHabilidad], [Nombre]) VALUES (12, N'Edición de fotografía y/o video')
GO
INSERT [dbo].[Habilidad] ([IdHabilidad], [Nombre]) VALUES (13, N'Fotografía')
GO
INSERT [dbo].[Habilidad] ([IdHabilidad], [Nombre]) VALUES (14, N'Internet de las Cosas')
GO
INSERT [dbo].[Habilidad] ([IdHabilidad], [Nombre]) VALUES (15, N'Investigación')
GO
INSERT [dbo].[Habilidad] ([IdHabilidad], [Nombre]) VALUES (16, N'Marketing digital')
GO
INSERT [dbo].[Habilidad] ([IdHabilidad], [Nombre]) VALUES (17, N'Pedagogía')
GO
INSERT [dbo].[Habilidad] ([IdHabilidad], [Nombre]) VALUES (18, N'Programación')
GO
INSERT [dbo].[Habilidad] ([IdHabilidad], [Nombre]) VALUES (19, N'Testing de software')
GO
INSERT [dbo].[Habilidad] ([IdHabilidad], [Nombre]) VALUES (20, N'Visualización de datos')
GO
SET IDENTITY_INSERT [dbo].[Habilidad] OFF
GO
SET IDENTITY_INSERT [dbo].[Institucion] ON 
GO
INSERT [dbo].[Institucion] ([IdInstitucion], [Cedula], [Email], [Contrasenna], [Nombre], [Descripcion], [Telefono], [PaginaWeb], [Activo], [Imagen], [IdRol], [IdTipoInstitucion], [TieneContrasennaTemp], [FechaVencimientoTemp]) VALUES (4, N'3002602052', N'bomberos@gmail.com', N'DM357K3QR4', N'ASOCIACION SOLIDARISTA DE EMPLEADOS DEL BENEMERITO CUERPO DE BOMBEROS DE COSTA RICA', N'ASOCIACIONES SOLIDARISTAS', N'3414123123', N'https://www.bomberos.go.cr/', 1, N'https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png', 2, 2, 0, CAST(N'2024-11-19T15:20:05.723' AS DateTime))
GO
INSERT [dbo].[Institucion] ([IdInstitucion], [Cedula], [Email], [Contrasenna], [Nombre], [Descripcion], [Telefono], [PaginaWeb], [Activo], [Imagen], [IdRol], [IdTipoInstitucion], [TieneContrasennaTemp], [FechaVencimientoTemp]) VALUES (5, N'3002045433', N'amata90989@ufide.ac.cr', N'123', N'ASOCIACION CRUZ ROJA COSTARRICENSE', N'ASOCIACIONES O ENTIDADES CON FINES CULTURALES, SOCIALES, RECREATIVOS, ARTESANALES', N'84622823', N'https://cruzroja.or.cr/', 1, N'/Imagenes/Instituciones/5.png', 2, 1, 0, CAST(N'2024-11-20T11:34:36.130' AS DateTime))
GO
INSERT [dbo].[Institucion] ([IdInstitucion], [Cedula], [Email], [Contrasenna], [Nombre], [Descripcion], [Telefono], [PaginaWeb], [Activo], [Imagen], [IdRol], [IdTipoInstitucion], [TieneContrasennaTemp], [FechaVencimientoTemp]) VALUES (6, N'3008051814', N'centroeducativo@gmail.com', N'123', N'CENTRO EDUCATIVO DR. CARLOS SAENZ HERRERA', N'JUNTAS DE EDUCACION, COMEDORES ESCOLARES, PATRONATOS, COOPERATIVAS ESCOLARES, COLEGIALES, VOCACIONALES', N'123123123123112', N'prueba', 1, N'/Imagenes/Instituciones/6.png', 2, 1, 0, CAST(N'2024-12-13T10:56:18.780' AS DateTime))
GO
INSERT [dbo].[Institucion] ([IdInstitucion], [Cedula], [Email], [Contrasenna], [Nombre], [Descripcion], [Telefono], [PaginaWeb], [Activo], [Imagen], [IdRol], [IdTipoInstitucion], [TieneContrasennaTemp], [FechaVencimientoTemp]) VALUES (8, N'3007566209', N'sutel@gmail.com', N'123', N'SUPERINTENDENCIA DE TELECOMUNICACIONES (SUTEL)', N'ACTIVIDADES DE LA ADMINISTRACION PUBLICA EN GENERAL, NO SUJETAS A IMPUESTO SOBRE LAS UTILIDADES Y SOBRE EL VALOR AGREGADO', N'1241312331', NULL, 1, N'/Imagenes/Instituciones/8.png', 2, 2, 0, CAST(N'2024-12-13T11:06:52.550' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Institucion] OFF
GO
SET IDENTITY_INSERT [dbo].[Notificacion] ON 
GO
INSERT [dbo].[Notificacion] ([IdNotificacion], [IdEstudiante], [IdInstitucion], [IdPostulacion], [IdProyecto], [Fecha], [Contenido], [TipoNotificacion]) VALUES (5, 2, 5, 32, 10024, CAST(N'2024-12-15T05:53:01.637' AS DateTime), N'Tu proyecto Trabajo Social Hogar de Ancianos. ha recibido una nueva postulación de parte de el/la estudiante ARIANNA DE JESUS. Revisa en las postulaciones de tus proyectos para gestionar la postulación.', 0)
GO
SET IDENTITY_INSERT [dbo].[Notificacion] OFF
GO
SET IDENTITY_INSERT [dbo].[Postulacion] ON 
GO
INSERT [dbo].[Postulacion] ([IdPostulacion], [IdEstudiante], [IdProyecto], [FechaPostulacion], [Estado], [ConfirmacionEstudiante]) VALUES (2, 6, 10025, CAST(N'2024-11-26T12:29:25.383' AS DateTime), N'Pendiente', 0)
GO
INSERT [dbo].[Postulacion] ([IdPostulacion], [IdEstudiante], [IdProyecto], [FechaPostulacion], [Estado], [ConfirmacionEstudiante]) VALUES (3, 6, 10025, CAST(N'2024-11-26T12:30:14.923' AS DateTime), N'Pendiente', 0)
GO
INSERT [dbo].[Postulacion] ([IdPostulacion], [IdEstudiante], [IdProyecto], [FechaPostulacion], [Estado], [ConfirmacionEstudiante]) VALUES (4, 6, 10025, CAST(N'2024-11-26T13:09:54.160' AS DateTime), N'Pendiente', 0)
GO
INSERT [dbo].[Postulacion] ([IdPostulacion], [IdEstudiante], [IdProyecto], [FechaPostulacion], [Estado], [ConfirmacionEstudiante]) VALUES (5, 6, 10024, CAST(N'2024-11-26T13:10:00.130' AS DateTime), N'Pendiente', 0)
GO
INSERT [dbo].[Postulacion] ([IdPostulacion], [IdEstudiante], [IdProyecto], [FechaPostulacion], [Estado], [ConfirmacionEstudiante]) VALUES (6, 6, 17, CAST(N'2024-11-26T13:54:54.087' AS DateTime), N'Pendiente', 0)
GO
INSERT [dbo].[Postulacion] ([IdPostulacion], [IdEstudiante], [IdProyecto], [FechaPostulacion], [Estado], [ConfirmacionEstudiante]) VALUES (18, 5, 10025, CAST(N'2024-12-12T23:47:22.837' AS DateTime), N'Aceptado', 0)
GO
INSERT [dbo].[Postulacion] ([IdPostulacion], [IdEstudiante], [IdProyecto], [FechaPostulacion], [Estado], [ConfirmacionEstudiante]) VALUES (20, 5, 10024, CAST(N'2024-12-13T00:39:37.630' AS DateTime), N'Pendiente', 0)
GO
INSERT [dbo].[Postulacion] ([IdPostulacion], [IdEstudiante], [IdProyecto], [FechaPostulacion], [Estado], [ConfirmacionEstudiante]) VALUES (32, 2, 10024, CAST(N'2024-12-15T05:51:30.407' AS DateTime), N'Pendiente', 0)
GO
SET IDENTITY_INSERT [dbo].[Postulacion] OFF
GO
SET IDENTITY_INSERT [dbo].[Provincia] ON 
GO
INSERT [dbo].[Provincia] ([IdProvincia], [Nombre]) VALUES (1, N'San José')
GO
INSERT [dbo].[Provincia] ([IdProvincia], [Nombre]) VALUES (2, N'Alajuela')
GO
INSERT [dbo].[Provincia] ([IdProvincia], [Nombre]) VALUES (3, N'Cartago')
GO
INSERT [dbo].[Provincia] ([IdProvincia], [Nombre]) VALUES (4, N'Heredia')
GO
INSERT [dbo].[Provincia] ([IdProvincia], [Nombre]) VALUES (5, N'Guanacaste')
GO
INSERT [dbo].[Provincia] ([IdProvincia], [Nombre]) VALUES (6, N'Puntarenas')
GO
INSERT [dbo].[Provincia] ([IdProvincia], [Nombre]) VALUES (7, N'Limón')
GO
SET IDENTITY_INSERT [dbo].[Provincia] OFF
GO
SET IDENTITY_INSERT [dbo].[Proyecto] ON 
GO
INSERT [dbo].[Proyecto] ([IdProyecto], [IdInstitucion], [Nombre], [Descripcion], [Cupo], [Estado], [CreadoPor], [Imagen], [Contacto], [Direccion], [CorreoAsociado], [IdProvincia]) VALUES (17, 4, N'Proyecto Bomberos', N'Colaboración con la cruz roja', 4, N'Pendiente', N'Institucion', N'/Imagenes/Proyectos/17.jpg', NULL, NULL, NULL, 4)
GO
INSERT [dbo].[Proyecto] ([IdProyecto], [IdInstitucion], [Nombre], [Descripcion], [Cupo], [Estado], [CreadoPor], [Imagen], [Contacto], [Direccion], [CorreoAsociado], [IdProvincia]) VALUES (10024, 5, N'Trabajo Social Hogar de Ancianos.', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', 3, N'Pendiente', N'Institucion', N'/Imagenes/Proyectos/10024.jpeg', N'11223344', N'Ejemplo dirección', N'prueba@gmail.com', 4)
GO
INSERT [dbo].[Proyecto] ([IdProyecto], [IdInstitucion], [Nombre], [Descripcion], [Cupo], [Estado], [CreadoPor], [Imagen], [Contacto], [Direccion], [CorreoAsociado], [IdProvincia]) VALUES (10025, 5, N'Crear sistema de inventario de equipos', N'Lorem ipsum dolor sit amet, consectetur adipisci elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur. Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. ', 6, N'Pendiente', N'Institucion', N'/Imagenes/Proyectos/10025.jpg', N'72482158', N'Virtual', N'CRUZROJA@GMAIL.COM', 4)
GO
INSERT [dbo].[Proyecto] ([IdProyecto], [IdInstitucion], [Nombre], [Descripcion], [Cupo], [Estado], [CreadoPor], [Imagen], [Contacto], [Direccion], [CorreoAsociado], [IdProvincia]) VALUES (10026, 6, N'PRUEBA PROYECTIO', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 4, N'Pendiente', N'Institucion', N'/Imagenes/Proyectos/10026.png', N'413123312', N'100 mts oeste de la ferretería el buen nivel', N'prueba@gmail.com', 4)
GO
SET IDENTITY_INSERT [dbo].[Proyecto] OFF
GO
INSERT [dbo].[ProyectoCategoria] ([IdProyecto], [IdCategoria]) VALUES (17, 2)
GO
INSERT [dbo].[ProyectoCategoria] ([IdProyecto], [IdCategoria]) VALUES (10024, 1)
GO
INSERT [dbo].[ProyectoCategoria] ([IdProyecto], [IdCategoria]) VALUES (10024, 2)
GO
INSERT [dbo].[ProyectoCategoria] ([IdProyecto], [IdCategoria]) VALUES (10024, 4)
GO
INSERT [dbo].[ProyectoCategoria] ([IdProyecto], [IdCategoria]) VALUES (10025, 1)
GO
INSERT [dbo].[ProyectoCategoria] ([IdProyecto], [IdCategoria]) VALUES (10026, 2)
GO
INSERT [dbo].[ProyectoCategoria] ([IdProyecto], [IdCategoria]) VALUES (10026, 4)
GO
INSERT [dbo].[ProyectoCategoria] ([IdProyecto], [IdCategoria]) VALUES (10026, 5)
GO
SET IDENTITY_INSERT [dbo].[Rol] ON 
GO
INSERT [dbo].[Rol] ([IdRol], [NombreRol]) VALUES (1, N'Usuario')
GO
INSERT [dbo].[Rol] ([IdRol], [NombreRol]) VALUES (2, N'Institucion')
GO
SET IDENTITY_INSERT [dbo].[Rol] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoInstitucion] ON 
GO
INSERT [dbo].[TipoInstitucion] ([IdTipoInstitucion], [Nombre]) VALUES (1, N'ONG')
GO
INSERT [dbo].[TipoInstitucion] ([IdTipoInstitucion], [Nombre]) VALUES (2, N'Gubernamental')
GO
INSERT [dbo].[TipoInstitucion] ([IdTipoInstitucion], [Nombre]) VALUES (3, N'Empresa')
GO
INSERT [dbo].[TipoInstitucion] ([IdTipoInstitucion], [Nombre]) VALUES (4, N'Otro')
GO
SET IDENTITY_INSERT [dbo].[TipoInstitucion] OFF
GO
SET IDENTITY_INSERT [dbo].[Universidad] ON 
GO
INSERT [dbo].[Universidad] ([IdUniversidad], [Nombre]) VALUES (1, N'Fidélitas')
GO
INSERT [dbo].[Universidad] ([IdUniversidad], [Nombre]) VALUES (2, N'TEC')
GO
SET IDENTITY_INSERT [dbo].[Universidad] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Cedula_Estudiante]    Script Date: 12/15/2024 8:14:08 PM ******/
ALTER TABLE [dbo].[Estudiante] ADD  CONSTRAINT [UQ_Cedula_Estudiante] UNIQUE NONCLUSTERED 
(
	[Cedula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Email_Estudiante]    Script Date: 12/15/2024 8:14:08 PM ******/
ALTER TABLE [dbo].[Estudiante] ADD  CONSTRAINT [UQ_Email_Estudiante] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Cedula_Institucion]    Script Date: 12/15/2024 8:14:08 PM ******/
ALTER TABLE [dbo].[Institucion] ADD  CONSTRAINT [UQ_Cedula_Institucion] UNIQUE NONCLUSTERED 
(
	[Cedula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Email_Institucion]    Script Date: 12/15/2024 8:14:08 PM ******/
ALTER TABLE [dbo].[Institucion] ADD  CONSTRAINT [UQ_Email_Institucion] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Telefono_Institucion]    Script Date: 12/15/2024 8:14:08 PM ******/
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
ALTER TABLE [dbo].[Notificacion] ADD  CONSTRAINT [DF__Notificac__Fecha__123EB7A3]  DEFAULT (getdate()) FOR [Fecha]
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
/****** Object:  StoredProcedure [dbo].[AceptarSolicitud]    Script Date: 12/15/2024 8:14:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ActualizarContrasenna]    Script Date: 12/15/2024 8:14:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ActualizarImagenEstudiante]    Script Date: 12/15/2024 8:14:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ActualizarImagenInstitucion]    Script Date: 12/15/2024 8:14:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ActualizarImagenProyecto]    Script Date: 12/15/2024 8:14:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ActualizarPerfilEstudiante]    Script Date: 12/15/2024 8:14:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ActualizarPerfilInstitucion]    Script Date: 12/15/2024 8:14:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ActualizarProyecto]    Script Date: 12/15/2024 8:14:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[CambiarContrasennaTemp]    Script Date: 12/15/2024 8:14:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultarConexiones]    Script Date: 12/15/2024 8:14:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultarNotificaciones]    Script Date: 12/15/2024 8:14:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultarPostulaciones]    Script Date: 12/15/2024 8:14:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultarProyectos]    Script Date: 12/15/2024 8:14:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DatosEstudiante]    Script Date: 12/15/2024 8:14:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DatosInstitucion]    Script Date: 12/15/2024 8:14:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[EliminarCategoriasProyecto]    Script Date: 12/15/2024 8:14:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[EliminarConexion]    Script Date: 12/15/2024 8:14:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[EliminarHabilidadesEstudiante]    Script Date: 12/15/2024 8:14:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[EliminarPostulacion]    Script Date: 12/15/2024 8:14:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[EliminarPostulacion]
    @IdPostulacion bigint
AS
BEGIN
    DELETE FROM Postulacion
	WHERE IdPostulacion = @IdPostulacion
END
GO
/****** Object:  StoredProcedure [dbo].[EliminarProyecto]    Script Date: 12/15/2024 8:14:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EliminarProyecto]
    @IdProyecto bigint
AS
BEGIN
    DELETE FROM Proyecto
	WHERE IdProyecto = @IdProyecto
END
GO
/****** Object:  StoredProcedure [dbo].[IngresoSistema]    Script Date: 12/15/2024 8:14:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[InsertarPostulacion]    Script Date: 12/15/2024 8:14:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ObtenerCategoriasProyecto]    Script Date: 12/15/2024 8:14:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ObtenerCategoriasUsadasEnInstitucion]    Script Date: 12/15/2024 8:14:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ObtenerConexionesBusqueda]    Script Date: 12/15/2024 8:14:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ObtenerEstudiantesAceptados]    Script Date: 12/15/2024 8:14:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ObtenerEstudiantesPostulados]    Script Date: 12/15/2024 8:14:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ObtenerHabilidadesEstudiante]    Script Date: 12/15/2024 8:14:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ObtenerHabilidadesParaEditar]    Script Date: 12/15/2024 8:14:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ObtenerProyectoReciente]    Script Date: 12/15/2024 8:14:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ObtenerProyectosBusqueda]    Script Date: 12/15/2024 8:14:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ObtenerProyectosEspecifico]    Script Date: 12/15/2024 8:14:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ObtenerProyectosInstitucion]    Script Date: 12/15/2024 8:14:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[RechazarSolicitud]    Script Date: 12/15/2024 8:14:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[RegistrarCategoriaProyecto]    Script Date: 12/15/2024 8:14:08 PM ******/
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
    
    BEGIN TRY
        BEGIN TRANSACTION;
        INSERT INTO dbo.ProyectoCategoria(IdProyecto, IdCategoria)
        VALUES 
        (
            @IdProyecto, 
            @IdCategoria
        );
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[RegistrarEstudiante]    Script Date: 12/15/2024 8:14:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[RegistrarHabilidadEstudiante]    Script Date: 12/15/2024 8:14:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[RegistrarInstitucion]    Script Date: 12/15/2024 8:14:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[RegistrarNotificacion]    Script Date: 12/15/2024 8:14:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[RegistrarProyecto]    Script Date: 12/15/2024 8:14:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SolicitarConexion]    Script Date: 12/15/2024 8:14:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SugerenciasConexiones]    Script Date: 12/15/2024 8:14:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SugerenciasProyectos]    Script Date: 12/15/2024 8:14:08 PM ******/
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
USE [master]
GO
ALTER DATABASE [EncuentraTCU] SET  READ_WRITE 
GO
