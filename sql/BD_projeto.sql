USE [master]
GO
/****** Object:  Database [p4g10]    Script Date: 12/06/2020 23:13:20 ******/
CREATE DATABASE [p4g10]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'p4g10', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLSERVER\MSSQL\DATA\p4g10.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'p4g10_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLSERVER\MSSQL\DATA\p4g10_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [p4g10] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [p4g10].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [p4g10] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [p4g10] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [p4g10] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [p4g10] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [p4g10] SET ARITHABORT OFF 
GO
ALTER DATABASE [p4g10] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [p4g10] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [p4g10] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [p4g10] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [p4g10] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [p4g10] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [p4g10] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [p4g10] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [p4g10] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [p4g10] SET  ENABLE_BROKER 
GO
ALTER DATABASE [p4g10] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [p4g10] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [p4g10] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [p4g10] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [p4g10] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [p4g10] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [p4g10] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [p4g10] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [p4g10] SET  MULTI_USER 
GO
ALTER DATABASE [p4g10] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [p4g10] SET DB_CHAINING OFF 
GO
ALTER DATABASE [p4g10] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [p4g10] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [p4g10] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [p4g10] SET QUERY_STORE = OFF
GO
USE [p4g10]
GO
/****** Object:  User [p4g10]    Script Date: 12/06/2020 23:13:20 ******/
CREATE USER [p4g10] FOR LOGIN [p4g10] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [p4g10]
GO
/****** Object:  Schema [ALUGAR_CARRO]    Script Date: 12/06/2020 23:13:21 ******/
CREATE SCHEMA [ALUGAR_CARRO]
GO
/****** Object:  Schema [Company]    Script Date: 12/06/2020 23:13:21 ******/
CREATE SCHEMA [Company]
GO
/****** Object:  Schema [Gest_Stock]    Script Date: 12/06/2020 23:13:21 ******/
CREATE SCHEMA [Gest_Stock]
GO
/****** Object:  Schema [Prescricao]    Script Date: 12/06/2020 23:13:21 ******/
CREATE SCHEMA [Prescricao]
GO
/****** Object:  Schema [RENT_A_CAR]    Script Date: 12/06/2020 23:13:21 ******/
CREATE SCHEMA [RENT_A_CAR]
GO
/****** Object:  Schema [SPORT_SHOP]    Script Date: 12/06/2020 23:13:21 ******/
CREATE SCHEMA [SPORT_SHOP]
GO
/****** Object:  Schema [SPORTSHOP]    Script Date: 12/06/2020 23:13:21 ******/
CREATE SCHEMA [SPORTSHOP]
GO
/****** Object:  UserDefinedDataType [dbo].[string]    Script Date: 12/06/2020 23:13:21 ******/
CREATE TYPE [dbo].[string] FROM [varchar](50) NULL
GO
/****** Object:  UserDefinedFunction [Company].[employeeDeptHighAverage]    Script Date: 12/06/2020 23:13:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [Company].[employeeDeptHighAverage](@dno int) RETURNS @table TABLE (pname varchar(15), number int, plocation varchar(15), dnum int, budget decimal(10,2), totalbudget decimal(10,2))
AS
BEGIN

	DECLARE @pname AS varchar(15), @number AS int, @plocation AS varchar(15), @dnum AS int, @budget AS decimal(10,2), @totalbudget AS decimal(10,2);

	DECLARE C CURSOR FAST_FORWARD
	FOR SELECT Pname, Pnumber, Plocation, Dnumber, Sum(Salary*[Hours]/40)
		FROM	Company.department 
				JOIN Company.project ON Dnumber=Dnum
				JOIN Company.works_on ON Pnumber=Pno
				JOIN Company.employee ON Essn=Ssn
		WHERE Dnumber=@dno
		GROUP BY Pname, Pnumber, Plocation, Dnumber;

	OPEN C;

	FETCH C INTO @pname, @number, @plocation, @dnum, @budget;
	SELECT @totalbudget = 0;

	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @totalbudget += @budget;
		INSERT INTO @table VALUES (@pname, @number, @plocation, @dnum, @budget, @totalbudget)
		FETCH C INTO @pname, @number, @plocation, @dnum, @budget;
	END

	CLOSE C;

	DEALLOCATE C;

	return;
END
GO
/****** Object:  Table [Company].[employee]    Script Date: 12/06/2020 23:13:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Company].[employee](
	[Fname] [varchar](15) NOT NULL,
	[Minit] [char](1) NULL,
	[Lname] [varchar](20) NOT NULL,
	[Ssn] [decimal](9, 0) NOT NULL,
	[Bdate] [date] NULL,
	[Address] [varchar](60) NULL,
	[Sex] [char](1) NULL,
	[Salary] [decimal](11, 2) NULL,
	[Super_ssn] [decimal](9, 0) NULL,
	[Dno] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Ssn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [Company].[f_nameLocal]    Script Date: 12/06/2020 23:13:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [Company].[f_nameLocal] (@Ssn char(9)) RETURNS TABLE
AS

	RETURN(SELECT Pname, Plocation
	FROM Company.employee
			JOIN Company.works_on ON Ssn=Essn
			JOIN Company.project ON Pno=Pnumber
	WHERE employee.Ssn=@Ssn);

GO
/****** Object:  UserDefinedFunction [Company].[f_bestAvgSalary]    Script Date: 12/06/2020 23:13:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [Company].[f_bestAvgSalary](@dno int) RETURNS TABLE
AS

	RETURN(
		SELECT Ssn
		FROM Company.employee
		WHERE DNO=@Dno AND Salary>(
			SELECT AVG(Salary)
			FROM Company.employee
			WHERE Dno=@Dno
		));

GO
/****** Object:  Table [Company].[department]    Script Date: 12/06/2020 23:13:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Company].[department](
	[Dname] [varchar](25) NOT NULL,
	[Dnumber] [int] NOT NULL,
	[Mgr_ssn] [decimal](9, 0) NULL,
	[Mgr_start_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Dnumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [SPORTSHOP].[Cliente]    Script Date: 12/06/2020 23:13:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SPORTSHOP].[Cliente](
	[mail] [dbo].[string] NOT NULL,
	[num_ID] [int] NOT NULL,
 CONSTRAINT [CLIENTE_PK] PRIMARY KEY CLUSTERED 
(
	[num_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [SPORTSHOP].[Funcionario]    Script Date: 12/06/2020 23:13:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SPORTSHOP].[Funcionario](
	[work_ID] [int] IDENTITY(10000,1) NOT NULL,
	[loja_code] [int] NULL,
	[num_ID] [int] NULL,
	[password] [dbo].[string] NOT NULL,
 CONSTRAINT [FUNCIONARIO_PK] PRIMARY KEY CLUSTERED 
(
	[work_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [SPORTSHOP].[Inclui]    Script Date: 12/06/2020 23:13:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SPORTSHOP].[Inclui](
	[ID_venda] [int] NOT NULL,
	[produto_ID] [int] NOT NULL,
	[quantidadeProduto] [int] NULL,
 CONSTRAINT [INCLUI_PK] PRIMARY KEY CLUSTERED 
(
	[ID_venda] ASC,
	[produto_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [SPORTSHOP].[Loja]    Script Date: 12/06/2020 23:13:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SPORTSHOP].[Loja](
	[nomeLoja] [dbo].[string] NOT NULL,
	[endereco] [dbo].[string] NOT NULL,
	[codigo_postal] [dbo].[string] NOT NULL,
	[loja_code] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [LOJA_PK] PRIMARY KEY CLUSTERED 
(
	[loja_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [SPORTSHOP].[Produto]    Script Date: 12/06/2020 23:13:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SPORTSHOP].[Produto](
	[produto_ID] [int] IDENTITY(1000000000,1) NOT NULL,
	[nome_Produto] [dbo].[string] NOT NULL,
	[marca] [dbo].[string] NOT NULL,
	[especificidade] [dbo].[string] NOT NULL,
	[preco] [money] NULL,
	[loja_code] [int] NULL,
	[tipo_ID] [int] NULL,
 CONSTRAINT [PRODUTO_PK] PRIMARY KEY CLUSTERED 
(
	[produto_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [SPORTSHOP].[Stock]    Script Date: 12/06/2020 23:13:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SPORTSHOP].[Stock](
	[quantidade_Loja] [int] NULL,
	[quantidade_Armazem] [int] NULL,
	[produto_ID] [int] NOT NULL,
	[loja_code] [int] NOT NULL,
 CONSTRAINT [STOCK_PK] PRIMARY KEY CLUSTERED 
(
	[loja_code] ASC,
	[produto_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [SPORTSHOP].[Utilizador]    Script Date: 12/06/2020 23:13:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SPORTSHOP].[Utilizador](
	[nome] [dbo].[string] NOT NULL,
	[num_ID] [int] NOT NULL,
 CONSTRAINT [UTILIZADOR_PK] PRIMARY KEY CLUSTERED 
(
	[num_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [SPORTSHOP].[Venda]    Script Date: 12/06/2020 23:13:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SPORTSHOP].[Venda](
	[ID_venda] [int] IDENTITY(1,1) NOT NULL,
	[data_venda] [date] NULL,
	[quantidade] [int] NULL,
	[loja_code] [int] NULL,
	[work_ID] [int] NULL,
	[num_ID] [int] NULL,
	[precoTotal] [money] NULL,
 CONSTRAINT [VENDA_PK] PRIMARY KEY CLUSTERED 
(
	[ID_venda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [Company].[department] ([Dname], [Dnumber], [Mgr_ssn], [Mgr_start_date]) VALUES (N'Investigacao', 1, CAST(21312332 AS Decimal(9, 0)), CAST(N'2010-08-02' AS Date))
INSERT [Company].[department] ([Dname], [Dnumber], [Mgr_ssn], [Mgr_start_date]) VALUES (N'Comercial', 2, CAST(321233765 AS Decimal(9, 0)), CAST(N'2013-05-16' AS Date))
INSERT [Company].[department] ([Dname], [Dnumber], [Mgr_ssn], [Mgr_start_date]) VALUES (N'Logistica', 3, CAST(41124234 AS Decimal(9, 0)), CAST(N'2013-05-16' AS Date))
INSERT [Company].[department] ([Dname], [Dnumber], [Mgr_ssn], [Mgr_start_date]) VALUES (N'Recursos Humanos', 4, CAST(12652121 AS Decimal(9, 0)), CAST(N'2014-04-02' AS Date))
INSERT [Company].[employee] ([Fname], [Minit], [Lname], [Ssn], [Bdate], [Address], [Sex], [Salary], [Super_ssn], [Dno]) VALUES (N'Ana', N'L', N'Silva', CAST(12652121 AS Decimal(9, 0)), CAST(N'1990-03-03' AS Date), N'Rua ZIG ZAG', N'F', CAST(1400.00 AS Decimal(11, 2)), CAST(21312332 AS Decimal(9, 0)), 2)
INSERT [Company].[employee] ([Fname], [Minit], [Lname], [Ssn], [Bdate], [Address], [Sex], [Salary], [Super_ssn], [Dno]) VALUES (N'Carlos', N'D', N'Gomes', CAST(21312332 AS Decimal(9, 0)), CAST(N'2000-01-01' AS Date), N'Rua XPTO', N'M', CAST(1200.00 AS Decimal(11, 2)), NULL, 1)
INSERT [Company].[employee] ([Fname], [Minit], [Lname], [Ssn], [Bdate], [Address], [Sex], [Salary], [Super_ssn], [Dno]) VALUES (N'Joao', N'G', N'Costa', CAST(41124234 AS Decimal(9, 0)), CAST(N'2001-01-01' AS Date), N'Rua YGZ', N'M', CAST(1300.00 AS Decimal(11, 2)), CAST(21312332 AS Decimal(9, 0)), 2)
INSERT [Company].[employee] ([Fname], [Minit], [Lname], [Ssn], [Bdate], [Address], [Sex], [Salary], [Super_ssn], [Dno]) VALUES (N'Paula', N'A', N'Sousa', CAST(183623612 AS Decimal(9, 0)), CAST(N'2001-08-11' AS Date), N'Rua da FRENTE', N'F', CAST(1450.00 AS Decimal(11, 2)), NULL, 3)
INSERT [Company].[employee] ([Fname], [Minit], [Lname], [Ssn], [Bdate], [Address], [Sex], [Salary], [Super_ssn], [Dno]) VALUES (N'Juliana', N'A', N'Amaral', CAST(321233765 AS Decimal(9, 0)), CAST(N'1980-08-11' AS Date), N'Rua BZZZZ', N'F', CAST(1350.00 AS Decimal(11, 2)), NULL, 3)
INSERT [Company].[employee] ([Fname], [Minit], [Lname], [Ssn], [Bdate], [Address], [Sex], [Salary], [Super_ssn], [Dno]) VALUES (N'Maria', N'I', N'Pereira', CAST(342343434 AS Decimal(9, 0)), CAST(N'2001-05-01' AS Date), N'Rua JANOTA', N'F', CAST(1250.00 AS Decimal(11, 2)), CAST(21312332 AS Decimal(9, 0)), 2)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N'h.sharpe@testmail.com', 10176924)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N's.casey@testmail.com', 10182109)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N'n.woods@testmail.com', 10491988)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N'n.villarreal@testmail.com', 10532028)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N't.andrews@testmail.com', 10552344)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N'n.hyde@testmail.com', 10609422)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N'f.curtis@testmail.com', 10630263)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N't.burch@testmail.com', 10929079)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N'g.lawson@testmail.com', 11135420)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N's.murray@testmail.com', 11295867)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N'a.cooke@testmail.com', 11400459)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N'h.macdonald@testmail.com', 11645825)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N'c.pollard@testmail.com', 11769137)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N'w.pacheco@testmail.com', 11841118)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N'p.mayo@testmail.com', 12020799)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N'a.hendrix@testmail.com', 12098117)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N'q.chandler@testmail.com', 12176552)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N'c.shaffer@testmail.com', 12505291)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N's.garrett@testmail.com', 12601052)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N'f.frye@testmail.com', 12609491)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N'c.baird@testmail.com', 12672454)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N'k.slater@testmail.com', 12727951)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N'f.kemp@testmail.com', 13176638)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N'd.english@testmail.com', 13509096)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N'u.england@testmail.com', 13651412)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N'c.horne@testmail.com', 13852279)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N'r.randolph@testmail.com', 14202762)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N's.bauer@testmail.com', 14240553)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N'e.garza@testmail.com', 14420369)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N'f.greene@testmail.com', 14825962)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N'k.camacho@testmail.com', 14927762)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N'l.orr@testmail.com', 14988942)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N'j.dawson@testmail.com', 15208428)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N'a.pitts@testmail.com', 15312303)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N'l.hansen@testmail.com', 15779662)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N'b.pierce@testmail.com', 15905420)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N'd.goodwin@testmail.com', 15939048)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N'b.lewis@testmail.com', 16101490)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N'v.todd@testmail.com', 16212112)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N'n.leblanc@testmail.com', 16520257)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N'o.nielsen@testmail.com', 16605959)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N'm.norman@testmail.com', 16640869)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N'g.simon@testmail.com', 16741818)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N'k.alvarado@testmail.com', 16782187)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N'i.sullivan@testmail.com', 16933652)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N'p.gray@testmail.com', 17371425)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N'r.mcmahon@testmail.com', 17447686)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N'd.simpson@testmail.com', 17595671)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N'c.benson@testmail.com', 17676222)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N'r.hickman@testmail.com', 17702370)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N'c.kerr@testmail.com', 17770398)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N's.mckinney@testmail.com', 17802983)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N'b.guy@testmail.com', 17880704)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N'l.alston@testmail.com', 18071908)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N'm.rasmussen@testmail.com', 18076783)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N'v.matthews@testmail.com', 18093333)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N'l.cabrera@testmail.com', 18443231)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N'k.rodriguez@testmail.com', 18593718)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N'l.stark@testmail.com', 18642467)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N'a.manning@testmail.com', 18762889)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N'f.dillon@testmail.com', 19060481)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N'l.diaz@testmail.com', 19359971)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N'c.freeman@testmail.com', 19446914)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N'b.moon@testmail.com', 19452731)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N'a.cantu@testmail.com', 19484298)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N'a.daniels@testmail.com', 19511695)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N'u.parks@testmail.com', 19531058)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N'c.cooper@testmail.com', 19729784)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N'm.nolan@testmail.com', 19876652)
INSERT [SPORTSHOP].[Cliente] ([mail], [num_ID]) VALUES (N'r.moore@testmail.com', 19937575)
SET IDENTITY_INSERT [SPORTSHOP].[Funcionario] ON 

INSERT [SPORTSHOP].[Funcionario] ([work_ID], [loja_code], [num_ID], [password]) VALUES (10000, 1, 17023334, N'17023Macon')
INSERT [SPORTSHOP].[Funcionario] ([work_ID], [loja_code], [num_ID], [password]) VALUES (10001, 2, 13597973, N'13597Jason')
INSERT [SPORTSHOP].[Funcionario] ([work_ID], [loja_code], [num_ID], [password]) VALUES (10002, 3, 17812075, N'17812Denton')
INSERT [SPORTSHOP].[Funcionario] ([work_ID], [loja_code], [num_ID], [password]) VALUES (10003, 1, 14591765, N'14591Hamish')
INSERT [SPORTSHOP].[Funcionario] ([work_ID], [loja_code], [num_ID], [password]) VALUES (10004, 2, 12363321, N'12363Orli')
INSERT [SPORTSHOP].[Funcionario] ([work_ID], [loja_code], [num_ID], [password]) VALUES (10005, 3, 19491337, N'19491Bernard')
INSERT [SPORTSHOP].[Funcionario] ([work_ID], [loja_code], [num_ID], [password]) VALUES (10006, 1, 13150517, N'13150Acton')
INSERT [SPORTSHOP].[Funcionario] ([work_ID], [loja_code], [num_ID], [password]) VALUES (10007, 2, 17264919, N'17264Edward')
INSERT [SPORTSHOP].[Funcionario] ([work_ID], [loja_code], [num_ID], [password]) VALUES (10008, 3, 15858305, N'15858Dennis')
INSERT [SPORTSHOP].[Funcionario] ([work_ID], [loja_code], [num_ID], [password]) VALUES (10009, 1, 18749269, N'18749Nero')
INSERT [SPORTSHOP].[Funcionario] ([work_ID], [loja_code], [num_ID], [password]) VALUES (10010, 2, 17639652, N'17639Urielle')
INSERT [SPORTSHOP].[Funcionario] ([work_ID], [loja_code], [num_ID], [password]) VALUES (10011, 3, 14437001, N'14437Lysandra')
INSERT [SPORTSHOP].[Funcionario] ([work_ID], [loja_code], [num_ID], [password]) VALUES (10012, 1, 19558825, N'19558Galena')
INSERT [SPORTSHOP].[Funcionario] ([work_ID], [loja_code], [num_ID], [password]) VALUES (10013, 2, 19201883, N'19201Elliott')
INSERT [SPORTSHOP].[Funcionario] ([work_ID], [loja_code], [num_ID], [password]) VALUES (10014, 3, 14292591, N'14292Kelly')
INSERT [SPORTSHOP].[Funcionario] ([work_ID], [loja_code], [num_ID], [password]) VALUES (10015, 1, 13816681, N'13816Randall')
INSERT [SPORTSHOP].[Funcionario] ([work_ID], [loja_code], [num_ID], [password]) VALUES (10016, 2, 14564443, N'14564Iris')
INSERT [SPORTSHOP].[Funcionario] ([work_ID], [loja_code], [num_ID], [password]) VALUES (10017, 3, 11115576, N'11115Kaden')
INSERT [SPORTSHOP].[Funcionario] ([work_ID], [loja_code], [num_ID], [password]) VALUES (10018, 1, 15983319, N'15983Karyn')
INSERT [SPORTSHOP].[Funcionario] ([work_ID], [loja_code], [num_ID], [password]) VALUES (10019, 2, 15984692, N'15984Olympia')
INSERT [SPORTSHOP].[Funcionario] ([work_ID], [loja_code], [num_ID], [password]) VALUES (10020, 3, 16383510, N'16383Kyla')
INSERT [SPORTSHOP].[Funcionario] ([work_ID], [loja_code], [num_ID], [password]) VALUES (10021, 1, 10135728, N'10135Stacey')
INSERT [SPORTSHOP].[Funcionario] ([work_ID], [loja_code], [num_ID], [password]) VALUES (10022, 2, 10120836, N'10120Ginger')
INSERT [SPORTSHOP].[Funcionario] ([work_ID], [loja_code], [num_ID], [password]) VALUES (10023, 3, 10412196, N'10412Uma')
INSERT [SPORTSHOP].[Funcionario] ([work_ID], [loja_code], [num_ID], [password]) VALUES (10024, 1, 18677317, N'18677Burton')
INSERT [SPORTSHOP].[Funcionario] ([work_ID], [loja_code], [num_ID], [password]) VALUES (10025, 2, 13441919, N'13441Gay')
INSERT [SPORTSHOP].[Funcionario] ([work_ID], [loja_code], [num_ID], [password]) VALUES (10026, 3, 11083909, N'11083Hilel')
INSERT [SPORTSHOP].[Funcionario] ([work_ID], [loja_code], [num_ID], [password]) VALUES (10027, 1, 16645740, N'16645Jared')
INSERT [SPORTSHOP].[Funcionario] ([work_ID], [loja_code], [num_ID], [password]) VALUES (10028, 2, 14802156, N'14802Ainsley')
INSERT [SPORTSHOP].[Funcionario] ([work_ID], [loja_code], [num_ID], [password]) VALUES (10029, 3, 17350548, N'17350Brendan')
SET IDENTITY_INSERT [SPORTSHOP].[Funcionario] OFF
SET IDENTITY_INSERT [SPORTSHOP].[Loja] ON 

INSERT [SPORTSHOP].[Loja] ([nomeLoja], [endereco], [codigo_postal], [loja_code]) VALUES (N'SportShop Aveiro', N'Rua do Batalhão de Caçadores 10', N'3810-064', 1)
INSERT [SPORTSHOP].[Loja] ([nomeLoja], [endereco], [codigo_postal], [loja_code]) VALUES (N'SportShop Viseu', N'Rua Dom José da Cruz Moreira Pinto 32', N'3510-078', 2)
INSERT [SPORTSHOP].[Loja] ([nomeLoja], [endereco], [codigo_postal], [loja_code]) VALUES (N'SportShop Braga', N'Av. Dr. Franscisco Pires Gonçalves', N'4715-558', 3)
SET IDENTITY_INSERT [SPORTSHOP].[Loja] OFF
SET IDENTITY_INSERT [SPORTSHOP].[Produto] ON 

INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000000, N'Kettlebell', N'Under Armour', N'12.5kg', 17.9500, 1, 3)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000001, N'Kettlebell', N'Under Armour', N'12.5kg', 17.9500, 2, 3)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000002, N'Kettlebell', N'Under Armour', N'12.5kg', 17.9500, 3, 3)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000003, N'Disco Borracha', N'Puma', N'2kg', 5.0000, 1, 3)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000004, N'Disco Borracha', N'Puma', N'2kg', 5.0000, 2, 3)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000005, N'Disco Borracha', N'Puma', N'2kg', 5.0000, 3, 3)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000006, N'Calças', N'New Balance', N'S', 7.5000, 1, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000007, N'Calças', N'New Balance', N'S', 7.5000, 2, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000008, N'Calças', N'New Balance', N'S', 7.5000, 3, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000009, N'Bola', N'New Balance', N'Andebol', 3.9900, 1, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000010, N'Bola', N'New Balance', N'Andebol', 3.9900, 2, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000011, N'Bola', N'New Balance', N'Andebol', 3.9900, 3, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000012, N'Sweatshirt', N'ASICS', N'XL', 15.5000, 1, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000013, N'Sweatshirt', N'ASICS', N'XL', 15.5000, 2, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000014, N'Sweatshirt', N'ASICS', N'XL', 15.5000, 3, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000015, N'Bola', N'FILA', N'Andebol', 5.0000, 1, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000016, N'Bola', N'FILA', N'Andebol', 5.0000, 2, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000017, N'Bola', N'FILA', N'Andebol', 5.0000, 3, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000018, N'Sapatilhas Ciclismo', N'Puma', N'35', 55.0000, 1, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000019, N'Sapatilhas Ciclismo', N'Puma', N'35', 55.0000, 2, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000020, N'Sapatilhas Ciclismo', N'Puma', N'35', 55.0000, 3, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000021, N'Fato de Treino', N'FILA', N'XL', 29.9900, 1, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000022, N'Fato de Treino', N'FILA', N'XL', 29.9900, 2, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000023, N'Fato de Treino', N'FILA', N'XL', 29.9900, 3, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000024, N'Bola', N'FILA', N'Golfe', 4.5000, 1, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000025, N'Bola', N'FILA', N'Golfe', 4.5000, 2, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000026, N'Bola', N'FILA', N'Golfe', 4.5000, 3, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000027, N'Sapatilhas Casual', N'FILA', N'39', 29.9900, 1, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000028, N'Sapatilhas Casual', N'FILA', N'39', 29.9900, 2, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000029, N'Sapatilhas Casual', N'FILA', N'39', 29.9900, 3, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000030, N'Sapatilhas Running', N'Nike', N'36', 119.9900, 1, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000031, N'Sapatilhas Running', N'Nike', N'36', 119.9900, 2, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000032, N'Sapatilhas Running', N'Nike', N'36', 119.9900, 3, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000033, N'Sapatilhas Trail', N'Adidas', N'40', 89.9900, 1, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000034, N'Sapatilhas Trail', N'Adidas', N'40', 89.9900, 2, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000035, N'Sapatilhas Trail', N'Adidas', N'40', 89.9900, 3, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000036, N'Sweatshirt', N'Lacoste', N'XL', 140.0000, 1, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000037, N'Sweatshirt', N'Lacoste', N'XL', 140.0000, 2, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000038, N'Sweatshirt', N'Lacoste', N'XL', 140.0000, 3, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000039, N'Bola', N'Puma', N'Basebol', 19.9900, 1, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000040, N'Bola', N'Puma', N'Basebol', 19.9900, 2, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000041, N'Bola', N'Puma', N'Basebol', 19.9900, 3, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000042, N'Power Bag', N'Jordan Brand', N'15kg', 69.9900, 1, 3)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000043, N'Power Bag', N'Jordan Brand', N'15kg', 69.9900, 2, 3)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000044, N'Power Bag', N'Jordan Brand', N'15kg', 69.9900, 3, 3)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000045, N'Boxers', N'Lacoste', N'M', 15.0000, 1, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000046, N'Boxers', N'Lacoste', N'M', 15.0000, 2, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000047, N'Boxers', N'Lacoste', N'M', 15.0000, 3, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000048, N'Bola', N'Nike', N'Voleibol', 19.9900, 1, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000049, N'Bola', N'Nike', N'Voleibol', 19.9900, 2, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000050, N'Bola', N'Nike', N'Voleibol', 19.9900, 3, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000051, N'T-Shirt', N'ASICS', N'M', 25.0000, 1, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000052, N'T-Shirt', N'ASICS', N'M', 25.0000, 2, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000053, N'T-Shirt', N'ASICS', N'M', 25.0000, 3, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000054, N'Fato de Treino', N'New Balance', N'L', 66.0000, 1, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000055, N'Fato de Treino', N'New Balance', N'L', 66.0000, 2, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000056, N'Fato de Treino', N'New Balance', N'L', 66.0000, 3, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000057, N'Sapatilhas Ciclismo', N'Lacoste', N'37', 39.9900, 1, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000058, N'Sapatilhas Ciclismo', N'Lacoste', N'37', 39.9900, 2, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000059, N'Sapatilhas Ciclismo', N'Lacoste', N'37', 39.9900, 3, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000060, N'Sapatilhas Fitness', N'Champion', N'37', 24.9900, 1, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000061, N'Sapatilhas Fitness', N'Champion', N'37', 24.9900, 2, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000062, N'Sapatilhas Fitness', N'Champion', N'37', 24.9900, 3, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000063, N'Boxers', N'Puma', N'S', 7.0000, 1, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000064, N'Boxers', N'Puma', N'S', 7.0000, 2, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000065, N'Boxers', N'Puma', N'S', 7.0000, 3, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000066, N'Fato de Treino', N'Adidas', N'S', 49.9900, 1, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000067, N'Fato de Treino', N'Adidas', N'S', 49.9900, 2, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000068, N'Fato de Treino', N'Adidas', N'S', 49.9900, 3, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000069, N'Bola', N'FILA', N'Basebol', 15.9900, 1, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000070, N'Bola', N'FILA', N'Basebol', 15.9900, 2, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000071, N'Bola', N'FILA', N'Basebol', 15.9900, 3, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000072, N'Bola', N'Under Armour', N'Basquetebol', 39.9900, 1, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000073, N'Bola', N'Under Armour', N'Basquetebol', 39.9900, 2, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000074, N'Bola', N'Under Armour', N'Basquetebol', 39.9900, 3, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000075, N'Sapatilhas Casual', N'Champion', N'41', 59.9900, 1, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000076, N'Sapatilhas Casual', N'Champion', N'41', 59.9900, 2, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000077, N'Sapatilhas Casual', N'Champion', N'41', 59.9900, 3, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000078, N'Boxers', N'ASICS', N'S', 6.0000, 1, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000079, N'Boxers', N'ASICS', N'S', 6.0000, 2, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000080, N'Boxers', N'ASICS', N'S', 6.0000, 3, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000081, N'Fato de Treino', N'Champion', N'L', 58.9900, 1, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000082, N'Fato de Treino', N'Champion', N'L', 58.9900, 2, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000083, N'Fato de Treino', N'Champion', N'L', 58.9900, 3, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000084, N'Sapatilhas Ciclismo', N'Puma', N'41', 49.9900, 1, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000085, N'Sapatilhas Ciclismo', N'Puma', N'41', 49.9900, 2, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000086, N'Sapatilhas Ciclismo', N'Puma', N'41', 49.9900, 3, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000087, N'Bola', N'Puma', N'Voleibol', 35.9900, 1, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000088, N'Bola', N'Puma', N'Voleibol', 35.9900, 2, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000089, N'Bola', N'Puma', N'Voleibol', 35.9900, 3, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000090, N'Boxers', N'New Balance', N'XL', 19.9900, 1, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000091, N'Boxers', N'New Balance', N'XL', 19.9900, 2, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000092, N'Boxers', N'New Balance', N'XL', 19.9900, 3, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000093, N'Kettlebell', N'Puma', N'7.5kg', 49.9900, 1, 3)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000094, N'Kettlebell', N'Puma', N'7.5kg', 49.9900, 2, 3)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000095, N'Kettlebell', N'Puma', N'7.5kg', 49.9900, 3, 3)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000096, N'Kettlebell', N'Under Armour', N'12.5kg', 39.9900, 1, 3)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000097, N'Kettlebell', N'Under Armour', N'12.5kg', 39.9900, 2, 3)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000098, N'Kettlebell', N'Under Armour', N'12.5kg', 39.9900, 3, 3)
GO
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000099, N'Fato de Treino', N'Champion', N'XS', 38.9900, 1, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000100, N'Fato de Treino', N'Champion', N'XS', 38.9900, 2, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000101, N'Fato de Treino', N'Champion', N'XS', 38.9900, 3, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000102, N'Boxers', N'FILA', N'XS', 5.9900, 1, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000103, N'Boxers', N'FILA', N'XS', 5.9900, 2, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000104, N'Boxers', N'FILA', N'XS', 5.9900, 3, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000105, N'Kettlebell', N'Adidas', N'7.5kg', 59.9900, 1, 3)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000106, N'Kettlebell', N'Adidas', N'7.5kg', 59.9900, 2, 3)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000107, N'Kettlebell', N'Adidas', N'7.5kg', 59.9900, 3, 3)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000108, N'Calças', N'ASICS', N'XS', 34.9900, 1, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000109, N'Calças', N'ASICS', N'XS', 34.9900, 2, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000110, N'Calças', N'ASICS', N'XS', 34.9900, 3, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000111, N'Sapatilhas Ciclismo', N'ASICS', N'38', 19.9900, 1, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000112, N'Sapatilhas Ciclismo', N'ASICS', N'38', 19.9900, 2, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000113, N'Sapatilhas Ciclismo', N'ASICS', N'38', 19.9900, 3, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000114, N'Meias', N'Under Armour', N'S', 4.0000, 1, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000115, N'Meias', N'Under Armour', N'S', 4.0000, 2, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000116, N'Meias', N'Under Armour', N'S', 4.0000, 3, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000117, N'Bola', N'Puma', N'Voleibol', 14.9900, 1, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000118, N'Bola', N'Puma', N'Voleibol', 14.9900, 2, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000119, N'Bola', N'Puma', N'Voleibol', 14.9900, 3, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000120, N'Bola', N'Adidas', N'Basquetebol', 29.9900, 1, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000121, N'Bola', N'Adidas', N'Basquetebol', 29.9900, 2, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000122, N'Bola', N'Adidas', N'Basquetebol', 29.9900, 3, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000123, N'Bola', N'New Balance', N'Futebol', 24.9900, 1, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000124, N'Bola', N'New Balance', N'Futebol', 24.9900, 2, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000125, N'Bola', N'New Balance', N'Futebol', 24.9900, 3, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000126, N'Disco Borracha', N'ASICS', N'15kg', 69.9900, 1, 3)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000127, N'Disco Borracha', N'ASICS', N'15kg', 69.9900, 2, 3)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000128, N'Disco Borracha', N'ASICS', N'15kg', 69.9900, 3, 3)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000129, N'Bola', N'Under Armour', N'Golfe', 9.9900, 1, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000130, N'Bola', N'Under Armour', N'Golfe', 9.9900, 2, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000131, N'Bola', N'Under Armour', N'Golfe', 9.9900, 3, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000132, N'Bola', N'Jordan Brand', N'Ping-Pong', 14.9900, 1, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000133, N'Bola', N'Jordan Brand', N'Ping-Pong', 14.9900, 2, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000134, N'Bola', N'Jordan Brand', N'Ping-Pong', 14.9900, 3, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000135, N'Sweatshirt', N'Adidas', N'L', 89.9900, 1, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000136, N'Sweatshirt', N'Adidas', N'L', 89.9900, 2, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000137, N'Sweatshirt', N'Adidas', N'L', 89.9900, 3, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000138, N'Disco Borracha', N'Under Armour', N'2kg', 29.9900, 1, 3)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000139, N'Disco Borracha', N'Under Armour', N'2kg', 29.9900, 2, 3)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000140, N'Disco Borracha', N'Under Armour', N'2kg', 29.9900, 3, 3)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000141, N'Sapatilhas Running', N'Under Armour', N'38', 34.9900, 1, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000142, N'Sapatilhas Running', N'Under Armour', N'38', 34.9900, 2, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000143, N'Sapatilhas Running', N'Under Armour', N'38', 34.9900, 3, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000144, N'Disco Borracha', N'Under Armour', N'10kg', 54.9900, 1, 3)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000145, N'Disco Borracha', N'Under Armour', N'10kg', 54.9900, 2, 3)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000146, N'Disco Borracha', N'Under Armour', N'10kg', 54.9900, 3, 3)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000147, N'Halteres', N'Champion', N'2kg', 39.9900, 1, 3)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000148, N'Halteres', N'Champion', N'2kg', 39.9900, 2, 3)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000149, N'Halteres', N'Champion', N'2kg', 39.9900, 3, 3)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000150, N'Bola', N'ASICS', N'Futebol', 9.9900, 1, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000151, N'Bola', N'ASICS', N'Futebol', 9.9900, 2, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000152, N'Bola', N'ASICS', N'Futebol', 9.9900, 3, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000153, N'Sapatilhas Casual', N'Under Armour', N'44', 19.9900, 1, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000154, N'Sapatilhas Casual', N'Under Armour', N'44', 19.9900, 2, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000155, N'Sapatilhas Casual', N'Under Armour', N'44', 19.9900, 3, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000156, N'Calças', N'Jordan Brand', N'M', 40.0000, 1, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000157, N'Calças', N'Jordan Brand', N'M', 40.0000, 2, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000158, N'Calças', N'Jordan Brand', N'M', 40.0000, 3, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000159, N'Boxers', N'Nike', N'M', 27.9900, 1, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000160, N'Boxers', N'Nike', N'M', 27.9900, 2, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000161, N'Boxers', N'Nike', N'M', 27.9900, 3, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000162, N'Power Bag', N'Champion', N'20kg', 84.9900, 1, 3)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000163, N'Power Bag', N'Champion', N'20kg', 84.9900, 2, 3)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000164, N'Power Bag', N'Champion', N'20kg', 84.9900, 3, 3)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000165, N'Bola', N'Champion', N'Basebol', 15.9900, 1, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000166, N'Bola', N'Champion', N'Basebol', 15.9900, 2, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000167, N'Bola', N'Champion', N'Basebol', 15.9900, 3, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000168, N'Calças', N'Under Armour', N'L', 45.0000, 1, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000169, N'Calças', N'Under Armour', N'L', 45.0000, 2, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000170, N'Calças', N'Under Armour', N'L', 45.0000, 3, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000171, N'Sapatilhas Trail', N'Adidas', N'41', 49.9900, 1, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000172, N'Sapatilhas Trail', N'Adidas', N'41', 49.9900, 2, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000173, N'Sapatilhas Trail', N'Adidas', N'41', 49.9900, 3, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000174, N'Calções', N'Adidas', N'M', 25.0000, 1, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000175, N'Calções', N'Adidas', N'M', 25.0000, 2, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000176, N'Calções', N'Adidas', N'M', 25.0000, 3, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000177, N'Fato de Treino', N'FILA', N'S', 29.9900, 1, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000178, N'Fato de Treino', N'FILA', N'S', 29.9900, 2, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000179, N'Fato de Treino', N'FILA', N'S', 29.9900, 3, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000180, N'Sapatilhas Fitness', N'Lacoste', N'42', 34.9900, 1, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000181, N'Sapatilhas Fitness', N'Lacoste', N'42', 34.9900, 2, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000182, N'Sapatilhas Fitness', N'Lacoste', N'42', 34.9900, 3, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000183, N'Sapatilhas Trail', N'Adidas', N'42', 109.9900, 1, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000184, N'Sapatilhas Trail', N'Adidas', N'42', 109.9900, 2, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000185, N'Sapatilhas Trail', N'Adidas', N'42', 109.9900, 3, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000186, N'Boxers', N'Champion', N'M', 34.9900, 1, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000187, N'Boxers', N'Champion', N'M', 34.9900, 2, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000188, N'Boxers', N'Champion', N'M', 34.9900, 3, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000189, N'Bola', N'Lacoste', N'Andebol', 17.9900, 1, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000190, N'Bola', N'Lacoste', N'Andebol', 17.9900, 2, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000191, N'Bola', N'Lacoste', N'Andebol', 17.9900, 3, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000192, N'Bola', N'New Balance', N'Voleibol', 12.9900, 1, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000193, N'Bola', N'New Balance', N'Voleibol', 12.9900, 2, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000194, N'Bola', N'New Balance', N'Voleibol', 12.9900, 3, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000195, N'Sapatilhas Casual', N'Jordan Brand', N'35', 19.9900, 1, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000196, N'Sapatilhas Casual', N'Jordan Brand', N'35', 19.9900, 2, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000197, N'Sapatilhas Casual', N'Jordan Brand', N'35', 19.9900, 3, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000198, N'Bola', N'Nike', N'Basebol', 9.9900, 1, 4)
GO
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000199, N'Bola', N'Nike', N'Basebol', 9.9900, 2, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000200, N'Bola', N'Nike', N'Basebol', 9.9900, 3, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000201, N'Bola', N'Under Armour', N'Ping-Pong', 8.9900, 1, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000202, N'Bola', N'Under Armour', N'Ping-Pong', 8.9900, 2, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000203, N'Bola', N'Under Armour', N'Ping-Pong', 8.9900, 3, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000204, N'Bola', N'FILA', N'Basebol', 7.9900, 1, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000205, N'Bola', N'FILA', N'Basebol', 7.9900, 2, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000206, N'Bola', N'FILA', N'Basebol', 7.9900, 3, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000207, N'Boxers', N'FILA', N'S', 7.9900, 1, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000208, N'Boxers', N'FILA', N'S', 7.9900, 2, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000209, N'Boxers', N'FILA', N'S', 7.9900, 3, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000210, N'Kettlebell', N'Lacoste', N'2kg', 14.9900, 1, 3)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000211, N'Kettlebell', N'Lacoste', N'2kg', 14.9900, 2, 3)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000212, N'Kettlebell', N'Lacoste', N'2kg', 14.9900, 3, 3)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000213, N'Halteres', N'ASICS', N'27.5kg', 25.9900, 1, 3)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000214, N'Halteres', N'ASICS', N'27.5kg', 25.9900, 2, 3)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000215, N'Halteres', N'ASICS', N'27.5kg', 25.9900, 3, 3)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000216, N'Bola', N'Adidas', N'Futebol', 26.9900, 1, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000217, N'Bola', N'Adidas', N'Futebol', 26.9900, 2, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000218, N'Bola', N'Adidas', N'Futebol', 26.9900, 3, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000219, N'Sapatilhas Trail', N'Champion', N'35', 82.9900, 1, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000220, N'Sapatilhas Trail', N'Champion', N'35', 82.9900, 2, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000221, N'Sapatilhas Trail', N'Champion', N'35', 82.9900, 3, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000222, N'Sapatilhas Casual', N'Under Armour', N'44', 37.9900, 1, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000223, N'Sapatilhas Casual', N'Under Armour', N'44', 37.9900, 2, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000224, N'Sapatilhas Casual', N'Under Armour', N'44', 37.9900, 3, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000225, N'Bola', N'ASICS', N'Ténis', 21.9900, 1, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000226, N'Bola', N'ASICS', N'Ténis', 21.9900, 2, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000227, N'Bola', N'ASICS', N'Ténis', 21.9900, 3, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000228, N'Power Bag', N'Champion', N'17.5kg', 29.9900, 1, 3)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000229, N'Power Bag', N'Champion', N'17.5kg', 29.9900, 2, 3)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000230, N'Power Bag', N'Champion', N'17.5kg', 29.9900, 3, 3)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000231, N'Fato de Treino', N'Champion', N'XS', 34.9900, 1, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000232, N'Fato de Treino', N'Champion', N'XS', 34.9900, 2, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000233, N'Fato de Treino', N'Champion', N'XS', 34.9900, 3, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000234, N'Sweatshirt', N'Lacoste', N'L', 16.9900, 1, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000235, N'Sweatshirt', N'Lacoste', N'L', 16.9900, 2, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000236, N'Sweatshirt', N'Lacoste', N'L', 16.9900, 3, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000237, N'Bola', N'ASICS', N'Ping-Pong', 30.9900, 1, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000238, N'Bola', N'ASICS', N'Ping-Pong', 30.9900, 2, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000239, N'Bola', N'ASICS', N'Ping-Pong', 30.9900, 3, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000240, N'Kettlebell', N'Champion', N'20kg', 27.9900, 1, 3)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000241, N'Kettlebell', N'Champion', N'20kg', 27.9900, 2, 3)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000242, N'Kettlebell', N'Champion', N'20kg', 27.9900, 3, 3)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000243, N'Bola', N'Under Armour', N'Futebol', 7.9900, 1, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000244, N'Bola', N'Under Armour', N'Futebol', 7.9900, 2, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000245, N'Bola', N'Under Armour', N'Futebol', 7.9900, 3, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000246, N'Meias', N'Jordan Brand', N'L', 2.9900, 1, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000247, N'Meias', N'Jordan Brand', N'L', 2.9900, 2, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000248, N'Meias', N'Jordan Brand', N'L', 2.9900, 3, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000249, N'Sapatilhas Trail', N'Puma', N'37', 76.9900, 1, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000250, N'Sapatilhas Trail', N'Puma', N'37', 76.9900, 2, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000251, N'Sapatilhas Trail', N'Puma', N'37', 76.9900, 3, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000252, N'Bola', N'Puma', N'Basquetebol', 5.9900, 1, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000253, N'Bola', N'Puma', N'Basquetebol', 5.9900, 2, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000254, N'Bola', N'Puma', N'Basquetebol', 5.9900, 3, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000255, N'Sapatilhas Running', N'Nike', N'43', 115.9900, 1, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000256, N'Sapatilhas Running', N'Nike', N'43', 115.9900, 2, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000257, N'Sapatilhas Running', N'Nike', N'43', 115.9900, 3, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000258, N'Disco Borracha', N'Puma', N'10kg', 9.9900, 1, 3)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000259, N'Disco Borracha', N'Puma', N'10kg', 9.9900, 2, 3)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000260, N'Disco Borracha', N'Puma', N'10kg', 9.9900, 3, 3)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000261, N'Halteres', N'Adidas', N'25kg', 29.9900, 1, 3)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000262, N'Halteres', N'Adidas', N'25kg', 29.9900, 2, 3)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000263, N'Halteres', N'Adidas', N'25kg', 29.9900, 3, 3)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000264, N'Sapatilhas Ciclismo', N'Lacoste', N'38', 67.9900, 1, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000265, N'Sapatilhas Ciclismo', N'Lacoste', N'38', 67.9900, 2, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000266, N'Sapatilhas Ciclismo', N'Lacoste', N'38', 67.9900, 3, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000267, N'Sapatilhas Trail', N'FILA', N'35', 75.9900, 1, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000268, N'Sapatilhas Trail', N'FILA', N'35', 75.9900, 2, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000269, N'Sapatilhas Trail', N'FILA', N'35', 75.9900, 3, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000270, N'Bola', N'Puma', N'Basquetebol', 27.9900, 1, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000271, N'Bola', N'Puma', N'Basquetebol', 27.9900, 2, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000272, N'Bola', N'Puma', N'Basquetebol', 27.9900, 3, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000273, N'Bola', N'Nike', N'Basebol', 10.9900, 1, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000274, N'Bola', N'Nike', N'Basebol', 10.9900, 2, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000275, N'Bola', N'Nike', N'Basebol', 10.9900, 3, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000276, N'Power Bag', N'Nike', N'17.5kg', 6.9900, 1, 3)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000277, N'Power Bag', N'Nike', N'17.5kg', 6.9900, 2, 3)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000278, N'Power Bag', N'Nike', N'17.5kg', 6.9900, 3, 3)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000279, N'Boxers', N'Adidas', N'S', 5.9900, 1, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000280, N'Boxers', N'Adidas', N'S', 5.9900, 2, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000281, N'Boxers', N'Adidas', N'S', 5.9900, 3, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000282, N'Disco Borracha', N'New Balance', N'17.5kg', 26.9900, 1, 3)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000283, N'Disco Borracha', N'New Balance', N'17.5kg', 26.9900, 2, 3)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000284, N'Disco Borracha', N'New Balance', N'17.5kg', 26.9900, 3, 3)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000285, N'Sapatilhas Fitness', N'ASICS', N'36', 96.9900, 1, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000286, N'Sapatilhas Fitness', N'ASICS', N'36', 96.9900, 2, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000287, N'Sapatilhas Fitness', N'ASICS', N'36', 96.9900, 3, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000288, N'Halteres', N'FILA', N'5kg', 13.9900, 1, 3)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000289, N'Halteres', N'FILA', N'5kg', 13.9900, 2, 3)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000290, N'Halteres', N'FILA', N'5kg', 13.9900, 3, 3)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000291, N'Sapatilhas Fitness', N'ASICS', N'38', 97.9900, 1, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000292, N'Sapatilhas Fitness', N'ASICS', N'38', 97.9900, 2, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000293, N'Sapatilhas Fitness', N'ASICS', N'38', 97.9900, 3, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000294, N'Calças', N'Adidas', N'S', 8.9900, 1, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000295, N'Calças', N'Adidas', N'S', 8.9900, 2, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000296, N'Calças', N'Adidas', N'S', 8.9900, 3, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000297, N'Power Bag', N'Adidas', N'25kg', 18.9900, 1, 3)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000298, N'Power Bag', N'Adidas', N'25kg', 18.9900, 2, 3)
GO
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000299, N'Power Bag', N'Adidas', N'25kg', 18.9900, 3, 3)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000300, N'Boxers', N'Puma', N'S', 8.9900, 1, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000301, N'Boxers', N'Puma', N'S', 8.9900, 2, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000302, N'Boxers', N'Puma', N'S', 8.9900, 3, 1)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000303, N'Bola', N'Champion', N'Futebol', 29.9900, 1, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000304, N'Bola', N'Champion', N'Futebol', 29.9900, 2, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000305, N'Bola', N'Champion', N'Futebol', 29.9900, 3, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000306, N'Sapatilhas Trail', N'Puma', N'36', 71.9900, 1, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000307, N'Sapatilhas Trail', N'Puma', N'36', 71.9900, 2, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000308, N'Sapatilhas Trail', N'Puma', N'36', 71.9900, 3, 2)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000309, N'Disco Borracha', N'Lacoste', N'17.5kg', 10.9900, 1, 3)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000310, N'Disco Borracha', N'Lacoste', N'17.5kg', 10.9900, 2, 3)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000311, N'Disco Borracha', N'Lacoste', N'17.5kg', 10.9900, 3, 3)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000312, N'Luvas', N'FILA', N'Golfe', 12.0000, 1, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000313, N'Luvas', N'FILA', N'Golfe', 12.0000, 2, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000314, N'Luvas', N'FILA', N'Golfe', 12.0000, 3, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000315, N'Luvas', N'FILA', N'Ping-Pong', 14.9900, 1, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000316, N'Luvas', N'FILA', N'Ping-Pong', 14.9900, 2, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000317, N'Luvas', N'FILA', N'Ping-Pong', 14.9900, 3, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000318, N'Luvas', N'Puma', N'Futebol', 24.9900, 1, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000319, N'Luvas', N'Puma', N'Futebol', 24.9900, 2, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000320, N'Luvas', N'Puma', N'Futebol', 24.9900, 3, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000321, N'Luvas', N'Under Armour', N'Futebol', 20.9900, 1, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000322, N'Luvas', N'Under Armour', N'Futebol', 20.9900, 2, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000323, N'Luvas', N'Under Armour', N'Futebol', 20.9900, 3, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000324, N'Luvas', N'Puma', N'Ping-Pong', 19.9900, 1, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000325, N'Luvas', N'Puma', N'Ping-Pong', 19.9900, 2, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000326, N'Luvas', N'Puma', N'Ping-Pong', 19.9900, 3, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000327, N'Taco', N'Puma', N'Golfe', 39.9900, 1, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000328, N'Taco', N'Puma', N'Golfe', 39.9900, 2, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000329, N'Taco', N'Puma', N'Golfe', 39.9900, 3, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000330, N'Taco', N'New Balance', N'Golfe', 34.9900, 1, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000331, N'Taco', N'New Balance', N'Golfe', 34.9900, 2, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000332, N'Taco', N'New Balance', N'Golfe', 34.9900, 3, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000333, N'Taco', N'FILA', N'Basebol', 45.0000, 1, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000334, N'Taco', N'FILA', N'Basebol', 45.0000, 2, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000335, N'Taco', N'FILA', N'Basebol', 45.0000, 3, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000336, N'Taco', N'Nike', N'Golfe', 34.9900, 1, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000337, N'Taco', N'Nike', N'Golfe', 34.9900, 2, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000338, N'Taco', N'Nike', N'Golfe', 34.9900, 3, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000339, N'Taco', N'Under Armour', N'Golfe', 50.0000, 1, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000340, N'Taco', N'Under Armour', N'Golfe', 50.0000, 2, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000341, N'Taco', N'Under Armour', N'Golfe', 50.0000, 3, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000342, N'Raquete', N'FILA', N'Ping-Pong', 6.5000, 1, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000343, N'Raquete', N'FILA', N'Ping-Pong', 6.5000, 2, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000344, N'Raquete', N'FILA', N'Ping-Pong', 6.5000, 3, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000345, N'Raquete', N'Nike', N'Tenis', 9.9900, 1, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000346, N'Raquete', N'Nike', N'Tenis', 9.9900, 2, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000347, N'Raquete', N'Nike', N'Tenis', 9.9900, 3, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000348, N'Raquete', N'New Balance', N'Ping-Pong', 4.0000, 1, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000349, N'Raquete', N'New Balance', N'Ping-Pong', 4.0000, 2, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000350, N'Raquete', N'New Balance', N'Ping-Pong', 4.0000, 3, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000351, N'Raquete', N'Nike', N'Ping-Pong', 7.9900, 1, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000352, N'Raquete', N'Nike', N'Ping-Pong', 7.9900, 2, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000353, N'Raquete', N'Nike', N'Ping-Pong', 7.9900, 3, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000354, N'Raquete', N'Puma', N'Tenis', 6.0000, 1, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000355, N'Raquete', N'Puma', N'Tenis', 6.0000, 2, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000356, N'Raquete', N'Puma', N'Tenis', 6.0000, 3, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000357, N'Baliza', N'ASICS', N'Futebol', 29.9900, 1, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000358, N'Baliza', N'ASICS', N'Futebol', 29.9900, 2, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000359, N'Baliza', N'ASICS', N'Futebol', 29.9900, 3, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000360, N'Baliza', N'Nike', N'Futebol', 49.9900, 1, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000361, N'Baliza', N'Nike', N'Futebol', 49.9900, 2, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000362, N'Baliza', N'Nike', N'Futebol', 49.9900, 3, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000363, N'Braçadeira', N'Select', N'Futebol', 3.9900, 1, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000364, N'Braçadeira', N'Select', N'Futebol', 3.9900, 2, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000365, N'Braçadeira', N'Select', N'Futebol', 3.9900, 3, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000366, N'Apito', N'Select', N'Futebol', 3.9900, 1, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000367, N'Apito', N'Select', N'Futebol', 3.9900, 2, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000368, N'Apito', N'Select', N'Futebol', 3.9900, 3, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000369, N'Cartões de Árbitro', N'Select', N'Futebol', 3.9900, 1, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000370, N'Cartões de Árbitro', N'Select', N'Futebol', 3.9900, 2, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000371, N'Cartões de Árbitro', N'Select', N'Futebol', 3.9900, 3, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000372, N'Cesta', N'Nike', N'Basquetebol', 24.9900, 1, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000373, N'Cesta', N'Nike', N'Basquetebol', 24.9900, 2, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000374, N'Cesta', N'Nike', N'Basquetebol', 24.9900, 3, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000375, N'Pulso Elástico', N'Jordan Brand', N'Basquetebol', 14.9900, 1, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000376, N'Pulso Elástico', N'Jordan Brand', N'Basquetebol', 14.9900, 2, 4)
INSERT [SPORTSHOP].[Produto] ([produto_ID], [nome_Produto], [marca], [especificidade], [preco], [loja_code], [tipo_ID]) VALUES (1000000377, N'Pulso Elástico', N'Jordan Brand', N'Basquetebol', 14.9900, 3, 4)
SET IDENTITY_INSERT [SPORTSHOP].[Produto] OFF
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (3, 26, 1000000000, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (7, 39, 1000000003, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (10, 12, 1000000006, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (4, 37, 1000000009, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (9, 38, 1000000012, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (6, 28, 1000000015, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (7, 49, 1000000018, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (3, 36, 1000000021, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (9, 50, 1000000024, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (7, 39, 1000000027, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (7, 40, 1000000030, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (9, 38, 1000000033, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (9, 35, 1000000036, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (4, 25, 1000000039, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (4, 19, 1000000042, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (8, 47, 1000000045, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (6, 27, 1000000048, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (9, 10, 1000000051, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (3, 32, 1000000054, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (5, 13, 1000000057, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (4, 22, 1000000060, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (3, 13, 1000000063, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (5, 21, 1000000066, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (8, 48, 1000000069, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (4, 15, 1000000072, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (4, 38, 1000000075, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (3, 17, 1000000078, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (7, 38, 1000000081, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (9, 32, 1000000084, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (8, 23, 1000000087, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (9, 43, 1000000090, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (8, 14, 1000000093, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (4, 17, 1000000096, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (9, 12, 1000000099, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (9, 24, 1000000102, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (10, 31, 1000000105, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (7, 21, 1000000108, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (5, 47, 1000000111, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (10, 21, 1000000114, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (5, 44, 1000000117, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (8, 39, 1000000120, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (7, 24, 1000000123, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (5, 33, 1000000126, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (3, 15, 1000000129, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (7, 11, 1000000132, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (5, 33, 1000000135, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (3, 30, 1000000138, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (9, 11, 1000000141, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (8, 29, 1000000144, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (9, 32, 1000000147, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (10, 21, 1000000150, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (3, 36, 1000000153, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (9, 37, 1000000156, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (4, 30, 1000000159, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (6, 34, 1000000162, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (10, 40, 1000000165, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (9, 26, 1000000168, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (8, 41, 1000000171, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (7, 12, 1000000174, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (6, 17, 1000000177, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (9, 13, 1000000180, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (10, 48, 1000000183, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (10, 49, 1000000186, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (5, 14, 1000000189, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (3, 19, 1000000192, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (10, 43, 1000000195, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (10, 40, 1000000198, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (10, 18, 1000000201, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (9, 46, 1000000204, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (3, 13, 1000000207, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (4, 50, 1000000210, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (7, 50, 1000000213, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (4, 30, 1000000216, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (7, 37, 1000000219, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (10, 34, 1000000222, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (8, 26, 1000000225, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (10, 39, 1000000228, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (7, 24, 1000000231, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (6, 12, 1000000234, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (6, 14, 1000000237, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (4, 15, 1000000240, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (3, 36, 1000000243, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (9, 35, 1000000246, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (5, 29, 1000000249, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (8, 19, 1000000252, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (10, 18, 1000000255, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (7, 38, 1000000258, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (7, 16, 1000000261, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (5, 43, 1000000264, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (7, 48, 1000000267, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (10, 28, 1000000270, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (6, 13, 1000000273, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (5, 41, 1000000276, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (6, 29, 1000000279, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (10, 21, 1000000282, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (3, 26, 1000000285, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (3, 44, 1000000288, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (9, 19, 1000000291, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (8, 27, 1000000294, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (9, 42, 1000000297, 1)
GO
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (10, 44, 1000000300, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (10, 43, 1000000303, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (9, 41, 1000000306, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (5, 23, 1000000309, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (4, 19, 1000000312, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (4, 46, 1000000315, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (8, 15, 1000000318, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (6, 27, 1000000321, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (4, 29, 1000000324, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (8, 22, 1000000327, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (9, 20, 1000000330, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (4, 44, 1000000333, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (9, 31, 1000000336, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (10, 25, 1000000339, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (9, 35, 1000000342, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (8, 14, 1000000345, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (6, 25, 1000000348, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (8, 13, 1000000351, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (9, 11, 1000000354, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (6, 30, 1000000357, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (3, 45, 1000000360, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (5, 40, 1000000363, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (6, 38, 1000000366, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (7, 13, 1000000369, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (3, 29, 1000000372, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (9, 40, 1000000375, 1)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (5, 14, 1000000001, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (9, 18, 1000000004, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (10, 26, 1000000007, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (4, 41, 1000000010, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (4, 30, 1000000013, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (8, 40, 1000000016, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (3, 41, 1000000019, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (6, 37, 1000000022, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (7, 27, 1000000025, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (4, 45, 1000000028, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (4, 40, 1000000031, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (3, 15, 1000000034, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (3, 38, 1000000037, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (8, 47, 1000000040, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (7, 41, 1000000043, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (7, 43, 1000000046, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (4, 25, 1000000049, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (5, 39, 1000000052, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (8, 46, 1000000055, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (9, 39, 1000000058, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (10, 41, 1000000061, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (7, 22, 1000000064, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (7, 43, 1000000067, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (3, 27, 1000000070, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (10, 28, 1000000073, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (7, 44, 1000000076, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (6, 36, 1000000079, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (8, 17, 1000000082, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (8, 37, 1000000085, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (5, 31, 1000000088, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (3, 36, 1000000091, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (5, 12, 1000000094, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (9, 10, 1000000097, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (5, 33, 1000000100, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (10, 46, 1000000103, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (3, 31, 1000000106, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (3, 39, 1000000109, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (9, 43, 1000000112, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (5, 13, 1000000115, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (8, 29, 1000000118, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (10, 16, 1000000121, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (7, 17, 1000000124, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (8, 10, 1000000127, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (6, 27, 1000000130, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (8, 43, 1000000133, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (10, 23, 1000000136, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (5, 39, 1000000139, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (9, 31, 1000000142, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (4, 38, 1000000145, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (4, 33, 1000000148, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (9, 41, 1000000151, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (10, 36, 1000000154, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (8, 18, 1000000157, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (9, 10, 1000000160, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (8, 40, 1000000163, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (8, 44, 1000000166, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (7, 32, 1000000169, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (8, 20, 1000000172, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (5, 50, 1000000175, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (5, 33, 1000000178, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (5, 41, 1000000181, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (9, 24, 1000000184, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (5, 42, 1000000187, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (9, 48, 1000000190, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (8, 47, 1000000193, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (7, 31, 1000000196, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (3, 36, 1000000199, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (6, 29, 1000000202, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (6, 47, 1000000205, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (9, 43, 1000000208, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (6, 38, 1000000211, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (7, 21, 1000000214, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (6, 11, 1000000217, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (6, 46, 1000000220, 2)
GO
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (6, 27, 1000000223, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (7, 20, 1000000226, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (3, 21, 1000000229, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (9, 40, 1000000232, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (5, 28, 1000000235, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (10, 39, 1000000238, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (3, 13, 1000000241, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (4, 42, 1000000244, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (10, 33, 1000000247, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (9, 31, 1000000250, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (5, 44, 1000000253, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (10, 46, 1000000256, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (8, 49, 1000000259, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (9, 39, 1000000262, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (9, 16, 1000000265, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (3, 18, 1000000268, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (6, 37, 1000000271, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (5, 42, 1000000274, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (9, 23, 1000000277, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (9, 40, 1000000280, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (3, 50, 1000000283, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (3, 21, 1000000286, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (6, 41, 1000000289, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (6, 16, 1000000292, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (7, 25, 1000000295, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (10, 19, 1000000298, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (10, 45, 1000000301, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (10, 10, 1000000304, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (7, 48, 1000000307, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (8, 38, 1000000310, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (4, 48, 1000000313, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (6, 28, 1000000316, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (5, 38, 1000000319, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (8, 12, 1000000322, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (4, 26, 1000000325, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (4, 33, 1000000328, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (3, 22, 1000000331, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (7, 30, 1000000334, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (10, 47, 1000000337, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (8, 11, 1000000340, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (10, 10, 1000000343, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (9, 44, 1000000346, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (5, 35, 1000000349, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (3, 24, 1000000352, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (7, 34, 1000000355, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (10, 31, 1000000358, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (7, 29, 1000000361, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (5, 32, 1000000364, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (8, 44, 1000000367, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (5, 40, 1000000370, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (4, 20, 1000000373, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (3, 10, 1000000376, 2)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (5, 11, 1000000002, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (6, 20, 1000000005, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (8, 16, 1000000008, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (10, 26, 1000000011, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (5, 39, 1000000014, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (9, 38, 1000000017, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (7, 49, 1000000020, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (3, 21, 1000000023, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (4, 34, 1000000026, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (9, 40, 1000000029, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (6, 39, 1000000032, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (6, 21, 1000000035, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (10, 25, 1000000038, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (4, 48, 1000000041, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (4, 14, 1000000044, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (10, 30, 1000000047, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (5, 47, 1000000050, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (6, 19, 1000000053, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (7, 25, 1000000056, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (8, 23, 1000000059, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (10, 44, 1000000062, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (4, 31, 1000000065, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (7, 24, 1000000068, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (9, 18, 1000000071, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (8, 11, 1000000074, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (6, 37, 1000000077, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (5, 33, 1000000080, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (6, 28, 1000000083, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (6, 50, 1000000086, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (6, 12, 1000000089, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (9, 11, 1000000092, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (3, 11, 1000000095, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (10, 42, 1000000098, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (5, 12, 1000000101, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (8, 36, 1000000104, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (5, 30, 1000000107, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (9, 11, 1000000110, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (5, 50, 1000000113, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (9, 22, 1000000116, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (5, 26, 1000000119, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (4, 46, 1000000122, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (8, 44, 1000000125, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (6, 39, 1000000128, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (9, 44, 1000000131, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (5, 14, 1000000134, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (7, 16, 1000000137, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (3, 12, 1000000140, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (9, 41, 1000000143, 3)
GO
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (6, 41, 1000000146, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (7, 27, 1000000149, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (6, 33, 1000000152, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (8, 44, 1000000155, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (6, 34, 1000000158, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (3, 49, 1000000161, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (7, 16, 1000000164, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (3, 36, 1000000167, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (3, 19, 1000000170, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (3, 39, 1000000173, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (3, 42, 1000000176, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (7, 48, 1000000179, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (9, 42, 1000000182, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (7, 46, 1000000185, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (5, 15, 1000000188, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (6, 27, 1000000191, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (10, 17, 1000000194, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (5, 29, 1000000197, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (9, 26, 1000000200, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (7, 46, 1000000203, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (8, 45, 1000000206, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (9, 42, 1000000209, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (3, 22, 1000000212, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (7, 10, 1000000215, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (3, 24, 1000000218, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (4, 16, 1000000221, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (3, 30, 1000000224, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (10, 12, 1000000227, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (6, 38, 1000000230, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (7, 43, 1000000233, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (5, 29, 1000000236, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (3, 19, 1000000239, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (4, 33, 1000000242, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (5, 27, 1000000245, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (5, 16, 1000000248, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (6, 26, 1000000251, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (8, 45, 1000000254, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (8, 44, 1000000257, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (8, 15, 1000000260, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (8, 18, 1000000263, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (3, 44, 1000000266, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (8, 24, 1000000269, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (3, 11, 1000000272, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (3, 44, 1000000275, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (9, 29, 1000000278, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (7, 28, 1000000281, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (10, 31, 1000000284, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (10, 42, 1000000287, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (4, 38, 1000000290, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (10, 49, 1000000293, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (7, 20, 1000000296, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (6, 47, 1000000299, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (6, 25, 1000000302, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (9, 17, 1000000305, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (10, 23, 1000000308, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (6, 47, 1000000311, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (6, 32, 1000000314, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (5, 18, 1000000317, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (7, 37, 1000000320, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (4, 28, 1000000323, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (6, 25, 1000000326, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (10, 47, 1000000329, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (7, 48, 1000000332, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (8, 18, 1000000335, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (9, 26, 1000000338, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (8, 31, 1000000341, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (8, 46, 1000000344, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (10, 13, 1000000347, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (5, 22, 1000000350, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (5, 46, 1000000353, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (3, 50, 1000000356, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (8, 21, 1000000359, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (3, 50, 1000000362, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (7, 21, 1000000365, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (6, 45, 1000000368, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (9, 38, 1000000371, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (10, 19, 1000000374, 3)
INSERT [SPORTSHOP].[Stock] ([quantidade_Loja], [quantidade_Armazem], [produto_ID], [loja_code]) VALUES (10, 10, 1000000377, 3)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Ginger Kennedy', 10120836)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Stacey Little', 10135728)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Hedy Sharpe', 10176924)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Sybill Casey', 10182109)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Uma Robinson', 10412196)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Nissim Woods', 10491988)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Nita Villarreal', 10532028)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Tara Andrews', 10552344)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Noelle Hyde', 10609422)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Francis Curtis', 10630263)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Tanya Burch', 10929079)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Hilel Heath', 11083909)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Kaden Murphy', 11115576)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Gannon Lawson', 11135420)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Scarlett Murray', 11295867)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Anne Cooke', 11400459)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Harding Macdonald', 11645825)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Clayton Pollard', 11769137)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Walter Pacheco', 11841118)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Phoebe Mayo', 12020799)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Alfreda Hendrix', 12098117)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Quon Chandler', 12176552)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Orli Clayton', 12363321)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Candace Shaffer', 12505291)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Salvador Garrett', 12601052)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Fitzgerald Frye', 12609491)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Cheyenne Baird', 12672454)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Kaitlin Slater', 12727951)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Acton Orr', 13150517)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Flynn Kemp', 13176638)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Gay Puckett', 13441919)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Daquan English', 13509096)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Jason Cooley', 13597973)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Uta England', 13651412)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Randall Sutton', 13816681)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Coby Horne', 13852279)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Russell Randolph', 14202762)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Stephanie Bauer', 14240553)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Kelly Morris', 14292591)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Emerson Garza', 14420369)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Lysandra Ross', 14437001)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Iris Huff', 14564443)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Hamish Bray', 14591765)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Ainsley Rodriguez', 14802156)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Flynn Greene', 14825962)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Keaton Camacho', 14927762)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Lewis Orr', 14988942)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Jolie Dawson', 15208428)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Allegra Pitts', 15312303)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Lionel Hansen', 15779662)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Dennis Herring', 15858305)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Beverly Pierce', 15905420)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Dahlia Goodwin', 15939048)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Karyn Wilkins', 15983319)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Olympia Knapp', 15984692)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Buffy Lewis', 16101490)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Vivian Todd', 16212112)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Kyla Finch', 16383510)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Norman Leblanc', 16520257)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Odette Nielsen', 16605959)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Martha Norman', 16640869)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Jared Holmes', 16645740)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Gretchen Simon', 16741818)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Kirby Alvarado', 16782187)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Ivy Sullivan', 16933652)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Macon Newman', 17023334)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Edward Barnes', 17264919)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Brendan Powell', 17350548)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Phoebe Gray', 17371425)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Richard Mcmahon', 17447686)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Deacon Simpson', 17595671)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Urielle Barnes', 17639652)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Christian Benson', 17676222)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Rebecca Hickman', 17702370)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Ciaran Kerr', 17770398)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Sawyer Mckinney', 17802983)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Denton Johnson', 17812075)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Burke Guy', 17880704)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Lila Alston', 18071908)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Marcia Rasmussen', 18076783)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Virginia Matthews', 18093333)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Laurel Cabrera', 18443231)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Kato Rodriguez', 18593718)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Libby Stark', 18642467)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Burton Miranda', 18677317)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Nero Francis', 18749269)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Alden Manning', 18762889)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Francis Dillon', 19060481)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Elliott Merritt', 19201883)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Leonard Diaz', 19359971)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Colton Freeman', 19446914)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Bradley Moon', 19452731)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Alec Cantu', 19484298)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Bernard Workman', 19491337)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Amos Daniels', 19511695)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Ulla Parks', 19531058)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Galena Montoya', 19558825)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Christian Cooper', 19729784)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Megan Nolan', 19876652)
INSERT [SPORTSHOP].[Utilizador] ([nome], [num_ID]) VALUES (N'Rae Moore', 19937575)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [i_produto_nome]    Script Date: 12/06/2020 23:13:22 ******/
CREATE NONCLUSTERED INDEX [i_produto_nome] ON [SPORTSHOP].[Produto]
(
	[tipo_ID] ASC,
	[nome_Produto] ASC,
	[marca] ASC,
	[especificidade] ASC,
	[loja_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [SPORTSHOP].[Venda] ADD  DEFAULT ((0)) FOR [work_ID]
GO
ALTER TABLE [SPORTSHOP].[Venda] ADD  DEFAULT ((0)) FOR [num_ID]
GO
ALTER TABLE [Company].[department]  WITH CHECK ADD FOREIGN KEY([Mgr_ssn])
REFERENCES [Company].[employee] ([Ssn])
GO
ALTER TABLE [Company].[employee]  WITH CHECK ADD  CONSTRAINT [fk] FOREIGN KEY([Dno])
REFERENCES [Company].[department] ([Dnumber])
GO
ALTER TABLE [Company].[employee] CHECK CONSTRAINT [fk]
GO
ALTER TABLE [Company].[employee]  WITH CHECK ADD FOREIGN KEY([Super_ssn])
REFERENCES [Company].[employee] ([Ssn])
GO
ALTER TABLE [SPORTSHOP].[Cliente]  WITH CHECK ADD FOREIGN KEY([num_ID])
REFERENCES [SPORTSHOP].[Utilizador] ([num_ID])
GO
ALTER TABLE [SPORTSHOP].[Funcionario]  WITH CHECK ADD FOREIGN KEY([loja_code])
REFERENCES [SPORTSHOP].[Loja] ([loja_code])
GO
ALTER TABLE [SPORTSHOP].[Funcionario]  WITH CHECK ADD FOREIGN KEY([num_ID])
REFERENCES [SPORTSHOP].[Utilizador] ([num_ID])
GO
ALTER TABLE [SPORTSHOP].[Inclui]  WITH CHECK ADD FOREIGN KEY([ID_venda])
REFERENCES [SPORTSHOP].[Venda] ([ID_venda])
GO
ALTER TABLE [SPORTSHOP].[Inclui]  WITH CHECK ADD FOREIGN KEY([produto_ID])
REFERENCES [SPORTSHOP].[Produto] ([produto_ID])
GO
ALTER TABLE [SPORTSHOP].[Produto]  WITH CHECK ADD FOREIGN KEY([loja_code])
REFERENCES [SPORTSHOP].[Loja] ([loja_code])
GO
ALTER TABLE [SPORTSHOP].[Stock]  WITH CHECK ADD FOREIGN KEY([loja_code])
REFERENCES [SPORTSHOP].[Loja] ([loja_code])
GO
ALTER TABLE [SPORTSHOP].[Stock]  WITH CHECK ADD FOREIGN KEY([produto_ID])
REFERENCES [SPORTSHOP].[Produto] ([produto_ID])
GO
ALTER TABLE [SPORTSHOP].[Venda]  WITH CHECK ADD FOREIGN KEY([loja_code])
REFERENCES [SPORTSHOP].[Loja] ([loja_code])
GO
ALTER TABLE [SPORTSHOP].[Venda]  WITH CHECK ADD FOREIGN KEY([num_ID])
REFERENCES [SPORTSHOP].[Cliente] ([num_ID])
ON DELETE SET DEFAULT
GO
ALTER TABLE [SPORTSHOP].[Venda]  WITH CHECK ADD FOREIGN KEY([work_ID])
REFERENCES [SPORTSHOP].[Funcionario] ([work_ID])
ON DELETE SET DEFAULT
GO
/****** Object:  StoredProcedure [dbo].[p_Create_Cliente]    Script Date: 12/06/2020 23:13:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ================
-- ===  CLIENTE ===
-- ================

CREATE PROC	[dbo].[p_Create_Cliente](@num_ID int, @mail varchar(50), @nome varchar(50))
AS
	BEGIN TRY
		BEGIN TRANSACTION
			INSERT INTO SPORTSHOP.[Utilizador](nome, num_ID) VALUES (@nome, @num_ID)
			INSERT INTO SPORTSHOP.[Cliente](mail, num_ID) VALUES (@mail, @num_ID)
		COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[p_Create_Funcionario]    Script Date: 12/06/2020 23:13:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- ===================
-- === FUNCIONARIO ===
-- ===================

CREATE PROC	[dbo].[p_Create_Funcionario](@num_ID int, @password varchar(50), @nome varchar(50), @loja_code int)
AS
	BEGIN TRY
		BEGIN TRANSACTION
			INSERT INTO SPORTSHOP.[Utilizador](nome, num_ID) VALUES (@nome, @num_ID)
			INSERT INTO SPORTSHOP.[Funcionario]([password], num_ID, loja_code) VALUES (@password, @num_ID, @loja_code)
		COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[p_Create_Produto]    Script Date: 12/06/2020 23:13:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ===============
-- === PRODUTO ===
-- ===============

CREATE PROC	[dbo].[p_Create_Produto](@nome varchar(50), @marca varchar(50), @especificidade varchar(50), @preco money, @loja_code int, @tipo_ID int)
AS
	BEGIN TRY
		BEGIN TRANSACTION
			INSERT INTO SPORTSHOP.[Produto](nome_Produto, marca, especificidade, preco, loja_code, tipo_ID) VALUES (@nome, @marca, @especificidade, @preco, @loja_code, @tipo_ID)
		COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[p_Create_Venda]    Script Date: 12/06/2020 23:13:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============
-- === VENDA ===
-- =============

CREATE PROC	[dbo].[p_Create_Venda](@data_venda date, @loja_code	int, @work_ID int, @num_ID int)
AS
	BEGIN TRY
		BEGIN TRANSACTION
			INSERT INTO SPORTSHOP.[Venda](data_venda,  loja_code,  work_ID,  num_ID, quantidade, precoTotal) VALUES (@data_venda, @loja_code, @work_ID, @num_ID, 0, 0.00)
		COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[p_Delete_Cliente]    Script Date: 12/06/2020 23:13:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC	[dbo].[p_Delete_Cliente](@num_ID int)
AS
	BEGIN TRY
		BEGIN TRANSACTION
			DELETE SPORTSHOP.[Cliente] WHERE num_ID = @num_ID
			DELETE SPORTSHOP.[Utilizador] WHERE num_ID = @num_ID
		COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[p_Delete_Funcionario]    Script Date: 12/06/2020 23:13:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC	[dbo].[p_Delete_Funcionario](@work_ID int)
AS
	DECLARE @num_ID int
	BEGIN TRY
		BEGIN TRANSACTION
			SELECT @num_ID = num_ID FROM SPORTSHOP.[Funcionario] WHERE work_ID = @work_ID
			DELETE SPORTSHOP.[Funcionario] WHERE work_ID = @work_ID
			DELETE SPORTSHOP.[Utilizador] WHERE num_ID = @num_ID
		COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[p_func]    Script Date: 12/06/2020 23:13:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[p_func] @SSN char(9)
AS
BEGIN

	DELETE FROM Company.[dependent] WHERE Essn=@SSN;
	DELETE FROM Company.works_on WHERE Essn=@SSN;
	UPDATE Company.department SET Mgr_ssn=null WHERE Mgr_ssn=@SSN;
	DELETE FROM Company.employee WHERE Ssn=@SSN;
END
GO
/****** Object:  StoredProcedure [dbo].[p_gestores]    Script Date: 12/06/2020 23:13:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[p_gestores] (@Ssn char(9) OUTPUT, @Fname varchar(15) OUTPUT, @Lname varchar(15) OUTPUT, @diff int OUTPUT)
AS
BEGIN

	SELECT Ssn, Fname, Lname
	FROM Company.employee JOIN Company.department ON Ssn=Mgr_ssn;

	SELECT TOP 1 @Ssn=Ssn, @Fname=Fname, @Lname=Lname, @diff=DATEDIFF(year, Mgr_start_date, CONVERT(date, SYSDATETIME()))
	FROM Company.employee JOIN Company.department ON Ssn=Mgr_ssn
	ORDER BY Mgr_start_date;
END
GO
/****** Object:  StoredProcedure [dbo].[p_retiraStock]    Script Date: 12/06/2020 23:13:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[p_retiraStock](@produto_ID int, @loja_code int, @quantidade int)
AS
	DECLARE @soja int
	DECLARE @sarm int
	BEGIN TRY
	BEGIN TRANSACTION
		SELECT @soja = quantidade_Loja, @sarm = quantidade_Armazem FROM SPORTSHOP.Stock WHERE produto_ID = @produto_ID AND loja_code = @loja_code
		IF @sarm > @quantidade
		BEGIN
			UPDATE SPORTSHOP.Stock SET quantidade_Armazem = @sarm - @quantidade WHERE produto_ID = @produto_ID AND loja_code = @loja_code
		END
		ELSE
		BEGIN
			SET @quantidade = @quantidade - @sarm
			UPDATE SPORTSHOP.Stock SET quantidade_Loja = @soja - @quantidade, quantidade_Armazem = 0 WHERE produto_ID = @produto_ID AND loja_code = @loja_code
		END
	COMMIT
	END TRY
	BEGIN CATCH
	ROLLBACK
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[p_Update_Stock]    Script Date: 12/06/2020 23:13:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============
-- === STOCK ===
-- =============

CREATE PROC [dbo].[p_Update_Stock](@produto_ID int, @quantidade_Loja int, @quantidade_Armazem int)
AS
	DECLARE @existe_Loja int
	DECLARE @existe_Armazem int
    BEGIN TRY
		BEGIN TRANSACTION
			SELECT @existe_Loja = quantidade_Loja, @existe_Armazem = quantidade_Armazem FROM SPORTSHOP.[Stock] WHERE produto_ID = @produto_ID
			UPDATE SPORTSHOP.[Stock] SET quantidade_Loja = @existe_Loja + @quantidade_Loja, quantidade_Armazem = @existe_Armazem + @quantidade_Armazem WHERE produto_ID = @produto_ID
		COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK
	END CATCH
GO
/****** Object:  Trigger [Company].[t_DeleteDepartment]    Script Date: 12/06/2020 23:13:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [Company].[t_DeleteDepartment] ON [Company].[department]
INSTEAD OF DELETE
AS
BEGIN

	IF (NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES
		WHERE TABLE_SCHEMA = 'Company' AND TABLE_NAME = 'DEPARTMENT_DELETED'))
		BEGIN
			CREATE TABLE Company.DEPARTMENT_DELETED (Dname varchar(15) NOT NULL, Dnumber int PRIMARY KEY, Mgr_ssn char(9), Mgr_start_date date);
		END

	DELETE FROM Company.project WHERE Dnum in (SELECT Dnumber FROM deleted);
	UPDATE Company.employee SET Dno=NULL WHERE DNO IN (SELECT Dnumber FROM deleted);
	INSERT INTO Company.DEPARTMENT_DELETED SELECT * FROM DELETED;
	DELETE FROM Company.department WHERE Dnumber IN (SELECT Dnumber FROM deleted);

END

GO
ALTER TABLE [Company].[department] ENABLE TRIGGER [t_DeleteDepartment]
GO
/****** Object:  Trigger [Company].[t_funcDepartment]    Script Date: 12/06/2020 23:13:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [Company].[t_funcDepartment] ON [Company].[department]
AFTER INSERT, UPDATE
AS
BEGIN
	
	DECLARE @Ssn as char(9);

	SELECT @Ssn=Mgr_ssn FROM inserted;

	IF EXISTS(SELECT Mgr_ssn FROM Company.department WHERE Mgr_ssn=@Ssn)
	BEGIN
		ROLLBACK TRAN;
		RAISERROR('Funcionário já gere um departamento!', 16, 1);
	END
END

GO
ALTER TABLE [Company].[department] ENABLE TRIGGER [t_funcDepartment]
GO
/****** Object:  Trigger [Company].[t_funcSalary]    Script Date: 12/06/2020 23:13:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [Company].[t_funcSalary] ON [Company].[employee]
INSTEAD OF INSERT, UPDATE
AS
BEGIN
	
	DECLARE @Salary as decimal(10,2);
	DECLARE @ESalary as decimal(10,2) = NULL;
	DECLARE @IsUpdate as int;

	SELECT @Salary=Salary FROM inserted;
	SELECT @IsUpdate=COUNT(*) FROM deleted;


	SELECT @ESalary=employee.Salary
	FROM inserted JOIN Company.department ON inserted.Dno=Dnumber
		JOIN Company.employee ON Mgr_ssn=employee.Ssn
	WHERE employee.Salary<@Salary;

	if(@IsUpdate = 0)
	BEGIN
		if (@ESalary = NULL)
		BEGIN
			INSERT INTO Company.employee
			SELECT *
			FROM inserted;
		END
	ELSE
		BEGIN
			INSERT INTO Company.employee(Fname, Minit, Lname, Ssn, Bdate, [Address], Sex, Salary, Super_ssn, Dno)
			SELECT Fname, Minit, Lname, Ssn, Bdate, [Address], Sex, @ESalary-1, Super_ssn, Dno
			FROM inserted;
		END
	END
	ELSE
	BEGIN
		if (@ESalary = NULL)
		BEGIN
			UPDATE Company.employee
			SET Fname=inserted.Fname, Minit=inserted.Minit, Lname=inserted.Lname, Ssn=inserted.Ssn, Bdate=inserted.Bdate, [Address]=inserted.[Address], Sex=inserted.Sex, Salary=inserted.Salary, Super_ssn=inserted.Super_ssn, Dno=inserted.Dno
			FROM deleted JOIN inserted ON deleted.Ssn=inserted.Ssn;
		END
		ELSE
		BEGIN
			UPDATE Company.employee
			SET Fname=inserted.Fname, Minit=inserted.Minit, Lname=inserted.Lname, Ssn=inserted.Ssn, Bdate=inserted.Bdate, [Address]=inserted.[Address], Sex=inserted.Sex, Salary=@ESalary-1, Super_ssn=inserted.Super_ssn, Dno=inserted.Dno
			FROM deleted JOIN inserted ON deleted.Ssn=inserted.Ssn;
		END
	END
	
END

GO
ALTER TABLE [Company].[employee] ENABLE TRIGGER [t_funcSalary]
GO
/****** Object:  Trigger [SPORTSHOP].[t_Create_Stock]    Script Date: 12/06/2020 23:13:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============
-- === STOCK ===
-- =============

CREATE TRIGGER [SPORTSHOP].[t_Create_Stock] ON [SPORTSHOP].[Produto] AFTER INSERT
AS
	DECLARE @produto_ID int
	DECLARE @loja_code int
	BEGIN TRY
		BEGIN TRANSACTION
			SET @produto_ID = @@IDENTITY
			SELECT @loja_code = loja_code FROM SPORTSHOP.[Produto] WHERE produto_ID = @produto_ID
			INSERT INTO SPORTSHOP.[Stock](produto_ID, loja_code, quantidade_Loja, quantidade_Armazem) VALUES (@produto_ID, @loja_code, 0, 0)
		COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK
	END CATCH
GO
ALTER TABLE [SPORTSHOP].[Produto] ENABLE TRIGGER [t_Create_Stock]
GO
USE [master]
GO
ALTER DATABASE [p4g10] SET  READ_WRITE 
GO
