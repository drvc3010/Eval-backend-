﻿USE [BDQS]
GO
/****** Object:  StoredProcedure [dbo].[SPS_LISTAR_VENDEDOR_POR_ANIO]    Script Date: 03/03/2020 3:40:22 ******/
DROP PROCEDURE [dbo].[SPS_LISTAR_VENDEDOR_POR_ANIO]
GO
/****** Object:  StoredProcedure [dbo].[SPS_LISTA_PRODUCTOS]    Script Date: 03/03/2020 3:40:22 ******/
DROP PROCEDURE [dbo].[SPS_LISTA_PRODUCTOS]
GO
/****** Object:  StoredProcedure [dbo].[SPS_LISTA_FACTURAS_EMITIDAS]    Script Date: 03/03/2020 3:40:22 ******/
DROP PROCEDURE [dbo].[SPS_LISTA_FACTURAS_EMITIDAS]
GO
/****** Object:  StoredProcedure [dbo].[SPS_LISTA_CLIENTES_A]    Script Date: 03/03/2020 3:40:22 ******/
DROP PROCEDURE [dbo].[SPS_LISTA_CLIENTES_A]
GO
/****** Object:  StoredProcedure [dbo].[SPI_FACTURA]    Script Date: 03/03/2020 3:40:22 ******/
DROP PROCEDURE [dbo].[SPI_FACTURA]
GO
ALTER TABLE [dbo].[Factura] DROP CONSTRAINT [FK_Factura_Vendedor]
GO
ALTER TABLE [dbo].[Factura] DROP CONSTRAINT [FK_Factura_Cliente]
GO
ALTER TABLE [dbo].[DetalleFactura] DROP CONSTRAINT [FK_DetalleFactura_Producto]
GO
ALTER TABLE [dbo].[DetalleFactura] DROP CONSTRAINT [FK_DetalleFactura_Factura]
GO
/****** Object:  Table [dbo].[Vendedor]    Script Date: 03/03/2020 3:40:22 ******/
DROP TABLE [dbo].[Vendedor]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 03/03/2020 3:40:22 ******/
DROP TABLE [dbo].[Producto]
GO
/****** Object:  Table [dbo].[Factura]    Script Date: 03/03/2020 3:40:22 ******/
DROP TABLE [dbo].[Factura]
GO
/****** Object:  Table [dbo].[DetalleFactura]    Script Date: 03/03/2020 3:40:22 ******/
DROP TABLE [dbo].[DetalleFactura]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 03/03/2020 3:40:22 ******/
DROP TABLE [dbo].[Cliente]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 03/03/2020 3:40:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cliente](
	[ClienteId] [int] NOT NULL,
	[Nombres] [varchar](50) NOT NULL,
	[Apellidos] [varchar](50) NOT NULL,
	[Nic] [varchar](12) NOT NULL,
	[Categoria] [char](1) NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[ClienteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DetalleFactura]    Script Date: 03/03/2020 3:40:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleFactura](
	[DetalleFacturaId] [int] NOT NULL,
	[FacturaId] [int] NOT NULL,
	[ProductoId] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[PrecioUnitario] [decimal](18, 5) NOT NULL,
 CONSTRAINT [PK_DetalleFactura] PRIMARY KEY CLUSTERED 
(
	[DetalleFacturaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Factura]    Script Date: 03/03/2020 3:40:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Factura](
	[FacturaId] [int] NOT NULL,
	[Serie] [varchar](3) NOT NULL,
	[Codigo] [varchar](5) NOT NULL,
	[VendedorId] [int] NOT NULL,
	[ClienteId] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[Moneda] [char](3) NOT NULL,
 CONSTRAINT [PK_Factura] PRIMARY KEY CLUSTERED 
(
	[FacturaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 03/03/2020 3:40:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Producto](
	[ProductoId] [int] NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[PrecioUnitario] [decimal](18, 5) NOT NULL,
	[Categoria] [char](2) NOT NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[ProductoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Vendedor]    Script Date: 03/03/2020 3:40:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Vendedor](
	[VendedorId] [int] NOT NULL,
	[Nombres] [varchar](50) NOT NULL,
	[Apellidos] [varchar](50) NOT NULL,
	[Dni] [char](8) NOT NULL,
	[FechaIngreso] [date] NOT NULL,
 CONSTRAINT [PK_Vendedor] PRIMARY KEY CLUSTERED 
(
	[VendedorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombres], [Apellidos], [Nic], [Categoria]) VALUES (1, N'Daniel', N'Villanueva', N'72727272', N'A')
INSERT [dbo].[Cliente] ([ClienteId], [Nombres], [Apellidos], [Nic], [Categoria]) VALUES (2, N'Juan', N'Vega', N'61616161', N'A')
INSERT [dbo].[Cliente] ([ClienteId], [Nombres], [Apellidos], [Nic], [Categoria]) VALUES (3, N'ANA', N'RODRIGUEZ', N'34322123', N'A')
INSERT [dbo].[DetalleFactura] ([DetalleFacturaId], [FacturaId], [ProductoId], [Cantidad], [PrecioUnitario]) VALUES (1, 1, 1, 5, CAST(2.50000 AS Decimal(18, 5)))
INSERT [dbo].[DetalleFactura] ([DetalleFacturaId], [FacturaId], [ProductoId], [Cantidad], [PrecioUnitario]) VALUES (2, 1, 2, 3, CAST(3.00000 AS Decimal(18, 5)))
INSERT [dbo].[DetalleFactura] ([DetalleFacturaId], [FacturaId], [ProductoId], [Cantidad], [PrecioUnitario]) VALUES (3, 2, 2, 5, CAST(3.00000 AS Decimal(18, 5)))
INSERT [dbo].[Factura] ([FacturaId], [Serie], [Codigo], [VendedorId], [ClienteId], [Fecha], [Moneda]) VALUES (1, N'001', N'01001', 1, 1, CAST(N'2020-03-01' AS Date), N'SOL')
INSERT [dbo].[Factura] ([FacturaId], [Serie], [Codigo], [VendedorId], [ClienteId], [Fecha], [Moneda]) VALUES (2, N'001', N'01002', 2, 2, CAST(N'2020-03-02' AS Date), N'SOL')
INSERT [dbo].[Factura] ([FacturaId], [Serie], [Codigo], [VendedorId], [ClienteId], [Fecha], [Moneda]) VALUES (5, N'001', N'00122', 1, 1, CAST(N'2020-02-02' AS Date), N'SOL')
INSERT [dbo].[Factura] ([FacturaId], [Serie], [Codigo], [VendedorId], [ClienteId], [Fecha], [Moneda]) VALUES (6, N'001', N'00122', 1, 1, CAST(N'2020-02-02' AS Date), N'SOL')
INSERT [dbo].[Factura] ([FacturaId], [Serie], [Codigo], [VendedorId], [ClienteId], [Fecha], [Moneda]) VALUES (8, N'001', N'00122', 1, 1, CAST(N'2020-02-02' AS Date), N'SOL')
INSERT [dbo].[Producto] ([ProductoId], [Descripcion], [PrecioUnitario], [Categoria]) VALUES (1, N'Pastilla 1', CAST(2.50000 AS Decimal(18, 5)), N'PA')
INSERT [dbo].[Producto] ([ProductoId], [Descripcion], [PrecioUnitario], [Categoria]) VALUES (2, N'Vitaminas', CAST(3.00000 AS Decimal(18, 5)), N'VT')
INSERT [dbo].[Vendedor] ([VendedorId], [Nombres], [Apellidos], [Dni], [FechaIngreso]) VALUES (1, N'Jorge', N'Vargas', N'55555555', CAST(N'2020-03-01' AS Date))
INSERT [dbo].[Vendedor] ([VendedorId], [Nombres], [Apellidos], [Dni], [FechaIngreso]) VALUES (2, N'Aldo', N'Lopez', N'45454545', CAST(N'2020-03-01' AS Date))
ALTER TABLE [dbo].[DetalleFactura]  WITH CHECK ADD  CONSTRAINT [FK_DetalleFactura_Factura] FOREIGN KEY([FacturaId])
REFERENCES [dbo].[Factura] ([FacturaId])
GO
ALTER TABLE [dbo].[DetalleFactura] CHECK CONSTRAINT [FK_DetalleFactura_Factura]
GO
ALTER TABLE [dbo].[DetalleFactura]  WITH CHECK ADD  CONSTRAINT [FK_DetalleFactura_Producto] FOREIGN KEY([ProductoId])
REFERENCES [dbo].[Producto] ([ProductoId])
GO
ALTER TABLE [dbo].[DetalleFactura] CHECK CONSTRAINT [FK_DetalleFactura_Producto]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Cliente] FOREIGN KEY([ClienteId])
REFERENCES [dbo].[Cliente] ([ClienteId])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_Cliente]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Vendedor] FOREIGN KEY([VendedorId])
REFERENCES [dbo].[Vendedor] ([VendedorId])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_Vendedor]
GO
/****** Object:  StoredProcedure [dbo].[SPI_FACTURA]    Script Date: 03/03/2020 3:40:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPI_FACTURA]
@FacturaId INT,
@Serie	varchar(3),
@Codigo VARCHAR(5),
@VendedorId INT ,
@ClienteId INT ,
@Fecha DATE ,
@Moneda VARCHAR(3),
@CantidadProductos INT,
@CantidadDetalle INT

AS 
IF @CantidadProductos > 0 AND @CantidadDetalle > 0 AND (SELECT COUNT(*) FROM Factura WHERE FacturaId = @FacturaId ) <= 0
BEGIN
	BEGIN TRANSACTION
			INSERT INTO dbo.Factura ( FacturaId ,  Serie , Codigo ,  VendedorId , ClienteId , Fecha , Moneda )
			VALUES ( @FacturaId ,  @Serie ,    @Codigo , @VendedorId ,  @ClienteId ,@Fecha , @Moneda   )
	COMMIT TRANSACTION
END
ELSE 
PRINT 0




GO
/****** Object:  StoredProcedure [dbo].[SPS_LISTA_CLIENTES_A]    Script Date: 03/03/2020 3:40:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPS_LISTA_CLIENTES_A]
AS

BEGIN
	
	SELECT ClienteId,Nombres,Apellidos,Nic,Categoria
	FROM  dbo.Cliente	
	WHERE Categoria = 'A' AND ClienteId NOT IN ( SELECT  ClienteId FROM dbo.Factura )


END

GO
/****** Object:  StoredProcedure [dbo].[SPS_LISTA_FACTURAS_EMITIDAS]    Script Date: 03/03/2020 3:40:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPS_LISTA_FACTURAS_EMITIDAS]
AS

BEGIN

	SELECT  f.FacturaId , SUM(df.PrecioUnitario * df.Cantidad) MontoFactura , f.Moneda ,
	 CONCAT(cl.Nombres , ' ' , cl.Apellidos) NombresCliente ,  CONCAT(v.Nombres , ' ' , v.Apellidos) NombresVendedor,
	 f.VendedorId , cl.ClienteId , cl.Nic , v.Dni , f.Fecha FechaFactura
	FROM  Factura  f INNER JOIN DetalleFactura df
	ON df.FacturaId = f.FacturaId
	INNER JOIN dbo.Vendedor v ON v.VendedorId = f.VendedorId
	INNER JOIN dbo.Cliente cl ON cl.ClienteId = f.ClienteId
	GROUP BY CONCAT(cl.Nombres, ' ', cl.Apellidos),
			 CONCAT(v.Nombres, ' ', v.Apellidos),
			 f.FacturaId,
			 f.Moneda,
			 f.VendedorId,
			 cl.ClienteId,
			 cl.Nic,
			 v.Dni,
			 f.Fecha
	ORDER BY MontoFactura DESC
END



GO
/****** Object:  StoredProcedure [dbo].[SPS_LISTA_PRODUCTOS]    Script Date: 03/03/2020 3:40:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPS_LISTA_PRODUCTOS]
AS

SELECT ProductoId,
       Descripcion,
       PrecioUnitario,
       Categoria 
FROM  dbo.Producto 

GO
/****** Object:  StoredProcedure [dbo].[SPS_LISTAR_VENDEDOR_POR_ANIO]    Script Date: 03/03/2020 3:40:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[SPS_LISTAR_VENDEDOR_POR_ANIO]
AS

BEGIN
	SELECT VendedorId,
		   Nombres,
		   Apellidos,
		   Dni,
		   FechaIngreso FROM  dbo.Vendedor
	WHERE DATEPART(YEAR,FechaIngreso) = 2019
END

GO
