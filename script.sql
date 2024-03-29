USE [master]
GO
/****** Object:  Database [GasStationdb]    Script Date: 12.01.2024 15:34:05 ******/
CREATE DATABASE [GasStationdb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GasStationdb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\GasStationdb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GasStationdb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\GasStationdb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GasStationdb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GasStationdb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GasStationdb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GasStationdb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GasStationdb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GasStationdb] SET ARITHABORT OFF 
GO
ALTER DATABASE [GasStationdb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GasStationdb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GasStationdb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GasStationdb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GasStationdb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GasStationdb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GasStationdb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GasStationdb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GasStationdb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GasStationdb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GasStationdb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GasStationdb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GasStationdb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GasStationdb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GasStationdb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GasStationdb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GasStationdb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GasStationdb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GasStationdb] SET  MULTI_USER 
GO
ALTER DATABASE [GasStationdb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GasStationdb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GasStationdb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GasStationdb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GasStationdb] SET DELAYED_DURABILITY = DISABLED 
GO
USE [GasStationdb]
GO
/****** Object:  Table [dbo].[Camera_load]    Script Date: 12.01.2024 15:34:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Camera_load](
	[date] [date] NOT NULL,
	[status] [bit] NOT NULL,
	[state_number] [nvarchar](50) NULL,
	[img] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CreditCard]    Script Date: 12.01.2024 15:34:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CreditCard](
	[CardIssuer] [varchar](40) NOT NULL,
	[CardNumber] [varchar](20) NOT NULL,
	[CardExpDate] [date] NOT NULL,
	[Balance] [int] NOT NULL,
	[CardHolder] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CreditCard] PRIMARY KEY CLUSTERED 
(
	[CardNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DepositCard]    Script Date: 12.01.2024 15:34:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DepositCard](
	[CardIssuer] [varchar](40) NOT NULL,
	[CardNumber] [varchar](20) NOT NULL,
	[CardExpDate] [date] NOT NULL,
	[Balance] [int] NOT NULL,
	[CardHolder] [varchar](50) NOT NULL,
 CONSTRAINT [PK_DepositCard] PRIMARY KEY CLUSTERED 
(
	[CardNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fuel_List]    Script Date: 12.01.2024 15:34:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fuel_List](
	[Station_ID] [int] NULL,
	[Name] [varchar](30) NULL,
	[Price] [decimal](4, 2) NULL,
	[AmountOfFuel] [int] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Fuel_List] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gas_Station]    Script Date: 12.01.2024 15:34:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gas_Station](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Gas_station] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Gas_Station] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gas_Station_ID]    Script Date: 12.01.2024 15:34:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gas_Station_ID](
	[Address] [nvarchar](120) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Gas_Station_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Loyalty_Сards]    Script Date: 12.01.2024 15:34:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loyalty_Сards](
	[LoyaltyСard] [int] NOT NULL,
	[CardHolder] [nvarchar](50) NOT NULL,
	[Balance] [smallint] NOT NULL,
 CONSTRAINT [PK_Loyalty_Сards] PRIMARY KEY CLUSTERED 
(
	[LoyaltyСard] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Camera_load] ([date], [status], [state_number], [img]) VALUES (CAST(N'2020-11-28' AS Date), 1, N'А001АА01', N'А001АА01.png')
INSERT [dbo].[Camera_load] ([date], [status], [state_number], [img]) VALUES (CAST(N'2020-11-28' AS Date), 1, N'А001АА40', N'А001АА40.png')
INSERT [dbo].[Camera_load] ([date], [status], [state_number], [img]) VALUES (CAST(N'2020-11-28' AS Date), 1, N'А077ЕН142', N'А077ЕН142.jpg')
INSERT [dbo].[Camera_load] ([date], [status], [state_number], [img]) VALUES (CAST(N'2020-11-28' AS Date), 1, N'А149НЕ763', N'А149НЕ763.jpg')
INSERT [dbo].[Camera_load] ([date], [status], [state_number], [img]) VALUES (CAST(N'2020-11-29' AS Date), 1, N'А317ВО116', N'А317ВО116.jpg')
INSERT [dbo].[Camera_load] ([date], [status], [state_number], [img]) VALUES (CAST(N'2020-11-29' AS Date), 1, N'А744АА02', N'А744АА02.jpg')
INSERT [dbo].[Camera_load] ([date], [status], [state_number], [img]) VALUES (CAST(N'2020-11-29' AS Date), 1, N'А888ОК55', N'А888ОК55.jpg')
INSERT [dbo].[Camera_load] ([date], [status], [state_number], [img]) VALUES (CAST(N'2020-11-29' AS Date), 1, N'А999АА777', N'А999АА777.jpg')
INSERT [dbo].[Camera_load] ([date], [status], [state_number], [img]) VALUES (CAST(N'2020-11-30' AS Date), 1, N'В333ВВ43', N'В333ВВ43.png')
INSERT [dbo].[Camera_load] ([date], [status], [state_number], [img]) VALUES (CAST(N'2020-11-30' AS Date), 1, N'Е008ЕЕ77', N'Е008ЕЕ77.png')
INSERT [dbo].[Camera_load] ([date], [status], [state_number], [img]) VALUES (CAST(N'2020-11-30' AS Date), 1, N'Е969УТ197', N'Е969УТ197.png')
INSERT [dbo].[Camera_load] ([date], [status], [state_number], [img]) VALUES (CAST(N'2020-11-30' AS Date), 1, N'М640РВ72', N'М640РВ72.png')
INSERT [dbo].[Camera_load] ([date], [status], [state_number], [img]) VALUES (CAST(N'2020-12-01' AS Date), 1, N'Н888РУ150', N'Н888РУ150.jpg')
INSERT [dbo].[Camera_load] ([date], [status], [state_number], [img]) VALUES (CAST(N'2020-12-01' AS Date), 1, N'Н952НВ777', N'Н952НВ777.jpeg')
INSERT [dbo].[Camera_load] ([date], [status], [state_number], [img]) VALUES (CAST(N'2020-11-28' AS Date), 0, NULL, N'не распознан.png')
INSERT [dbo].[Camera_load] ([date], [status], [state_number], [img]) VALUES (CAST(N'2020-11-28' AS Date), 0, NULL, N'не распознан_1.jpg')
INSERT [dbo].[Camera_load] ([date], [status], [state_number], [img]) VALUES (CAST(N'2020-11-29' AS Date), 0, NULL, N'не распознан_2.jpg')
INSERT [dbo].[Camera_load] ([date], [status], [state_number], [img]) VALUES (CAST(N'2020-11-29' AS Date), 0, NULL, N'не распознан_3.jpg')
INSERT [dbo].[Camera_load] ([date], [status], [state_number], [img]) VALUES (CAST(N'2020-11-30' AS Date), 0, NULL, N'не распознан_4.jpg')
INSERT [dbo].[Camera_load] ([date], [status], [state_number], [img]) VALUES (CAST(N'2020-11-30' AS Date), 0, NULL, N'не распознан_5.jpg')
INSERT [dbo].[Camera_load] ([date], [status], [state_number], [img]) VALUES (CAST(N'2020-12-01' AS Date), 0, NULL, N'не распознан_6.jpg')
INSERT [dbo].[Camera_load] ([date], [status], [state_number], [img]) VALUES (CAST(N'2020-12-01' AS Date), 0, NULL, N'не распознан_7.jpg')
INSERT [dbo].[Camera_load] ([date], [status], [state_number], [img]) VALUES (CAST(N'2020-12-02' AS Date), 0, NULL, N'не распознан_8.jpg')
INSERT [dbo].[Camera_load] ([date], [status], [state_number], [img]) VALUES (CAST(N'2020-12-02' AS Date), 0, NULL, N'не распознан_9.jpg')
INSERT [dbo].[Camera_load] ([date], [status], [state_number], [img]) VALUES (CAST(N'2020-12-01' AS Date), 1, N'О007ОО77', N'О007ОО77.png')
INSERT [dbo].[Camera_load] ([date], [status], [state_number], [img]) VALUES (CAST(N'2020-12-01' AS Date), 1, N'О999ОО77', N'О999ОО77.png')
INSERT [dbo].[Camera_load] ([date], [status], [state_number], [img]) VALUES (CAST(N'2020-12-02' AS Date), 1, N'С001АС777', N'С001АС777.png')
INSERT [dbo].[Camera_load] ([date], [status], [state_number], [img]) VALUES (CAST(N'2020-12-02' AS Date), 1, N'Т777ТТ71', N'Т777ТТ71.png')
INSERT [dbo].[Camera_load] ([date], [status], [state_number], [img]) VALUES (CAST(N'2020-12-02' AS Date), 1, N'Х007АМ97', N'Х007АМ97.png')
INSERT [dbo].[Camera_load] ([date], [status], [state_number], [img]) VALUES (CAST(N'2020-12-02' AS Date), 1, N'Х082МК125', N'Х082МК125.png')
GO
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5020 6473 7155 7524', CAST(N'2023-07-01' AS Date), 7000, N'MAKSIM FEDOROV')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5027 4122 1559 1061', CAST(N'2022-12-01' AS Date), 3830, N'IULIIA SMIRNOVA')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5028 8353 9248 8231', CAST(N'2023-01-01' AS Date), 2780, N'OLEG KUDRIAVTSEV')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5036 6736 0977 4220', CAST(N'2023-07-01' AS Date), 8930, N'GALINA BELIAEVA')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5045 4685 8409 6932', CAST(N'2023-03-01' AS Date), 7290, N'MARINA FEDOROVA')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5045 5553 1100 7099', CAST(N'2022-02-01' AS Date), 3450, N'TATIANA GERASIMOVA')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5067 3294 7843 6092', CAST(N'2023-05-01' AS Date), 9740, N'MARINA FEDOROVA')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5079 1861 5628 5688', CAST(N'2023-09-01' AS Date), 5780, N'MARIIA GUSEVA')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5080 7881 7958 5205', CAST(N'2022-03-01' AS Date), 3200, N'NIKITA NOVIKOV')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5080 9537 7580 6856', CAST(N'2022-09-01' AS Date), 2950, N'OLGA PETROVA')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5084 8823 1410 5320', CAST(N'2022-04-01' AS Date), 8410, N'MIKHAIL MIKHAILOV')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5089 4570 2981 0582', CAST(N'2023-07-01' AS Date), 9860, N'VLADISLAV VASILEV')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5092 8348 9231 5136', CAST(N'2023-01-01' AS Date), 3170, N'VLADIMIR MIKHAILOV')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5097 1274 5985 7896', CAST(N'2023-01-01' AS Date), 8850, N'OKSANA SOKOLOVA')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5125 3911 4246 1880', CAST(N'2023-04-01' AS Date), 9960, N'TATIANA VASILEVA')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5126 2582 0318 6731', CAST(N'2023-07-01' AS Date), 6000, N'ALENA ILINA')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5135 6083 5086 5082', CAST(N'2022-01-01' AS Date), 6920, N'VIKTOR ANDREEV')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5137 2802 8474 1058', CAST(N'2023-01-01' AS Date), 2490, N'NIKITA KISELEV')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5150 6304 0793 9108', CAST(N'2023-07-01' AS Date), 7880, N'EVGENII ZAKHAROV')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5166 1656 7722 5864', CAST(N'2023-01-01' AS Date), 5860, N'DMITRII FEDOROV')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5183 5535 3764 5661', CAST(N'2023-12-01' AS Date), 6860, N'DARIA LEBEDEVA')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5198 5459 8664 8835', CAST(N'2022-09-01' AS Date), 2790, N'ILIA ZAKHAROV')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5206 7970 9166 4401', CAST(N'2023-09-01' AS Date), 9200, N'SERGEI GOLUBEV')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5207 5334 3317 5437', CAST(N'2023-08-01' AS Date), 4270, N'SVETLANA KUZNETSOVA')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5215 1758 3647 6168', CAST(N'2022-01-01' AS Date), 4450, N'ALEKSANDRA GOLUBEVA')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5224 8034 9911 6206', CAST(N'2022-07-01' AS Date), 1630, N'ARTEM MOROZOV')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5246 1506 3297 0360', CAST(N'2023-03-01' AS Date), 3890, N'VLADIMIR GOLUBEV')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5248 5853 2888 4011', CAST(N'2022-10-01' AS Date), 7290, N'KSENIIA VINOGRADOVA')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5259 8266 3892 8338', CAST(N'2022-12-01' AS Date), 3670, N'SERGEI ZAKHAROV')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5271 1516 0722 9947', CAST(N'2023-09-01' AS Date), 4470, N'VIKTORIIA SOROKINA')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5289 7245 2558 2066', CAST(N'2022-05-01' AS Date), 8120, N'ALENA IVANOVA')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5304 6221 5957 2455', CAST(N'2022-06-01' AS Date), 6100, N'OKSANA KUZMINA')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5316 2370 9000 0643', CAST(N'2023-01-01' AS Date), 4420, N'ELENA GRIGOREVA')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5340 3472 7622 8775', CAST(N'2022-08-01' AS Date), 4190, N'IGOR STEPANOV')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5349 9763 4642 6752', CAST(N'2023-09-01' AS Date), 9790, N'MARIIA LEBEDEVA')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5368 7969 1816 9697', CAST(N'2023-10-01' AS Date), 4240, N'ALENA KUZNETSOVA')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5375 9512 1855 9284', CAST(N'2022-01-01' AS Date), 1420, N'MIKHAIL PETROV')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5405 2273 8585 4756', CAST(N'2022-10-01' AS Date), 3890, N'VLADIMIR GOLUBEV')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5405 3125 8200 2753', CAST(N'2023-07-01' AS Date), 9720, N'OKSANA TARASOVA')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5405 7324 7933 6040', CAST(N'2022-01-01' AS Date), 2280, N'KSENIIA ORLOVA')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5408 0890 3484 2054', CAST(N'2022-02-01' AS Date), 5530, N'ANTON PETROV')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5408 5257 0822 8674', CAST(N'2023-10-01' AS Date), 5700, N'DARIA GOLUBEVA')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5418 8118 2734 5328', CAST(N'2022-03-01' AS Date), 7530, N'KONSTANTIN TITOV')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5427 3877 6423 8353', CAST(N'2023-01-01' AS Date), 6570, N'ILIA FEDOROV')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5432 2790 4221 2941', CAST(N'2022-07-01' AS Date), 2890, N'MARIIA KULIKOVA')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5433 4218 8684 0754', CAST(N'2022-04-01' AS Date), 1200, N'VALENTINA VASILEVA')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5445 0028 5833 5936', CAST(N'2022-01-01' AS Date), 7070, N'SERGEI GUSEV')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5445 7620 2847 8029', CAST(N'2022-01-01' AS Date), 2340, N'NADEZHDA BELIAEVA')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5457 6570 9997 0083', CAST(N'2023-01-01' AS Date), 5710, N'VLADISLAV POPOV')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5458 2651 7631 8686', CAST(N'2022-05-01' AS Date), 5650, N'KSENIIA SMIRNOVA')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5464 8539 0438 4591', CAST(N'2023-07-01' AS Date), 6640, N'ANTON BELIAEV')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5486 8431 2591 7653', CAST(N'2023-01-01' AS Date), 2750, N'IVAN SERGEEV')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5487 6734 6497 4000', CAST(N'2023-05-01' AS Date), 4920, N'IVAN KOZLOV')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5489 3558 5783 2338', CAST(N'2022-04-01' AS Date), 9120, N'OKSANA KOVALEVA')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5492 0402 4577 7362', CAST(N'2022-05-01' AS Date), 3450, N'IGOR PAVLOV')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5499 6595 7572 9264', CAST(N'2022-08-01' AS Date), 4610, N'MIKHAIL GERASIMOV')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5501 9486 3084 0216', CAST(N'2023-02-01' AS Date), 4420, N'EKATERINA BARANOVA')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5507 3698 3133 0838', CAST(N'2022-02-01' AS Date), 6430, N'VLADIMIR VINOGRADOV')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5507 4998 9185 9309', CAST(N'2022-10-01' AS Date), 7740, N'NATALIA GOLUBEVA')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5510 7141 9546 6394', CAST(N'2023-07-01' AS Date), 6790, N'NIKOLAI PETROV')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5516 4459 7161 3842', CAST(N'2022-09-01' AS Date), 5360, N'VITALII KOROLEV')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5529 5892 1952 9263', CAST(N'2022-11-01' AS Date), 7500, N'MARIIA MOROZOVA')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5545 0929 7653 0343', CAST(N'2023-02-01' AS Date), 5930, N'ROMAN IAKOVLEV')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5548 1798 6463 5016', CAST(N'2023-12-01' AS Date), 7610, N'IULIIA STEPANOVA')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5552 0381 8854 8078', CAST(N'2022-11-01' AS Date), 3150, N'IURII ANDREEV')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5568 5130 6813 5172', CAST(N'2023-07-01' AS Date), 5640, N'ROMAN BORISOV')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5579 4014 4548 7788', CAST(N'2023-11-01' AS Date), 2140, N'LIUDMILA STEPANOVA')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5586 7751 1350 1561', CAST(N'2023-01-01' AS Date), 5780, N'VALENTINA GERASIMOVA')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5601 6176 7931 1426', CAST(N'2022-08-01' AS Date), 6880, N'EVGENIIA PAVLOVA')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5619 8682 2376 7940', CAST(N'2023-02-01' AS Date), 5470, N'IULIIA VINOGRADOVA')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5665 8826 1252 2140', CAST(N'2023-12-01' AS Date), 9700, N'NIKITA GOLUBEV')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5666 7224 2888 0507', CAST(N'2023-09-01' AS Date), 6620, N'ARTEM ZAITSEV')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5669 1252 4255 3069', CAST(N'2023-05-01' AS Date), 6180, N'ANASTASIIA KUZMINA')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5675 8856 2254 5231', CAST(N'2023-04-01' AS Date), 2680, N'ILIA IVANOV')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5678 5370 5973 7644', CAST(N'2023-09-01' AS Date), 9080, N'NATALIA ORLOVA')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5696 8653 7021 4839', CAST(N'2023-10-01' AS Date), 9570, N'EVGENII VASILEV')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5702 2551 8050 8244', CAST(N'2023-04-01' AS Date), 8470, N'IGOR PAVLOV')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5711 8490 1606 4486', CAST(N'2022-01-01' AS Date), 8820, N'ROMAN MAKAROV')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5778 0494 6516 2010', CAST(N'2022-11-01' AS Date), 2460, N'DARIA ALEKSEEVA')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5800 4328 6408 4484', CAST(N'2022-05-01' AS Date), 4420, N'NATALIA KISELEVA')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5807 3659 9582 0637', CAST(N'2022-03-01' AS Date), 8950, N'IULIIA KOVALEVA')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5817 1655 4316 1874', CAST(N'2023-06-01' AS Date), 8590, N'ANDREI SMIRNOV')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5843 8162 0770 2183', CAST(N'2023-02-01' AS Date), 3240, N'ANNA BELIAEVA')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5849 7449 4436 3255', CAST(N'2022-04-01' AS Date), 8280, N'OKSANA SEMENOVA')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5859 5417 7650 8453', CAST(N'2023-07-01' AS Date), 8700, N'EVGENIIA KISELEVA')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5860 1308 7173 9184', CAST(N'2022-12-01' AS Date), 3030, N'SVETLANA BARANOVA')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5867 1427 1264 3296', CAST(N'2022-08-01' AS Date), 2120, N'NATALIA ROMANOVA')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5881 6922 8854 7216', CAST(N'2023-12-01' AS Date), 3100, N'ANNA ZAKHAROVA')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5881 9350 5380 2120', CAST(N'2023-01-01' AS Date), 1090, N'ALENA ROMANOVA')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5887 2834 1129 2294', CAST(N'2022-12-01' AS Date), 1240, N'OLEG ANDREEV')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5906 0023 0106 1883', CAST(N'2023-11-01' AS Date), 5800, N'IULIIA STEPANOVA')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5906 6666 5035 5169', CAST(N'2023-10-01' AS Date), 2110, N'EVGENIIA KOMAROVA')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5923 6418 6214 3009', CAST(N'2022-04-01' AS Date), 6170, N'IURII BARANOV')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5929 6983 8560 3244', CAST(N'2022-09-01' AS Date), 8190, N'ANNA SEMENOVA')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5930 9869 8499 6987', CAST(N'2023-03-01' AS Date), 1090, N'EVGENII BOGDANOV')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5944 4254 6761 3383', CAST(N'2023-11-01' AS Date), 9190, N'ELENA KOMAROVA')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5947 4728 0146 3916', CAST(N'2022-05-01' AS Date), 9740, N'OLGA ZAKHAROVA')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5990 4444 6582 5785', CAST(N'2022-03-01' AS Date), 3820, N'KONSTANTIN GUSEV')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5997 0478 1554 7745', CAST(N'2023-11-01' AS Date), 6070, N'DMITRII BELOV')
INSERT [dbo].[CreditCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'MasterCard', N'5999 4385 3638 2124', CAST(N'2022-07-01' AS Date), 8080, N'ELENA SOLOVEVA')
GO
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4000 5953 5041 7441', CAST(N'2022-08-01' AS Date), 8370, N'EKATERINA BARANOVA')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4006 0630 5091 3684', CAST(N'2023-02-01' AS Date), 1810, N'MARIIA KOVALEVA')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4020 5346 4675 6508', CAST(N'2023-09-01' AS Date), 5620, N'ALEKSANDRA SMIRNOVA')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4029 4590 4710 6759', CAST(N'2022-09-01' AS Date), 1720, N'NATALIA SERGEEVA')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4030 0200 8847 3131', CAST(N'2023-07-01' AS Date), 1300, N'VITALII GUSEV')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4035 2193 2883 1067', CAST(N'2022-01-01' AS Date), 6820, N'KSENIIA SMIRNOVA')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4040 7012 8613 5279', CAST(N'2023-07-01' AS Date), 1860, N'OKSANA BOGDANOVA')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4052 6410 4403 4502', CAST(N'2022-04-01' AS Date), 6650, N'ANNA SEMENOVA')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4057 7224 8017 7321', CAST(N'2023-02-01' AS Date), 8660, N'IVAN KOROLEV')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4107 7656 8120 0442', CAST(N'2022-09-01' AS Date), 3770, N'ANASTASIIA TARASOVA')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4123 4315 5110 8534', CAST(N'2022-02-01' AS Date), 5540, N'IGOR KISELEV')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4135 2613 2858 5177', CAST(N'2022-08-01' AS Date), 9730, N'ANTON FEDOROV')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4137 5125 6045 4755', CAST(N'2023-08-01' AS Date), 4090, N'VIKTORIIA SOROKINA')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4145 0706 3942 2212', CAST(N'2022-06-01' AS Date), 7960, N'MARINA MIKHAILOVA')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4146 9874 8072 9818', CAST(N'2022-11-01' AS Date), 1930, N'KONSTANTIN PETROV')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4148 9668 9982 6520', CAST(N'2023-06-01' AS Date), 7870, N'ALEKSANDR VOLKOV')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4169 2313 5476 3302', CAST(N'2023-03-01' AS Date), 8060, N'VITALII BARANOV')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4178 3396 9166 7513', CAST(N'2022-12-01' AS Date), 2810, N'IVAN ORLOV')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4195 7042 7931 1868', CAST(N'2022-03-01' AS Date), 7500, N'NATALIA VINOGRADOVA')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4236 2613 7949 1943', CAST(N'2022-11-01' AS Date), 6230, N'OLGA MIKHAILOVA')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4239 6583 4374 0312', CAST(N'2023-07-01' AS Date), 9650, N'VLADIMIR KOVALEV')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4248 6360 1418 1395', CAST(N'2023-11-01' AS Date), 2620, N'NIKITA KOZLOV')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4267 6675 3098 2459', CAST(N'2023-03-01' AS Date), 1240, N'MARIIA VINOGRADOVA')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4274 8670 5951 9192', CAST(N'2022-08-01' AS Date), 3590, N'PAVEL LEBEDEV')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4279 7622 9569 5481', CAST(N'2022-08-01' AS Date), 3210, N'ANASTASIIA PAVLOVA')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4282 5739 4536 2363', CAST(N'2023-12-01' AS Date), 5010, N'IURII PETROV')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4299 7128 3741 0283', CAST(N'2023-06-01' AS Date), 7890, N'IULIIA ZAKHAROVA')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4301 3896 9033 6321', CAST(N'2023-01-01' AS Date), 5440, N'LIUDMILA KOROLEVA')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4306 1146 6036 0381', CAST(N'2022-06-01' AS Date), 5070, N'ILIA KISELEV')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4307 8162 3455 2686', CAST(N'2023-05-01' AS Date), 3350, N'ALENA STEPANOVA')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4307 9517 1929 8792', CAST(N'2022-10-01' AS Date), 2500, N'LIUDMILA ILINA')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4317 5245 4153 8731', CAST(N'2023-10-01' AS Date), 5820, N'ROMAN MOROZOV')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4327 3478 8750 7245', CAST(N'2022-06-01' AS Date), 9820, N'DENIS STEPANOV')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4360 2512 8012 9243', CAST(N'2023-11-01' AS Date), 8290, N'IURII BORISOV')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4360 5577 1457 8023', CAST(N'2022-03-01' AS Date), 9530, N'NATALIA PETROVA')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4368 7443 0272 7889', CAST(N'2022-05-01' AS Date), 9360, N'EVGENII SOKOLOV')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4384 8191 8296 0980', CAST(N'2023-09-01' AS Date), 5970, N'DMITRII VOLKOV')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4385 3352 8192 7365', CAST(N'2023-09-01' AS Date), 9090, N'IRINA KUZNETSOVA')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4395 3371 1614 7357', CAST(N'2022-07-01' AS Date), 2970, N'IULIIA IVANOVA')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4416 1732 6465 1873', CAST(N'2023-07-01' AS Date), 7550, N'ALINA VASILEVA')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4419 4715 4263 2385', CAST(N'2023-01-01' AS Date), 2630, N'NIKITA SOKOLOV')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4437 4387 8474 2212', CAST(N'2022-12-01' AS Date), 7300, N'ARTEM VASILEV')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4448 8167 5063 3340', CAST(N'2022-09-01' AS Date), 7160, N'DENIS FEDOROV')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4453 3371 7691 4208', CAST(N'2022-02-01' AS Date), 5630, N'ANDREI KUZMIN')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4454 5991 4586 8505', CAST(N'2022-08-01' AS Date), 4040, N'KONSTANTIN GUSEV')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4456 7994 3469 6124', CAST(N'2022-07-01' AS Date), 3030, N'OLGA SOROKINA')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4477 7436 9648 4956', CAST(N'2022-05-01' AS Date), 5240, N'ROMAN ROMANOV')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4483 7366 2115 0231', CAST(N'2022-07-01' AS Date), 4770, N'EVGENII NOVIKOV')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4495 0252 2355 9288', CAST(N'2023-06-01' AS Date), 2680, N'MIKHAIL SEMENOV')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4509 5489 2130 9965', CAST(N'2022-11-01' AS Date), 6670, N'GALINA GRIGOREVA')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4530 9768 6820 3680', CAST(N'2022-03-01' AS Date), 4500, N'IULIIA STEPANOVA')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4532 2496 2396 6654', CAST(N'2023-01-01' AS Date), 8710, N'EVGENIIA VINOGRADOVA')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4550 4580 1335 7633', CAST(N'2022-12-01' AS Date), 193, N'OLEG ZAKHAROV')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4556 5214 1173 7195', CAST(N'2023-06-01' AS Date), 9080, N'TATIANA BARANOVA')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4561 0712 9516 9431', CAST(N'2023-02-01' AS Date), 2840, N'DARIA MIKHAILOVA')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4564 1710 2682 1263', CAST(N'2022-11-01' AS Date), 5770, N'VITALII VASILEV')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4568 9157 6580 2280', CAST(N'2022-04-01' AS Date), 8460, N'ALEKSANDR SERGEEV')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4587 8692 1927 5386', CAST(N'2022-04-01' AS Date), 4350, N'MAKSIM BORISOV')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4612 8507 7107 4150', CAST(N'2022-03-01' AS Date), 6740, N'ALEKSANDRA SOROKINA')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4613 4803 7446 2781', CAST(N'2022-08-01' AS Date), 2860, N'VIKTOR BORISOV')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4636 1128 0683 6349', CAST(N'2022-04-01' AS Date), 2460, N'ALENA SEMENOVA')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4638 0105 2690 1328', CAST(N'2023-04-01' AS Date), 4900, N'VLADIMIR VASILEV')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4643 6743 2238 5920', CAST(N'2022-10-01' AS Date), 4340, N'MARINA GOLUBEVA')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4645 5649 9074 4169', CAST(N'2022-02-01' AS Date), 7460, N'VLADIMIR BORISOV')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4655 5566 2899 8115', CAST(N'2022-11-01' AS Date), 4330, N'DMITRII KOZLOV')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4657 9816 5582 2665', CAST(N'2023-03-01' AS Date), 3530, N'ANASTASIIA POPOVA')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4663 9736 6016 1504', CAST(N'2022-04-01' AS Date), 6690, N'PAVEL IAKOVLEV')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4685 3882 5264 0522', CAST(N'2023-03-01' AS Date), 8640, N'SVETLANA VOROBEVA')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4687 3054 6068 9792', CAST(N'2022-12-01' AS Date), 2660, N'VITALII VASILEV')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4701 7848 2287 4288', CAST(N'2022-02-01' AS Date), 4770, N'ALEKSANDRA GUSEVA')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4707 4604 4344 7093', CAST(N'2023-10-01' AS Date), 1480, N'ANASTASIIA TARASOVA')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4724 1966 8557 7325', CAST(N'2022-03-01' AS Date), 7340, N'ALEKSANDR VOLKOV')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4728 9078 1843 4812', CAST(N'2022-07-01' AS Date), 9240, N'NADEZHDA MIKHAILOVA')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4739 4117 8757 7211', CAST(N'2023-11-01' AS Date), 1350, N'ANNA LEBEDEVA')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4744 4518 3616 8383', CAST(N'2023-05-01' AS Date), 6090, N'ELENA KOVALEVA')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4745 0347 6479 1878', CAST(N'2022-11-01' AS Date), 4810, N'ALEKSANDRA SEMENOVA')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4756 1730 5734 3421', CAST(N'2022-03-01' AS Date), 2420, N'ANASTASIIA BELIAEVA')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4758 7921 6561 0021', CAST(N'2023-01-01' AS Date), 8450, N'NATALIA BARANOVA')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4811 7422 1127 1356', CAST(N'2022-09-01' AS Date), 4520, N'MIKHAIL IVANOV')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4817 5079 8260 5122', CAST(N'2022-08-01' AS Date), 4130, N'EVGENIIA ALEKSEEVA')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4823 7119 7797 9870', CAST(N'2022-05-01' AS Date), 3250, N'MARIIA LEBEDEVA')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4828 2903 9847 8858', CAST(N'2022-08-01' AS Date), 8440, N'OLEG TITOV')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4852 0456 1248 8144', CAST(N'2023-01-01' AS Date), 7370, N'IGOR PONOMAREV')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4857 5979 3269 8807', CAST(N'2022-12-01' AS Date), 2570, N'MARIIA STEPANOVA')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4871 4248 9322 6084', CAST(N'2022-05-01' AS Date), 7350, N'DENIS STEPANOV')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4895 9422 0965 3420', CAST(N'2022-01-01' AS Date), 7820, N'TATIANA ANDREEVA')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4899 2487 1400 7060', CAST(N'2023-02-01' AS Date), 9130, N'LIUDMILA IAKOVLEVA')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4921 4010 4484 1714', CAST(N'2022-06-01' AS Date), 5570, N'ANTON STEPANOV')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4923 9769 9324 0701', CAST(N'2023-12-01' AS Date), 2350, N'ANNA PONOMAREVA')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4929 7643 3412 3156', CAST(N'2022-11-01' AS Date), 5540, N'IURII SEMENOV')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4932 3306 3311 2095', CAST(N'2022-03-01' AS Date), 3440, N'TATIANA BELIAEVA')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4941 1461 5923 7507', CAST(N'2022-02-01' AS Date), 7200, N'NATALIA SERGEEVA')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4946 1529 0365 2574', CAST(N'2023-11-01' AS Date), 2670, N'VALENTINA BELOVA')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4950 4752 4118 3736', CAST(N'2022-11-01' AS Date), 9450, N'KRISTINA TARASOVA')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4951 0417 6952 6851', CAST(N'2022-04-01' AS Date), 9090, N'ALEKSEI PAVLOV')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4970 4938 2327 5701', CAST(N'2022-04-01' AS Date), 7620, N'IRINA NOVIKOVA')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4974 1280 6928 8390', CAST(N'2022-01-01' AS Date), 2460, N'MAKSIM VINOGRADOV')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4979 6344 1060 0550', CAST(N'2023-05-01' AS Date), 7420, N'DENIS KOROLEV')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4991 2513 2738 7520', CAST(N'2023-10-01' AS Date), 5930, N'KSENIIA KOROLEVA')
INSERT [dbo].[DepositCard] ([CardIssuer], [CardNumber], [CardExpDate], [Balance], [CardHolder]) VALUES (N'Visa', N'4998 2003 9577 0953', CAST(N'2023-07-01' AS Date), 8270, N'ANASTASIIA ROMANOVA')
GO
SET IDENTITY_INSERT [dbo].[Fuel_List] ON 

INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (1, N'92', CAST(88.88 AS Decimal(4, 2)), 15255, 1)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (1, N'95', CAST(11.32 AS Decimal(4, 2)), 5555, 2)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (1, N'98', CAST(11.11 AS Decimal(4, 2)), 55555, 3)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (1, N'Disel Fuel', CAST(25.32 AS Decimal(4, 2)), 42342, 4)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (2, N'92', CAST(44.49 AS Decimal(4, 2)), 56531, 5)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (2, N'95', CAST(47.85 AS Decimal(4, 2)), 81209, 6)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (2, N'98', CAST(56.09 AS Decimal(4, 2)), 49249, 7)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (2, N'Disel Fuel', CAST(49.69 AS Decimal(4, 2)), 82789, 8)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (3, N'92', CAST(42.40 AS Decimal(4, 2)), 79325, 9)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (3, N'95', CAST(44.85 AS Decimal(4, 2)), 83131, 10)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (3, N'98', CAST(51.60 AS Decimal(4, 2)), 30789, 11)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (3, N'Disel Fuel', CAST(51.80 AS Decimal(4, 2)), 88761, 12)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (4, N'92', CAST(43.20 AS Decimal(4, 2)), 56700, 13)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (4, N'95', CAST(46.70 AS Decimal(4, 2)), 32636, 14)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (4, N'98', CAST(54.61 AS Decimal(4, 2)), 10652, 15)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (4, N'Disel Fuel', CAST(49.90 AS Decimal(4, 2)), 60992, 16)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (5, N'92', CAST(43.83 AS Decimal(4, 2)), 29172, 17)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (5, N'95', CAST(47.70 AS Decimal(4, 2)), 47850, 18)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (5, N'98', CAST(53.15 AS Decimal(4, 2)), 8886, 19)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (5, N'Disel Fuel', CAST(47.40 AS Decimal(4, 2)), 28755, 20)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (6, N'92', CAST(43.50 AS Decimal(4, 2)), 17449, 21)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (6, N'95', CAST(47.94 AS Decimal(4, 2)), 48202, 22)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (6, N'98', CAST(54.09 AS Decimal(4, 2)), 21610, 23)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (6, N'Disel Fuel', CAST(47.60 AS Decimal(4, 2)), 17762, 24)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (7, N'92', CAST(41.50 AS Decimal(4, 2)), 9900, 25)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (7, N'95', CAST(44.30 AS Decimal(4, 2)), 91094, 26)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (7, N'98', CAST(54.86 AS Decimal(4, 2)), 98166, 27)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (7, N'Disel Fuel', CAST(49.00 AS Decimal(4, 2)), 11188, 28)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (8, N'92', CAST(43.20 AS Decimal(4, 2)), 76823, 29)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (8, N'95', CAST(46.70 AS Decimal(4, 2)), 96618, 30)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (8, N'98', CAST(54.61 AS Decimal(4, 2)), 61735, 31)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (8, N'Disel Fuel', CAST(49.90 AS Decimal(4, 2)), 14212, 32)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (9, N'92', CAST(42.55 AS Decimal(4, 2)), 65759, 33)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (9, N'95', CAST(45.10 AS Decimal(4, 2)), 14877, 34)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (9, N'98', CAST(53.17 AS Decimal(4, 2)), 90600, 35)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (9, N'Disel Fuel', CAST(50.05 AS Decimal(4, 2)), 27447, 36)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (10, N'92', CAST(43.05 AS Decimal(4, 2)), 83814, 37)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (10, N'95', CAST(46.87 AS Decimal(4, 2)), 54379, 38)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (10, N'98', CAST(54.28 AS Decimal(4, 2)), 85304, 39)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (10, N'Disel Fuel', CAST(48.39 AS Decimal(4, 2)), 90719, 40)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (11, N'92', CAST(45.34 AS Decimal(4, 2)), 71635, 41)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (11, N'95', CAST(48.94 AS Decimal(4, 2)), 3964, 42)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (11, N'98', CAST(56.16 AS Decimal(4, 2)), 14830, 43)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (11, N'Disel Fuel', CAST(47.75 AS Decimal(4, 2)), 12456, 44)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (12, N'92', CAST(43.35 AS Decimal(4, 2)), 36193, 45)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (12, N'95', CAST(44.85 AS Decimal(4, 2)), 39307, 46)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (12, N'98', CAST(54.98 AS Decimal(4, 2)), 95846, 47)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (12, N'Disel Fuel', CAST(48.60 AS Decimal(4, 2)), 69859, 48)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (13, N'92', CAST(45.07 AS Decimal(4, 2)), 3898, 49)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (13, N'95', CAST(47.92 AS Decimal(4, 2)), 3637, 50)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (13, N'98', CAST(54.61 AS Decimal(4, 2)), 77828, 51)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (13, N'Disel Fuel', CAST(51.41 AS Decimal(4, 2)), 70496, 52)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (14, N'92', CAST(44.80 AS Decimal(4, 2)), 3782, 53)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (14, N'95', CAST(48.45 AS Decimal(4, 2)), 54395, 54)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (14, N'98', CAST(54.21 AS Decimal(4, 2)), 21082, 55)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (14, N'Disel Fuel', CAST(48.00 AS Decimal(4, 2)), 96594, 56)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (15, N'92', CAST(45.09 AS Decimal(4, 2)), 27700, 57)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (15, N'95', CAST(48.55 AS Decimal(4, 2)), 93404, 58)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (15, N'98', CAST(54.22 AS Decimal(4, 2)), 36796, 59)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (15, N'Disel Fuel', CAST(48.76 AS Decimal(4, 2)), 79144, 60)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (16, N'92', CAST(43.98 AS Decimal(4, 2)), 33954, 61)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (16, N'95', CAST(48.30 AS Decimal(4, 2)), 30117, 62)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (16, N'98', CAST(53.51 AS Decimal(4, 2)), 84952, 63)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (16, N'Disel Fuel', CAST(48.39 AS Decimal(4, 2)), 32538, 64)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (17, N'92', CAST(44.09 AS Decimal(4, 2)), 60327, 65)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (17, N'95', CAST(47.67 AS Decimal(4, 2)), 17685, 66)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (17, N'98', CAST(56.20 AS Decimal(4, 2)), 39562, 67)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (17, N'Disel Fuel', CAST(48.50 AS Decimal(4, 2)), 8925, 68)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (18, N'92', CAST(44.49 AS Decimal(4, 2)), 72769, 69)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (18, N'95', CAST(47.85 AS Decimal(4, 2)), 63241, 70)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (18, N'98', CAST(56.09 AS Decimal(4, 2)), 59468, 71)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (18, N'Disel Fuel', CAST(49.69 AS Decimal(4, 2)), 82861, 72)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (19, N'92', CAST(42.40 AS Decimal(4, 2)), 53178, 73)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (19, N'95', CAST(44.85 AS Decimal(4, 2)), 87751, 74)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (19, N'98', CAST(51.60 AS Decimal(4, 2)), 86745, 75)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (19, N'Disel Fuel', CAST(51.80 AS Decimal(4, 2)), 26554, 76)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (20, N'92', CAST(43.20 AS Decimal(4, 2)), 88314, 77)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (20, N'95', CAST(46.70 AS Decimal(4, 2)), 45723, 78)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (20, N'98', CAST(54.61 AS Decimal(4, 2)), 81765, 79)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (20, N'Disel Fuel', CAST(49.90 AS Decimal(4, 2)), 92130, 80)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (21, N'92', CAST(43.83 AS Decimal(4, 2)), 61919, 81)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (21, N'95', CAST(47.70 AS Decimal(4, 2)), 50845, 82)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (21, N'98', CAST(53.15 AS Decimal(4, 2)), 32344, 83)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (21, N'Disel Fuel', CAST(47.40 AS Decimal(4, 2)), 3480, 84)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (22, N'92', CAST(43.50 AS Decimal(4, 2)), 16383, 85)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (22, N'95', CAST(47.94 AS Decimal(4, 2)), 41286, 86)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (22, N'98', CAST(54.09 AS Decimal(4, 2)), 75068, 87)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (22, N'Disel Fuel', CAST(47.60 AS Decimal(4, 2)), 41868, 88)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (23, N'92', CAST(41.50 AS Decimal(4, 2)), 97689, 89)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (23, N'95', CAST(44.30 AS Decimal(4, 2)), 60473, 90)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (23, N'98', CAST(54.86 AS Decimal(4, 2)), 11558, 91)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (23, N'Disel Fuel', CAST(49.00 AS Decimal(4, 2)), 4643, 92)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (24, N'92', CAST(43.20 AS Decimal(4, 2)), 17468, 93)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (24, N'95', CAST(46.70 AS Decimal(4, 2)), 71227, 94)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (24, N'98', CAST(54.61 AS Decimal(4, 2)), 50941, 95)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (24, N'Disel Fuel', CAST(49.90 AS Decimal(4, 2)), 28775, 96)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (25, N'92', CAST(42.55 AS Decimal(4, 2)), 79721, 97)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (25, N'95', CAST(45.10 AS Decimal(4, 2)), 3666, 98)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (25, N'98', CAST(53.17 AS Decimal(4, 2)), 52222, 99)
GO
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (25, N'Disel Fuel', CAST(50.05 AS Decimal(4, 2)), 68280, 100)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (26, N'92', CAST(43.05 AS Decimal(4, 2)), 90955, 101)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (26, N'95', CAST(46.87 AS Decimal(4, 2)), 83789, 102)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (26, N'98', CAST(54.28 AS Decimal(4, 2)), 50723, 103)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (26, N'Disel Fuel', CAST(48.39 AS Decimal(4, 2)), 74784, 104)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (27, N'92', CAST(45.34 AS Decimal(4, 2)), 26404, 105)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (27, N'95', CAST(48.94 AS Decimal(4, 2)), 50604, 106)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (27, N'98', CAST(56.16 AS Decimal(4, 2)), 15978, 107)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (27, N'Disel Fuel', CAST(47.75 AS Decimal(4, 2)), 6626, 108)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (28, N'92', CAST(43.35 AS Decimal(4, 2)), 55875, 109)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (28, N'95', CAST(44.85 AS Decimal(4, 2)), 13526, 110)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (28, N'98', CAST(54.98 AS Decimal(4, 2)), 39670, 111)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (28, N'Disel Fuel', CAST(48.60 AS Decimal(4, 2)), 24615, 112)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (29, N'92', CAST(45.07 AS Decimal(4, 2)), 73637, 113)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (29, N'95', CAST(47.92 AS Decimal(4, 2)), 52445, 114)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (29, N'98', CAST(54.61 AS Decimal(4, 2)), 17268, 115)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (29, N'Disel Fuel', CAST(51.41 AS Decimal(4, 2)), 57977, 116)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (30, N'92', CAST(44.80 AS Decimal(4, 2)), 7799, 117)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (30, N'95', CAST(48.45 AS Decimal(4, 2)), 20706, 118)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (30, N'98', CAST(54.21 AS Decimal(4, 2)), 94241, 119)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (30, N'Disel Fuel', CAST(48.00 AS Decimal(4, 2)), 68943, 120)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (31, N'92', CAST(45.09 AS Decimal(4, 2)), 76260, 121)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (31, N'95', CAST(48.55 AS Decimal(4, 2)), 11111, 122)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (31, N'98', CAST(54.22 AS Decimal(4, 2)), 5555, 123)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (31, N'Disel Fuel', CAST(48.76 AS Decimal(4, 2)), 57577, 124)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (32, N'92', CAST(43.98 AS Decimal(4, 2)), 16997, 125)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (32, N'95', CAST(48.30 AS Decimal(4, 2)), 99594, 126)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (32, N'98', CAST(53.51 AS Decimal(4, 2)), 32211, 127)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (32, N'Disel Fuel', CAST(48.39 AS Decimal(4, 2)), 85052, 128)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (33, N'92', CAST(44.09 AS Decimal(4, 2)), 61330, 129)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (33, N'95', CAST(47.67 AS Decimal(4, 2)), 98916, 130)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (33, N'98', CAST(56.20 AS Decimal(4, 2)), 43490, 131)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (33, N'Disel Fuel', CAST(48.50 AS Decimal(4, 2)), 51732, 132)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (34, N'92', CAST(44.49 AS Decimal(4, 2)), 55584, 133)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (34, N'95', CAST(47.85 AS Decimal(4, 2)), 85515, 134)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (34, N'98', CAST(56.09 AS Decimal(4, 2)), 76949, 135)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (34, N'Disel Fuel', CAST(49.69 AS Decimal(4, 2)), 30617, 136)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (35, N'92', CAST(42.40 AS Decimal(4, 2)), 70698, 137)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (35, N'95', CAST(44.85 AS Decimal(4, 2)), 32230, 138)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (35, N'98', CAST(51.60 AS Decimal(4, 2)), 39864, 139)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (35, N'Disel Fuel', CAST(51.80 AS Decimal(4, 2)), 46044, 140)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (36, N'92', CAST(43.20 AS Decimal(4, 2)), 87502, 141)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (36, N'95', CAST(46.70 AS Decimal(4, 2)), 46765, 142)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (36, N'98', CAST(54.61 AS Decimal(4, 2)), 49376, 143)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (36, N'Disel Fuel', CAST(49.90 AS Decimal(4, 2)), 77488, 144)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (37, N'92', CAST(43.83 AS Decimal(4, 2)), 70034, 145)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (37, N'95', CAST(47.70 AS Decimal(4, 2)), 33717, 146)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (37, N'98', CAST(53.15 AS Decimal(4, 2)), 95560, 147)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (37, N'Disel Fuel', CAST(47.40 AS Decimal(4, 2)), 45379, 148)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (38, N'92', CAST(43.50 AS Decimal(4, 2)), 77598, 149)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (38, N'95', CAST(47.94 AS Decimal(4, 2)), 23323, 150)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (38, N'98', CAST(54.09 AS Decimal(4, 2)), 38030, 151)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (38, N'Disel Fuel', CAST(47.60 AS Decimal(4, 2)), 54232, 152)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (39, N'92', CAST(41.50 AS Decimal(4, 2)), 64324, 153)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (39, N'95', CAST(44.30 AS Decimal(4, 2)), 43383, 154)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (39, N'98', CAST(54.86 AS Decimal(4, 2)), 11111, 155)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (39, N'Disel Fuel', CAST(49.00 AS Decimal(4, 2)), 88701, 156)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (40, N'92', CAST(43.20 AS Decimal(4, 2)), 35792, 157)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (40, N'95', CAST(46.70 AS Decimal(4, 2)), 45594, 158)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (40, N'98', CAST(54.61 AS Decimal(4, 2)), 86159, 159)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (40, N'Disel Fuel', CAST(49.90 AS Decimal(4, 2)), 69827, 160)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (41, N'92', CAST(42.55 AS Decimal(4, 2)), 61411, 161)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (41, N'95', CAST(45.10 AS Decimal(4, 2)), 74703, 162)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (41, N'98', CAST(53.17 AS Decimal(4, 2)), 23333, 163)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (41, N'Disel Fuel', CAST(50.05 AS Decimal(4, 2)), 44951, 164)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (42, N'92', CAST(43.05 AS Decimal(4, 2)), 35959, 165)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (42, N'95', CAST(46.87 AS Decimal(4, 2)), 44347, 166)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (42, N'98', CAST(54.28 AS Decimal(4, 2)), 22941, 167)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (42, N'Disel Fuel', CAST(48.39 AS Decimal(4, 2)), 98157, 168)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (43, N'92', CAST(45.34 AS Decimal(4, 2)), 68985, 169)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (43, N'95', CAST(48.94 AS Decimal(4, 2)), 81901, 170)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (43, N'98', CAST(56.16 AS Decimal(4, 2)), 82004, 171)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (43, N'Disel Fuel', CAST(47.75 AS Decimal(4, 2)), 39685, 172)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (44, N'92', CAST(43.35 AS Decimal(4, 2)), 62310, 173)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (44, N'95', CAST(44.85 AS Decimal(4, 2)), 75340, 174)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (44, N'98', CAST(54.98 AS Decimal(4, 2)), 98162, 175)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (44, N'Disel Fuel', CAST(48.60 AS Decimal(4, 2)), 15447, 176)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (45, N'92', CAST(45.07 AS Decimal(4, 2)), 36741, 177)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (45, N'95', CAST(47.92 AS Decimal(4, 2)), 95742, 178)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (45, N'98', CAST(54.61 AS Decimal(4, 2)), 41024, 179)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (45, N'Disel Fuel', CAST(51.41 AS Decimal(4, 2)), 94751, 180)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (46, N'92', CAST(44.80 AS Decimal(4, 2)), 93686, 181)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (46, N'95', CAST(48.45 AS Decimal(4, 2)), 75305, 182)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (46, N'98', CAST(54.21 AS Decimal(4, 2)), 18799, 183)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (46, N'Disel Fuel', CAST(48.00 AS Decimal(4, 2)), 18829, 184)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (47, N'92', CAST(45.09 AS Decimal(4, 2)), 93265, 185)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (47, N'95', CAST(48.55 AS Decimal(4, 2)), 5457, 186)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (47, N'98', CAST(54.22 AS Decimal(4, 2)), 83114, 187)
INSERT [dbo].[Fuel_List] ([Station_ID], [Name], [Price], [AmountOfFuel], [ID]) VALUES (47, N'Disel Fuel', CAST(48.76 AS Decimal(4, 2)), 44985, 188)
SET IDENTITY_INSERT [dbo].[Fuel_List] OFF
GO
SET IDENTITY_INSERT [dbo].[Gas_Station] ON 

INSERT [dbo].[Gas_Station] ([ID], [Gas_station]) VALUES (1, N'1000,1001')
INSERT [dbo].[Gas_Station] ([ID], [Gas_station]) VALUES (2, N'1002,1003')
INSERT [dbo].[Gas_Station] ([ID], [Gas_station]) VALUES (3, N'1004,1005')
INSERT [dbo].[Gas_Station] ([ID], [Gas_station]) VALUES (4, N'1006,1007')
INSERT [dbo].[Gas_Station] ([ID], [Gas_station]) VALUES (5, N'1008,1009')
INSERT [dbo].[Gas_Station] ([ID], [Gas_station]) VALUES (6, N'1010,1011')
INSERT [dbo].[Gas_Station] ([ID], [Gas_station]) VALUES (7, N'1012,1013')
INSERT [dbo].[Gas_Station] ([ID], [Gas_station]) VALUES (8, N'1014,1015')
INSERT [dbo].[Gas_Station] ([ID], [Gas_station]) VALUES (9, N'1016,1017')
INSERT [dbo].[Gas_Station] ([ID], [Gas_station]) VALUES (10, N'1018,1019')
INSERT [dbo].[Gas_Station] ([ID], [Gas_station]) VALUES (11, N'1020,1021')
INSERT [dbo].[Gas_Station] ([ID], [Gas_station]) VALUES (12, N'1022,1023')
INSERT [dbo].[Gas_Station] ([ID], [Gas_station]) VALUES (13, N'1024,1025')
INSERT [dbo].[Gas_Station] ([ID], [Gas_station]) VALUES (14, N'1026,1027')
INSERT [dbo].[Gas_Station] ([ID], [Gas_station]) VALUES (15, N'1028,1029')
INSERT [dbo].[Gas_Station] ([ID], [Gas_station]) VALUES (16, N'1030,1031')
INSERT [dbo].[Gas_Station] ([ID], [Gas_station]) VALUES (17, N'1032,1033')
INSERT [dbo].[Gas_Station] ([ID], [Gas_station]) VALUES (18, N'1034,1035')
INSERT [dbo].[Gas_Station] ([ID], [Gas_station]) VALUES (19, N'1036,1037')
INSERT [dbo].[Gas_Station] ([ID], [Gas_station]) VALUES (20, N'1038,1039')
INSERT [dbo].[Gas_Station] ([ID], [Gas_station]) VALUES (21, N'1040,1041')
INSERT [dbo].[Gas_Station] ([ID], [Gas_station]) VALUES (22, N'1042,1043')
INSERT [dbo].[Gas_Station] ([ID], [Gas_station]) VALUES (23, N'1044,1045')
INSERT [dbo].[Gas_Station] ([ID], [Gas_station]) VALUES (24, N'1046,1047')
INSERT [dbo].[Gas_Station] ([ID], [Gas_station]) VALUES (25, N'1048,1049')
INSERT [dbo].[Gas_Station] ([ID], [Gas_station]) VALUES (26, N'1050,1051')
INSERT [dbo].[Gas_Station] ([ID], [Gas_station]) VALUES (27, N'1052,1053')
INSERT [dbo].[Gas_Station] ([ID], [Gas_station]) VALUES (28, N'1054,1055')
INSERT [dbo].[Gas_Station] ([ID], [Gas_station]) VALUES (29, N'1056,1057')
INSERT [dbo].[Gas_Station] ([ID], [Gas_station]) VALUES (30, N'1058,1059')
INSERT [dbo].[Gas_Station] ([ID], [Gas_station]) VALUES (31, N'1060,1061')
INSERT [dbo].[Gas_Station] ([ID], [Gas_station]) VALUES (32, N'1062,1063')
INSERT [dbo].[Gas_Station] ([ID], [Gas_station]) VALUES (33, N'1064,1065')
INSERT [dbo].[Gas_Station] ([ID], [Gas_station]) VALUES (34, N'1066,1067')
INSERT [dbo].[Gas_Station] ([ID], [Gas_station]) VALUES (35, N'1068,1069')
INSERT [dbo].[Gas_Station] ([ID], [Gas_station]) VALUES (36, N'1070,1071')
INSERT [dbo].[Gas_Station] ([ID], [Gas_station]) VALUES (37, N'1072,1073')
INSERT [dbo].[Gas_Station] ([ID], [Gas_station]) VALUES (38, N'1074,1075')
INSERT [dbo].[Gas_Station] ([ID], [Gas_station]) VALUES (39, N'1076,1077')
INSERT [dbo].[Gas_Station] ([ID], [Gas_station]) VALUES (40, N'1078,1079')
INSERT [dbo].[Gas_Station] ([ID], [Gas_station]) VALUES (41, N'1080,1081')
INSERT [dbo].[Gas_Station] ([ID], [Gas_station]) VALUES (42, N'1082,1083')
INSERT [dbo].[Gas_Station] ([ID], [Gas_station]) VALUES (43, N'1084,1085')
INSERT [dbo].[Gas_Station] ([ID], [Gas_station]) VALUES (44, N'1086,1087')
INSERT [dbo].[Gas_Station] ([ID], [Gas_station]) VALUES (45, N'1088,1089')
INSERT [dbo].[Gas_Station] ([ID], [Gas_station]) VALUES (46, N'1090,1091')
INSERT [dbo].[Gas_Station] ([ID], [Gas_station]) VALUES (47, N'1092,1093')
SET IDENTITY_INSERT [dbo].[Gas_Station] OFF
GO
SET IDENTITY_INSERT [dbo].[Gas_Station_ID] ON 

INSERT [dbo].[Gas_Station_ID] ([Address], [ID]) VALUES (N'г. Санкт-Петербург, Богатырский проспект, 23', 1)
INSERT [dbo].[Gas_Station_ID] ([Address], [ID]) VALUES (N'г. Санкт-Петербург, Витебский проспект, 9к2 литера А', 2)
INSERT [dbo].[Gas_Station_ID] ([Address], [ID]) VALUES (N'г. Санкт-Петербург, Витебский проспект, 153', 3)
INSERT [dbo].[Gas_Station_ID] ([Address], [ID]) VALUES (N'г. Санкт-Петербург, Витебский проспект, 157', 4)
INSERT [dbo].[Gas_Station_ID] ([Address], [ID]) VALUES (N'г. Санкт-Петербург, Выборгская набережная, 57', 5)
INSERT [dbo].[Gas_Station_ID] ([Address], [ID]) VALUES (N'г. Санкт-Петербург, Выборгское шоссе, 6 Б,лит А', 6)
INSERT [dbo].[Gas_Station_ID] ([Address], [ID]) VALUES (N'г. Санкт-Петербург, Дальневосточный проспект, 20', 7)
INSERT [dbo].[Gas_Station_ID] ([Address], [ID]) VALUES (N'г. Санкт-Петербург, ул. Десантников, 13', 8)
INSERT [dbo].[Gas_Station_ID] ([Address], [ID]) VALUES (N'г. Санкт-Петербург, Ириновский проспект, 16', 9)
INSERT [dbo].[Gas_Station_ID] ([Address], [ID]) VALUES (N'г. Санкт-Петербург, ул. Коллонтай, 8', 10)
INSERT [dbo].[Gas_Station_ID] ([Address], [ID]) VALUES (N'г. Санкт-Петербург, Коломяжский проспект, 19', 11)
INSERT [dbo].[Gas_Station_ID] ([Address], [ID]) VALUES (N'г. Санкт-Петербург, ул. Коммуны, 14 литер А', 12)
INSERT [dbo].[Gas_Station_ID] ([Address], [ID]) VALUES (N'г. Санкт-Петербург, Лапинский проспект, 10', 13)
INSERT [dbo].[Gas_Station_ID] ([Address], [ID]) VALUES (N'г. Санкт-Петербург, Лахтинский проспект, 2к4', 14)
INSERT [dbo].[Gas_Station_ID] ([Address], [ID]) VALUES (N'г. Санкт-Петербург, Лахтинский проспект, 114', 15)
INSERT [dbo].[Gas_Station_ID] ([Address], [ID]) VALUES (N'г. Санкт-Петербург, Ленинский проспект, 61', 16)
INSERT [dbo].[Gas_Station_ID] ([Address], [ID]) VALUES (N'г. Санкт-Петербург, Малый проспект, 79', 17)
INSERT [dbo].[Gas_Station_ID] ([Address], [ID]) VALUES (N'г. Санкт-Петербург, Московское шоссе, М10, слева', 18)
INSERT [dbo].[Gas_Station_ID] ([Address], [ID]) VALUES (N'г. Санкт-Петербург, Московское шоссе, 11, лит.А, М10, справа', 19)
INSERT [dbo].[Gas_Station_ID] ([Address], [ID]) VALUES (N'г. Санкт-Петербург, Московское шоссе, 50, М10, 687-й км, слева', 20)
INSERT [dbo].[Gas_Station_ID] ([Address], [ID]) VALUES (N'г. Санкт-Петербург, Московское шоссе, М10, слева', 21)
INSERT [dbo].[Gas_Station_ID] ([Address], [ID]) VALUES (N'г. Санкт-Петербург, Московское шоссе, 156 А, М10, слева', 22)
INSERT [dbo].[Gas_Station_ID] ([Address], [ID]) VALUES (N'г. Санкт-Петербург, Октябрьская набережная, 38, корп.3', 23)
INSERT [dbo].[Gas_Station_ID] ([Address], [ID]) VALUES (N'г. Санкт-Петербург, Песочная набережная, 30', 24)
INSERT [dbo].[Gas_Station_ID] ([Address], [ID]) VALUES (N'г. Санкт-Петербург, Пискарёвский проспект, 135', 25)
INSERT [dbo].[Gas_Station_ID] ([Address], [ID]) VALUES (N'г. Санкт-Петербург, Приморское шоссе, 142', 26)
INSERT [dbo].[Gas_Station_ID] ([Address], [ID]) VALUES (N'г. Санкт-Петербург, Приморское шоссе, 251', 27)
INSERT [dbo].[Gas_Station_ID] ([Address], [ID]) VALUES (N'г. Санкт-Петербург, промзона «Парнас», 1-й верхний переулок, 3А', 28)
INSERT [dbo].[Gas_Station_ID] ([Address], [ID]) VALUES (N'г. Санкт-Петербург, проспект Маршала Жукова, 23 литер А', 29)
INSERT [dbo].[Gas_Station_ID] ([Address], [ID]) VALUES (N'г. Санкт-Петербург, проспект Обуховской обороны, 138', 30)
INSERT [dbo].[Gas_Station_ID] ([Address], [ID]) VALUES (N'г. Санкт-Петербург, проспект Энгельса, 179', 31)
INSERT [dbo].[Gas_Station_ID] ([Address], [ID]) VALUES (N'г. Санкт-Петербург, Пулковское шоссе, 71, Р23, справа', 32)
INSERT [dbo].[Gas_Station_ID] ([Address], [ID]) VALUES (N'г. Санкт-Петербург, ул. Руставели, 48А', 33)
INSERT [dbo].[Gas_Station_ID] ([Address], [ID]) VALUES (N'г. Санкт-Петербург, ул. Руставели, 54', 34)
INSERT [dbo].[Gas_Station_ID] ([Address], [ID]) VALUES (N'г. Санкт-Петербург, Рябовское шоссе, 115 к. 3, лит. А, а/д «Санкт-Петербург - станция Морье» (А128), справа', 35)
INSERT [dbo].[Gas_Station_ID] ([Address], [ID]) VALUES (N'г. Санкт-Петербург, ул. Салова, 82', 36)
INSERT [dbo].[Gas_Station_ID] ([Address], [ID]) VALUES (N'г. Санкт-Петербург, ул. Седова, 1', 37)
INSERT [dbo].[Gas_Station_ID] ([Address], [ID]) VALUES (N'г. Санкт-Петербург, ул. Софийская', 38)
INSERT [dbo].[Gas_Station_ID] ([Address], [ID]) VALUES (N'г. Санкт-Петербург, Софийская ул., 17А', 39)
INSERT [dbo].[Gas_Station_ID] ([Address], [ID]) VALUES (N'г. Санкт-Петербург, Софийская ул., 60', 40)
INSERT [dbo].[Gas_Station_ID] ([Address], [ID]) VALUES (N'г. Санкт-Петербург, Софийская ул., 77', 41)
INSERT [dbo].[Gas_Station_ID] ([Address], [ID]) VALUES (N'г. Санкт-Петербург, Торфяная дорога, 10 литер А', 42)
INSERT [dbo].[Gas_Station_ID] ([Address], [ID]) VALUES (N'г. Санкт-Петербург, ул. Демьяна Бедного, 15', 43)
INSERT [dbo].[Gas_Station_ID] ([Address], [ID]) VALUES (N'г. Санкт-Петербург, ул. Планерная, 22', 44)
INSERT [dbo].[Gas_Station_ID] ([Address], [ID]) VALUES (N'г. Санкт-Петербург, ул. Студенческая, 15', 45)
INSERT [dbo].[Gas_Station_ID] ([Address], [ID]) VALUES (N'г. Санкт-Петербург, Шафировский проспект, 24А', 46)
INSERT [dbo].[Gas_Station_ID] ([Address], [ID]) VALUES (N'пос. Шушары, Пулковское шоссе, д. 110, лит. А, Р23, слева', 47)
SET IDENTITY_INSERT [dbo].[Gas_Station_ID] OFF
GO
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (1074444, N'ANDREI SMIRNOV', 2761)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (1085114, N'NIKITA KOZLOV', 1695)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (1225570, N'MIKHAIL MIKHAILOV', 1011)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (1279680, N'ARTEM VASILEV', 2284)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (1316079, N'IURII SEMENOV', 2262)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (1355638, N'IVAN KOROLEV', 1069)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (1361350, N'ILIA FEDOROV', 2228)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (1463217, N'VIKTORIIA SOROKINA', 2528)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (1575669, N'OKSANA SOKOLOVA', 2639)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (1605296, N'OLGA SOROKINA', 1708)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (1672364, N'OKSANA KUZMINA', 2036)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (1714161, N'ANTON STEPANOV', 1613)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (1718401, N'DARIA MIKHAILOVA', 2485)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (1729130, N'DMITRII KOZLOV', 2077)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (1767284, N'IGOR PONOMAREV', 1872)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (1864521, N'KSENIIA VINOGRADOVA', 2011)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (1877205, N'IULIIA SMIRNOVA', 1381)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (1899259, N'ROMAN MAKAROV', 1686)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (1941056, N'TATIANA BELIAEVA', 1291)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (1950079, N'ALENA KUZNETSOVA', 2432)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (1973704, N'IULIIA VINOGRADOVA', 1446)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (1990868, N'KSENIIA ORLOVA', 2577)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (2019799, N'IGOR STEPANOV', 2813)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (2033248, N'OLEG ANDREEV', 1606)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (2058739, N'MAKSIM VINOGRADOV', 2033)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (2069799, N'NATALIA VINOGRADOVA', 1683)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (2138184, N'TATIANA ANDREEVA', 1747)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (2238926, N'ILIA KISELEV', 1150)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (2448621, N'DENIS STEPANOV', 1382)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (2454263, N'ELENA KOVALEVA', 1008)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (2465731, N'OLEG KUDRIAVTSEV', 2401)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (2531660, N'ALEKSEI PAVLOV', 1573)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (2566538, N'DARIA LEBEDEVA', 2216)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (2656074, N'ANASTASIIA BELIAEVA', 2916)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (2885965, N'MIKHAIL SEMENOV', 1943)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (2905002, N'ANNA BELIAEVA', 1013)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (2938337, N'NATALIA PETROVA', 1906)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (2950413, N'ANASTASIIA ROMANOVA', 1743)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (2987393, N'MARINA MIKHAILOVA', 1655)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (3141094, N'ANASTASIIA KUZMINA', 2367)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (3152256, N'EVGENII SOKOLOV', 2822)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (3331441, N'MIKHAIL GERASIMOV', 1797)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (3389678, N'MAKSIM BORISOV', 1673)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (3424502, N'TATIANA GERASIMOVA', 2034)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (3478179, N'IRINA KUZNETSOVA', 2400)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (3525718, N'VLADIMIR BORISOV', 1311)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (3531324, N'EVGENII BOGDANOV', 1304)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (3534225, N'NATALIA ORLOVA', 1896)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (3547780, N'VALENTINA BELOVA', 1798)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (3614984, N'NIKITA NOVIKOV', 1142)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (3655059, N'LIUDMILA ILINA', 1304)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (3724976, N'MARIIA KULIKOVA', 2872)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (3746594, N'SVETLANA KUZNETSOVA', 2366)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (3806450, N'IVAN SERGEEV', 2193)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (3891078, N'ANNA LEBEDEVA', 1259)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (3900541, N'OKSANA KOVALEVA', 1390)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (3973845, N'KONSTANTIN TITOV', 2881)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (4008653, N'MAKSIM FEDOROV', 2868)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (4055382, N'VITALII VASILEV', 1980)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (4081618, N'ALEKSANDRA GUSEVA', 1798)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (4161285, N'NATALIA BARANOVA', 1088)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (4206589, N'EVGENIIA KISELEVA', 2933)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (4210996, N'MARINA GOLUBEVA', 1854)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (4259384, N'DARIA GOLUBEVA', 2037)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (4270943, N'IURII PETROV', 1747)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (4287845, N'PAVEL LEBEDEV', 2487)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (4339460, N'OLEG TITOV', 1398)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (4360285, N'ROMAN BORISOV', 2083)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (4434730, N'MARIIA MOROZOVA', 1844)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (4435528, N'DMITRII VOLKOV', 1666)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (4517591, N'EVGENIIA VINOGRADOVA', 2477)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (4565112, N'ANASTASIIA POPOVA', 1475)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (4614822, N'EVGENIIA ALEKSEEVA', 2242)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (4646726, N'NIKITA GOLUBEV', 1892)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (4665951, N'NIKOLAI PETROV', 2694)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (4866765, N'ALINA VASILEVA', 1707)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (4905856, N'OLGA MIKHAILOVA', 2216)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (4925731, N'OKSANA BOGDANOVA', 2562)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (4947549, N'ELENA SOLOVEVA', 1327)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (4954928, N'EVGENIIA PAVLOVA', 2970)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (5046096, N'SVETLANA BARANOVA', 2380)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (5150897, N'IURII BARANOV', 2851)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (5164683, N'VLADIMIR MIKHAILOV', 1734)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (5201856, N'ANDREI KUZMIN', 1880)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (5250252, N'EVGENII VASILEV', 1614)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (5319090, N'ANTON PETROV', 2928)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (5363230, N'LIUDMILA STEPANOVA', 2065)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (5363806, N'ALENA IVANOVA', 1386)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (5394469, N'TATIANA VASILEVA', 1263)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (5408434, N'IURII ANDREEV', 2291)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (5491853, N'MIKHAIL IVANOV', 1662)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (5578386, N'DENIS FEDOROV', 1548)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (5623492, N'VITALII BARANOV', 2881)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (5675390, N'ALENA SEMENOVA', 1614)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (5805543, N'KONSTANTIN GUSEV', 1403)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (5819506, N'GALINA GRIGOREVA', 1060)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (5884150, N'IULIIA ZAKHAROVA', 2048)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (5921378, N'OLGA PETROVA', 2043)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (5946782, N'NATALIA ROMANOVA', 2960)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (6079562, N'NATALIA SERGEEVA', 2338)
GO
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (6151935, N'IGOR KISELEV', 1312)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (6320696, N'ALEKSANDRA SEMENOVA', 2787)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (6365463, N'NIKITA KISELEV', 2212)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (6403440, N'ANTON FEDOROV', 2828)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (6449203, N'ROMAN ROMANOV', 2629)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (6539539, N'ALENA ROMANOVA', 1801)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (6539911, N'ALEKSANDRA SMIRNOVA', 2626)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (6553045, N'DARIA ALEKSEEVA', 1559)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (6601554, N'SERGEI GUSEV', 1565)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (6627061, N'NATALIA GOLUBEVA', 2191)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (6660866, N'IVAN ORLOV', 1701)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (6717435, N'DMITRII BELOV', 2066)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (6757231, N'ANASTASIIA TARASOVA', 2021)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (6816790, N'ANNA ZAKHAROVA', 2830)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (6856270, N'ALEKSANDR SERGEEV', 2959)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (6918517, N'NADEZHDA BELIAEVA', 1088)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (6956768, N'ALEKSANDR VOLKOV', 2720)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (7003631, N'KSENIIA KOROLEVA', 1784)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (7036912, N'VLADIMIR KOVALEV', 1304)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (7058227, N'ANASTASIIA PAVLOVA', 1641)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (7087980, N'TATIANA BARANOVA', 1659)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (7111976, N'IULIIA STEPANOVA', 1918)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (7149048, N'ANNA PONOMAREVA', 1137)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (7357819, N'LIUDMILA KOROLEVA', 1531)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (7431575, N'IURII BORISOV', 2528)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (7462332, N'DMITRII FEDOROV', 1069)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (7478760, N'VLADISLAV POPOV', 1947)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (7503124, N'ROMAN IAKOVLEV', 2992)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (7562533, N'EVGENII ZAKHAROV', 1470)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (7569194, N'MIKHAIL PETROV', 1462)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (7632322, N'VIKTOR ANDREEV', 2846)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (7721334, N'PAVEL IAKOVLEV', 1673)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (7726398, N'MARIIA KOVALEVA', 1564)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (7778194, N'IGOR PAVLOV', 2913)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (7798032, N'KRISTINA TARASOVA', 2412)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (7806382, N'MARIIA VINOGRADOVA', 1144)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (7817110, N'SVETLANA VOROBEVA', 2737)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (7899793, N'LIUDMILA IAKOVLEVA', 1851)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (7902225, N'ALENA STEPANOVA', 1431)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (7980002, N'IVAN KOZLOV', 1601)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (8071572, N'VLADIMIR VASILEV', 1199)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (8120627, N'OLEG ZAKHAROV', 2949)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (8139545, N'OKSANA SEMENOVA', 2140)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (8143628, N'VLADISLAV VASILEV', 1239)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (8148851, N'ILIA IVANOV', 2219)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (8273828, N'VITALII GUSEV', 2722)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (8326854, N'ANNA SEMENOVA', 2081)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (8443220, N'EVGENIIA KOMAROVA', 1128)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (8452703, N'NATALIA KISELEVA', 2347)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (8525679, N'IULIIA IVANOVA', 2860)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (8574455, N'ANTON BELIAEV', 2117)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (8660005, N'MARIIA STEPANOVA', 2347)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (8749929, N'VALENTINA VASILEVA', 1041)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (8832296, N'ELENA GRIGOREVA', 1717)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (8881318, N'DENIS KOROLEV', 2930)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (8912005, N'OLGA ZAKHAROVA', 2239)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (8939532, N'KONSTANTIN PETROV', 1027)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (8961436, N'EKATERINA BARANOVA', 2703)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (9028264, N'OKSANA TARASOVA', 2871)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (9041195, N'MARIIA GUSEVA', 2155)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (9057867, N'SERGEI GOLUBEV', 1728)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (9237191, N'ARTEM ZAITSEV', 1582)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (9288396, N'NADEZHDA MIKHAILOVA', 2762)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (9322787, N'ALENA ILINA', 1930)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (9345212, N'IRINA NOVIKOVA', 2186)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (9355983, N'ARTEM MOROZOV', 2619)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (9368333, N'VLADIMIR VINOGRADOV', 1483)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (9412291, N'ALEKSANDRA SOROKINA', 2325)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (9443417, N'IULIIA KOVALEVA', 2716)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (9604475, N'ROMAN MOROZOV', 2024)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (9619854, N'KSENIIA SMIRNOVA', 1313)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (9674384, N'VIKTOR BORISOV', 1575)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (9691797, N'MARINA FEDOROVA', 1922)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (9700408, N'MARIIA LEBEDEVA', 1110)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (9742158, N'VITALII KOROLEV', 1400)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (9793773, N'ELENA KOMAROVA', 1867)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (9804031, N'GALINA BELIAEVA', 1119)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (9821868, N'VALENTINA GERASIMOVA', 1921)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (9851640, N'ALEKSANDRA GOLUBEVA', 2784)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (9920290, N'SERGEI ZAKHAROV', 2479)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (9950063, N'VLADIMIR GOLUBEV', 1341)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (9950289, N'NIKITA SOKOLOV', 2234)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (9951117, N'EVGENII NOVIKOV', 1612)
INSERT [dbo].[Loyalty_Сards] ([LoyaltyСard], [CardHolder], [Balance]) VALUES (9970227, N'ILIA ZAKHAROV', 2138)
GO
ALTER TABLE [dbo].[Fuel_List]  WITH CHECK ADD  CONSTRAINT [FK_Fuel_List_Gas_Station_ID] FOREIGN KEY([Station_ID])
REFERENCES [dbo].[Gas_Station_ID] ([ID])
GO
ALTER TABLE [dbo].[Fuel_List] CHECK CONSTRAINT [FK_Fuel_List_Gas_Station_ID]
GO
ALTER TABLE [dbo].[Gas_Station]  WITH CHECK ADD  CONSTRAINT [FK_Gas_Station_Gas_Station_ID] FOREIGN KEY([ID])
REFERENCES [dbo].[Gas_Station_ID] ([ID])
GO
ALTER TABLE [dbo].[Gas_Station] CHECK CONSTRAINT [FK_Gas_Station_Gas_Station_ID]
GO
USE [master]
GO
ALTER DATABASE [GasStationdb] SET  READ_WRITE 
GO
