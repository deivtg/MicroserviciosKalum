USE [master]
GO
/****** Object:  Database [kalum_test]    Script Date: 9/07/2022 06:10:52 ******/
CREATE DATABASE [kalum_test]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'kalum_test', FILENAME = N'/var/opt/mssql/data/kalum_test.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'kalum_test_log', FILENAME = N'/var/opt/mssql/data/kalum_test_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [kalum_test] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [kalum_test].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [kalum_test] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [kalum_test] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [kalum_test] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [kalum_test] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [kalum_test] SET ARITHABORT OFF 
GO
ALTER DATABASE [kalum_test] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [kalum_test] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [kalum_test] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [kalum_test] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [kalum_test] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [kalum_test] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [kalum_test] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [kalum_test] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [kalum_test] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [kalum_test] SET  ENABLE_BROKER 
GO
ALTER DATABASE [kalum_test] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [kalum_test] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [kalum_test] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [kalum_test] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [kalum_test] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [kalum_test] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [kalum_test] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [kalum_test] SET RECOVERY FULL 
GO
ALTER DATABASE [kalum_test] SET  MULTI_USER 
GO
ALTER DATABASE [kalum_test] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [kalum_test] SET DB_CHAINING OFF 
GO
ALTER DATABASE [kalum_test] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [kalum_test] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [kalum_test] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [kalum_test] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'kalum_test', N'ON'
GO
ALTER DATABASE [kalum_test] SET QUERY_STORE = OFF
GO
USE [kalum_test]
GO
/****** Object:  UserDefinedFunction [dbo].[LPAD]    Script Date: 9/07/2022 06:10:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[LPAD]
(
	@string VARCHAR(MAX),
	@length INT,
	@pad CHAR
)
RETURNS VARCHAR(MAX)
AS
BEGIN
	RETURN REPLICATE(@pad, @length - LEN(@string)) + @string
END
GO
/****** Object:  UserDefinedFunction [dbo].[RPAD]    Script Date: 9/07/2022 06:10:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[RPAD]
(
	@string VARCHAR(MAX),
	@length INT,
	@pad CHAR
)
RETURNS VARCHAR(MAX)
AS
BEGIN
	RETURN @string + REPLICATE(@pad, @length - LEN(@string))
END
GO
/****** Object:  Table [dbo].[ExamenAdmision]    Script Date: 9/07/2022 06:10:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamenAdmision](
	[ExamenId] [varchar](128) NOT NULL,
	[FechaExamen] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ExamenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarreraTecnica]    Script Date: 9/07/2022 06:10:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarreraTecnica](
	[CarreraId] [varchar](128) NOT NULL,
	[Nombre] [varchar](128) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CarreraId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Aspirante]    Script Date: 9/07/2022 06:10:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aspirante](
	[NoExpediente] [varchar](128) NOT NULL,
	[Apellidos] [varchar](128) NOT NULL,
	[Nombres] [varchar](128) NOT NULL,
	[Direccion] [varchar](128) NOT NULL,
	[Telefono] [varchar](64) NOT NULL,
	[Email] [varchar](128) NOT NULL,
	[Estatus] [varchar](32) NULL,
	[ExamenId] [varchar](128) NOT NULL,
	[CarreraId] [varchar](128) NOT NULL,
	[JornadaId] [varchar](128) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[NoExpediente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_ListarAspirantesPorFechaExamen]    Script Date: 9/07/2022 06:10:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_ListarAspirantesPorFechaExamen]
AS
	SELECT
		A.NoExpediente
		, A.Apellidos
		, A.Nombres
		, EA.FechaExamen
		, CT.CarreraTecnica
		, A.Estatus
	FROM Aspirante A
	INNER JOIN ExamenAdmision EA ON A.ExamenId = EA.ExamenId
	INNER JOIN CarreraTecnica CT ON A.CarreraId = CT.CarreraId
GO
/****** Object:  Table [dbo].[Alumno]    Script Date: 9/07/2022 06:10:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alumno](
	[Carne] [varchar](8) NOT NULL,
	[Apellidos] [varchar](128) NULL,
	[Nombres] [varchar](128) NULL,
	[Direccion] [varchar](128) NULL,
	[Telefono] [varchar](64) NULL,
	[Email] [varchar](64) NULL,
PRIMARY KEY CLUSTERED 
(
	[Carne] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cargo]    Script Date: 9/07/2022 06:10:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cargo](
	[CargoId] [varchar](128) NOT NULL,
	[Descripcion] [varchar](128) NOT NULL,
	[Prefijo] [varchar](64) NOT NULL,
	[Monto] [decimal](10, 2) NOT NULL,
	[GeneraMora] [bit] NULL,
	[PorcentajeMora] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CargoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CuentaPorCobrar]    Script Date: 9/07/2022 06:10:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CuentaPorCobrar](
	[Codigo] [varchar](128) NOT NULL,
	[Anio] [varchar](4) NOT NULL,
	[Carne] [varchar](8) NOT NULL,
	[CargoId] [varchar](128) NOT NULL,
	[Descripcion] [varchar](128) NOT NULL,
	[FechaCargo] [datetime] NOT NULL,
	[FechaAplica] [datetime] NOT NULL,
	[Monto] [decimal](10, 2) NOT NULL,
	[Mora] [decimal](10, 2) NOT NULL,
	[Descuento] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC,
	[Anio] ASC,
	[Carne] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inscripcion]    Script Date: 9/07/2022 06:10:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inscripcion](
	[InscripcionId] [varchar](128) NOT NULL,
	[Carne] [varchar](8) NOT NULL,
	[CarreraId] [varchar](128) NOT NULL,
	[JornadaId] [varchar](128) NOT NULL,
	[Ciclo] [varchar](4) NOT NULL,
	[FechaInscripcion] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[InscripcionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InscripcionPago]    Script Date: 9/07/2022 06:10:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InscripcionPago](
	[BoletaPago] [varchar](128) NOT NULL,
	[NoExpediente] [varchar](128) NOT NULL,
	[Anio] [varchar](4) NOT NULL,
	[FechaPago] [datetime] NOT NULL,
	[Monto] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BoletaPago] ASC,
	[NoExpediente] ASC,
	[Anio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InversionCarreraTecnica]    Script Date: 9/07/2022 06:10:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InversionCarreraTecnica](
	[InversionId] [varchar](128) NOT NULL,
	[CarreraId] [varchar](128) NOT NULL,
	[MontoInscripcion] [decimal](10, 2) NOT NULL,
	[NumeroPagos] [int] NULL,
	[MontoPago] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[InversionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Jornada]    Script Date: 9/07/2022 06:10:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jornada](
	[JornadaId] [varchar](128) NOT NULL,
	[NombreCorto] [varchar](2) NOT NULL,
	[Descripcion] [varchar](128) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[JornadaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResultadoExamenAdmision]    Script Date: 9/07/2022 06:10:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResultadoExamenAdmision](
	[NoExpediente] [varchar](128) NOT NULL,
	[Anio] [varchar](4) NOT NULL,
	[Descripcion] [varchar](128) NOT NULL,
	[Nota] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[NoExpediente] ASC,
	[Anio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Aspirante] ADD  DEFAULT ('NO ASIGNADO') FOR [Estatus]
GO
ALTER TABLE [dbo].[Aspirante]  WITH CHECK ADD  CONSTRAINT [FK_ASPIRANTE_CARRERA_TECNICA] FOREIGN KEY([CarreraId])
REFERENCES [dbo].[CarreraTecnica] ([CarreraId])
GO
ALTER TABLE [dbo].[Aspirante] CHECK CONSTRAINT [FK_ASPIRANTE_CARRERA_TECNICA]
GO
ALTER TABLE [dbo].[Aspirante]  WITH CHECK ADD  CONSTRAINT [FK_ASPIRANTE_EXAMEN_ADMISION] FOREIGN KEY([ExamenId])
REFERENCES [dbo].[ExamenAdmision] ([ExamenId])
GO
ALTER TABLE [dbo].[Aspirante] CHECK CONSTRAINT [FK_ASPIRANTE_EXAMEN_ADMISION]
GO
ALTER TABLE [dbo].[Aspirante]  WITH CHECK ADD  CONSTRAINT [FK_ASPIRANTE_JORNADA] FOREIGN KEY([JornadaId])
REFERENCES [dbo].[Jornada] ([JornadaId])
GO
ALTER TABLE [dbo].[Aspirante] CHECK CONSTRAINT [FK_ASPIRANTE_JORNADA]
GO
ALTER TABLE [dbo].[CuentaPorCobrar]  WITH CHECK ADD  CONSTRAINT [FK_CUENTAS_POR_COBRAR_ALUMNO] FOREIGN KEY([Carne])
REFERENCES [dbo].[Alumno] ([Carne])
GO
ALTER TABLE [dbo].[CuentaPorCobrar] CHECK CONSTRAINT [FK_CUENTAS_POR_COBRAR_ALUMNO]
GO
ALTER TABLE [dbo].[CuentaPorCobrar]  WITH CHECK ADD  CONSTRAINT [FK_CUENTAS_POR_COBRAR_CARGO] FOREIGN KEY([CargoId])
REFERENCES [dbo].[Cargo] ([CargoId])
GO
ALTER TABLE [dbo].[CuentaPorCobrar] CHECK CONSTRAINT [FK_CUENTAS_POR_COBRAR_CARGO]
GO
ALTER TABLE [dbo].[Inscripcion]  WITH CHECK ADD  CONSTRAINT [FK_INSCRIPCION_ALUMNO] FOREIGN KEY([Carne])
REFERENCES [dbo].[Alumno] ([Carne])
GO
ALTER TABLE [dbo].[Inscripcion] CHECK CONSTRAINT [FK_INSCRIPCION_ALUMNO]
GO
ALTER TABLE [dbo].[Inscripcion]  WITH CHECK ADD  CONSTRAINT [FK_INSCRIPCION_CARRERA_TECNICA] FOREIGN KEY([CarreraId])
REFERENCES [dbo].[CarreraTecnica] ([CarreraId])
GO
ALTER TABLE [dbo].[Inscripcion] CHECK CONSTRAINT [FK_INSCRIPCION_CARRERA_TECNICA]
GO
ALTER TABLE [dbo].[Inscripcion]  WITH CHECK ADD  CONSTRAINT [FK_INSCRIPCION_JORNADA] FOREIGN KEY([JornadaId])
REFERENCES [dbo].[Jornada] ([JornadaId])
GO
ALTER TABLE [dbo].[Inscripcion] CHECK CONSTRAINT [FK_INSCRIPCION_JORNADA]
GO
ALTER TABLE [dbo].[InscripcionPago]  WITH CHECK ADD  CONSTRAINT [FK_INSCRIPCION_PAGO_ASPIRANTE] FOREIGN KEY([NoExpediente])
REFERENCES [dbo].[Aspirante] ([NoExpediente])
GO
ALTER TABLE [dbo].[InscripcionPago] CHECK CONSTRAINT [FK_INSCRIPCION_PAGO_ASPIRANTE]
GO
ALTER TABLE [dbo].[InversionCarreraTecnica]  WITH CHECK ADD  CONSTRAINT [FK_INVERSION_CARRERA_TECNICA_CARRERA_TECNICA] FOREIGN KEY([CarreraId])
REFERENCES [dbo].[CarreraTecnica] ([CarreraId])
GO
ALTER TABLE [dbo].[InversionCarreraTecnica] CHECK CONSTRAINT [FK_INVERSION_CARRERA_TECNICA_CARRERA_TECNICA]
GO
ALTER TABLE [dbo].[ResultadoExamenAdmision]  WITH CHECK ADD  CONSTRAINT [FK_RESULTADO_EXAMEN_ADMISION_ASPIRANTE] FOREIGN KEY([NoExpediente])
REFERENCES [dbo].[Aspirante] ([NoExpediente])
GO
ALTER TABLE [dbo].[ResultadoExamenAdmision] CHECK CONSTRAINT [FK_RESULTADO_EXAMEN_ADMISION_ASPIRANTE]
GO
/****** Object:  StoredProcedure [dbo].[sp_EnrollmentProcess]    Script Date: 9/07/2022 06:10:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EnrollmentProcess] @NoExpediente VARCHAR(12), @Ciclo VARCHAR(4), @MesInicioPago INT, @CarreraId VARCHAR(128)
AS
BEGIN
	---Variables para informacion de aspirantes
	DECLARE @Apellidos VARCHAR(128)
	DECLARE @Nombres VARCHAR(128)
	DECLARE @Direccion VARCHAR(128)
	DECLARE @Telefono VARCHAR(64)
	DECLARE @Email VARCHAR(64)
	DECLARE @JornadaId VARCHAR(128)
	---Variables para generar numero de carne
	DECLARE @Exist INT
	DECLARE @Carne VARCHAR(12)
	---Variables para generar proceso de pago
	DECLARE @MontoInscripcion NUMERIC(10,2)
	DECLARE @NumeroPagos INT
	DECLARE @MontoPago NUMERIC(10,2)
	DECLARE @Descripcion VARCHAR(128)
	DECLARE @Prefijo VARCHAR(6)
	DECLARE @CargoId VARCHAR(128)
	DECLARE @Monto NUMERIC(10,2)
	DECLARE @CorrelativoPagos INT
	---Inicio de transaccion
	BEGIN TRANSACTION
	BEGIN TRY
		SELECT 
			@Apellidos = apellidos
			, @Nombres = a.Nombres
			, @Direccion = a.Direccion
			, @Telefono = a.Telefono
			, @Email = a.Email
			, @JornadaId = a.JornadaId
		FROM Aspirante a 
		WHERE a.NoExpediente = @NoExpediente

		SET @Exist = (SELECT TOP 1
							a.Carne
						FROM Alumno a
						WHERE SUBSTRING(a.Carne, 1, 4) = @Ciclo ORDER BY a.Carne DESC)

		IF @Exist IS NULL
		BEGIN
			SET @Carne = (@Ciclo * 10000) + 1
		END
		ELSE
		BEGIN
			SET @Carne = (SELECT TOP 1
								a.Carne
							FROM Alumno a
							WHERE SUBSTRING(a.Carne, 1, 4) = @Ciclo ORDER BY a.Carne DESC) + 1
		END

		INSERT INTO Alumno VALUES(@Carne, @Apellidos, @Nombres, @Direccion, @Telefono, CONCAT(@Carne, @Email))

		INSERT INTO Inscripcion VALUES(NEWID(), @Carne, @CarreraId, @JornadaId, @Ciclo, GETDATE())

		UPDATE Aspirante SET Estatus = 'INSCRITO CICLO ' + @Ciclo WHERE NoExpediente = @NoExpediente

		SELECT 
			@MontoInscripcion = ict.MontoInscripcion
			, @NumeroPagos = ict.NumeroPagos
			, @MontoPago = ict.MontoPago
		FROM InversionCarreraTecnica ict
		WHERE ict.CarreraId = @CarreraId

		SELECT
			@CargoId = c.CargoId
			, @Descripcion = c.Descripcion
			, @Prefijo = c.Prefijo
		FROM Cargo c
		WHERE c.CargoId = '2A43A20E-BAFA-4627-8B7E-DE2875C55AF7'

		INSERT INTO CuentaPorCobrar VALUES(CONCAT(@Prefijo, SUBSTRING(@Ciclo, 3, 2), dbo.LPAD('1', 2, '0')), @Ciclo, @Carne, @CargoId, @Descripcion, GETDATE(), GETDATE(), @MontoInscripcion, 0, 0)

		SELECT
			@CargoId = c.CargoId
			, @Descripcion = c.Descripcion
			, @Prefijo = c.Prefijo
			, @Monto = c.Monto
		FROM Cargo c
		WHERE c.CargoId = 'B33FEC90-5A9F-46DF-977F-8A4D40447A8B'

		INSERT INTO CuentaPorCobrar VALUES(CONCAT(@Prefijo, SUBSTRING(@Ciclo, 3, 2), dbo.LPAD('1', 2, '0')), @Ciclo, @Carne, @CargoId, @Descripcion, GETDATE(), GETDATE(), @Monto, 0, 0)

		---Cargos Mensuales
		SET @CorrelativoPagos = 1

		SELECT @Descripcion = Descripcion, @Prefijo = Prefijo FROM Cargo c WHERE c.CargoId = '6C50E05B-342A-4F22-BD5D-917BEBD3D516'

		WHILE(@CorrelativoPagos <= @NumeroPagos)
		BEGIN
			INSERT INTO CuentaPorCobrar VALUES(CONCAT(@Prefijo, SUBSTRING(@Ciclo, 3, 2), dbo.LPAD(@CorrelativoPagos, 2, '0')), @Ciclo, @Carne, @CargoId, @Descripcion, GETDATE(), CONCAT(@Ciclo, '-', dbo.LPAD(@MesInicioPago, 2, '0'), '-', '05'), @MontoPago, 0, 0)
			SET @CorrelativoPagos = @CorrelativoPagos + 1
			SET @MesInicioPago = @MesInicioPago + 1
		END

		COMMIT TRANSACTION
		SELECT 'TRANSACTION SUCCESS' AS status, @Carne AS carne
	END TRY
	BEGIN CATCH
		
		--SELECT
  --          ERROR_NUMBER() AS ErrorNumber
  --          ,ERROR_SEVERITY() AS ErrorSeverity
  --          ,ERROR_STATE() AS ErrorState
  --          ,ERROR_PROCEDURE() AS ErrorProcedure
  --          ,ERROR_LINE() AS ErrorLine
  --          ,ERROR_MESSAGE() AS ErrorMessage;

		ROLLBACK TRANSACTION
		SELECT 'TRANSACTION ERROR' AS status, 0 AS carne
	END CATCH
END
GO
USE [master]
GO
ALTER DATABASE [kalum_test] SET  READ_WRITE 
GO
