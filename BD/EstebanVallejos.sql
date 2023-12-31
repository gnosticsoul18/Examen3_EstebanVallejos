USE [EstebanVallejos]
GO
/****** Object:  Table [dbo].[DatosEncuesta]    Script Date: 18/12/2023 20:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DatosEncuesta](
	[NumeroEncuesta] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Edad] [int] NULL,
	[Email] [varchar](50) NOT NULL,
	[PartidoP] [varchar](4) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[NumeroEncuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PartidosPoliticos]    Script Date: 18/12/2023 20:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartidosPoliticos](
	[Partido] [varchar](4) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Partido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DatosEncuesta]  WITH CHECK ADD  CONSTRAINT [FK_Partido] FOREIGN KEY([PartidoP])
REFERENCES [dbo].[PartidosPoliticos] ([Partido])
GO
ALTER TABLE [dbo].[DatosEncuesta] CHECK CONSTRAINT [FK_Partido]
GO
/****** Object:  StoredProcedure [dbo].[AgregarEncuesta]    Script Date: 18/12/2023 20:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AgregarEncuesta]
   @Nombre VARCHAR(50),
   @Edad INT,
   @Email VARCHAR(50),
   @PartidoP VARCHAR(4)
AS 
BEGIN 
   INSERT INTO DatosEncuesta (Nombre, Edad, Email, PartidoP)
   VALUES (@Nombre, @Edad, @Email, @PartidoP)
END
GO
