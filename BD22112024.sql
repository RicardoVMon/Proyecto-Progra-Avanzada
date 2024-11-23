USE [EncuentraTCU]
GO
/****** Object:  Table [dbo].[Auditoria]    Script Date: 22/11/2024 03:27:09 p. m. ******/
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
/****** Object:  Table [dbo].[Categoria]    Script Date: 22/11/2024 03:27:09 p. m. ******/
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
/****** Object:  Table [dbo].[Conexion]    Script Date: 22/11/2024 03:27:09 p. m. ******/
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
/****** Object:  Table [dbo].[Estudiante]    Script Date: 22/11/2024 03:27:09 p. m. ******/
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
/****** Object:  Table [dbo].[Genero]    Script Date: 22/11/2024 03:27:09 p. m. ******/
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
/****** Object:  Table [dbo].[Institucion]    Script Date: 22/11/2024 03:27:09 p. m. ******/
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
/****** Object:  Table [dbo].[Postulacion]    Script Date: 22/11/2024 03:27:09 p. m. ******/
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
/****** Object:  Table [dbo].[Proyecto]    Script Date: 22/11/2024 03:27:09 p. m. ******/
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
 CONSTRAINT [PK_Proyecto] PRIMARY KEY CLUSTERED 
(
	[IdProyecto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProyectoCategoria]    Script Date: 22/11/2024 03:27:09 p. m. ******/
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
/****** Object:  Table [dbo].[Rol]    Script Date: 22/11/2024 03:27:09 p. m. ******/
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
/****** Object:  Table [dbo].[TipoInstitucion]    Script Date: 22/11/2024 03:27:09 p. m. ******/
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
/****** Object:  Table [dbo].[Universidad]    Script Date: 22/11/2024 03:27:09 p. m. ******/
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

INSERT [dbo].[Categoria] ([IdCategoria], [Nombre]) VALUES (1, N'Tecnología')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre]) VALUES (2, N'Salud')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre]) VALUES (3, N'Educación')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre]) VALUES (4, N'Medio Ambiente')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre]) VALUES (5, N'Deporte')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre]) VALUES (6, N'Emprendimiento')
SET IDENTITY_INSERT [dbo].[Categoria] OFF
GO
SET IDENTITY_INSERT [dbo].[Estudiante] ON 

INSERT [dbo].[Estudiante] ([IdEstudiante], [Cedula], [Email], [Contrasenna], [Nombre], [Apellidos], [Descripcion], [Carrera], [Imagen], [Activo], [IdRol], [IdGenero], [IdUniversidad], [TieneContrasennaTemp], [FechaVencimientoTemp]) VALUES (1, N'117310079', N'jvega10079@ufide.ac.cr', N'12345', N'JESUS DANIEL', N'VEGA MARVEZ', N'Hola! Estoy buscando lugares para hacer mi TCU!', N'Sistemas', N'https://us.123rf.com/450wm/arhimicrostok/arhimicrostok1705/arhimicrostok170504136/78019673-user-sign-icon-person-symbol-human-avatar-flat-style.jpg?ver=6', 1, 1, 1, 1, 0, CAST(N'2024-11-17T00:00:00.000' AS DateTime))
INSERT [dbo].[Estudiante] ([IdEstudiante], [Cedula], [Email], [Contrasenna], [Nombre], [Apellidos], [Descripcion], [Carrera], [Imagen], [Activo], [IdRol], [IdGenero], [IdUniversidad], [TieneContrasennaTemp], [FechaVencimientoTemp]) VALUES (2, N'117890989', N'encuentratcu@outlook.com', N'QNPBSI07XL', N'ARIANNA DE JESUS', N'MATA RETANA', N'Hola! Estoy buscando lugares para hacer mi TCU!', N'Sistemas', N'https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png', 1, 1, 2, 1, 0, CAST(N'2024-11-18T04:01:48.827' AS DateTime))
INSERT [dbo].[Estudiante] ([IdEstudiante], [Cedula], [Email], [Contrasenna], [Nombre], [Apellidos], [Descripcion], [Carrera], [Imagen], [Activo], [IdRol], [IdGenero], [IdUniversidad], [TieneContrasennaTemp], [FechaVencimientoTemp]) VALUES (4, N'401230456', N'ana@prueba.com', N'123', N'ANA LUCIA', N'CHAVARRIA MADRIGAL', N'Hola! Estoy buscando lugares para hacer mi TCU!', N'Ingeniería en Sistemas', NULL, 1, 1, 1, 1, 0, CAST(N'2024-11-19T13:35:09.047' AS DateTime))
INSERT [dbo].[Estudiante] ([IdEstudiante], [Cedula], [Email], [Contrasenna], [Nombre], [Apellidos], [Descripcion], [Carrera], [Imagen], [Activo], [IdRol], [IdGenero], [IdUniversidad], [TieneContrasennaTemp], [FechaVencimientoTemp]) VALUES (5, N'402620226', N'ricardovm2803@gmail.com', N'123', N'Ricardo Aaron', N'Vargas Montero', N'Hola! Estoy buscando lugares para hacer mi TCU!', N'Ingeniería en Sistemas', N'https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png', 1, 1, 1, 1, 0, CAST(N'2024-11-19T21:52:22.743' AS DateTime))
SET IDENTITY_INSERT [dbo].[Estudiante] OFF
GO
SET IDENTITY_INSERT [dbo].[Genero] ON 

INSERT [dbo].[Genero] ([IdGenero], [Nombre]) VALUES (1, N'Masculino')
INSERT [dbo].[Genero] ([IdGenero], [Nombre]) VALUES (2, N'Femenino')
INSERT [dbo].[Genero] ([IdGenero], [Nombre]) VALUES (3, N'Prefiero no decir')
SET IDENTITY_INSERT [dbo].[Genero] OFF
GO
SET IDENTITY_INSERT [dbo].[Institucion] ON 

INSERT [dbo].[Institucion] ([IdInstitucion], [Cedula], [Email], [Contrasenna], [Nombre], [Descripcion], [Telefono], [PaginaWeb], [Activo], [Imagen], [IdRol], [IdTipoInstitucion], [TieneContrasennaTemp], [FechaVencimientoTemp]) VALUES (4, N'3002602052', N'bomberos@gmail.com', N'DM357K3QR4', N'ASOCIACION SOLIDARISTA DE EMPLEADOS DEL BENEMERITO CUERPO DE BOMBEROS DE COSTA RICA', N'ASOCIACIONES SOLIDARISTAS', N'3414123123', N'https://www.bomberos.go.cr/', 1, N'https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png', 2, 2, 0, CAST(N'2024-11-19T15:20:05.723' AS DateTime))
INSERT [dbo].[Institucion] ([IdInstitucion], [Cedula], [Email], [Contrasenna], [Nombre], [Descripcion], [Telefono], [PaginaWeb], [Activo], [Imagen], [IdRol], [IdTipoInstitucion], [TieneContrasennaTemp], [FechaVencimientoTemp]) VALUES (5, N'3002045433', N'cruzroja@gmail.com', N'123', N'ASOCIACION CRUZ ROJA COSTARRICENSE', N'ASOCIACIONES O ENTIDADES CON FINES CULTURALES, SOCIALES, RECREATIVOS, ARTESANALES', N'84622823', N'https://cruzroja.or.cr/', 1, N'/Imagenes/Instituciones/5.jpg', 2, 1, 0, CAST(N'2024-11-20T11:34:36.130' AS DateTime))
SET IDENTITY_INSERT [dbo].[Institucion] OFF
GO
SET IDENTITY_INSERT [dbo].[Proyecto] ON 

INSERT [dbo].[Proyecto] ([IdProyecto], [IdInstitucion], [Nombre], [Descripcion], [Cupo], [Estado], [CreadoPor]) VALUES (1, 5, N'Taller de Programación Web', N'Aprender los fundamentos del desarrollo web, incluyendo HTML, CSS y JavaScript.', 4, N'Pendiente', N'Institucion')
INSERT [dbo].[Proyecto] ([IdProyecto], [IdInstitucion], [Nombre], [Descripcion], [Cupo], [Estado], [CreadoPor]) VALUES (2, 5, N'Capacitación en Soporte Técnico', N'Formación práctica en diagnóstico y reparación de equipos de cómputo.', 4, N'Pendiente', N'Institucion')
INSERT [dbo].[Proyecto] ([IdProyecto], [IdInstitucion], [Nombre], [Descripcion], [Cupo], [Estado], [CreadoPor]) VALUES (3, 5, N'Jornadas de Salud Comunitaria', N'Organización de campañas de chequeo médico gratuito para comunidades rurales.', 4, N'Pendiente', N'Institucion')
INSERT [dbo].[Proyecto] ([IdProyecto], [IdInstitucion], [Nombre], [Descripcion], [Cupo], [Estado], [CreadoPor]) VALUES (4, 5, N'Programa de Educación Financiera', N'Clases para enseñar a las personas a gestionar sus finanzas personales.', 4, N'Pendiente', N'Institucion')
SET IDENTITY_INSERT [dbo].[Proyecto] OFF
GO
INSERT [dbo].[ProyectoCategoria] ([IdProyecto], [IdCategoria]) VALUES (1, 1)
INSERT [dbo].[ProyectoCategoria] ([IdProyecto], [IdCategoria]) VALUES (1, 3)
INSERT [dbo].[ProyectoCategoria] ([IdProyecto], [IdCategoria]) VALUES (2, 1)
INSERT [dbo].[ProyectoCategoria] ([IdProyecto], [IdCategoria]) VALUES (3, 2)
INSERT [dbo].[ProyectoCategoria] ([IdProyecto], [IdCategoria]) VALUES (4, 3)
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
/****** Object:  Index [UQ_Cedula_Estudiante]    Script Date: 22/11/2024 03:27:09 p. m. ******/
ALTER TABLE [dbo].[Estudiante] ADD  CONSTRAINT [UQ_Cedula_Estudiante] UNIQUE NONCLUSTERED 
(
	[Cedula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Email_Estudiante]    Script Date: 22/11/2024 03:27:09 p. m. ******/
ALTER TABLE [dbo].[Estudiante] ADD  CONSTRAINT [UQ_Email_Estudiante] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Cedula_Institucion]    Script Date: 22/11/2024 03:27:09 p. m. ******/
ALTER TABLE [dbo].[Institucion] ADD  CONSTRAINT [UQ_Cedula_Institucion] UNIQUE NONCLUSTERED 
(
	[Cedula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Email_Institucion]    Script Date: 22/11/2024 03:27:09 p. m. ******/
ALTER TABLE [dbo].[Institucion] ADD  CONSTRAINT [UQ_Email_Institucion] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Telefono_Institucion]    Script Date: 22/11/2024 03:27:09 p. m. ******/
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
ALTER TABLE [dbo].[Postulacion]  WITH CHECK ADD CHECK  (([Estado]='Rechazado' OR [Estado]='Aceptado'))
GO
ALTER TABLE [dbo].[Proyecto]  WITH CHECK ADD CHECK  (([CreadoPor]='Estudiante' OR [CreadoPor]='Institucion'))
GO
ALTER TABLE [dbo].[Proyecto]  WITH CHECK ADD CHECK  (([Estado]='Rechazado' OR [Estado]='Confirmado' OR [Estado]='En revision' OR [Estado]='Pendiente'))
GO
/****** Object:  StoredProcedure [dbo].[ActualizarContrasenna]    Script Date: 22/11/2024 03:27:09 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[ActualizarImagenInstitucion]    Script Date: 22/11/2024 03:27:09 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[ActualizarPerfilEstudiante]    Script Date: 22/11/2024 03:27:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ActualizarPerfilEstudiante]
    @IdEstudiante BIGINT,        
    @IdUniversidad BIGINT,       
    @Carrera VARCHAR(100),       
    @Email VARCHAR(50),          
    @Descripcion VARCHAR(1000) 
AS
BEGIN
    UPDATE [dbo].[Estudiante]
    SET 
        IdUniversidad = @IdUniversidad,    
        Carrera = @Carrera,                
        Email = @Email,                    
        Descripcion = @Descripcion        
    WHERE IdEstudiante = @IdEstudiante  
END

GO
/****** Object:  StoredProcedure [dbo].[ActualizarPerfilInstitucion]    Script Date: 22/11/2024 03:27:09 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[DatosEstudiante]    Script Date: 22/11/2024 03:27:09 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[DatosInstitucion]    Script Date: 22/11/2024 03:27:09 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[IngresoSistema]    Script Date: 22/11/2024 03:27:09 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[ObtenerCategoriasProyecto]    Script Date: 22/11/2024 03:27:09 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[RegistrarEstudiante]    Script Date: 22/11/2024 03:27:09 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[RegistrarInstitucion]    Script Date: 22/11/2024 03:27:09 p. m. ******/
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
