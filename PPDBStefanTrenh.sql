USE [master]
GO
/****** Object:  Database [PPDBStefanTrenh]    Script Date: 2021-03-02 14:01:38 ******/
CREATE DATABASE [PPDBStefanTrenh]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PPDBStefanTrenh', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PPDBStefanTrenh.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PPDBStefanTrenh_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PPDBStefanTrenh_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PPDBStefanTrenh] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PPDBStefanTrenh].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PPDBStefanTrenh] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PPDBStefanTrenh] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PPDBStefanTrenh] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PPDBStefanTrenh] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PPDBStefanTrenh] SET ARITHABORT OFF 
GO
ALTER DATABASE [PPDBStefanTrenh] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PPDBStefanTrenh] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PPDBStefanTrenh] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PPDBStefanTrenh] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PPDBStefanTrenh] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PPDBStefanTrenh] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PPDBStefanTrenh] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PPDBStefanTrenh] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PPDBStefanTrenh] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PPDBStefanTrenh] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PPDBStefanTrenh] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PPDBStefanTrenh] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PPDBStefanTrenh] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PPDBStefanTrenh] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PPDBStefanTrenh] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PPDBStefanTrenh] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PPDBStefanTrenh] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PPDBStefanTrenh] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PPDBStefanTrenh] SET  MULTI_USER 
GO
ALTER DATABASE [PPDBStefanTrenh] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PPDBStefanTrenh] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PPDBStefanTrenh] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PPDBStefanTrenh] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PPDBStefanTrenh] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PPDBStefanTrenh] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PPDBStefanTrenh] SET QUERY_STORE = OFF
GO
USE [PPDBStefanTrenh]
GO
/****** Object:  Table [dbo].[OptimizeLog]    Script Date: 2021-03-02 14:01:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OptimizeLog](
	[OptimizeLogID] [int] IDENTITY(1,1) NOT NULL,
	[ParkinglotID] [int] NULL,
	[NewParkinglotID] [int] NULL,
	[OldParkinglotID] [int] NULL,
	[CreationDate] [datetime] NULL,
 CONSTRAINT [PK_OptimizeLog] PRIMARY KEY CLUSTERED 
(
	[OptimizeLogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderHistory]    Script Date: 2021-03-02 14:01:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderHistory](
	[OrderHistoryID] [int] IDENTITY(1,1) NOT NULL,
	[CheckedIn] [datetime] NULL,
	[CheckedOut] [datetime] NULL,
	[Price] [decimal](7, 2) NULL,
	[LicensePlate] [varchar](10) NULL,
	[Discount] [bit] NULL,
 CONSTRAINT [PK_OrderHistory] PRIMARY KEY CLUSTERED 
(
	[OrderHistoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Parkinglot]    Script Date: 2021-03-02 14:01:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parkinglot](
	[ParkinglotID] [int] IDENTITY(1,1) NOT NULL,
	[Size] [int] NULL,
 CONSTRAINT [PK_Parkinglot] PRIMARY KEY CLUSTERED 
(
	[ParkinglotID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehicle]    Script Date: 2021-03-02 14:01:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicle](
	[LicensePlate] [varchar](10) NOT NULL,
	[VehicleTypeID] [int] NULL,
	[ParkinglotID] [int] NULL,
	[CheckedIn] [datetime] NULL,
	[CheckedOut] [datetime] NULL,
	[Price] [decimal](7, 2) NULL,
	[Discount] [bit] NULL,
 CONSTRAINT [PK_Vehicle] PRIMARY KEY CLUSTERED 
(
	[LicensePlate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VehicleType]    Script Date: 2021-03-02 14:01:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VehicleType](
	[VehicleTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Vehicle] [varchar](3) NULL,
 CONSTRAINT [PK_VehicleType] PRIMARY KEY CLUSTERED 
(
	[VehicleTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[OrderHistory] ON 

INSERT [dbo].[OrderHistory] ([OrderHistoryID], [CheckedIn], [CheckedOut], [Price], [LicensePlate], [Discount]) VALUES (1, CAST(N'2021-02-04T13:01:10.460' AS DateTime), CAST(N'2021-02-04T23:52:19.923' AS DateTime), CAST(100.00 AS Decimal(7, 2)), N'PARKELL', 0)
INSERT [dbo].[OrderHistory] ([OrderHistoryID], [CheckedIn], [CheckedOut], [Price], [LicensePlate], [Discount]) VALUES (2, CAST(N'2021-02-04T12:34:19.297' AS DateTime), CAST(N'2021-02-05T00:57:03.040' AS DateTime), CAST(120.00 AS Decimal(7, 2)), N'ABC123', 0)
INSERT [dbo].[OrderHistory] ([OrderHistoryID], [CheckedIn], [CheckedOut], [Price], [LicensePlate], [Discount]) VALUES (3, CAST(N'2021-02-04T13:17:27.787' AS DateTime), CAST(N'2021-02-05T00:57:22.523' AS DateTime), CAST(0.00 AS Decimal(7, 2)), N'ROBIN', 1)
INSERT [dbo].[OrderHistory] ([OrderHistoryID], [CheckedIn], [CheckedOut], [Price], [LicensePlate], [Discount]) VALUES (4, CAST(N'2021-02-04T22:36:20.073' AS DateTime), CAST(N'2021-02-05T00:57:55.400' AS DateTime), CAST(40.00 AS Decimal(7, 2)), N'EINAR', 0)
INSERT [dbo].[OrderHistory] ([OrderHistoryID], [CheckedIn], [CheckedOut], [Price], [LicensePlate], [Discount]) VALUES (5, CAST(N'2021-02-01T13:47:00.000' AS DateTime), CAST(N'2021-02-05T01:06:54.663' AS DateTime), CAST(830.00 AS Decimal(7, 2)), N'001', 0)
INSERT [dbo].[OrderHistory] ([OrderHistoryID], [CheckedIn], [CheckedOut], [Price], [LicensePlate], [Discount]) VALUES (7, CAST(N'2021-02-05T01:10:24.870' AS DateTime), CAST(N'2021-02-05T01:12:08.773' AS DateTime), CAST(0.00 AS Decimal(7, 2)), N'CAR123', 0)
INSERT [dbo].[OrderHistory] ([OrderHistoryID], [CheckedIn], [CheckedOut], [Price], [LicensePlate], [Discount]) VALUES (8, CAST(N'2021-02-05T01:12:25.330' AS DateTime), CAST(N'2021-02-05T01:14:16.213' AS DateTime), CAST(0.00 AS Decimal(7, 2)), N'MC123', 0)
INSERT [dbo].[OrderHistory] ([OrderHistoryID], [CheckedIn], [CheckedOut], [Price], [LicensePlate], [Discount]) VALUES (10, CAST(N'2021-02-02T10:30:00.000' AS DateTime), CAST(N'2021-02-05T01:26:07.490' AS DateTime), CAST(620.00 AS Decimal(7, 2)), N'MC1234', 0)
INSERT [dbo].[OrderHistory] ([OrderHistoryID], [CheckedIn], [CheckedOut], [Price], [LicensePlate], [Discount]) VALUES (11, CAST(N'2021-02-02T17:30:00.000' AS DateTime), CAST(N'2021-02-05T01:25:55.647' AS DateTime), CAST(550.00 AS Decimal(7, 2)), N'MC1337', 0)
INSERT [dbo].[OrderHistory] ([OrderHistoryID], [CheckedIn], [CheckedOut], [Price], [LicensePlate], [Discount]) VALUES (12, CAST(N'2021-02-04T12:51:18.060' AS DateTime), CAST(N'2021-02-05T11:51:56.987' AS DateTime), CAST(460.00 AS Decimal(7, 2)), N'NISSE', 0)
INSERT [dbo].[OrderHistory] ([OrderHistoryID], [CheckedIn], [CheckedOut], [Price], [LicensePlate], [Discount]) VALUES (13, CAST(N'2021-02-05T15:33:58.713' AS DateTime), CAST(N'2021-02-05T15:40:41.560' AS DateTime), CAST(20.00 AS Decimal(7, 2)), N'AVC22', 0)
INSERT [dbo].[OrderHistory] ([OrderHistoryID], [CheckedIn], [CheckedOut], [Price], [LicensePlate], [Discount]) VALUES (14, CAST(N'2021-02-05T15:54:56.280' AS DateTime), CAST(N'2021-02-05T15:56:16.667' AS DateTime), CAST(0.00 AS Decimal(7, 2)), N'AAA111', 0)
INSERT [dbo].[OrderHistory] ([OrderHistoryID], [CheckedIn], [CheckedOut], [Price], [LicensePlate], [Discount]) VALUES (15, CAST(N'2021-02-05T23:38:42.290' AS DateTime), CAST(N'2021-02-06T00:01:51.140' AS DateTime), CAST(10.00 AS Decimal(7, 2)), N'MC123', 0)
SET IDENTITY_INSERT [dbo].[OrderHistory] OFF
GO
SET IDENTITY_INSERT [dbo].[Parkinglot] ON 

INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (1, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (2, 2)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (3, 2)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (4, 2)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (5, 2)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (6, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (7, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (8, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (9, 1)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (10, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (11, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (12, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (13, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (14, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (15, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (16, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (17, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (18, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (19, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (20, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (21, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (22, 2)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (23, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (24, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (25, 2)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (26, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (27, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (28, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (29, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (30, 2)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (31, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (32, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (33, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (34, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (35, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (36, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (37, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (38, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (39, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (40, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (41, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (42, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (43, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (44, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (45, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (46, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (47, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (48, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (49, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (50, 2)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (51, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (52, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (53, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (54, 2)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (55, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (56, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (57, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (58, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (59, 1)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (60, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (61, 1)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (62, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (63, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (64, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (65, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (66, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (67, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (68, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (69, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (70, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (71, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (72, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (73, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (74, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (75, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (76, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (77, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (78, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (79, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (80, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (81, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (82, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (83, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (84, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (85, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (86, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (87, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (88, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (89, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (90, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (91, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (92, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (93, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (94, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (95, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (96, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (97, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (98, 0)
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (99, 0)
GO
INSERT [dbo].[Parkinglot] ([ParkinglotID], [Size]) VALUES (100, 2)
SET IDENTITY_INSERT [dbo].[Parkinglot] OFF
GO
INSERT [dbo].[Vehicle] ([LicensePlate], [VehicleTypeID], [ParkinglotID], [CheckedIn], [CheckedOut], [Price], [Discount]) VALUES (N'JULIA', 1, 25, CAST(N'2021-02-05T23:39:18.133' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Vehicle] ([LicensePlate], [VehicleTypeID], [ParkinglotID], [CheckedIn], [CheckedOut], [Price], [Discount]) VALUES (N'LUDDE', 2, 2, CAST(N'2021-02-05T23:40:16.100' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Vehicle] ([LicensePlate], [VehicleTypeID], [ParkinglotID], [CheckedIn], [CheckedOut], [Price], [Discount]) VALUES (N'MADDE', 2, 50, CAST(N'2021-02-05T23:40:44.137' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Vehicle] ([LicensePlate], [VehicleTypeID], [ParkinglotID], [CheckedIn], [CheckedOut], [Price], [Discount]) VALUES (N'MC1234', 1, 59, CAST(N'2021-03-02T13:58:52.430' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Vehicle] ([LicensePlate], [VehicleTypeID], [ParkinglotID], [CheckedIn], [CheckedOut], [Price], [Discount]) VALUES (N'MC1337', 1, 9, CAST(N'2021-03-02T13:58:21.293' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Vehicle] ([LicensePlate], [VehicleTypeID], [ParkinglotID], [CheckedIn], [CheckedOut], [Price], [Discount]) VALUES (N'MC33', 1, 22, CAST(N'2021-03-02T13:56:50.567' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Vehicle] ([LicensePlate], [VehicleTypeID], [ParkinglotID], [CheckedIn], [CheckedOut], [Price], [Discount]) VALUES (N'MC99', 1, 61, CAST(N'2021-03-02T13:58:09.097' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Vehicle] ([LicensePlate], [VehicleTypeID], [ParkinglotID], [CheckedIn], [CheckedOut], [Price], [Discount]) VALUES (N'NISSE', 1, 25, CAST(N'2021-02-05T23:40:06.117' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Vehicle] ([LicensePlate], [VehicleTypeID], [ParkinglotID], [CheckedIn], [CheckedOut], [Price], [Discount]) VALUES (N'OLOF', 2, 100, CAST(N'2021-02-05T23:39:28.477' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Vehicle] ([LicensePlate], [VehicleTypeID], [ParkinglotID], [CheckedIn], [CheckedOut], [Price], [Discount]) VALUES (N'PARKELL', 2, 5, CAST(N'2021-02-05T23:39:06.043' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Vehicle] ([LicensePlate], [VehicleTypeID], [ParkinglotID], [CheckedIn], [CheckedOut], [Price], [Discount]) VALUES (N'ROBIN', 1, 22, CAST(N'2021-02-05T23:41:03.420' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Vehicle] ([LicensePlate], [VehicleTypeID], [ParkinglotID], [CheckedIn], [CheckedOut], [Price], [Discount]) VALUES (N'SIMON', 1, 54, CAST(N'2021-02-05T23:40:27.190' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Vehicle] ([LicensePlate], [VehicleTypeID], [ParkinglotID], [CheckedIn], [CheckedOut], [Price], [Discount]) VALUES (N'STEFAN', 2, 4, CAST(N'2021-02-05T23:54:27.610' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Vehicle] ([LicensePlate], [VehicleTypeID], [ParkinglotID], [CheckedIn], [CheckedOut], [Price], [Discount]) VALUES (N'TEST3', 1, 3, CAST(N'2021-02-05T23:54:56.860' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Vehicle] ([LicensePlate], [VehicleTypeID], [ParkinglotID], [CheckedIn], [CheckedOut], [Price], [Discount]) VALUES (N'TESTDATA1', 2, 30, CAST(N'2021-03-02T12:18:54.450' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Vehicle] ([LicensePlate], [VehicleTypeID], [ParkinglotID], [CheckedIn], [CheckedOut], [Price], [Discount]) VALUES (N'TESTMC123', 1, 54, CAST(N'2021-03-02T12:20:12.333' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Vehicle] ([LicensePlate], [VehicleTypeID], [ParkinglotID], [CheckedIn], [CheckedOut], [Price], [Discount]) VALUES (N'WTF', 1, 3, CAST(N'2021-02-05T23:54:46.527' AS DateTime), NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[VehicleType] ON 

INSERT [dbo].[VehicleType] ([VehicleTypeID], [Vehicle]) VALUES (1, N'MC')
INSERT [dbo].[VehicleType] ([VehicleTypeID], [Vehicle]) VALUES (2, N'CAR')
SET IDENTITY_INSERT [dbo].[VehicleType] OFF
GO
ALTER TABLE [dbo].[Parkinglot] ADD  DEFAULT ((0)) FOR [Size]
GO
ALTER TABLE [dbo].[OptimizeLog]  WITH CHECK ADD  CONSTRAINT [FK_OptimizeLog_ParkinglotID] FOREIGN KEY([ParkinglotID])
REFERENCES [dbo].[Parkinglot] ([ParkinglotID])
GO
ALTER TABLE [dbo].[OptimizeLog] CHECK CONSTRAINT [FK_OptimizeLog_ParkinglotID]
GO
ALTER TABLE [dbo].[Vehicle]  WITH CHECK ADD  CONSTRAINT [FK_Vehicle_Parkinglot] FOREIGN KEY([ParkinglotID])
REFERENCES [dbo].[Parkinglot] ([ParkinglotID])
GO
ALTER TABLE [dbo].[Vehicle] CHECK CONSTRAINT [FK_Vehicle_Parkinglot]
GO
ALTER TABLE [dbo].[Vehicle]  WITH CHECK ADD  CONSTRAINT [FK_Vehicle_VehicleType] FOREIGN KEY([VehicleTypeID])
REFERENCES [dbo].[VehicleType] ([VehicleTypeID])
GO
ALTER TABLE [dbo].[Vehicle] CHECK CONSTRAINT [FK_Vehicle_VehicleType]
GO
ALTER TABLE [dbo].[Parkinglot]  WITH CHECK ADD  CONSTRAINT [Check_MaxSize] CHECK  (([Size]>=(0) AND [Size]<(3)))
GO
ALTER TABLE [dbo].[Parkinglot] CHECK CONSTRAINT [Check_MaxSize]
GO
ALTER TABLE [dbo].[Vehicle]  WITH CHECK ADD  CONSTRAINT [Check_LicensePlate] CHECK  ((len([LicensePlate])>=(3)))
GO
ALTER TABLE [dbo].[Vehicle] CHECK CONSTRAINT [Check_LicensePlate]
GO
/****** Object:  StoredProcedure [dbo].[AvailbleSpace]    Script Date: 2021-03-02 14:01:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[AvailbleSpace](@veType varchar(3))
AS
DECLARE @value int
IF @veType = 'MC'
SET @value = 1
ELSE
SET @value = 2
SELECT park.ParkinglotID
FROM Parkinglot park
WHERE @value + park.Size <= 2
GO
/****** Object:  StoredProcedure [dbo].[CountIntervallDateIncome]    Script Date: 2021-03-02 14:01:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[CountIntervallDateIncome](@firstIntervall varchar(12), @secondIntervall varchar(12))
AS
BEGIN TRANSACTION
BEGIN TRY
DECLARE @totaldays decimal
DECLARE @firstInputConcat varchar(20)
DECLARE @secondInputConcat varchar(20)
SET @firstInputConcat = CONCAT(@firstIntervall , ' 00:00:00')
SET @secondInputConcat = CONCAT(@secondIntervall , ' 23:59:59')
SET @totaldays = DATEDIFF(DAY,@firstIntervall,@secondIntervall);
SELECT COUNT(*), SUM(Price) AS [Total Sum], AVG(Price) AS [Avarage CashFlow On Vehicle],SUM(Price)/@totaldays AS [Avarage Cash Flow Day]
FROM OrderHistory orh
WHERE orh.CheckedOut BETWEEN @firstInputConcat and @secondInputConcat
COMMIT TRANSACTION
END TRY 
BEGIN CATCH
IF @@TRANCOUNT > 0
BEGIN
ROLLBACK TRANSACTION
END
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[DeleteVehicleFromTableWhenCheckOut]    Script Date: 2021-03-02 14:01:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DeleteVehicleFromTableWhenCheckOut] (@license varchar(10))
AS
BEGIN TRANSACTION
BEGIN TRY
DELETE FROM Vehicle
WHERE LicensePlate = @license
COMMIT TRANSACTION
END TRY 
BEGIN CATCH
IF @@TRANCOUNT > 0
BEGIN
ROLLBACK TRANSACTION
END
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[DoesVehicleExists]    Script Date: 2021-03-02 14:01:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DoesVehicleExists](@reg varchar(10))
AS
SELECT ve.LicensePlate
FROM Vehicle ve
WHERE ve.LicensePlate = @reg
GO
/****** Object:  StoredProcedure [dbo].[FindVehicle]    Script Date: 2021-03-02 14:01:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[FindVehicle](@reg varchar(10))
AS
SELECT ve.ParkinglotID,ve.LicensePlate,veType.Vehicle,ve.CheckedIn,ve.VehicleTypeID
FROM Vehicle ve
INNER JOIN VehicleType veType
ON
veType.VehicleTypeID = ve.VehicleTypeID
WHERE ve.LicensePlate = @reg
GO
/****** Object:  StoredProcedure [dbo].[GetFullDataOfVehicleBeforeCheckout]    Script Date: 2021-03-02 14:01:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetFullDataOfVehicleBeforeCheckout](@license varchar(10))
AS
SELECT ve.ParkinglotID,ve.LicensePlate, vetype.Vehicle, ve.CheckedIn,ve.CheckedOut,ve.Price
FROM Vehicle ve
INNER JOIN VehicleType vetype
ON ve.VehicleTypeID = vetype.VehicleTypeID
WHERE ve.LicensePlate = @license
GO
/****** Object:  StoredProcedure [dbo].[GetMoveData]    Script Date: 2021-03-02 14:01:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetMoveData](@reg varchar(10))
AS
SELECT ve.LicensePlate,ve.VehicleTypeID,ve.ParkinglotID
FROM Vehicle ve
JOIN Parkinglot park
ON ve.ParkinglotID = park.ParkinglotID
WHERE ve.LicensePlate = @reg
GO
/****** Object:  StoredProcedure [dbo].[getPrice]    Script Date: 2021-03-02 14:01:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[getPrice] (@reg varchar(10),@discounts bit,@vehicleType int)
AS
UPDATE Vehicle
SET CheckedOut = GETDATE()
WHERE LicensePlate = @reg
DECLARE @time int 
DECLARE @prices int
SET @time = (SELECT DATEDIFF(MINUTE,CheckedIn,CheckedOut) FROM Vehicle WHERE LicensePlate = @reg)
IF (@discounts = 1)
	SET @prices = 0
ELSE
	SET @prices = CASE WHEN @vehicleType = 1 THEN 10 ELSE 20 END
SET @prices = CASE 
	WHEN @time <= 5 THEN 0
	WHEN @time >= 5 AND @time <= 120 THEN @prices
	ELSE (@time / 60) * @prices
	END
SELECT ve.LicensePlate, @prices 
FROM Vehicle ve
WHERE ve.LicensePlate = @reg
UPDATE Vehicle
SET Price = @prices, discount = @discounts
WHERE LicensePlate = @reg
GO
/****** Object:  StoredProcedure [dbo].[GetRemoveData]    Script Date: 2021-03-02 14:01:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetRemoveData](@license varchar(10))
AS
SELECT ve.ParkinglotID,ve.VehicleTypeID,ve.LicensePlate
FROM Vehicle ve
JOIN Parkinglot park
ON park.ParkinglotID = ve.ParkinglotID
WHERE ve.LicensePlate = @license
GO
/****** Object:  StoredProcedure [dbo].[insertVehicle]    Script Date: 2021-03-02 14:01:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[insertVehicle](@license varchar(10),@vehicleTypeID int,@parkingLotId int)
AS
BEGIN TRANSACTION
BEGIN TRY
INSERT INTO Vehicle(LicensePlate,VehicleTypeID,ParkinglotID,CheckedIn)
VALUES(@license,@vehicleTypeID,@parkingLotId,GETDATE())
UPDATE Parkinglot
SET Size = Size + @vehicleTypeID
WHERE ParkinglotID = @parkingLotId
COMMIT TRANSACTION
END TRY
BEGIN CATCH
IF @@TRANCOUNT > 0
BEGIN
ROLLBACK TRANSACTION
END
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[McOptimizer]    Script Date: 2021-03-02 14:01:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[McOptimizer]
AS
DECLARE @counter int = 0;
DECLARE @countertotal int
SELECT @countertotal = COUNT(*)
FROM Parkinglot park
JOIN Vehicle ve
ON ve.ParkinglotID = park.ParkinglotID
WHERE park.Size = 1
WHILE @counter < @countertotal
BEGIN

BEGIN TRANSACTION
BEGIN TRY

SET @countertotal = 

(SELECT COUNT(*)
FROM Parkinglot park
JOIN Vehicle ve
ON ve.ParkinglotID = park.ParkinglotID
WHERE park.Size = 1)

DECLARE @license varchar(10)
DECLARE @oldParkId int
DECLARE @newParkId int

SET @license = (SELECT TOP(1) ve.LicensePlate FROM Vehicle ve JOIN Parkinglot park ON park.ParkinglotID = ve.ParkinglotID WHERE park.Size = 1 ORDER BY park.ParkinglotID)
SET @oldParkId =  (SELECT TOP(1) ve.ParkinglotID FROM Vehicle ve JOIN Parkinglot park ON park.ParkinglotID = ve.ParkinglotID WHERE park.Size = 1 ORDER BY park.ParkinglotID)
SET @newParkId  =  (SELECT TOP(1) ve.ParkinglotID FROM Vehicle ve JOIN Parkinglot park ON park.ParkinglotID = ve.ParkinglotID WHERE park.Size = 1 ORDER BY park.ParkinglotID DESC)

UPDATE Vehicle
SET ParkinglotID = @newParkId 
WHERE LicensePlate = @license

UPDATE Parkinglot
SET Size = Size - 1
WHERE ParkinglotID = @oldParkId

UPDATE Parkinglot
SET Size = Size + 1
WHERE ParkinglotID = @newParkId
COMMIT TRANSACTION
END TRY 
BEGIN CATCH
IF @@TRANCOUNT > 0
BEGIN
ROLLBACK TRANSACTION
END
END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[MoveVehicle]    Script Date: 2021-03-02 14:01:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[MoveVehicle](@reg varchar(10),@vehicleType int,@OldparkingId int,@newParkingId int)
AS
BEGIN TRANSACTION
BEGIN TRY
SELECT ve.LicensePlate,ve.ParkinglotID,ve.VehicleTypeID
FROM Vehicle ve
JOIN Parkinglot park
ON park.ParkinglotID = ve.ParkinglotID
WHERE ve.LicensePlate = @reg
UPDATE Parkinglot
SET Size = 0
WHERE ParkinglotID = @OldparkingId
UPDATE Vehicle
SET ParkinglotID = @newParkingId
WHERE ParkinglotID = @OldparkingId
IF(@vehicleType = 1)
UPDATE Parkinglot
SET Size = Size + @vehicleType
WHERE ParkinglotID = @newParkingId
ELSE IF(@vehicleType = 2)
UPDATE Parkinglot
SET Size = 2
WHERE ParkinglotID = @newParkingId
COMMIT TRANSACTION
END TRY 
BEGIN CATCH
IF @@TRANCOUNT > 0
BEGIN
ROLLBACK TRANSACTION
END
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[OptimizeMC]    Script Date: 2021-03-02 14:01:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OptimizeMC]
AS
DECLARE @counter int = 0;
DECLARE @countertotal int
SELECT @countertotal = COUNT(*)
FROM Parkinglot park
JOIN Vehicle ve
ON ve.ParkinglotID = park.ParkinglotID
WHERE park.Size = 1
WHILE @counter < @countertotal AND @countertotal <> 1
BEGIN
SET @countertotal = (SELECT COUNT(*) FROM Parkinglot park JOIN Vehicle ve ON ve.ParkinglotID = park.ParkinglotID WHERE park.Size = 1)
DECLARE @license varchar(10)
DECLARE @oldParkId int
DECLARE @newParkId int
SET @license = (SELECT TOP(1) ve.LicensePlate FROM Vehicle ve JOIN Parkinglot park ON park.ParkinglotID = ve.ParkinglotID WHERE park.Size = 1 ORDER BY park.ParkinglotID)
SET @oldParkId =  (SELECT TOP(1) ve.ParkinglotID FROM Vehicle ve JOIN Parkinglot park ON park.ParkinglotID = ve.ParkinglotID WHERE park.Size = 1 ORDER BY park.ParkinglotID)
SET @newParkId  =  (SELECT TOP(1) ve.ParkinglotID FROM Vehicle ve JOIN Parkinglot park ON park.ParkinglotID = ve.ParkinglotID WHERE park.Size = 1 ORDER BY park.ParkinglotID DESC)
UPDATE Vehicle
SET ParkinglotID = @newParkId 
WHERE LicensePlate = @license
UPDATE Parkinglot
SET Size = Size - 1
WHERE ParkinglotID = @oldParkId
UPDATE Parkinglot
SET Size = Size + 1
WHERE ParkinglotID = @newParkId
END
GO
/****** Object:  StoredProcedure [dbo].[updateParkinglotAfterDelete]    Script Date: 2021-03-02 14:01:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[updateParkinglotAfterDelete](@vehicleType int,@parkinglotID int)
AS
UPDATE Parkinglot
SET Size = Size - @vehicleType
WHERE ParkinglotID = @parkinglotID
GO
/****** Object:  Trigger [dbo].[CheckOutVehicleTRIGGER]    Script Date: 2021-03-02 14:01:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[CheckOutVehicleTRIGGER] 
ON [dbo].[Vehicle]
FOR DELETE
AS
INSERT INTO OrderHistory (LicensePlate,CheckedIn,CheckedOut,Price,Discount)
SELECT LicensePlate,CheckedIn,CheckedOut,Price,Discount
FROM DELETED
GO
ALTER TABLE [dbo].[Vehicle] ENABLE TRIGGER [CheckOutVehicleTRIGGER]
GO
USE [master]
GO
ALTER DATABASE [PPDBStefanTrenh] SET  READ_WRITE 
GO
