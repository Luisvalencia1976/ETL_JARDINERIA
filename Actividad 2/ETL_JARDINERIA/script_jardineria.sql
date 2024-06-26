USE [jardineria]
GO
/****** Object:  Table [dbo].[Categoria_producto]    Script Date: 12/05/2024 9:04:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria_producto](
	[Id_Categoria] [int] IDENTITY(1,1) NOT NULL,
	[Desc_Categoria] [varchar](50) NOT NULL,
	[descripcion_texto] [text] NULL,
	[descripcion_html] [text] NULL,
	[imagen] [varchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 12/05/2024 9:04:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[ID_cliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre_cliente] [varchar](50) NOT NULL,
	[nombre_contacto] [varchar](30) NULL,
	[apellido_contacto] [varchar](30) NULL,
	[telefono] [varchar](15) NOT NULL,
	[fax] [varchar](15) NOT NULL,
	[linea_direccion1] [varchar](50) NOT NULL,
	[linea_direccion2] [varchar](50) NULL,
	[ciudad] [varchar](50) NOT NULL,
	[region] [varchar](50) NULL,
	[pais] [varchar](50) NULL,
	[codigo_postal] [varchar](10) NULL,
	[ID_empleado_rep_ventas] [int] NULL,
	[limite_credito] [numeric](15, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalle_pedido]    Script Date: 12/05/2024 9:04:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle_pedido](
	[ID_pedido] [int] NOT NULL,
	[ID_producto] [varchar](15) NOT NULL,
	[cantidad] [int] NOT NULL,
	[precio_unidad] [numeric](15, 2) NOT NULL,
	[numero_linea] [smallint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_pedido] ASC,
	[ID_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[empleado]    Script Date: 12/05/2024 9:04:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empleado](
	[ID_empleado] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido1] [varchar](50) NOT NULL,
	[apellido2] [varchar](50) NULL,
	[extension] [varchar](10) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[ID_oficina] [int] NOT NULL,
	[ID_jefe] [int] NULL,
	[puesto] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[oficina]    Script Date: 12/05/2024 9:04:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[oficina](
	[ID_oficina] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](10) NOT NULL,
	[ciudad] [varchar](30) NOT NULL,
	[pais] [varchar](50) NOT NULL,
	[region] [varchar](50) NULL,
	[codigo_postal] [varchar](10) NOT NULL,
	[telefono] [varchar](20) NOT NULL,
	[linea_direccion1] [varchar](50) NOT NULL,
	[linea_direccion2] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_oficina] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pago]    Script Date: 12/05/2024 9:04:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pago](
	[ID_cliente] [int] NOT NULL,
	[forma_pago] [varchar](40) NOT NULL,
	[id_transaccion] [varchar](50) NOT NULL,
	[fecha_pago] [date] NOT NULL,
	[total] [numeric](15, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_cliente] ASC,
	[id_transaccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pedido]    Script Date: 12/05/2024 9:04:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pedido](
	[ID_pedido] [int] IDENTITY(1,1) NOT NULL,
	[fecha_pedido] [date] NOT NULL,
	[fecha_esperada] [date] NOT NULL,
	[fecha_entrega] [date] NULL,
	[estado] [varchar](15) NOT NULL,
	[comentarios] [text] NULL,
	[ID_cliente] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_pedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[producto]    Script Date: 12/05/2024 9:04:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[producto](
	[ID_producto] [varchar](15) NOT NULL,
	[nombre] [varchar](70) NOT NULL,
	[Categoria] [int] NOT NULL,
	[dimensiones] [varchar](25) NULL,
	[proveedor] [varchar](50) NULL,
	[descripcion] [text] NULL,
	[cantidad_en_stock] [smallint] NOT NULL,
	[precio_venta] [numeric](15, 2) NOT NULL,
	[precio_proveedor] [numeric](15, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categoria_producto] ON 

INSERT [dbo].[Categoria_producto] ([Id_Categoria], [Desc_Categoria], [descripcion_texto], [descripcion_html], [imagen]) VALUES (1, N'Herbaceas', N'Plantas para jardin decorativas', NULL, NULL)
INSERT [dbo].[Categoria_producto] ([Id_Categoria], [Desc_Categoria], [descripcion_texto], [descripcion_html], [imagen]) VALUES (2, N'Herramientas', N'Herramientas para todo tipo de acciÃ³n', NULL, NULL)
INSERT [dbo].[Categoria_producto] ([Id_Categoria], [Desc_Categoria], [descripcion_texto], [descripcion_html], [imagen]) VALUES (3, N'AromÃ¡ticas', N'Plantas aromÃ¡ticas', NULL, NULL)
INSERT [dbo].[Categoria_producto] ([Id_Categoria], [Desc_Categoria], [descripcion_texto], [descripcion_html], [imagen]) VALUES (4, N'Frutales', N'Ãrboles pequeÃ±os de producciÃ³n frutal', NULL, NULL)
INSERT [dbo].[Categoria_producto] ([Id_Categoria], [Desc_Categoria], [descripcion_texto], [descripcion_html], [imagen]) VALUES (5, N'Ornamentales', N'Plantas vistosas para la decoraciÃ³n del jardÃ­n', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Categoria_producto] OFF
GO
SET IDENTITY_INSERT [dbo].[cliente] ON 

INSERT [dbo].[cliente] ([ID_cliente], [nombre_cliente], [nombre_contacto], [apellido_contacto], [telefono], [fax], [linea_direccion1], [linea_direccion2], [ciudad], [region], [pais], [codigo_postal], [ID_empleado_rep_ventas], [limite_credito]) VALUES (1, N'GoldFish Garden', N'Daniel G', N'GoldFish', N'5556901745', N'5556901746', N'False Street 52 2 A', NULL, N'San Francisco', NULL, N'USA', N'24006', 19, CAST(3000.00 AS Numeric(15, 2)))
INSERT [dbo].[cliente] ([ID_cliente], [nombre_cliente], [nombre_contacto], [apellido_contacto], [telefono], [fax], [linea_direccion1], [linea_direccion2], [ciudad], [region], [pais], [codigo_postal], [ID_empleado_rep_ventas], [limite_credito]) VALUES (2, N'Gardening Associates', N'Anne', N'Wright', N'5557410345', N'5557410346', N'Wall-e Avenue', NULL, N'Miami', N'Miami', N'USA', N'24010', 19, CAST(6000.00 AS Numeric(15, 2)))
INSERT [dbo].[cliente] ([ID_cliente], [nombre_cliente], [nombre_contacto], [apellido_contacto], [telefono], [fax], [linea_direccion1], [linea_direccion2], [ciudad], [region], [pais], [codigo_postal], [ID_empleado_rep_ventas], [limite_credito]) VALUES (3, N'Gerudo Valley', N'Link', N'Flaute', N'5552323129', N'5552323128', N'Oaks Avenue nÂº22', NULL, N'New York', NULL, N'USA', N'85495', 22, CAST(12000.00 AS Numeric(15, 2)))
INSERT [dbo].[cliente] ([ID_cliente], [nombre_cliente], [nombre_contacto], [apellido_contacto], [telefono], [fax], [linea_direccion1], [linea_direccion2], [ciudad], [region], [pais], [codigo_postal], [ID_empleado_rep_ventas], [limite_credito]) VALUES (4, N'Tendo Garden', N'Akane', N'Tendo', N'55591233210', N'55591233211', N'Null Street nÂº69', NULL, N'Miami', NULL, N'USA', N'696969', 22, CAST(600000.00 AS Numeric(15, 2)))
INSERT [dbo].[cliente] ([ID_cliente], [nombre_cliente], [nombre_contacto], [apellido_contacto], [telefono], [fax], [linea_direccion1], [linea_direccion2], [ciudad], [region], [pais], [codigo_postal], [ID_empleado_rep_ventas], [limite_credito]) VALUES (5, N'Lasas S.A.', N'Antonio', N'Lasas', N'34916540145', N'34914851312', N'C/Leganes 15', NULL, N'Fuenlabrada', N'Madrid', N'Spain', N'28945', 8, CAST(154310.00 AS Numeric(15, 2)))
INSERT [dbo].[cliente] ([ID_cliente], [nombre_cliente], [nombre_contacto], [apellido_contacto], [telefono], [fax], [linea_direccion1], [linea_direccion2], [ciudad], [region], [pais], [codigo_postal], [ID_empleado_rep_ventas], [limite_credito]) VALUES (6, N'Beragua', N'Jose', N'Bermejo', N'654987321', N'916549872', N'C/pintor segundo', N'Getafe', N'Madrid', N'Madrid', N'Spain', N'28942', 11, CAST(20000.00 AS Numeric(15, 2)))
INSERT [dbo].[cliente] ([ID_cliente], [nombre_cliente], [nombre_contacto], [apellido_contacto], [telefono], [fax], [linea_direccion1], [linea_direccion2], [ciudad], [region], [pais], [codigo_postal], [ID_empleado_rep_ventas], [limite_credito]) VALUES (7, N'Club Golf Puerta del hierro', N'Paco', N'Lopez', N'62456810', N'919535678', N'C/sinesio delgado', N'Madrid', N'Madrid', N'Madrid', N'Spain', N'28930', 11, CAST(40000.00 AS Numeric(15, 2)))
INSERT [dbo].[cliente] ([ID_cliente], [nombre_cliente], [nombre_contacto], [apellido_contacto], [telefono], [fax], [linea_direccion1], [linea_direccion2], [ciudad], [region], [pais], [codigo_postal], [ID_empleado_rep_ventas], [limite_credito]) VALUES (8, N'Naturagua', N'Guillermo', N'Rengifo', N'689234750', N'916428956', N'C/majadahonda', N'Boadilla', N'Madrid', N'Madrid', N'Spain', N'28947', 11, CAST(32000.00 AS Numeric(15, 2)))
INSERT [dbo].[cliente] ([ID_cliente], [nombre_cliente], [nombre_contacto], [apellido_contacto], [telefono], [fax], [linea_direccion1], [linea_direccion2], [ciudad], [region], [pais], [codigo_postal], [ID_empleado_rep_ventas], [limite_credito]) VALUES (9, N'DaraDistribuciones', N'David', N'Serrano', N'675598001', N'916421756', N'C/azores', N'Fuenlabrada', N'Madrid', N'Madrid', N'Spain', N'28946', 11, CAST(50000.00 AS Numeric(15, 2)))
INSERT [dbo].[cliente] ([ID_cliente], [nombre_cliente], [nombre_contacto], [apellido_contacto], [telefono], [fax], [linea_direccion1], [linea_direccion2], [ciudad], [region], [pais], [codigo_postal], [ID_empleado_rep_ventas], [limite_credito]) VALUES (10, N'MadrileÃ±a de riegos', N'Jose', N'TacaÃ±o', N'655983045', N'916689215', N'C/LagaÃ±as', N'Fuenlabrada', N'Madrid', N'Madrid', N'Spain', N'28943', 11, CAST(20000.00 AS Numeric(15, 2)))
INSERT [dbo].[cliente] ([ID_cliente], [nombre_cliente], [nombre_contacto], [apellido_contacto], [telefono], [fax], [linea_direccion1], [linea_direccion2], [ciudad], [region], [pais], [codigo_postal], [ID_empleado_rep_ventas], [limite_credito]) VALUES (11, N'Lasas S.A.', N'Antonio', N'Lasas', N'34916540145', N'34914851312', N'C/Leganes 15', NULL, N'Fuenlabrada', N'Madrid', N'Spain', N'28945', 8, CAST(154310.00 AS Numeric(15, 2)))
INSERT [dbo].[cliente] ([ID_cliente], [nombre_cliente], [nombre_contacto], [apellido_contacto], [telefono], [fax], [linea_direccion1], [linea_direccion2], [ciudad], [region], [pais], [codigo_postal], [ID_empleado_rep_ventas], [limite_credito]) VALUES (12, N'Camunas Jardines S.L.', N'Pedro', N'Camunas', N'34914873241', N'34914871541', N'C/Virgenes 45', N'C/Princesas 2 1ÂºB', N'San Lorenzo del Escorial', N'Madrid', N'Spain', N'28145', 8, CAST(16481.00 AS Numeric(15, 2)))
INSERT [dbo].[cliente] ([ID_cliente], [nombre_cliente], [nombre_contacto], [apellido_contacto], [telefono], [fax], [linea_direccion1], [linea_direccion2], [ciudad], [region], [pais], [codigo_postal], [ID_empleado_rep_ventas], [limite_credito]) VALUES (13, N'Dardena S.A.', N'Juan', N'Rodriguez', N'34912453217', N'34912484764', N'C/Nueva York 74', NULL, N'Madrid', N'Madrid', N'Spain', N'28003', 8, CAST(321000.00 AS Numeric(15, 2)))
INSERT [dbo].[cliente] ([ID_cliente], [nombre_cliente], [nombre_contacto], [apellido_contacto], [telefono], [fax], [linea_direccion1], [linea_direccion2], [ciudad], [region], [pais], [codigo_postal], [ID_empleado_rep_ventas], [limite_credito]) VALUES (14, N'Jardin de Flores', N'Javier', N'Villar', N'654865643', N'914538776', N'C/ OÃ±a 34', NULL, N'Madrid', N'Madrid', N'Spain', N'28950', 30, CAST(40000.00 AS Numeric(15, 2)))
INSERT [dbo].[cliente] ([ID_cliente], [nombre_cliente], [nombre_contacto], [apellido_contacto], [telefono], [fax], [linea_direccion1], [linea_direccion2], [ciudad], [region], [pais], [codigo_postal], [ID_empleado_rep_ventas], [limite_credito]) VALUES (15, N'Flores Marivi', N'Maria', N'Rodriguez', N'666555444', N'912458657', N'C/Leganes24', NULL, N'Fuenlabrada', N'Madrid', N'Spain', N'28945', 5, CAST(1500.00 AS Numeric(15, 2)))
INSERT [dbo].[cliente] ([ID_cliente], [nombre_cliente], [nombre_contacto], [apellido_contacto], [telefono], [fax], [linea_direccion1], [linea_direccion2], [ciudad], [region], [pais], [codigo_postal], [ID_empleado_rep_ventas], [limite_credito]) VALUES (16, N'Flowers, S.A', N'Beatriz', N'Fernandez', N'698754159', N'978453216', N'C/Luis Salquillo4', NULL, N'Montornes del valles', N'Barcelona', N'Spain', N'24586', 5, CAST(3500.00 AS Numeric(15, 2)))
INSERT [dbo].[cliente] ([ID_cliente], [nombre_cliente], [nombre_contacto], [apellido_contacto], [telefono], [fax], [linea_direccion1], [linea_direccion2], [ciudad], [region], [pais], [codigo_postal], [ID_empleado_rep_ventas], [limite_credito]) VALUES (17, N'Naturajardin', N'Victoria', N'Cruz', N'612343529', N'916548735', N'Plaza MagallÃ³n 15', NULL, N'Madrid', N'Madrid', N'Spain', N'28011', 30, CAST(5050.00 AS Numeric(15, 2)))
INSERT [dbo].[cliente] ([ID_cliente], [nombre_cliente], [nombre_contacto], [apellido_contacto], [telefono], [fax], [linea_direccion1], [linea_direccion2], [ciudad], [region], [pais], [codigo_postal], [ID_empleado_rep_ventas], [limite_credito]) VALUES (18, N'Golf S.A.', N'Luis', N'Martinez', N'916458762', N'912354475', N'C/Estancado', NULL, N'Santa cruz de Tenerife', N'Islas Canarias', N'Spain', N'38297', 12, CAST(30000.00 AS Numeric(15, 2)))
INSERT [dbo].[cliente] ([ID_cliente], [nombre_cliente], [nombre_contacto], [apellido_contacto], [telefono], [fax], [linea_direccion1], [linea_direccion2], [ciudad], [region], [pais], [codigo_postal], [ID_empleado_rep_ventas], [limite_credito]) VALUES (19, N'Americh Golf Management SL', N'Mario', N'Suarez', N'964493072', N'964493063', N'C/Letardo', NULL, N'Barcelona', N'CataluÃ±a', N'Spain', N'12320', 12, CAST(20000.00 AS Numeric(15, 2)))
INSERT [dbo].[cliente] ([ID_cliente], [nombre_cliente], [nombre_contacto], [apellido_contacto], [telefono], [fax], [linea_direccion1], [linea_direccion2], [ciudad], [region], [pais], [codigo_postal], [ID_empleado_rep_ventas], [limite_credito]) VALUES (20, N'Aloha', N'Cristian', N'Rodrigez', N'916485852', N'914489898', N'C/Roman 3', NULL, N'Canarias', N'Canarias', N'Spain', N'35488', 12, CAST(50000.00 AS Numeric(15, 2)))
INSERT [dbo].[cliente] ([ID_cliente], [nombre_cliente], [nombre_contacto], [apellido_contacto], [telefono], [fax], [linea_direccion1], [linea_direccion2], [ciudad], [region], [pais], [codigo_postal], [ID_empleado_rep_ventas], [limite_credito]) VALUES (21, N'El Prat', N'Francisco', N'Camacho', N'916882323', N'916493211', N'Avenida Tibidabo', NULL, N'Barcelona', N'CataluÃ±a', N'Spain', N'12320', 12, CAST(30000.00 AS Numeric(15, 2)))
INSERT [dbo].[cliente] ([ID_cliente], [nombre_cliente], [nombre_contacto], [apellido_contacto], [telefono], [fax], [linea_direccion1], [linea_direccion2], [ciudad], [region], [pais], [codigo_postal], [ID_empleado_rep_ventas], [limite_credito]) VALUES (22, N'Sotogrande', N'Maria', N'Santillana', N'915576622', N'914825645', N'C/Paseo del Parque', NULL, N'Sotogrande', N'Cadiz', N'Spain', N'11310', 12, CAST(60000.00 AS Numeric(15, 2)))
INSERT [dbo].[cliente] ([ID_cliente], [nombre_cliente], [nombre_contacto], [apellido_contacto], [telefono], [fax], [linea_direccion1], [linea_direccion2], [ciudad], [region], [pais], [codigo_postal], [ID_empleado_rep_ventas], [limite_credito]) VALUES (23, N'Vivero Humanes', N'Federico', N'Gomez', N'654987690', N'916040875', N'C/Miguel Echegaray 54', NULL, N'Humanes', N'Madrid', N'Spain', N'28970', 30, CAST(7430.00 AS Numeric(15, 2)))
INSERT [dbo].[cliente] ([ID_cliente], [nombre_cliente], [nombre_contacto], [apellido_contacto], [telefono], [fax], [linea_direccion1], [linea_direccion2], [ciudad], [region], [pais], [codigo_postal], [ID_empleado_rep_ventas], [limite_credito]) VALUES (24, N'Fuenla City', N'Tony', N'MuÃ±oz Mena', N'675842139', N'915483754', N'C/Callo 52', NULL, N'Fuenlabrada', N'Madrid', N'Spain', N'28574', 5, CAST(4500.00 AS Numeric(15, 2)))
INSERT [dbo].[cliente] ([ID_cliente], [nombre_cliente], [nombre_contacto], [apellido_contacto], [telefono], [fax], [linea_direccion1], [linea_direccion2], [ciudad], [region], [pais], [codigo_postal], [ID_empleado_rep_ventas], [limite_credito]) VALUES (25, N'Jardines y Mansiones Cactus SL', N'Eva MarÃ­a', N'SÃ¡nchez', N'916877445', N'914477777', N'PolÃ­gono Industrial Maspalomas, NÂº52', N'MÃ³stoles', N'Madrid', N'Madrid', N'Spain', N'29874', 9, CAST(76000.00 AS Numeric(15, 2)))
INSERT [dbo].[cliente] ([ID_cliente], [nombre_cliente], [nombre_contacto], [apellido_contacto], [telefono], [fax], [linea_direccion1], [linea_direccion2], [ciudad], [region], [pais], [codigo_postal], [ID_empleado_rep_ventas], [limite_credito]) VALUES (26, N'JardinerÃ­as MatÃ­as SL', N'MatÃ­as', N'San MartÃ­n', N'916544147', N'917897474', N'C/Francisco Arce, NÂº44', N'Bustarviejo', N'Madrid', N'Madrid', N'Spain', N'37845', 9, CAST(100500.00 AS Numeric(15, 2)))
INSERT [dbo].[cliente] ([ID_cliente], [nombre_cliente], [nombre_contacto], [apellido_contacto], [telefono], [fax], [linea_direccion1], [linea_direccion2], [ciudad], [region], [pais], [codigo_postal], [ID_empleado_rep_ventas], [limite_credito]) VALUES (27, N'Agrojardin', N'Benito', N'Lopez', N'675432926', N'916549264', N'C/Mar Caspio 43', NULL, N'Getafe', N'Madrid', N'Spain', N'28904', 30, CAST(8040.00 AS Numeric(15, 2)))
INSERT [dbo].[cliente] ([ID_cliente], [nombre_cliente], [nombre_contacto], [apellido_contacto], [telefono], [fax], [linea_direccion1], [linea_direccion2], [ciudad], [region], [pais], [codigo_postal], [ID_empleado_rep_ventas], [limite_credito]) VALUES (28, N'Top Campo', N'Joseluis', N'Sanchez', N'685746512', N'974315924', N'C/Ibiza 32', NULL, N'Humanes', N'Madrid', N'Spain', N'28574', 5, CAST(5500.00 AS Numeric(15, 2)))
INSERT [dbo].[cliente] ([ID_cliente], [nombre_cliente], [nombre_contacto], [apellido_contacto], [telefono], [fax], [linea_direccion1], [linea_direccion2], [ciudad], [region], [pais], [codigo_postal], [ID_empleado_rep_ventas], [limite_credito]) VALUES (29, N'Jardineria Sara', N'Sara', N'Marquez', N'675124537', N'912475843', N'C/Lima 1', NULL, N'Fuenlabrada', N'Madrid', N'Spain', N'27584', 5, CAST(7500.00 AS Numeric(15, 2)))
INSERT [dbo].[cliente] ([ID_cliente], [nombre_cliente], [nombre_contacto], [apellido_contacto], [telefono], [fax], [linea_direccion1], [linea_direccion2], [ciudad], [region], [pais], [codigo_postal], [ID_empleado_rep_ventas], [limite_credito]) VALUES (30, N'Campohermoso', N'Luis', N'Jimenez', N'645925376', N'916159116', N'C/Peru 78', NULL, N'Fuenlabrada', N'Madrid', N'Spain', N'28945', 30, CAST(3250.00 AS Numeric(15, 2)))
INSERT [dbo].[cliente] ([ID_cliente], [nombre_cliente], [nombre_contacto], [apellido_contacto], [telefono], [fax], [linea_direccion1], [linea_direccion2], [ciudad], [region], [pais], [codigo_postal], [ID_empleado_rep_ventas], [limite_credito]) VALUES (31, N'france telecom', N'FraÃƒÂ§ois', N'Toulou', N'(33)5120578961', N'(33)5120578961', N'6 place d Alleray 15ÃƒÂ¨me', NULL, N'Paris', NULL, N'France', N'75010', 16, CAST(10000.00 AS Numeric(15, 2)))
INSERT [dbo].[cliente] ([ID_cliente], [nombre_cliente], [nombre_contacto], [apellido_contacto], [telefono], [fax], [linea_direccion1], [linea_direccion2], [ciudad], [region], [pais], [codigo_postal], [ID_empleado_rep_ventas], [limite_credito]) VALUES (32, N'MusÃ©e du Louvre', N'Pierre', N'Delacroux', N'(33)0140205050', N'(33)0140205442', N'Quai du Louvre', NULL, N'Paris', NULL, N'France', N'75058', 16, CAST(30000.00 AS Numeric(15, 2)))
INSERT [dbo].[cliente] ([ID_cliente], [nombre_cliente], [nombre_contacto], [apellido_contacto], [telefono], [fax], [linea_direccion1], [linea_direccion2], [ciudad], [region], [pais], [codigo_postal], [ID_empleado_rep_ventas], [limite_credito]) VALUES (33, N'Tutifruti S.A', N'Jacob', N'Jones', N'2 9261-2433', N'2 9283-1695', N'level 24, St. Martins Tower.-31 Market St.', NULL, N'Sydney', N'Nueva Gales del Sur', N'Australia', N'2000', 31, CAST(10000.00 AS Numeric(15, 2)))
INSERT [dbo].[cliente] ([ID_cliente], [nombre_cliente], [nombre_contacto], [apellido_contacto], [telefono], [fax], [linea_direccion1], [linea_direccion2], [ciudad], [region], [pais], [codigo_postal], [ID_empleado_rep_ventas], [limite_credito]) VALUES (34, N'Flores S.L.', N'Antonio', N'Romero', N'654352981', N'685249700', N'Avenida EspaÃ±a', NULL, N'Madrid', N'Fuenlabrada', N'Spain', N'29643', 18, CAST(6000.00 AS Numeric(15, 2)))
INSERT [dbo].[cliente] ([ID_cliente], [nombre_cliente], [nombre_contacto], [apellido_contacto], [telefono], [fax], [linea_direccion1], [linea_direccion2], [ciudad], [region], [pais], [codigo_postal], [ID_empleado_rep_ventas], [limite_credito]) VALUES (35, N'The Magic Garden', N'Richard', N'Mcain', N'926523468', N'9364875882', N'Lihgting Park', NULL, N'London', N'London', N'United Kingdom', N'65930', 18, CAST(10000.00 AS Numeric(15, 2)))
INSERT [dbo].[cliente] ([ID_cliente], [nombre_cliente], [nombre_contacto], [apellido_contacto], [telefono], [fax], [linea_direccion1], [linea_direccion2], [ciudad], [region], [pais], [codigo_postal], [ID_empleado_rep_ventas], [limite_credito]) VALUES (36, N'El Jardin Viviente S.L', N'Justin', N'Smith', N'2 8005-7161', N'2 8005-7162', N'176 Cumberland Street The rocks', NULL, N'Sydney', N'Nueva Gales del Sur', N'Australia', N'2003', 31, CAST(8000.00 AS Numeric(15, 2)))
SET IDENTITY_INSERT [dbo].[cliente] OFF
GO
SET IDENTITY_INSERT [dbo].[empleado] ON 

INSERT [dbo].[empleado] ([ID_empleado], [nombre], [apellido1], [apellido2], [extension], [email], [ID_oficina], [ID_jefe], [puesto]) VALUES (1, N'Marcos', N'MagaÃ±a', N'Perez', N'3897', N'marcos@jardineria.es', 8, NULL, N'Director General')
INSERT [dbo].[empleado] ([ID_empleado], [nombre], [apellido1], [apellido2], [extension], [email], [ID_oficina], [ID_jefe], [puesto]) VALUES (2, N'Ruben', N'LÃ³pez', N'Martinez', N'2899', N'rlopez@jardineria.es', 8, 1, N'Subdirector Marketing')
INSERT [dbo].[empleado] ([ID_empleado], [nombre], [apellido1], [apellido2], [extension], [email], [ID_oficina], [ID_jefe], [puesto]) VALUES (3, N'Alberto', N'Soria', N'Carrasco', N'2837', N'asoria@jardineria.es', 8, 2, N'Subdirector Ventas')
INSERT [dbo].[empleado] ([ID_empleado], [nombre], [apellido1], [apellido2], [extension], [email], [ID_oficina], [ID_jefe], [puesto]) VALUES (4, N'Maria', N'SolÃ­s', N'Jerez', N'2847', N'msolis@jardineria.es', 8, 2, N'Secretaria')
INSERT [dbo].[empleado] ([ID_empleado], [nombre], [apellido1], [apellido2], [extension], [email], [ID_oficina], [ID_jefe], [puesto]) VALUES (5, N'Felipe', N'Rosas', N'Marquez', N'2844', N'frosas@jardineria.es', 8, 3, N'Representante Ventas')
INSERT [dbo].[empleado] ([ID_empleado], [nombre], [apellido1], [apellido2], [extension], [email], [ID_oficina], [ID_jefe], [puesto]) VALUES (6, N'Juan Carlos', N'Ortiz', N'Serrano', N'2845', N'cortiz@jardineria.es', 8, 3, N'Representante Ventas')
INSERT [dbo].[empleado] ([ID_empleado], [nombre], [apellido1], [apellido2], [extension], [email], [ID_oficina], [ID_jefe], [puesto]) VALUES (7, N'Carlos', N'Soria', N'Jimenez', N'2444', N'csoria@jardineria.es', 4, 3, N'Director Oficina')
INSERT [dbo].[empleado] ([ID_empleado], [nombre], [apellido1], [apellido2], [extension], [email], [ID_oficina], [ID_jefe], [puesto]) VALUES (8, N'Mariano', N'LÃ³pez', N'Murcia', N'2442', N'mlopez@jardineria.es', 4, 7, N'Representante Ventas')
INSERT [dbo].[empleado] ([ID_empleado], [nombre], [apellido1], [apellido2], [extension], [email], [ID_oficina], [ID_jefe], [puesto]) VALUES (9, N'Lucio', N'Campoamor', N'MartÃ­n', N'2442', N'lcampoamor@jardineria.es', 4, 7, N'Representante Ventas')
INSERT [dbo].[empleado] ([ID_empleado], [nombre], [apellido1], [apellido2], [extension], [email], [ID_oficina], [ID_jefe], [puesto]) VALUES (10, N'Hilario', N'Rodriguez', N'Huertas', N'2444', N'hrodriguez@jardineria.es', 4, 7, N'Representante Ventas')
INSERT [dbo].[empleado] ([ID_empleado], [nombre], [apellido1], [apellido2], [extension], [email], [ID_oficina], [ID_jefe], [puesto]) VALUES (11, N'Emmanuel', N'MagaÃ±a', N'Perez', N'2518', N'manu@jardineria.es', 1, 3, N'Director Oficina')
INSERT [dbo].[empleado] ([ID_empleado], [nombre], [apellido1], [apellido2], [extension], [email], [ID_oficina], [ID_jefe], [puesto]) VALUES (12, N'JosÃ© Manuel', N'Martinez', N'De la Osa', N'2519', N'jmmart@hotmail.es', 1, 11, N'Representante Ventas')
INSERT [dbo].[empleado] ([ID_empleado], [nombre], [apellido1], [apellido2], [extension], [email], [ID_oficina], [ID_jefe], [puesto]) VALUES (13, N'David', N'Palma', N'Aceituno', N'2519', N'dpalma@jardineria.es', 1, 11, N'Representante Ventas')
INSERT [dbo].[empleado] ([ID_empleado], [nombre], [apellido1], [apellido2], [extension], [email], [ID_oficina], [ID_jefe], [puesto]) VALUES (14, N'Oscar', N'Palma', N'Aceituno', N'2519', N'opalma@jardineria.es', 1, 11, N'Representante Ventas')
INSERT [dbo].[empleado] ([ID_empleado], [nombre], [apellido1], [apellido2], [extension], [email], [ID_oficina], [ID_jefe], [puesto]) VALUES (15, N'Francois', N'Fignon', N'', N'9981', N'ffignon@gardening.com', 5, 3, N'Director Oficina')
INSERT [dbo].[empleado] ([ID_empleado], [nombre], [apellido1], [apellido2], [extension], [email], [ID_oficina], [ID_jefe], [puesto]) VALUES (16, N'Lionel', N'Narvaez', N'', N'9982', N'lnarvaez@gardening.com', 5, 15, N'Representante Ventas')
INSERT [dbo].[empleado] ([ID_empleado], [nombre], [apellido1], [apellido2], [extension], [email], [ID_oficina], [ID_jefe], [puesto]) VALUES (17, N'Laurent', N'Serra', N'', N'9982', N'lserra@gardening.com', 5, 15, N'Representante Ventas')
INSERT [dbo].[empleado] ([ID_empleado], [nombre], [apellido1], [apellido2], [extension], [email], [ID_oficina], [ID_jefe], [puesto]) VALUES (18, N'Michael', N'Bolton', N'', N'7454', N'mbolton@gardening.com', 6, 3, N'Director Oficina')
INSERT [dbo].[empleado] ([ID_empleado], [nombre], [apellido1], [apellido2], [extension], [email], [ID_oficina], [ID_jefe], [puesto]) VALUES (19, N'Walter Santiago', N'Sanchez', N'Lopez', N'7454', N'wssanchez@gardening.com', 6, 18, N'Representante Ventas')
INSERT [dbo].[empleado] ([ID_empleado], [nombre], [apellido1], [apellido2], [extension], [email], [ID_oficina], [ID_jefe], [puesto]) VALUES (20, N'Hilary', N'Washington', N'', N'7565', N'hwashington@gardening.com', 2, 3, N'Director Oficina')
INSERT [dbo].[empleado] ([ID_empleado], [nombre], [apellido1], [apellido2], [extension], [email], [ID_oficina], [ID_jefe], [puesto]) VALUES (21, N'Marcus', N'Paxton', N'', N'7565', N'mpaxton@gardening.com', 2, 20, N'Representante Ventas')
INSERT [dbo].[empleado] ([ID_empleado], [nombre], [apellido1], [apellido2], [extension], [email], [ID_oficina], [ID_jefe], [puesto]) VALUES (22, N'Lorena', N'Paxton', N'', N'7665', N'lpaxton@gardening.com', 2, 20, N'Representante Ventas')
INSERT [dbo].[empleado] ([ID_empleado], [nombre], [apellido1], [apellido2], [extension], [email], [ID_oficina], [ID_jefe], [puesto]) VALUES (23, N'Nei', N'Nishikori', N'', N'8734', N'nnishikori@gardening.com', 9, 3, N'Director Oficina')
INSERT [dbo].[empleado] ([ID_empleado], [nombre], [apellido1], [apellido2], [extension], [email], [ID_oficina], [ID_jefe], [puesto]) VALUES (24, N'Narumi', N'Riko', N'', N'8734', N'nriko@gardening.com', 9, 23, N'Representante Ventas')
INSERT [dbo].[empleado] ([ID_empleado], [nombre], [apellido1], [apellido2], [extension], [email], [ID_oficina], [ID_jefe], [puesto]) VALUES (25, N'Takuma', N'Nomura', N'', N'8735', N'tnomura@gardening.com', 9, 23, N'Representante Ventas')
INSERT [dbo].[empleado] ([ID_empleado], [nombre], [apellido1], [apellido2], [extension], [email], [ID_oficina], [ID_jefe], [puesto]) VALUES (26, N'Amy', N'Johnson', N'', N'3321', N'ajohnson@gardening.com', 3, 3, N'Director Oficina')
INSERT [dbo].[empleado] ([ID_empleado], [nombre], [apellido1], [apellido2], [extension], [email], [ID_oficina], [ID_jefe], [puesto]) VALUES (27, N'Larry', N'Westfalls', N'', N'3322', N'lwestfalls@gardening.com', 3, 26, N'Representante Ventas')
INSERT [dbo].[empleado] ([ID_empleado], [nombre], [apellido1], [apellido2], [extension], [email], [ID_oficina], [ID_jefe], [puesto]) VALUES (28, N'John', N'Walton', N'', N'3322', N'jwalton@gardening.com', 3, 26, N'Representante Ventas')
INSERT [dbo].[empleado] ([ID_empleado], [nombre], [apellido1], [apellido2], [extension], [email], [ID_oficina], [ID_jefe], [puesto]) VALUES (29, N'Kevin', N'Fallmer', N'', N'3210', N'kfalmer@gardening.com', 7, 3, N'Director Oficina')
INSERT [dbo].[empleado] ([ID_empleado], [nombre], [apellido1], [apellido2], [extension], [email], [ID_oficina], [ID_jefe], [puesto]) VALUES (30, N'Julian', N'Bellinelli', N'', N'3211', N'jbellinelli@gardening.com', 7, 29, N'Representante Ventas')
INSERT [dbo].[empleado] ([ID_empleado], [nombre], [apellido1], [apellido2], [extension], [email], [ID_oficina], [ID_jefe], [puesto]) VALUES (31, N'Mariko', N'Kishi', N'', N'3211', N'mkishi@gardening.com', 7, 29, N'Representante Ventas')
SET IDENTITY_INSERT [dbo].[empleado] OFF
GO
SET IDENTITY_INSERT [dbo].[oficina] ON 

INSERT [dbo].[oficina] ([ID_oficina], [Descripcion], [ciudad], [pais], [region], [codigo_postal], [telefono], [linea_direccion1], [linea_direccion2]) VALUES (1, N'BCN-ES', N'Barcelona', N'EspaÃ±a', N'Barcelona', N'08019', N'+34 93 3561182', N'Avenida Diagonal, 38', N'3A escalera Derecha')
INSERT [dbo].[oficina] ([ID_oficina], [Descripcion], [ciudad], [pais], [region], [codigo_postal], [telefono], [linea_direccion1], [linea_direccion2]) VALUES (2, N'BOS-USA', N'Boston', N'EEUU', N'MA', N'02108', N'+1 215 837 0825', N'1550 Court Place', N'Suite 102')
INSERT [dbo].[oficina] ([ID_oficina], [Descripcion], [ciudad], [pais], [region], [codigo_postal], [telefono], [linea_direccion1], [linea_direccion2]) VALUES (3, N'LON-UK', N'Londres', N'Inglaterra', N'EMEA', N'EC2N 1HN', N'+44 20 78772041', N'52 Old Broad Street', N'Ground Floor')
INSERT [dbo].[oficina] ([ID_oficina], [Descripcion], [ciudad], [pais], [region], [codigo_postal], [telefono], [linea_direccion1], [linea_direccion2]) VALUES (4, N'MAD-ES', N'Madrid', N'EspaÃ±a', N'Madrid', N'28032', N'+34 91 7514487', N'Bulevar Indalecio Prieto, 32', N'')
INSERT [dbo].[oficina] ([ID_oficina], [Descripcion], [ciudad], [pais], [region], [codigo_postal], [telefono], [linea_direccion1], [linea_direccion2]) VALUES (5, N'PAR-FR', N'Paris', N'Francia', N'EMEA', N'75017', N'+33 14 723 4404', N'29 Rue Jouffroy d''abbans', N'')
INSERT [dbo].[oficina] ([ID_oficina], [Descripcion], [ciudad], [pais], [region], [codigo_postal], [telefono], [linea_direccion1], [linea_direccion2]) VALUES (6, N'SFC-USA', N'San Francisco', N'EEUU', N'CA', N'94080', N'+1 650 219 4782', N'100 Market Street', N'Suite 300')
INSERT [dbo].[oficina] ([ID_oficina], [Descripcion], [ciudad], [pais], [region], [codigo_postal], [telefono], [linea_direccion1], [linea_direccion2]) VALUES (7, N'SYD-AU', N'Sydney', N'Australia', N'APAC', N'NSW 2010', N'+61 2 9264 2451', N'5-11 Wentworth Avenue', N'Floor #2')
INSERT [dbo].[oficina] ([ID_oficina], [Descripcion], [ciudad], [pais], [region], [codigo_postal], [telefono], [linea_direccion1], [linea_direccion2]) VALUES (8, N'TAL-ES', N'Talavera de la Reina', N'EspaÃ±a', N'Castilla-LaMancha', N'45632', N'+34 925 867231', N'Francisco Aguirre, 32', N'5Âº piso (exterior)')
INSERT [dbo].[oficina] ([ID_oficina], [Descripcion], [ciudad], [pais], [region], [codigo_postal], [telefono], [linea_direccion1], [linea_direccion2]) VALUES (9, N'TOK-JP', N'Tokyo', N'JapÃ³n', N'Chiyoda-Ku', N'102-8578', N'+81 33 224 5000', N'4-1 Kioicho', N'')
SET IDENTITY_INSERT [dbo].[oficina] OFF
GO
SET IDENTITY_INSERT [dbo].[pedido] ON 

INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (1, CAST(N'2006-01-17' AS Date), CAST(N'2006-01-19' AS Date), CAST(N'2006-01-19' AS Date), N'Entregado', N'Pagado a plazos', 5)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (2, CAST(N'2007-10-23' AS Date), CAST(N'2007-10-28' AS Date), CAST(N'2007-10-26' AS Date), N'Entregado', N'La entrega llego antes de lo esperado', 5)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (3, CAST(N'2008-06-20' AS Date), CAST(N'2008-06-25' AS Date), NULL, N'Rechazado', N'Limite de credito superado', 5)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (4, CAST(N'2009-01-20' AS Date), CAST(N'2009-01-26' AS Date), NULL, N'Pendiente', NULL, 5)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (5, CAST(N'2008-11-09' AS Date), CAST(N'2008-11-14' AS Date), CAST(N'2008-11-14' AS Date), N'Entregado', N'El cliente paga la mitad con tarjeta y la otra mitad con efectivo, se le realizan dos facturas', 1)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (6, CAST(N'2008-12-22' AS Date), CAST(N'2008-12-27' AS Date), CAST(N'2008-12-28' AS Date), N'Entregado', N'El cliente comprueba la integridad del paquete, todo correcto', 1)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (7, CAST(N'2009-01-15' AS Date), CAST(N'2009-01-20' AS Date), NULL, N'Pendiente', N'El cliente llama para confirmar la fecha - Esperando al proveedor', 3)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (8, CAST(N'2009-01-20' AS Date), CAST(N'2009-01-27' AS Date), NULL, N'Pendiente', N'El cliente requiere que el pedido se le entregue de 16:00h a 22:00h', 1)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (9, CAST(N'2009-01-22' AS Date), CAST(N'2009-01-27' AS Date), NULL, N'Pendiente', N'El cliente requiere que el pedido se le entregue de 9:00h a 13:00h', 1)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (10, CAST(N'2009-01-12' AS Date), CAST(N'2009-01-14' AS Date), CAST(N'2009-01-15' AS Date), N'Entregado', NULL, 7)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (11, CAST(N'2009-01-02' AS Date), CAST(N'2009-01-02' AS Date), NULL, N'Rechazado', N'mal pago', 7)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (12, CAST(N'2009-01-09' AS Date), CAST(N'2009-01-12' AS Date), CAST(N'2009-01-11' AS Date), N'Entregado', NULL, 7)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (13, CAST(N'2009-01-06' AS Date), CAST(N'2009-01-07' AS Date), CAST(N'2009-01-15' AS Date), N'Entregado', NULL, 7)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (14, CAST(N'2009-01-08' AS Date), CAST(N'2009-01-09' AS Date), CAST(N'2009-01-11' AS Date), N'Entregado', N'mal estado', 7)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (15, CAST(N'2009-01-05' AS Date), CAST(N'2009-01-06' AS Date), CAST(N'2009-01-07' AS Date), N'Entregado', NULL, 9)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (16, CAST(N'2009-01-18' AS Date), CAST(N'2009-02-12' AS Date), NULL, N'Pendiente', N'entregar en murcia', 9)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (17, CAST(N'2009-01-20' AS Date), CAST(N'2009-02-15' AS Date), NULL, N'Pendiente', NULL, 9)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (18, CAST(N'2009-01-09' AS Date), CAST(N'2009-01-09' AS Date), CAST(N'2009-01-09' AS Date), N'Rechazado', N'mal pago', 9)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (19, CAST(N'2009-01-11' AS Date), CAST(N'2009-01-11' AS Date), CAST(N'2009-01-13' AS Date), N'Entregado', NULL, 9)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (20, CAST(N'2008-12-30' AS Date), CAST(N'2009-01-10' AS Date), NULL, N'Rechazado', N'El pedido fue anulado por el cliente', 5)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (21, CAST(N'2008-07-14' AS Date), CAST(N'2008-07-31' AS Date), CAST(N'2008-07-25' AS Date), N'Entregado', NULL, 14)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (22, CAST(N'2009-02-02' AS Date), CAST(N'2009-02-08' AS Date), NULL, N'Rechazado', N'El cliente carece de saldo en la cuenta asociada', 1)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (23, CAST(N'2009-02-06' AS Date), CAST(N'2009-02-12' AS Date), NULL, N'Rechazado', N'El cliente anula la operacion para adquirir mas producto', 3)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (24, CAST(N'2009-02-07' AS Date), CAST(N'2009-02-13' AS Date), NULL, N'Entregado', N'El pedido aparece como entregado pero no sabemos en que fecha', 3)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (25, CAST(N'2009-02-10' AS Date), CAST(N'2009-02-17' AS Date), CAST(N'2009-02-20' AS Date), N'Entregado', N'El cliente se queja bastante de la espera asociada al producto', 3)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (26, CAST(N'2008-08-01' AS Date), CAST(N'2008-09-01' AS Date), CAST(N'2008-09-01' AS Date), N'Rechazado', N'El cliente no estÃ¡ conforme con el pedido', 14)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (27, CAST(N'2008-08-03' AS Date), CAST(N'2008-09-03' AS Date), CAST(N'2008-08-31' AS Date), N'Entregado', NULL, 13)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (28, CAST(N'2008-09-04' AS Date), CAST(N'2008-09-30' AS Date), CAST(N'2008-10-04' AS Date), N'Rechazado', N'El cliente ha rechazado por llegar 5 dias tarde', 13)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (29, CAST(N'2007-01-07' AS Date), CAST(N'2007-01-19' AS Date), CAST(N'2007-01-27' AS Date), N'Entregado', N'Entrega tardia, el cliente puso reclamacion', 4)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (30, CAST(N'2007-05-20' AS Date), CAST(N'2007-05-28' AS Date), NULL, N'Rechazado', N'El pedido fue anulado por el cliente', 4)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (31, CAST(N'2007-06-20' AS Date), CAST(N'2008-06-28' AS Date), CAST(N'2008-06-28' AS Date), N'Entregado', N'Pagado a plazos', 4)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (32, CAST(N'2008-03-10' AS Date), CAST(N'2009-03-20' AS Date), NULL, N'Rechazado', N'Limite de credito superado', 4)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (33, CAST(N'2008-10-15' AS Date), CAST(N'2008-12-15' AS Date), CAST(N'2008-12-10' AS Date), N'Entregado', NULL, 14)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (34, CAST(N'2008-11-03' AS Date), CAST(N'2009-11-13' AS Date), NULL, N'Pendiente', N'El pedido nunca llego a su destino', 4)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (35, CAST(N'2009-03-05' AS Date), CAST(N'2009-03-06' AS Date), CAST(N'2009-03-07' AS Date), N'Entregado', NULL, 19)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (36, CAST(N'2009-03-06' AS Date), CAST(N'2009-03-07' AS Date), CAST(N'2009-03-09' AS Date), N'Pendiente', NULL, 19)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (37, CAST(N'2009-03-09' AS Date), CAST(N'2009-03-10' AS Date), CAST(N'2009-03-13' AS Date), N'Rechazado', NULL, 19)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (38, CAST(N'2009-03-12' AS Date), CAST(N'2009-03-13' AS Date), CAST(N'2009-03-13' AS Date), N'Entregado', NULL, 19)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (39, CAST(N'2009-03-22' AS Date), CAST(N'2009-03-23' AS Date), CAST(N'2009-03-27' AS Date), N'Entregado', NULL, 19)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (40, CAST(N'2009-03-25' AS Date), CAST(N'2009-03-26' AS Date), CAST(N'2009-03-28' AS Date), N'Pendiente', NULL, 23)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (41, CAST(N'2009-03-26' AS Date), CAST(N'2009-03-27' AS Date), CAST(N'2009-03-30' AS Date), N'Pendiente', NULL, 23)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (42, CAST(N'2009-04-01' AS Date), CAST(N'2009-03-04' AS Date), CAST(N'2009-03-07' AS Date), N'Entregado', NULL, 23)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (43, CAST(N'2009-04-03' AS Date), CAST(N'2009-03-04' AS Date), CAST(N'2009-03-05' AS Date), N'Rechazado', NULL, 23)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (44, CAST(N'2009-04-15' AS Date), CAST(N'2009-03-17' AS Date), CAST(N'2009-03-17' AS Date), N'Entregado', NULL, 23)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (45, CAST(N'2008-03-17' AS Date), CAST(N'2008-03-30' AS Date), CAST(N'2008-03-29' AS Date), N'Entregado', N'SegÃºn el Cliente, el pedido llegÃ³ defectuoso', 26)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (46, CAST(N'2008-07-12' AS Date), CAST(N'2008-07-22' AS Date), CAST(N'2008-07-30' AS Date), N'Entregado', N'El pedido llegÃ³ 1 dÃ­a tarde, pero no hubo queja por parte de la empresa compradora', 26)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (47, CAST(N'2008-03-17' AS Date), CAST(N'2008-08-09' AS Date), NULL, N'Pendiente', N'Al parecer, el pedido se ha extraviado a la altura de Sotalbo (Ãvila)', 26)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (48, CAST(N'2008-10-01' AS Date), CAST(N'2008-10-14' AS Date), CAST(N'2008-10-14' AS Date), N'Entregado', N'Todo se entregÃ³ a tiempo y en perfecto estado, a pesar del pÃ©simo estado de las carreteras.', 26)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (49, CAST(N'2008-12-07' AS Date), CAST(N'2008-12-21' AS Date), NULL, N'Pendiente', N'El transportista ha llamado a Eva MarÃ­a para indicarle que el pedido llegarÃ¡ mÃ¡s tarde de lo esperado.', 26)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (50, CAST(N'2008-10-15' AS Date), CAST(N'2008-11-15' AS Date), CAST(N'2008-11-09' AS Date), N'Entregado', N'El pedido llega 6 dias antes', 13)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (51, CAST(N'2009-01-11' AS Date), CAST(N'2009-02-11' AS Date), NULL, N'Pendiente', NULL, 14)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (52, CAST(N'2008-12-10' AS Date), CAST(N'2009-01-10' AS Date), CAST(N'2009-01-11' AS Date), N'Entregado', N'Retrasado 1 dia por problemas de transporte', 14)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (53, CAST(N'2008-12-19' AS Date), CAST(N'2009-01-20' AS Date), NULL, N'Rechazado', N'El cliente a anulado el pedido el dia 2009-01-10', 13)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (54, CAST(N'2009-01-05' AS Date), CAST(N'2009-02-05' AS Date), NULL, N'Pendiente', NULL, 13)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (55, CAST(N'2009-01-24' AS Date), CAST(N'2009-01-31' AS Date), CAST(N'2009-01-30' AS Date), N'Entregado', N'Todo correcto', 3)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (56, CAST(N'2008-11-09' AS Date), CAST(N'2008-11-14' AS Date), CAST(N'2008-11-14' AS Date), N'Entregado', N'El cliente paga la mitad con tarjeta y la otra mitad con efectivo, se le realizan dos facturas', 1)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (57, CAST(N'2008-12-22' AS Date), CAST(N'2008-12-27' AS Date), CAST(N'2008-12-28' AS Date), N'Entregado', N'El cliente comprueba la integridad del paquete, todo correcto', 1)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (58, CAST(N'2009-01-15' AS Date), CAST(N'2009-01-20' AS Date), NULL, N'Pendiente', N'El cliente llama para confirmar la fecha - Esperando al proveedor', 3)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (59, CAST(N'2009-01-20' AS Date), CAST(N'2009-01-27' AS Date), NULL, N'Pendiente', N'El cliente requiere que el pedido se le entregue de 16:00h a 22:00h', 1)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (60, CAST(N'2009-01-22' AS Date), CAST(N'2009-01-27' AS Date), NULL, N'Pendiente', N'El cliente requiere que el pedido se le entregue de 9:00h a 13:00h', 1)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (61, CAST(N'2009-01-24' AS Date), CAST(N'2009-01-31' AS Date), CAST(N'2009-01-30' AS Date), N'Entregado', N'Todo correcto', 1)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (62, CAST(N'2009-02-02' AS Date), CAST(N'2009-02-08' AS Date), NULL, N'Rechazado', N'El cliente carece de saldo en la cuenta asociada', 1)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (63, CAST(N'2009-02-06' AS Date), CAST(N'2009-02-12' AS Date), NULL, N'Rechazado', N'El cliente anula la operacion para adquirir mas producto', 3)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (64, CAST(N'2009-02-07' AS Date), CAST(N'2009-02-13' AS Date), NULL, N'Entregado', N'El pedido aparece como entregado pero no sabemos en que fecha', 3)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (65, CAST(N'2009-02-10' AS Date), CAST(N'2009-02-17' AS Date), CAST(N'2009-02-20' AS Date), N'Entregado', N'El cliente se queja bastante de la espera asociada al producto', 3)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (66, CAST(N'2009-01-14' AS Date), CAST(N'2009-01-22' AS Date), NULL, N'Rechazado', N'El pedido no llego el dia que queria el cliente por fallo del transporte', 15)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (67, CAST(N'2009-01-11' AS Date), CAST(N'2009-01-13' AS Date), CAST(N'2009-01-13' AS Date), N'Entregado', N'El pedido llego perfectamente', 15)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (68, CAST(N'2008-11-15' AS Date), CAST(N'2008-11-23' AS Date), CAST(N'2008-11-23' AS Date), N'Entregado', NULL, 15)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (69, CAST(N'2009-01-03' AS Date), CAST(N'2009-01-08' AS Date), NULL, N'Pendiente', N'El pedido no pudo ser entregado por problemas meteorologicos', 15)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (70, CAST(N'2008-12-15' AS Date), CAST(N'2008-12-17' AS Date), CAST(N'2008-12-17' AS Date), N'Entregado', N'Fue entregado, pero faltaba mercancia que sera entregada otro dia', 15)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (71, CAST(N'2009-01-12' AS Date), CAST(N'2009-01-13' AS Date), CAST(N'2009-01-13' AS Date), N'Entregado', NULL, 28)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (72, CAST(N'2009-01-25' AS Date), CAST(N'2009-01-26' AS Date), NULL, N'Pendiente', N'No terminÃ³ el pago', 28)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (73, CAST(N'2009-01-18' AS Date), CAST(N'2009-01-24' AS Date), NULL, N'Rechazado', N'Los producto estaban en mal estado', 28)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (74, CAST(N'2009-01-20' AS Date), CAST(N'2009-01-29' AS Date), CAST(N'2009-01-29' AS Date), N'Entregado', N'El pedido llego un poco mas tarde de la hora fijada', 28)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (75, CAST(N'2009-01-24' AS Date), CAST(N'2009-01-28' AS Date), NULL, N'Entregado', NULL, 28)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (76, CAST(N'2007-10-05' AS Date), CAST(N'2007-12-13' AS Date), CAST(N'2007-12-10' AS Date), N'Entregado', N'La entrega se realizo dias antes de la fecha esperada por lo que el cliente quedo satisfecho', 35)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (77, CAST(N'2009-02-07' AS Date), CAST(N'2008-02-17' AS Date), NULL, N'Pendiente', N'Debido a la nevada caÃ­da en la sierra, el pedido no podrÃ¡ llegar hasta el dÃ­a ', 27)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (78, CAST(N'2009-03-18' AS Date), CAST(N'2009-03-29' AS Date), CAST(N'2009-03-27' AS Date), N'Entregado', N'Todo se entregÃ³ a su debido tiempo, incluso con un dÃ­a de antelaciÃ³n', 27)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (79, CAST(N'2009-04-19' AS Date), CAST(N'2009-04-30' AS Date), CAST(N'2009-05-03' AS Date), N'Entregado', N'El pedido se entregÃ³ tarde debido a la festividad celebrada en EspaÃ±a durante esas fechas', 27)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (80, CAST(N'2009-05-03' AS Date), CAST(N'2009-05-30' AS Date), CAST(N'2009-05-17' AS Date), N'Entregado', N'El pedido se entregÃ³ antes de lo esperado.', 27)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (81, CAST(N'2009-10-18' AS Date), CAST(N'2009-11-01' AS Date), NULL, N'Pendiente', N'El pedido estÃ¡ en camino.', 27)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (82, CAST(N'2008-01-04' AS Date), CAST(N'2008-01-19' AS Date), CAST(N'2008-01-19' AS Date), N'Entregado', NULL, 35)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (83, CAST(N'2008-03-20' AS Date), CAST(N'2008-04-12' AS Date), CAST(N'2008-04-13' AS Date), N'Entregado', N'La entrega se retraso un dia', 35)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (84, CAST(N'2008-10-08' AS Date), CAST(N'2008-11-25' AS Date), CAST(N'2008-11-25' AS Date), N'Entregado', NULL, 35)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (85, CAST(N'2009-01-08' AS Date), CAST(N'2009-02-13' AS Date), NULL, N'Pendiente', NULL, 35)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (86, CAST(N'2009-02-15' AS Date), CAST(N'2009-02-27' AS Date), NULL, N'Pendiente', NULL, 16)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (87, CAST(N'2009-01-10' AS Date), CAST(N'2009-01-15' AS Date), CAST(N'2009-01-15' AS Date), N'Entregado', N'El pedido llego perfectamente', 16)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (88, CAST(N'2009-03-07' AS Date), CAST(N'2009-03-27' AS Date), NULL, N'Rechazado', N'El pedido fue rechazado por el cliente', 16)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (89, CAST(N'2008-12-28' AS Date), CAST(N'2009-01-08' AS Date), CAST(N'2009-01-08' AS Date), N'Entregado', N'Pago pendiente', 16)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (90, CAST(N'2009-01-15' AS Date), CAST(N'2009-01-20' AS Date), CAST(N'2009-01-24' AS Date), N'Pendiente', NULL, 30)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (91, CAST(N'2009-03-02' AS Date), CAST(N'2009-03-06' AS Date), CAST(N'2009-03-06' AS Date), N'Entregado', NULL, 30)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (92, CAST(N'2009-02-14' AS Date), CAST(N'2009-02-20' AS Date), NULL, N'Rechazado', N'el producto ha sido rechazado por la pesima calidad', 30)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (93, CAST(N'2009-05-13' AS Date), CAST(N'2009-05-15' AS Date), CAST(N'2009-05-20' AS Date), N'Pendiente', NULL, 30)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (94, CAST(N'2009-04-06' AS Date), CAST(N'2009-04-10' AS Date), CAST(N'2009-04-10' AS Date), N'Entregado', NULL, 30)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (95, CAST(N'2009-04-09' AS Date), CAST(N'2009-04-15' AS Date), CAST(N'2009-04-15' AS Date), N'Entregado', NULL, 16)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (98, CAST(N'2008-03-05' AS Date), CAST(N'2008-03-30' AS Date), CAST(N'2008-03-30' AS Date), N'Entregado', NULL, 36)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (99, CAST(N'2009-03-05' AS Date), CAST(N'2009-04-06' AS Date), CAST(N'2009-05-07' AS Date), N'Pendiente', NULL, 36)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (100, CAST(N'2008-10-28' AS Date), CAST(N'2008-11-09' AS Date), CAST(N'2009-01-09' AS Date), N'Rechazado', N'El producto ha sido rechazado por la tardanza de el envio', 36)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (101, CAST(N'2009-01-15' AS Date), CAST(N'2009-01-29' AS Date), CAST(N'2009-01-31' AS Date), N'Entregado', N'El envio llego dos dias mÃ¡s tarde debido al mal tiempo', 36)
GO
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (102, CAST(N'2008-11-29' AS Date), CAST(N'2009-01-26' AS Date), CAST(N'2009-02-27' AS Date), N'Pendiente', NULL, 36)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (105, CAST(N'2009-02-15' AS Date), CAST(N'2009-02-27' AS Date), NULL, N'Pendiente', NULL, 16)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (106, CAST(N'2009-01-10' AS Date), CAST(N'2009-01-15' AS Date), CAST(N'2009-01-15' AS Date), N'Entregado', N'El pedido llego perfectamente', 16)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (107, CAST(N'2009-03-07' AS Date), CAST(N'2009-03-27' AS Date), NULL, N'Rechazado', N'El pedido fue rechazado por el cliente', 16)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (108, CAST(N'2008-12-28' AS Date), CAST(N'2009-01-08' AS Date), CAST(N'2009-01-08' AS Date), N'Entregado', N'Pago pendiente', 16)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (109, CAST(N'2009-04-09' AS Date), CAST(N'2009-04-15' AS Date), CAST(N'2009-04-15' AS Date), N'Entregado', NULL, 16)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (110, CAST(N'2009-01-15' AS Date), CAST(N'2009-01-20' AS Date), CAST(N'2009-01-24' AS Date), N'Pendiente', NULL, 30)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (111, CAST(N'2009-03-02' AS Date), CAST(N'2009-03-06' AS Date), CAST(N'2009-03-06' AS Date), N'Entregado', NULL, 30)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (112, CAST(N'2009-02-14' AS Date), CAST(N'2009-02-20' AS Date), NULL, N'Rechazado', N'el producto ha sido rechazado por la pesima calidad', 30)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (113, CAST(N'2009-05-13' AS Date), CAST(N'2009-05-15' AS Date), CAST(N'2009-05-20' AS Date), N'Pendiente', NULL, 30)
INSERT [dbo].[pedido] ([ID_pedido], [fecha_pedido], [fecha_esperada], [fecha_entrega], [estado], [comentarios], [ID_cliente]) VALUES (114, CAST(N'2009-04-06' AS Date), CAST(N'2009-04-10' AS Date), CAST(N'2009-04-10' AS Date), N'Entregado', NULL, 30)
SET IDENTITY_INSERT [dbo].[pedido] OFF
GO
INSERT [dbo].[producto] ([ID_producto], [nombre], [Categoria], [dimensiones], [proveedor], [descripcion], [cantidad_en_stock], [precio_venta], [precio_proveedor]) VALUES (N'11679', N'Sierra de Poda 400MM', 2, N'0,258', N'HiperGarden Tools', N'Gracias a la poda se consigue manipular un poco la naturaleza, dÃ¡ndole la forma que mÃ¡s nos guste. Este trabajo bÃ¡sico de jardinerÃ­a tambiÃ©n facilita que las plantas crezcan de un modo mÃ¡s equilibrado, y que las flores y los frutos vuelvan cada aÃ±o con regularidad. Lo mejor es dar forma cuando los ejemplares son jÃ³venes, de modo que exijan pocos cuidados cuando sean adultos. AdemÃ¡s de saber cuÃ¡ndo y cÃ³mo hay que podar, tener unas herramientas adecuadas para esta labor es tambiÃ©n de vital importancia.', 15, CAST(14.00 AS Numeric(15, 2)), CAST(11.00 AS Numeric(15, 2)))
GO
ALTER TABLE [dbo].[cliente] ADD  DEFAULT (NULL) FOR [nombre_contacto]
GO
ALTER TABLE [dbo].[cliente] ADD  DEFAULT (NULL) FOR [apellido_contacto]
GO
ALTER TABLE [dbo].[cliente] ADD  DEFAULT (NULL) FOR [linea_direccion2]
GO
ALTER TABLE [dbo].[cliente] ADD  DEFAULT (NULL) FOR [region]
GO
ALTER TABLE [dbo].[cliente] ADD  DEFAULT (NULL) FOR [pais]
GO
ALTER TABLE [dbo].[cliente] ADD  DEFAULT (NULL) FOR [codigo_postal]
GO
ALTER TABLE [dbo].[cliente] ADD  DEFAULT (NULL) FOR [ID_empleado_rep_ventas]
GO
ALTER TABLE [dbo].[cliente] ADD  DEFAULT (NULL) FOR [limite_credito]
GO
ALTER TABLE [dbo].[empleado] ADD  DEFAULT (NULL) FOR [apellido2]
GO
ALTER TABLE [dbo].[empleado] ADD  DEFAULT (NULL) FOR [ID_jefe]
GO
ALTER TABLE [dbo].[empleado] ADD  DEFAULT (NULL) FOR [puesto]
GO
ALTER TABLE [dbo].[oficina] ADD  DEFAULT (NULL) FOR [region]
GO
ALTER TABLE [dbo].[oficina] ADD  DEFAULT (NULL) FOR [linea_direccion2]
GO
ALTER TABLE [dbo].[pedido] ADD  DEFAULT (NULL) FOR [fecha_entrega]
GO
ALTER TABLE [dbo].[producto] ADD  DEFAULT (NULL) FOR [proveedor]
GO
ALTER TABLE [dbo].[producto] ADD  DEFAULT (NULL) FOR [precio_proveedor]
GO
ALTER TABLE [dbo].[cliente]  WITH CHECK ADD FOREIGN KEY([ID_empleado_rep_ventas])
REFERENCES [dbo].[empleado] ([ID_empleado])
GO
ALTER TABLE [dbo].[detalle_pedido]  WITH CHECK ADD FOREIGN KEY([ID_pedido])
REFERENCES [dbo].[pedido] ([ID_pedido])
GO
ALTER TABLE [dbo].[detalle_pedido]  WITH CHECK ADD FOREIGN KEY([ID_producto])
REFERENCES [dbo].[producto] ([ID_producto])
GO
ALTER TABLE [dbo].[empleado]  WITH CHECK ADD FOREIGN KEY([ID_jefe])
REFERENCES [dbo].[empleado] ([ID_empleado])
GO
ALTER TABLE [dbo].[empleado]  WITH CHECK ADD FOREIGN KEY([ID_oficina])
REFERENCES [dbo].[oficina] ([ID_oficina])
GO
ALTER TABLE [dbo].[pago]  WITH CHECK ADD FOREIGN KEY([ID_cliente])
REFERENCES [dbo].[cliente] ([ID_cliente])
GO
ALTER TABLE [dbo].[pedido]  WITH CHECK ADD FOREIGN KEY([ID_cliente])
REFERENCES [dbo].[cliente] ([ID_cliente])
GO
ALTER TABLE [dbo].[producto]  WITH CHECK ADD FOREIGN KEY([Categoria])
REFERENCES [dbo].[Categoria_producto] ([Id_Categoria])
GO
