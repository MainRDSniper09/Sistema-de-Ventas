USE [master]
GO
/****** Object:  Database [DBventa]    Script Date: 15/09/2024 12:43:11 p. m. ******/
CREATE DATABASE [DBventa]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBventa', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\DBventa.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBventa_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\DBventa_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DBventa] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBventa].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBventa] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBventa] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBventa] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBventa] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBventa] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBventa] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBventa] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBventa] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBventa] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBventa] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBventa] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBventa] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBventa] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBventa] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBventa] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DBventa] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBventa] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBventa] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBventa] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBventa] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBventa] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBventa] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBventa] SET RECOVERY FULL 
GO
ALTER DATABASE [DBventa] SET  MULTI_USER 
GO
ALTER DATABASE [DBventa] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBventa] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBventa] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBventa] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBventa] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBventa] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DBventa', N'ON'
GO
ALTER DATABASE [DBventa] SET QUERY_STORE = ON
GO
ALTER DATABASE [DBventa] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DBventa]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 15/09/2024 12:43:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[idCategoria] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[esActivo] [bit] NULL,
	[fechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleVenta]    Script Date: 15/09/2024 12:43:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleVenta](
	[idDetalleVenta] [int] IDENTITY(1,1) NOT NULL,
	[idVenta] [int] NULL,
	[idProducto] [int] NULL,
	[cantidad] [int] NULL,
	[precio] [decimal](10, 2) NULL,
	[total] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[idDetalleVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 15/09/2024 12:43:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[idMenu] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[icono] [varchar](50) NULL,
	[url] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuRol]    Script Date: 15/09/2024 12:43:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuRol](
	[idMenuRol] [int] IDENTITY(1,1) NOT NULL,
	[ideMenu] [int] NULL,
	[idRol] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idMenuRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NumeroDocumento]    Script Date: 15/09/2024 12:43:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NumeroDocumento](
	[idNumeroDocumento] [int] IDENTITY(1,1) NOT NULL,
	[ultimo_Numero] [int] NOT NULL,
	[fechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idNumeroDocumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 15/09/2024 12:43:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[idProducto] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NULL,
	[idCategoria] [int] NULL,
	[stock] [int] NULL,
	[precio] [decimal](10, 2) NULL,
	[esActivo] [bit] NULL,
	[fechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 15/09/2024 12:43:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[idRol] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[fecharegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 15/09/2024 12:43:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[nombreCompleto] [varchar](100) NULL,
	[correo] [varchar](40) NULL,
	[idRol] [int] NULL,
	[clave] [varchar](40) NULL,
	[esActivo] [bit] NULL,
	[fechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 15/09/2024 12:43:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[idVenta] [int] IDENTITY(1,1) NOT NULL,
	[numeroDocumento] [varchar](40) NULL,
	[tipoPago] [varchar](50) NULL,
	[total] [decimal](10, 2) NULL,
	[fechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Categoria] ADD  DEFAULT ((1)) FOR [esActivo]
GO
ALTER TABLE [dbo].[Categoria] ADD  DEFAULT (getdate()) FOR [fechaRegistro]
GO
ALTER TABLE [dbo].[NumeroDocumento] ADD  DEFAULT (getdate()) FOR [fechaRegistro]
GO
ALTER TABLE [dbo].[Producto] ADD  DEFAULT ((1)) FOR [esActivo]
GO
ALTER TABLE [dbo].[Producto] ADD  DEFAULT (getdate()) FOR [fechaRegistro]
GO
ALTER TABLE [dbo].[Rol] ADD  DEFAULT (getdate()) FOR [fecharegistro]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((1)) FOR [esActivo]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT (getdate()) FOR [fechaRegistro]
GO
ALTER TABLE [dbo].[Venta] ADD  DEFAULT (getdate()) FOR [fechaRegistro]
GO
ALTER TABLE [dbo].[DetalleVenta]  WITH CHECK ADD FOREIGN KEY([idProducto])
REFERENCES [dbo].[Producto] ([idProducto])
GO
ALTER TABLE [dbo].[DetalleVenta]  WITH CHECK ADD FOREIGN KEY([idVenta])
REFERENCES [dbo].[Venta] ([idVenta])
GO
ALTER TABLE [dbo].[MenuRol]  WITH CHECK ADD FOREIGN KEY([ideMenu])
REFERENCES [dbo].[Menu] ([idMenu])
GO
ALTER TABLE [dbo].[MenuRol]  WITH CHECK ADD FOREIGN KEY([idRol])
REFERENCES [dbo].[Rol] ([idRol])
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD FOREIGN KEY([idCategoria])
REFERENCES [dbo].[Categoria] ([idCategoria])
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD FOREIGN KEY([idRol])
REFERENCES [dbo].[Rol] ([idRol])
GO
USE [master]
GO
ALTER DATABASE [DBventa] SET  READ_WRITE 
GO
