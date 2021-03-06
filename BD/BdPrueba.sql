USE [pruebaVia]
GO
/****** Object:  Table [dbo].[FacturaCab]    Script Date: 20/3/2022 20:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FacturaCab](
	[id_factrua] [int] NOT NULL,
	[id_compania] [int] NULL,
	[id_vendedor] [int] NULL,
	[establecimiento] [nvarchar](3) NULL,
	[puntoEmision] [nvarchar](3) NULL,
	[sucursal] [nvarchar](9) NULL,
	[fechaIngreso] [date] NULL,
	[nombreCliente] [nvarchar](100) NOT NULL,
	[direccionCliente] [nvarchar](100) NULL,
	[correoCliente] [nvarchar](100) NULL,
	[valorTotal] [int] NULL,
	[estado] [nvarchar](3) NULL,
	[fechaCreacion] [date] NULL,
 CONSTRAINT [PK_FacturaCab] PRIMARY KEY CLUSTERED 
(
	[id_factrua] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[facturaDet]    Script Date: 20/3/2022 20:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[facturaDet](
	[id_factruaDet] [int] NOT NULL,
	[id_factrua] [int] NULL,
	[cod_produto] [nvarchar](50) NULL,
	[descripcion] [nvarchar](200) NULL,
	[valorUnitario] [int] NULL,
	[estado] [nvarchar](3) NULL,
	[fechaCreacion] [date] NULL,
 CONSTRAINT [PK_facturaDet] PRIMARY KEY CLUSTERED 
(
	[id_factruaDet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblEmpresa]    Script Date: 20/3/2022 20:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmpresa](
	[id_compania] [int] NOT NULL,
	[nombreCompania] [nvarchar](100) NULL,
	[direccionEmpresa] [nvarchar](100) NULL,
	[correoEmpresa] [nvarchar](100) NULL,
	[estado] [nchar](3) NULL,
	[fechaCreacion] [date] NULL,
 CONSTRAINT [PK_tblEmpresa] PRIMARY KEY CLUSTERED 
(
	[id_compania] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblProducto]    Script Date: 20/3/2022 20:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProducto](
	[id_produto] [int] NOT NULL,
	[cod_producto] [nvarchar](50) NULL,
	[descripcion] [nvarchar](300) NULL,
	[precioUnitario] [nvarchar](100) NULL,
	[estado] [nvarchar](3) NULL,
	[fechaCreacion] [date] NULL,
 CONSTRAINT [PK_tblProducto] PRIMARY KEY CLUSTERED 
(
	[id_produto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblVendedor]    Script Date: 20/3/2022 20:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblVendedor](
	[id_vendedor] [int] NOT NULL,
	[nombreVendedor] [nvarchar](100) NULL,
	[correoVendedor] [nvarchar](100) NULL,
	[esatdo] [nvarchar](50) NULL,
	[fechaCreacion] [date] NULL,
 CONSTRAINT [PK_tblVendedor] PRIMARY KEY CLUSTERED 
(
	[id_vendedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[tblEmpresa] ([id_compania], [nombreCompania], [direccionEmpresa], [correoEmpresa], [estado], [fechaCreacion]) VALUES (1, N'AVDE', N'Mucho Lote 1', N'avde@avde.ec', N'A  ', CAST(N'2022-03-20' AS Date))
INSERT [dbo].[tblProducto] ([id_produto], [cod_producto], [descripcion], [precioUnitario], [estado], [fechaCreacion]) VALUES (1, N'EC824', N'RESMAS DE PAPEL', N'03.00', N'A', CAST(N'2022-03-20' AS Date))
INSERT [dbo].[tblProducto] ([id_produto], [cod_producto], [descripcion], [precioUnitario], [estado], [fechaCreacion]) VALUES (2, N'EC456', N'Pluma big', N'00.30', N'A', CAST(N'2022-03-20' AS Date))
INSERT [dbo].[tblProducto] ([id_produto], [cod_producto], [descripcion], [precioUnitario], [estado], [fechaCreacion]) VALUES (3, N'EC567', N'Cuaderno Universitario', N'01.50', N'A', CAST(N'2022-03-20' AS Date))
INSERT [dbo].[tblProducto] ([id_produto], [cod_producto], [descripcion], [precioUnitario], [estado], [fechaCreacion]) VALUES (4, N'EC123', N'Borrador de queso', N'00.25', N'A', CAST(N'2022-03-20' AS Date))
INSERT [dbo].[tblProducto] ([id_produto], [cod_producto], [descripcion], [precioUnitario], [estado], [fechaCreacion]) VALUES (5, N'EC789', N'paquete tempera', N'02.50', N'A', CAST(N'2022-03-20' AS Date))
INSERT [dbo].[tblVendedor] ([id_vendedor], [nombreVendedor], [correoVendedor], [esatdo], [fechaCreacion]) VALUES (1, N'ADelgado', N'Adelgado@avde.ec', N'A', CAST(N'2022-03-20' AS Date))
ALTER TABLE [dbo].[FacturaCab]  WITH CHECK ADD  CONSTRAINT [FK_FacturaCab_empres] FOREIGN KEY([id_compania])
REFERENCES [dbo].[tblEmpresa] ([id_compania])
GO
ALTER TABLE [dbo].[FacturaCab] CHECK CONSTRAINT [FK_FacturaCab_empres]
GO
ALTER TABLE [dbo].[FacturaCab]  WITH CHECK ADD  CONSTRAINT [FK_FacturaCab_tblVendedor] FOREIGN KEY([id_vendedor])
REFERENCES [dbo].[tblVendedor] ([id_vendedor])
GO
ALTER TABLE [dbo].[FacturaCab] CHECK CONSTRAINT [FK_FacturaCab_tblVendedor]
GO
ALTER TABLE [dbo].[facturaDet]  WITH CHECK ADD  CONSTRAINT [FK_facturaDet_FacturaCab] FOREIGN KEY([id_factrua])
REFERENCES [dbo].[FacturaCab] ([id_factrua])
GO
ALTER TABLE [dbo].[facturaDet] CHECK CONSTRAINT [FK_facturaDet_FacturaCab]
GO
/****** Object:  StoredProcedure [dbo].[sp_consulta_factruadet]    Script Date: 20/3/2022 20:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_consulta_factruadet]
	
	@id_factruaDet nvarchar(100) = NULL,
	@id_factrua nvarchar(100) = NULL,
	@cod_produto nvarchar(100) = NULL,
	@descripcion nvarchar(100) = NULL,
	@valorUnitario nvarchar(100) = NULL,
	@estado nvarchar(100) = NULL,
	@fechaCreacion nvarchar(100) = NULL

AS
BEGIN
	SELECT [id_factruaDet]
		  ,[id_factrua]
		  ,[cod_produto]
		  ,[descripcion]
		  ,[valorUnitario]
		  ,[estado]
		  ,[fechaCreacion]
	FROM [dbo].[facturaDet]
	WHERE
		[id_factruaDet] = CASE WHEN @id_factruaDet = 0 OR  @id_factruaDet IS NULL THEN  id_factruaDet ELSE @id_factruaDet END
		AND [id_factrua] = CASE WHEN @id_factrua = 0 OR  @id_factrua IS NULL THEN  id_factrua ELSE @id_factrua END
		AND [cod_produto] = CASE WHEN @cod_produto = 0 OR  @cod_produto IS NULL THEN  cod_produto ELSE @cod_produto END
		AND [estado] = CASE WHEN @estado = 0 OR  @estado IS NULL THEN  estado ELSE @estado END

END

GO
/****** Object:  StoredProcedure [dbo].[sp_consulta_facturacab]    Script Date: 20/3/2022 20:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_consulta_facturacab]
	
	@id_factrua nvarchar(100) = NULL,
	@id_compania nvarchar(100) = NULL,
	@establecimiento nvarchar(100) = NULL,
	@puntoEmision nvarchar(100) = NULL,
	@sucursal nvarchar(100) = NULL,
	@nombreCliente nvarchar(100) = NULL

AS
BEGIN

	SELECT [id_factrua]
		  ,[id_compania]
		  ,[id_vendedor]
		  ,[establecimiento]
		  ,[puntoEmision]
		  ,[sucursal]
		  ,[fechaIngreso]
		  ,[nombreCliente]
		  ,[direccionCliente]
		  ,[correoCliente]
		  ,[valorTotal]
		  ,[estado]
		  ,[fechaCreacion]
	FROM [dbo].[FacturaCab]
	WHERE
		[id_factrua] = CASE WHEN @id_factrua = 0 OR  @id_factrua IS NULL THEN  id_factrua ELSE @id_factrua END
		AND [id_compania] = CASE WHEN @id_compania = 0 OR  @id_compania IS NULL THEN  id_compania ELSE @id_compania END
		AND [establecimiento] = CASE WHEN @establecimiento = 0 OR  @establecimiento IS NULL THEN  establecimiento ELSE @establecimiento END
		AND [puntoEmision] = CASE WHEN @puntoEmision = 0 OR  @puntoEmision IS NULL THEN  puntoEmision ELSE @puntoEmision END
		AND [sucursal] = CASE WHEN @sucursal = 0 OR  @sucursal IS NULL THEN  sucursal ELSE @sucursal END
		AND [nombreCliente] = CASE WHEN @nombreCliente = 0 OR  @nombreCliente IS NULL THEN  nombreCliente ELSE @nombreCliente END
	
END

GO
/****** Object:  StoredProcedure [dbo].[sp_consulta_producto]    Script Date: 20/3/2022 20:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_consulta_producto]
	
	@id_produto nvarchar(100) = NULL,
	@cod_producto  nvarchar(100) = NULL,
	@estado  nvarchar(100) = NULL

AS
BEGIN
	SELECT [id_produto]
		  ,[cod_producto]
		  ,[descripcion]
		  ,[precioUnitario]
		  ,[estado]
		  ,[fechaCreacion]
    FROM [dbo].[tblProducto]
	WHERE
		 [id_produto] = CASE WHEN @id_produto = 0 OR  @id_produto IS NULL THEN  id_produto ELSE @id_produto END
		 AND [cod_producto] = CASE WHEN @cod_producto = 0 OR  @cod_producto IS NULL THEN  cod_producto ELSE @cod_producto END
		 AND [estado] = CASE WHEN @estado = 0 OR  @estado IS NULL THEN  estado ELSE @estado END
END

GO
/****** Object:  StoredProcedure [dbo].[sp_ingresa_facturacab]    Script Date: 20/3/2022 20:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ingresa_facturacab]
	
	@id_factrua nvarchar(100) = NULL,
	@id_compania nvarchar(100) = NULL,
	@id_vendedor nvarchar(100) = NULL,
	@establecimiento nvarchar(100) = NULL,
	@puntoEmision nvarchar(100) = NULL,
	@sucursal nvarchar(100) = NULL,
	@fechaIngreso nvarchar(100) = NULL,
	@nombreCliente nvarchar(100) = NULL,
	@direccionCliente nvarchar(100) = NULL,
	@correoCliente nvarchar(100) = NULL,
	@valorTotal nvarchar(100) = NULL,
	@estado nvarchar(100) = NULL,
	@fechaCreacion nvarchar(100) = NULL

AS
BEGIN

	BEGIN TRY
		IF NOT EXISTS(SELECT [id_factrua] FROM [FacturaCab] WHERE [id_factrua] = @id_factrua)
		BEGIN
			INSERT INTO [dbo].[FacturaCab]
							 ([id_factrua]
							 ,[id_compania]
							 ,[id_vendedor]
							 ,[establecimiento]
							 ,[puntoEmision]
							 ,[sucursal]
							 ,[fechaIngreso]
							 ,[nombreCliente]
							 ,[direccionCliente]
							 ,[correoCliente]
							 ,[valorTotal]
							 ,[estado]
							 ,[fechaCreacion])
						VALUES
							 (@id_factrua 
							 ,@id_compania
							 ,@id_vendedor
							 ,@establecimiento
							 ,@puntoEmision
							 ,@sucursal
							 ,@fechaIngreso
							 ,@nombreCliente
							 ,@direccionCliente
							 ,@correoCliente
							 ,@valorTotal
							 ,'A'
							 ,CONVERT(date,GETDATE(),103))
		END
		ELSE
		BEGIN
			UPDATE [dbo].[FacturaCab]
					SET [id_compania] = CASE WHEN @id_compania = 0 OR  @id_compania IS NULL THEN  id_compania ELSE @id_compania END
					   ,[id_vendedor] = CASE WHEN @id_vendedor = 0 OR  @id_vendedor IS NULL THEN  id_vendedor ELSE @id_vendedor END
					   ,[establecimiento] = CASE WHEN @establecimiento = 0 OR  @establecimiento IS NULL THEN  establecimiento ELSE @establecimiento END
					   ,[puntoEmision] = CASE WHEN @puntoEmision = 0 OR  @puntoEmision IS NULL THEN  puntoEmision ELSE @puntoEmision END
					   ,[sucursal] = CASE WHEN @sucursal = 0 OR  @sucursal IS NULL THEN  sucursal ELSE @sucursal END
					   ,[fechaIngreso] = CASE WHEN @fechaIngreso = 0 OR  @fechaIngreso IS NULL THEN  fechaIngreso ELSE @fechaIngreso END
					   ,[nombreCliente] = CASE WHEN @nombreCliente = 0 OR  @nombreCliente IS NULL THEN  nombreCliente ELSE @nombreCliente END
					   ,[direccionCliente] = CASE WHEN @direccionCliente = 0 OR  @direccionCliente IS NULL THEN  direccionCliente ELSE @direccionCliente END
					   ,[correoCliente] = CASE WHEN @correoCliente = 0 OR  @correoCliente IS NULL THEN  correoCliente ELSE @correoCliente END
					   ,[valorTotal] = CASE WHEN @valorTotal = 0 OR  @valorTotal IS NULL THEN  valorTotal ELSE @valorTotal END
					   ,[estado] = CASE WHEN @estado = 0 OR  @estado IS NULL THEN  estado ELSE @estado END
			WHERE 
					[id_factrua] = @id_factrua
		END
		SELECT '00' AS CODERROR, 'Correcto' as MENSAJE
	END TRY
	BEGIN CATCH
		SELECT '01' AS CODERROR, ERROR_MESSAGE() as MENSAJE
	END CATCH

	
	
END

GO
/****** Object:  StoredProcedure [dbo].[sp_ingresar_producto]    Script Date: 20/3/2022 20:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ingresar_producto]
	
	@id_produto nvarchar(100) = NULL,
	@cod_producto nvarchar(100) = NULL,
	@descripcion nvarchar(100) = NULL,
	@precioUnitario nvarchar(100) = NULL,
	@estado nvarchar(100) = NULL,
	@fechaCreacion nvarchar(100) = NULL

AS
BEGIN
	BEGIN TRY
		IF NOT EXISTS(SELECT [id_produto] FROM [tblProducto] WHERE [id_produto] = @id_produto)
		BEGIN
			INSERT INTO [dbo].[tblProducto]
							 ([id_produto]
							 ,[cod_producto]
							 ,[descripcion]
							 ,[precioUnitario]
							 ,[estado]
							 ,[fechaCreacion])
					VALUES
							 ((SELECT ISNULL(MAX([id_produto]),0) + 1 FROM [tblProducto])
							 ,@cod_producto
							 ,@descripcion
							 ,@precioUnitario
							 ,'A'
							 ,CONVERT(date,GETDATE(),103))
		END
		ELSE
		BEGIN
			UPDATE [dbo].[tblProducto]
					 SET [cod_producto] = CASE WHEN @cod_producto = 0 OR  @cod_producto IS NULL THEN  cod_producto ELSE @cod_producto END
					    ,[descripcion] = CASE WHEN @descripcion = 0 OR  @descripcion IS NULL THEN  descripcion ELSE @descripcion END
						,[precioUnitario] = CASE WHEN @precioUnitario = 0 OR  @precioUnitario IS NULL THEN  precioUnitario ELSE @precioUnitario END
					    ,[estado] = CASE WHEN @estado = 0 OR  @estado IS NULL THEN  estado ELSE @estado END
				   WHERE 
						[id_produto] = @id_produto
		END
	END TRY
	BEGIN CATCH
	END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[sp_insertar_facturadet]    Script Date: 20/3/2022 20:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_insertar_facturadet]
	
	@id_factruaDet nvarchar(100) = NULL,
	@id_factrua nvarchar(100) = NULL,
	@cod_produto nvarchar(100) = NULL,
	@descripcion nvarchar(100) = NULL,
	@valorUnitario nvarchar(100) = NULL,
	@estado nvarchar(100) = NULL

AS
BEGIN
	BEGIN TRY
		IF NOT EXISTS (SELECT [id_factruaDet] FROM [facturaDet] WHERE [id_factruaDet] = @id_factruaDet)
		BEGIN
			INSERT INTO [dbo].[facturaDet]
							 ([id_factruaDet]
							 ,[id_factrua]
							 ,[cod_produto]
							 ,[descripcion]
							 ,[valorUnitario]
							 ,[estado]
							 ,[fechaCreacion])
					VALUES
							 (@id_factruaDet
							 ,@id_factrua
							 ,@cod_produto
							 ,@descripcion
							 ,@valorUnitario
							 ,'A'
							 ,CONVERT(date,GETDATE(),103))
		END
		ELSE
		BEGIN
			UPDATE [dbo].[facturaDet]
					 SET [cod_produto] = CASE WHEN @cod_produto = 0 OR  @cod_produto IS NULL THEN  cod_produto ELSE @cod_produto END
					    ,[descripcion] = CASE WHEN @descripcion = 0 OR  @descripcion IS NULL THEN  descripcion ELSE @descripcion END
					    ,[valorUnitario] = CASE WHEN @valorUnitario = 0 OR  @valorUnitario IS NULL THEN  valorUnitario ELSE @valorUnitario END
					    ,[estado] = CASE WHEN @estado = 0 OR  @estado IS NULL THEN  estado ELSE @estado END
			WHERE 
				[id_factruaDet] = @id_factruaDet
		END
		SELECT '00' AS CODERROR, 'CORRERTO' AS MENSAJE
	END TRY
	BEGIN CATCH
		SELECT '01' AS CODERROR, ERROR_MESSAGE() AS MENSAJE
	END CATCH
END

GO
