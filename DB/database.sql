USE [master]
GO
/****** Object:  Database [TestVueDatabase]    Script Date: 02/12/2024 22:47:23 ******/
CREATE DATABASE [TestVueDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TestVueDatabase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLSERVER\MSSQL\DATA\TestVueDatabase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TestVueDatabase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLSERVER\MSSQL\DATA\TestVueDatabase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [TestVueDatabase] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TestVueDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TestVueDatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TestVueDatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TestVueDatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TestVueDatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TestVueDatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [TestVueDatabase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TestVueDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TestVueDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TestVueDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TestVueDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TestVueDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TestVueDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TestVueDatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TestVueDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TestVueDatabase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TestVueDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TestVueDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TestVueDatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TestVueDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TestVueDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TestVueDatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TestVueDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TestVueDatabase] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TestVueDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [TestVueDatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TestVueDatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TestVueDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TestVueDatabase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TestVueDatabase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TestVueDatabase] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TestVueDatabase] SET QUERY_STORE = ON
GO
ALTER DATABASE [TestVueDatabase] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [TestVueDatabase]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 02/12/2024 22:47:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AdditionalFood]    Script Date: 02/12/2024 22:47:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdditionalFood](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FoodName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[CategoryId] [int] NULL,
	[Unit] [nvarchar](30) NULL,
	[OrderTime] [datetime] NULL,
	[Quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CashRegister]    Script Date: 02/12/2024 22:47:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CashRegister](
	[CashRegisterId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NULL,
	[StartBalance] [decimal](18, 2) NOT NULL,
	[EndBalance] [decimal](18, 2) NULL,
	[TotalIncome] [decimal](18, 2) NOT NULL,
	[TotalExpenses] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CashRegisterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomizableItem]    Script Date: 02/12/2024 22:47:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomizableItem](
	[CustomItemId] [int] IDENTITY(1,1) NOT NULL,
	[CustomItemName] [nvarchar](255) NOT NULL,
	[CustomItemPrice] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discount]    Script Date: 02/12/2024 22:47:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discount](
	[DiscountId] [int] IDENTITY(1,1) NOT NULL,
	[DiscountName] [nvarchar](100) NOT NULL,
	[DiscountValue] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DiscountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiscountAppliedItems]    Script Date: 02/12/2024 22:47:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscountAppliedItems](
	[DiscountId] [int] NOT NULL,
	[FoodItemId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DiscountId] ASC,
	[FoodItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fee]    Script Date: 02/12/2024 22:47:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fee](
	[FeeId] [int] IDENTITY(1,1) NOT NULL,
	[FeeName] [nvarchar](100) NOT NULL,
	[FeeValue] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeeAppliedItems]    Script Date: 02/12/2024 22:47:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeeAppliedItems](
	[FeeId] [int] NOT NULL,
	[FoodItemId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FeeId] ASC,
	[FoodItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FoodCategory]    Script Date: 02/12/2024 22:47:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodCategory](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[Icon] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FoodCustomizable]    Script Date: 02/12/2024 22:47:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodCustomizable](
	[FoodCustomId] [int] IDENTITY(1,1) NOT NULL,
	[FoodItemId] [int] NOT NULL,
	[CustomItemId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FoodCustomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FoodItem]    Script Date: 02/12/2024 22:47:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodItem](
	[FoodItemId] [int] IDENTITY(1,1) NOT NULL,
	[FoodName] [nvarchar](255) NOT NULL,
	[PriceListed] [decimal](18, 2) NOT NULL,
	[PriceCustom] [decimal](18, 2) NULL,
	[ImageUrl] [nvarchar](255) NULL,
	[Unit] [nvarchar](50) NULL,
	[CategoryId] [int] NULL,
	[Status] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FoodItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FoodPriceType]    Script Date: 02/12/2024 22:47:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodPriceType](
	[PriceTypeId] [int] IDENTITY(1,1) NOT NULL,
	[FoodItemId] [int] NOT NULL,
	[Size] [nvarchar](50) NULL,
	[Price] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PriceTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 02/12/2024 22:47:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory](
	[InventoryId] [int] IDENTITY(1,1) NOT NULL,
	[ItemName] [nvarchar](100) NOT NULL,
	[Quantity] [int] NOT NULL,
	[MinQuantity] [int] NOT NULL,
	[Unit] [nvarchar](50) NOT NULL,
	[ItemType] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[InventoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InventoryLog]    Script Date: 02/12/2024 22:47:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventoryLog](
	[InventoryLogId] [int] IDENTITY(1,1) NOT NULL,
	[InventoryId] [int] NOT NULL,
	[QuantityAdded] [int] NOT NULL,
	[LogTime] [datetime] NOT NULL,
	[UserId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[InventoryLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Materials]    Script Date: 02/12/2024 22:47:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materials](
	[MaterialId] [int] IDENTITY(1,1) NOT NULL,
	[MaterialName] [nvarchar](255) NOT NULL,
	[MaterialType] [nvarchar](50) NULL,
	[Quantity] [float] NOT NULL,
	[MinQuantity] [float] NOT NULL,
	[Unit] [nvarchar](20) NOT NULL,
	[ImportDate] [datetime] NOT NULL,
	[ExpirationDate] [datetime] NULL,
	[ImportPrice] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaterialId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 02/12/2024 22:47:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[OrderItemId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[FoodItemId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[FoodName] [nvarchar](255) NULL,
	[IsMainItem] [int] NULL,
	[Unit] [nvarchar](30) NULL,
	[Note] [nvarchar](500) NULL,
	[CategoryId] [int] NULL,
	[OrderTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 02/12/2024 22:47:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[OrderTime] [datetime] NOT NULL,
	[TableId] [int] NOT NULL,
	[TotalAmount] [decimal](18, 2) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[Discount] [decimal](18, 2) NULL,
	[Tax] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 02/12/2024 22:47:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Report]    Script Date: 02/12/2024 22:47:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report](
	[ReportId] [int] IDENTITY(1,1) NOT NULL,
	[ReportType] [nvarchar](100) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[ReportData] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ReportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tables]    Script Date: 02/12/2024 22:47:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tables](
	[TableId] [int] IDENTITY(1,1) NOT NULL,
	[TableName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TableId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tax]    Script Date: 02/12/2024 22:47:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tax](
	[TaxId] [int] IDENTITY(1,1) NOT NULL,
	[TaxName] [nvarchar](100) NOT NULL,
	[TaxValue] [decimal](18, 2) NOT NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TaxId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 02/12/2024 22:47:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](max) NOT NULL,
	[Phone] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Role] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[Avatar] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241022073415_InitialCreate', N'8.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241026030007_initMigration', N'8.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241026030732_InitialCreate', N'8.0.10')
GO
SET IDENTITY_INSERT [dbo].[AdditionalFood] ON 

INSERT [dbo].[AdditionalFood] ([Id], [FoodName], [Description], [Price], [CategoryId], [Unit], [OrderTime], [Quantity]) VALUES (1, N'Trân châu đen', N'Trân châu dai ngon', CAST(5000.00 AS Decimal(10, 2)), 6, N'Phần', NULL, 0)
INSERT [dbo].[AdditionalFood] ([Id], [FoodName], [Description], [Price], [CategoryId], [Unit], [OrderTime], [Quantity]) VALUES (2, N'Trân châu trắng', N'Trân châu vị ngọt thanh', CAST(5500.00 AS Decimal(10, 2)), 6, N'Phần', NULL, 0)
INSERT [dbo].[AdditionalFood] ([Id], [FoodName], [Description], [Price], [CategoryId], [Unit], [OrderTime], [Quantity]) VALUES (3, N'Thạch cà phê', N'Thạch vị cà phê thơm ngon', CAST(6000.00 AS Decimal(10, 2)), 6, N'Phần', NULL, 0)
INSERT [dbo].[AdditionalFood] ([Id], [FoodName], [Description], [Price], [CategoryId], [Unit], [OrderTime], [Quantity]) VALUES (4, N'Pudding trứng', N'Pudding trứng mềm mịn', CAST(7000.00 AS Decimal(10, 2)), 6, N'Phần', NULL, 0)
INSERT [dbo].[AdditionalFood] ([Id], [FoodName], [Description], [Price], [CategoryId], [Unit], [OrderTime], [Quantity]) VALUES (5, N'Rau câu dừa', N'Rau câu thơm mát vị dừa', CAST(5500.00 AS Decimal(10, 2)), 6, N'Phần', NULL, 0)
INSERT [dbo].[AdditionalFood] ([Id], [FoodName], [Description], [Price], [CategoryId], [Unit], [OrderTime], [Quantity]) VALUES (6, N'Bánh thêm', N'Bánh phở thêm', CAST(10000.00 AS Decimal(10, 2)), 3, N'Phần', NULL, 0)
INSERT [dbo].[AdditionalFood] ([Id], [FoodName], [Description], [Price], [CategoryId], [Unit], [OrderTime], [Quantity]) VALUES (7, N'Trứng trần', N'Trứng gà trần ăn kèm', CAST(7000.00 AS Decimal(10, 2)), 3, N'Phần', NULL, 0)
INSERT [dbo].[AdditionalFood] ([Id], [FoodName], [Description], [Price], [CategoryId], [Unit], [OrderTime], [Quantity]) VALUES (8, N'Bò viên thêm', N'Bò viên ăn kèm', CAST(15000.00 AS Decimal(10, 2)), 3, N'Phần', NULL, 0)
INSERT [dbo].[AdditionalFood] ([Id], [FoodName], [Description], [Price], [CategoryId], [Unit], [OrderTime], [Quantity]) VALUES (9, N'Giò thêm', N'Giò heo ăn kèm', CAST(12000.00 AS Decimal(10, 2)), 3, N'Phần', NULL, 0)
INSERT [dbo].[AdditionalFood] ([Id], [FoodName], [Description], [Price], [CategoryId], [Unit], [OrderTime], [Quantity]) VALUES (10, N'Hành phi', N'Hành phi giòn rụm', CAST(3000.00 AS Decimal(10, 2)), 3, N'Phần', NULL, 0)
INSERT [dbo].[AdditionalFood] ([Id], [FoodName], [Description], [Price], [CategoryId], [Unit], [OrderTime], [Quantity]) VALUES (11, N'Rau sống thêm', N'Rau sống ăn kèm', CAST(5000.00 AS Decimal(10, 2)), 3, N'Phần', NULL, 0)
INSERT [dbo].[AdditionalFood] ([Id], [FoodName], [Description], [Price], [CategoryId], [Unit], [OrderTime], [Quantity]) VALUES (12, N'Chả giò', N'Chả giò chiên giòn', CAST(15000.00 AS Decimal(10, 2)), 2, N'Phần', NULL, 0)
INSERT [dbo].[AdditionalFood] ([Id], [FoodName], [Description], [Price], [CategoryId], [Unit], [OrderTime], [Quantity]) VALUES (13, N'Mực chiên', N'Mực chiên giòn', CAST(20000.00 AS Decimal(10, 2)), 2, N'Phần', NULL, 0)
INSERT [dbo].[AdditionalFood] ([Id], [FoodName], [Description], [Price], [CategoryId], [Unit], [OrderTime], [Quantity]) VALUES (14, N'Tôm chiên', N'Tôm chiên xù', CAST(25000.00 AS Decimal(10, 2)), 2, N'Phần', NULL, 0)
INSERT [dbo].[AdditionalFood] ([Id], [FoodName], [Description], [Price], [CategoryId], [Unit], [OrderTime], [Quantity]) VALUES (15, N'Nạc heo xào', N'Nạc heo xào tỏi', CAST(18000.00 AS Decimal(10, 2)), 2, N'Phần', NULL, 0)
INSERT [dbo].[AdditionalFood] ([Id], [FoodName], [Description], [Price], [CategoryId], [Unit], [OrderTime], [Quantity]) VALUES (16, N'Rau xào', N'Rau củ xào', CAST(10000.00 AS Decimal(10, 2)), 2, N'Phần', NULL, 0)
INSERT [dbo].[AdditionalFood] ([Id], [FoodName], [Description], [Price], [CategoryId], [Unit], [OrderTime], [Quantity]) VALUES (17, N'Bò xào', N'Bò xào với hành', CAST(30000.00 AS Decimal(10, 2)), 2, N'Phần', NULL, 0)
SET IDENTITY_INSERT [dbo].[AdditionalFood] OFF
GO
SET IDENTITY_INSERT [dbo].[CustomizableItem] ON 

INSERT [dbo].[CustomizableItem] ([CustomItemId], [CustomItemName], [CustomItemPrice]) VALUES (1, N'Th?ch den', CAST(4000.00 AS Decimal(18, 2)))
INSERT [dbo].[CustomizableItem] ([CustomItemId], [CustomItemName], [CustomItemPrice]) VALUES (2, N'Bánh flan', CAST(10000.00 AS Decimal(18, 2)))
INSERT [dbo].[CustomizableItem] ([CustomItemId], [CustomItemName], [CustomItemPrice]) VALUES (3, N'H?t chia', CAST(5000.00 AS Decimal(18, 2)))
INSERT [dbo].[CustomizableItem] ([CustomItemId], [CustomItemName], [CustomItemPrice]) VALUES (4, N'Rau câu', CAST(3000.00 AS Decimal(18, 2)))
INSERT [dbo].[CustomizableItem] ([CustomItemId], [CustomItemName], [CustomItemPrice]) VALUES (5, N'Ð?u d?', CAST(6000.00 AS Decimal(18, 2)))
INSERT [dbo].[CustomizableItem] ([CustomItemId], [CustomItemName], [CustomItemPrice]) VALUES (6, N'Kem phô mai', CAST(8000.00 AS Decimal(18, 2)))
INSERT [dbo].[CustomizableItem] ([CustomItemId], [CustomItemName], [CustomItemPrice]) VALUES (7, N'Trân châu tr?ng', CAST(5000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[CustomizableItem] OFF
GO
SET IDENTITY_INSERT [dbo].[FoodCategory] ON 

INSERT [dbo].[FoodCategory] ([CategoryId], [CategoryName], [Description], [Icon]) VALUES (2, N'Món khô', N'Các món ăn không có nước', N'mdi-food-variant')
INSERT [dbo].[FoodCategory] ([CategoryId], [CategoryName], [Description], [Icon]) VALUES (3, N'Món nước', N'Các món ăn có nước', N'mdi-noodles')
INSERT [dbo].[FoodCategory] ([CategoryId], [CategoryName], [Description], [Icon]) VALUES (4, N'Món ăn nhanh', N'Các món ăn chế biến nhanh', N'mdi-hamburger')
INSERT [dbo].[FoodCategory] ([CategoryId], [CategoryName], [Description], [Icon]) VALUES (5, N'Tráng miệng', N'Các món tráng miệng sau bữa ăn', N'mdi-cookie')
INSERT [dbo].[FoodCategory] ([CategoryId], [CategoryName], [Description], [Icon]) VALUES (6, N'Nước uống', N'Các loại đồ uống', N'mdi-cup')
INSERT [dbo].[FoodCategory] ([CategoryId], [CategoryName], [Description], [Icon]) VALUES (7, N'Món gọi thêm', N'Các món ăn thêm', N'mdi-baguette')
SET IDENTITY_INSERT [dbo].[FoodCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[FoodCustomizable] ON 

INSERT [dbo].[FoodCustomizable] ([FoodCustomId], [FoodItemId], [CustomItemId]) VALUES (1, 5, 1)
INSERT [dbo].[FoodCustomizable] ([FoodCustomId], [FoodItemId], [CustomItemId]) VALUES (2, 5, 2)
INSERT [dbo].[FoodCustomizable] ([FoodCustomId], [FoodItemId], [CustomItemId]) VALUES (3, 5, 3)
INSERT [dbo].[FoodCustomizable] ([FoodCustomId], [FoodItemId], [CustomItemId]) VALUES (4, 5, 7)
INSERT [dbo].[FoodCustomizable] ([FoodCustomId], [FoodItemId], [CustomItemId]) VALUES (5, 1, 5)
INSERT [dbo].[FoodCustomizable] ([FoodCustomId], [FoodItemId], [CustomItemId]) VALUES (6, 1, 4)
INSERT [dbo].[FoodCustomizable] ([FoodCustomId], [FoodItemId], [CustomItemId]) VALUES (7, 4, 6)
SET IDENTITY_INSERT [dbo].[FoodCustomizable] OFF
GO
SET IDENTITY_INSERT [dbo].[FoodItem] ON 

INSERT [dbo].[FoodItem] ([FoodItemId], [FoodName], [PriceListed], [PriceCustom], [ImageUrl], [Unit], [CategoryId], [Status]) VALUES (1, N'Cơm sườn', CAST(35000.00 AS Decimal(18, 2)), CAST(30000.00 AS Decimal(18, 2)), N'/public/humbager.jpg', N'phần', 2, N'có sẵn')
INSERT [dbo].[FoodItem] ([FoodItemId], [FoodName], [PriceListed], [PriceCustom], [ImageUrl], [Unit], [CategoryId], [Status]) VALUES (2, N'Phở bò', CAST(40000.00 AS Decimal(18, 2)), CAST(35000.00 AS Decimal(18, 2)), N'/public/humbager.jpg', N'phần', 3, N'có sẵn')
INSERT [dbo].[FoodItem] ([FoodItemId], [FoodName], [PriceListed], [PriceCustom], [ImageUrl], [Unit], [CategoryId], [Status]) VALUES (3, N'Pizza phô mai', CAST(70000.00 AS Decimal(18, 2)), CAST(60000.00 AS Decimal(18, 2)), N'/public/humbager.jpg', N'phần', 4, N'có sẵn')
INSERT [dbo].[FoodItem] ([FoodItemId], [FoodName], [PriceListed], [PriceCustom], [ImageUrl], [Unit], [CategoryId], [Status]) VALUES (4, N'Kem trái cây', CAST(25000.00 AS Decimal(18, 2)), CAST(20000.00 AS Decimal(18, 2)), N'/public/humbager.jpg', N'phần', 5, N'có sẵn')
INSERT [dbo].[FoodItem] ([FoodItemId], [FoodName], [PriceListed], [PriceCustom], [ImageUrl], [Unit], [CategoryId], [Status]) VALUES (5, N'Trà sữa', CAST(30000.00 AS Decimal(18, 2)), CAST(25000.00 AS Decimal(18, 2)), N'/public/humbager.jpg', N'ly', 6, N'có sẵn')
INSERT [dbo].[FoodItem] ([FoodItemId], [FoodName], [PriceListed], [PriceCustom], [ImageUrl], [Unit], [CategoryId], [Status]) VALUES (6, N'Bánh mì kẹp', CAST(20000.00 AS Decimal(18, 2)), CAST(15000.00 AS Decimal(18, 2)), N'/public/humbager.jpg', N'phần', 4, N'có sẵn')
INSERT [dbo].[FoodItem] ([FoodItemId], [FoodName], [PriceListed], [PriceCustom], [ImageUrl], [Unit], [CategoryId], [Status]) VALUES (7, N'Gà rán', CAST(45000.00 AS Decimal(18, 2)), CAST(40000.00 AS Decimal(18, 2)), N'/public/humbager.jpg', N'phần', 2, N'có sẵn')
INSERT [dbo].[FoodItem] ([FoodItemId], [FoodName], [PriceListed], [PriceCustom], [ImageUrl], [Unit], [CategoryId], [Status]) VALUES (8, N'Bánh xèo', CAST(30000.00 AS Decimal(18, 2)), CAST(25000.00 AS Decimal(18, 2)), N'/public/humbager.jpg', N'phần', 2, N'có sẵn')
INSERT [dbo].[FoodItem] ([FoodItemId], [FoodName], [PriceListed], [PriceCustom], [ImageUrl], [Unit], [CategoryId], [Status]) VALUES (9, N'Cháo gà', CAST(25000.00 AS Decimal(18, 2)), CAST(20000.00 AS Decimal(18, 2)), N'/public/humbager.jpg', N'tô', 3, N'có sẵn')
INSERT [dbo].[FoodItem] ([FoodItemId], [FoodName], [PriceListed], [PriceCustom], [ImageUrl], [Unit], [CategoryId], [Status]) VALUES (10, N'Sinh tố xoài', CAST(20000.00 AS Decimal(18, 2)), CAST(15000.00 AS Decimal(18, 2)), N'/public/humbager.jpg', N'ly', 6, N'có sẵn')
INSERT [dbo].[FoodItem] ([FoodItemId], [FoodName], [PriceListed], [PriceCustom], [ImageUrl], [Unit], [CategoryId], [Status]) VALUES (11, N'Mì xào bò', CAST(40000.00 AS Decimal(18, 2)), CAST(35000.00 AS Decimal(18, 2)), N'/public/humbager.jpg', N'phần', 3, N'có sẵn')
INSERT [dbo].[FoodItem] ([FoodItemId], [FoodName], [PriceListed], [PriceCustom], [ImageUrl], [Unit], [CategoryId], [Status]) VALUES (12, N'Gỏi cuốn', CAST(15000.00 AS Decimal(18, 2)), CAST(10000.00 AS Decimal(18, 2)), N'/public/humbager.jpg', N'phần', 2, N'có sẵn')
INSERT [dbo].[FoodItem] ([FoodItemId], [FoodName], [PriceListed], [PriceCustom], [ImageUrl], [Unit], [CategoryId], [Status]) VALUES (13, N'Trà chanh', CAST(15000.00 AS Decimal(18, 2)), CAST(10000.00 AS Decimal(18, 2)), N'/public/humbager.jpg', N'ly', 6, N'có sẵn')
INSERT [dbo].[FoodItem] ([FoodItemId], [FoodName], [PriceListed], [PriceCustom], [ImageUrl], [Unit], [CategoryId], [Status]) VALUES (14, N'Kem dừa', CAST(30000.00 AS Decimal(18, 2)), CAST(25000.00 AS Decimal(18, 2)), N'/public/humbager.jpg', N'phần', 5, N'có sẵn')
INSERT [dbo].[FoodItem] ([FoodItemId], [FoodName], [PriceListed], [PriceCustom], [ImageUrl], [Unit], [CategoryId], [Status]) VALUES (15, N'Bánh mì trứng', CAST(25000.00 AS Decimal(18, 2)), CAST(20000.00 AS Decimal(18, 2)), N'/public/humbager.jpg', N'ổ', 4, N'có sẵn')
INSERT [dbo].[FoodItem] ([FoodItemId], [FoodName], [PriceListed], [PriceCustom], [ImageUrl], [Unit], [CategoryId], [Status]) VALUES (16, N'Hủ tiếu Nam Vang', CAST(45000.00 AS Decimal(18, 2)), CAST(40000.00 AS Decimal(18, 2)), N'/public/humbager.jpg', N'tô', 3, N'có sẵn')
INSERT [dbo].[FoodItem] ([FoodItemId], [FoodName], [PriceListed], [PriceCustom], [ImageUrl], [Unit], [CategoryId], [Status]) VALUES (17, N'Súp cua', CAST(35000.00 AS Decimal(18, 2)), CAST(30000.00 AS Decimal(18, 2)), N'/public/humbager.jpg', N'chén', 3, N'có sẵn')
INSERT [dbo].[FoodItem] ([FoodItemId], [FoodName], [PriceListed], [PriceCustom], [ImageUrl], [Unit], [CategoryId], [Status]) VALUES (18, N'Xúc xích chiên', CAST(15000.00 AS Decimal(18, 2)), CAST(10000.00 AS Decimal(18, 2)), N'/public/humbager.jpg', N'phần', 7, N'có sẵn')
INSERT [dbo].[FoodItem] ([FoodItemId], [FoodName], [PriceListed], [PriceCustom], [ImageUrl], [Unit], [CategoryId], [Status]) VALUES (19, N'Khoai tây chiên', CAST(20000.00 AS Decimal(18, 2)), CAST(15000.00 AS Decimal(18, 2)), N'/public/humbager.jpg', N'phần', 7, N'có sẵn')
INSERT [dbo].[FoodItem] ([FoodItemId], [FoodName], [PriceListed], [PriceCustom], [ImageUrl], [Unit], [CategoryId], [Status]) VALUES (20, N'Bắp rang bơ', CAST(10000.00 AS Decimal(18, 2)), CAST(5000.00 AS Decimal(18, 2)), N'/public/humbager.jpg', N'phần', 7, N'có sẵn')
INSERT [dbo].[FoodItem] ([FoodItemId], [FoodName], [PriceListed], [PriceCustom], [ImageUrl], [Unit], [CategoryId], [Status]) VALUES (21, N'Phô mai que', CAST(12000.00 AS Decimal(18, 2)), CAST(7000.00 AS Decimal(18, 2)), N'/public/humbager.jpg', N'phần', 7, N'có sẵn')
INSERT [dbo].[FoodItem] ([FoodItemId], [FoodName], [PriceListed], [PriceCustom], [ImageUrl], [Unit], [CategoryId], [Status]) VALUES (1002, N'Combo cá viên chiên nước mắm + 1 chai cocacola', CAST(58000.00 AS Decimal(18, 2)), CAST(53000.00 AS Decimal(18, 2)), N'/public/humbager.jpg', N'combo', 7, N'có sẵn')
INSERT [dbo].[FoodItem] ([FoodItemId], [FoodName], [PriceListed], [PriceCustom], [ImageUrl], [Unit], [CategoryId], [Status]) VALUES (1003, N'Cơm gà xối mở', CAST(45000.00 AS Decimal(18, 2)), CAST(40000.00 AS Decimal(18, 2)), N'/public/humbager.jpg', N'Phần', 2, N'Có sẵn')
INSERT [dbo].[FoodItem] ([FoodItemId], [FoodName], [PriceListed], [PriceCustom], [ImageUrl], [Unit], [CategoryId], [Status]) VALUES (1004, N'Mì xào ốc móng tay', CAST(40000.00 AS Decimal(18, 2)), CAST(35000.00 AS Decimal(18, 2)), N'/public/humbager.jpg', N'Phần', 2, N'Có sẵn')
SET IDENTITY_INSERT [dbo].[FoodItem] OFF
GO
SET IDENTITY_INSERT [dbo].[FoodPriceType] ON 

INSERT [dbo].[FoodPriceType] ([PriceTypeId], [FoodItemId], [Size], [Price]) VALUES (1, 5, N'Size M', CAST(30000.00 AS Decimal(18, 2)))
INSERT [dbo].[FoodPriceType] ([PriceTypeId], [FoodItemId], [Size], [Price]) VALUES (2, 5, N'Size L', CAST(35000.00 AS Decimal(18, 2)))
INSERT [dbo].[FoodPriceType] ([PriceTypeId], [FoodItemId], [Size], [Price]) VALUES (3, 5, N'Size XL', CAST(40000.00 AS Decimal(18, 2)))
INSERT [dbo].[FoodPriceType] ([PriceTypeId], [FoodItemId], [Size], [Price]) VALUES (4, 3, N'Nh?', CAST(70000.00 AS Decimal(18, 2)))
INSERT [dbo].[FoodPriceType] ([PriceTypeId], [FoodItemId], [Size], [Price]) VALUES (5, 3, N'V?a', CAST(90000.00 AS Decimal(18, 2)))
INSERT [dbo].[FoodPriceType] ([PriceTypeId], [FoodItemId], [Size], [Price]) VALUES (6, 3, N'L?n', CAST(110000.00 AS Decimal(18, 2)))
INSERT [dbo].[FoodPriceType] ([PriceTypeId], [FoodItemId], [Size], [Price]) VALUES (7, 2, N'Bát nh?', CAST(30000.00 AS Decimal(18, 2)))
INSERT [dbo].[FoodPriceType] ([PriceTypeId], [FoodItemId], [Size], [Price]) VALUES (8, 2, N'Bát l?n', CAST(50000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[FoodPriceType] OFF
GO
SET IDENTITY_INSERT [dbo].[Materials] ON 

INSERT [dbo].[Materials] ([MaterialId], [MaterialName], [MaterialType], [Quantity], [MinQuantity], [Unit], [ImportDate], [ExpirationDate], [ImportPrice]) VALUES (1, N'Gạo', N'Thực phẩm', 100, 10, N'kg', CAST(N'2024-11-29T13:40:35.150' AS DateTime), CAST(N'2025-05-29T13:40:35.150' AS DateTime), CAST(15.00 AS Decimal(18, 2)))
INSERT [dbo].[Materials] ([MaterialId], [MaterialName], [MaterialType], [Quantity], [MinQuantity], [Unit], [ImportDate], [ExpirationDate], [ImportPrice]) VALUES (2, N'Sườn heo', N'Thực phẩm', 50, 5, N'kg', CAST(N'2024-11-29T13:40:35.150' AS DateTime), CAST(N'2024-12-29T13:40:35.150' AS DateTime), CAST(120.00 AS Decimal(18, 2)))
INSERT [dbo].[Materials] ([MaterialId], [MaterialName], [MaterialType], [Quantity], [MinQuantity], [Unit], [ImportDate], [ExpirationDate], [ImportPrice]) VALUES (3, N'Nước mắm', N'Gia vị', 20, 5, N'lít', CAST(N'2024-11-29T13:40:35.150' AS DateTime), CAST(N'2026-11-29T13:40:35.150' AS DateTime), CAST(30.00 AS Decimal(18, 2)))
INSERT [dbo].[Materials] ([MaterialId], [MaterialName], [MaterialType], [Quantity], [MinQuantity], [Unit], [ImportDate], [ExpirationDate], [ImportPrice]) VALUES (4, N'Tỏi', N'Gia vị', 10, 2, N'kg', CAST(N'2024-11-29T13:40:35.150' AS DateTime), CAST(N'2025-01-29T13:40:35.150' AS DateTime), CAST(40.00 AS Decimal(18, 2)))
INSERT [dbo].[Materials] ([MaterialId], [MaterialName], [MaterialType], [Quantity], [MinQuantity], [Unit], [ImportDate], [ExpirationDate], [ImportPrice]) VALUES (5, N'Hành tím', N'Gia vị', 8, 2, N'kg', CAST(N'2024-11-29T13:40:35.150' AS DateTime), CAST(N'2025-01-29T13:40:35.150' AS DateTime), CAST(35.00 AS Decimal(18, 2)))
INSERT [dbo].[Materials] ([MaterialId], [MaterialName], [MaterialType], [Quantity], [MinQuantity], [Unit], [ImportDate], [ExpirationDate], [ImportPrice]) VALUES (6, N'Bánh phở', N'Thực phẩm', 50, 10, N'kg', CAST(N'2024-11-29T13:40:35.150' AS DateTime), CAST(N'2024-12-29T13:40:35.150' AS DateTime), CAST(20.00 AS Decimal(18, 2)))
INSERT [dbo].[Materials] ([MaterialId], [MaterialName], [MaterialType], [Quantity], [MinQuantity], [Unit], [ImportDate], [ExpirationDate], [ImportPrice]) VALUES (7, N'Thịt bò', N'Thực phẩm', 60, 5, N'kg', CAST(N'2024-11-29T13:40:35.150' AS DateTime), CAST(N'2024-12-29T13:40:35.150' AS DateTime), CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[Materials] ([MaterialId], [MaterialName], [MaterialType], [Quantity], [MinQuantity], [Unit], [ImportDate], [ExpirationDate], [ImportPrice]) VALUES (8, N'Xương bò', N'Thực phẩm', 30, 3, N'kg', CAST(N'2024-11-29T13:40:35.150' AS DateTime), CAST(N'2024-12-29T13:40:35.150' AS DateTime), CAST(80.00 AS Decimal(18, 2)))
INSERT [dbo].[Materials] ([MaterialId], [MaterialName], [MaterialType], [Quantity], [MinQuantity], [Unit], [ImportDate], [ExpirationDate], [ImportPrice]) VALUES (9, N'Hành tây', N'Gia vị', 15, 3, N'kg', CAST(N'2024-11-29T13:40:35.150' AS DateTime), CAST(N'2025-01-29T13:40:35.150' AS DateTime), CAST(25.00 AS Decimal(18, 2)))
INSERT [dbo].[Materials] ([MaterialId], [MaterialName], [MaterialType], [Quantity], [MinQuantity], [Unit], [ImportDate], [ExpirationDate], [ImportPrice]) VALUES (10, N'Gia vị phở', N'Gia vị', 5, 1, N'gói', CAST(N'2024-11-29T13:40:35.150' AS DateTime), CAST(N'2026-11-29T13:40:35.150' AS DateTime), CAST(10.00 AS Decimal(18, 2)))
INSERT [dbo].[Materials] ([MaterialId], [MaterialName], [MaterialType], [Quantity], [MinQuantity], [Unit], [ImportDate], [ExpirationDate], [ImportPrice]) VALUES (11, N'Bột mì', N'Nguyên liệu', 50, 10, N'kg', CAST(N'2024-11-29T13:40:35.150' AS DateTime), CAST(N'2025-05-29T13:40:35.150' AS DateTime), CAST(25.00 AS Decimal(18, 2)))
INSERT [dbo].[Materials] ([MaterialId], [MaterialName], [MaterialType], [Quantity], [MinQuantity], [Unit], [ImportDate], [ExpirationDate], [ImportPrice]) VALUES (12, N'Men nở', N'Gia vị', 10, 2, N'g', CAST(N'2024-11-29T13:40:35.150' AS DateTime), CAST(N'2025-11-29T13:40:35.150' AS DateTime), CAST(5.00 AS Decimal(18, 2)))
INSERT [dbo].[Materials] ([MaterialId], [MaterialName], [MaterialType], [Quantity], [MinQuantity], [Unit], [ImportDate], [ExpirationDate], [ImportPrice]) VALUES (13, N'Sốt cà chua', N'Gia vị', 20, 5, N'kg', CAST(N'2024-11-29T13:40:35.150' AS DateTime), CAST(N'2025-05-29T13:40:35.150' AS DateTime), CAST(40.00 AS Decimal(18, 2)))
INSERT [dbo].[Materials] ([MaterialId], [MaterialName], [MaterialType], [Quantity], [MinQuantity], [Unit], [ImportDate], [ExpirationDate], [ImportPrice]) VALUES (14, N'Phô mai mozzarella', N'Thực phẩm', 15, 5, N'kg', CAST(N'2024-11-29T13:40:35.150' AS DateTime), CAST(N'2024-12-29T13:40:35.150' AS DateTime), CAST(150.00 AS Decimal(18, 2)))
INSERT [dbo].[Materials] ([MaterialId], [MaterialName], [MaterialType], [Quantity], [MinQuantity], [Unit], [ImportDate], [ExpirationDate], [ImportPrice]) VALUES (15, N'Kem vanilla', N'Thực phẩm', 30, 5, N'lít', CAST(N'2024-11-29T13:40:35.150' AS DateTime), CAST(N'2025-02-28T13:40:35.150' AS DateTime), CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[Materials] ([MaterialId], [MaterialName], [MaterialType], [Quantity], [MinQuantity], [Unit], [ImportDate], [ExpirationDate], [ImportPrice]) VALUES (16, N'Trái cây tươi', N'Thực phẩm', 50, 10, N'kg', CAST(N'2024-11-29T13:40:35.150' AS DateTime), CAST(N'2024-12-06T13:40:35.150' AS DateTime), CAST(50.00 AS Decimal(18, 2)))
INSERT [dbo].[Materials] ([MaterialId], [MaterialName], [MaterialType], [Quantity], [MinQuantity], [Unit], [ImportDate], [ExpirationDate], [ImportPrice]) VALUES (17, N'Trà đen', N'Thực phẩm', 20, 5, N'kg', CAST(N'2024-11-29T13:40:35.150' AS DateTime), CAST(N'2025-11-29T13:40:35.150' AS DateTime), CAST(150.00 AS Decimal(18, 2)))
INSERT [dbo].[Materials] ([MaterialId], [MaterialName], [MaterialType], [Quantity], [MinQuantity], [Unit], [ImportDate], [ExpirationDate], [ImportPrice]) VALUES (18, N'Sữa đặc', N'Thực phẩm', 30, 5, N'lon', CAST(N'2024-11-29T13:40:35.150' AS DateTime), CAST(N'2026-11-29T13:40:35.150' AS DateTime), CAST(20.00 AS Decimal(18, 2)))
INSERT [dbo].[Materials] ([MaterialId], [MaterialName], [MaterialType], [Quantity], [MinQuantity], [Unit], [ImportDate], [ExpirationDate], [ImportPrice]) VALUES (19, N'Trân châu', N'Thực phẩm', 10, 3, N'kg', CAST(N'2024-11-29T13:40:35.150' AS DateTime), CAST(N'2024-12-29T13:40:35.150' AS DateTime), CAST(80.00 AS Decimal(18, 2)))
INSERT [dbo].[Materials] ([MaterialId], [MaterialName], [MaterialType], [Quantity], [MinQuantity], [Unit], [ImportDate], [ExpirationDate], [ImportPrice]) VALUES (20, N'Bánh mì', N'Thực phẩm', 100, 20, N'ổ', CAST(N'2024-11-29T13:40:35.150' AS DateTime), CAST(N'2024-12-02T13:40:35.150' AS DateTime), CAST(10.00 AS Decimal(18, 2)))
INSERT [dbo].[Materials] ([MaterialId], [MaterialName], [MaterialType], [Quantity], [MinQuantity], [Unit], [ImportDate], [ExpirationDate], [ImportPrice]) VALUES (21, N'Thịt nguội', N'Thực phẩm', 20, 5, N'kg', CAST(N'2024-11-29T13:40:35.150' AS DateTime), CAST(N'2024-12-06T13:40:35.150' AS DateTime), CAST(120.00 AS Decimal(18, 2)))
INSERT [dbo].[Materials] ([MaterialId], [MaterialName], [MaterialType], [Quantity], [MinQuantity], [Unit], [ImportDate], [ExpirationDate], [ImportPrice]) VALUES (22, N'Dưa leo', N'Thực phẩm', 30, 5, N'kg', CAST(N'2024-11-29T13:40:35.150' AS DateTime), CAST(N'2024-12-13T13:40:35.150' AS DateTime), CAST(15.00 AS Decimal(18, 2)))
INSERT [dbo].[Materials] ([MaterialId], [MaterialName], [MaterialType], [Quantity], [MinQuantity], [Unit], [ImportDate], [ExpirationDate], [ImportPrice]) VALUES (23, N'Mayonnaise', N'Gia vị', 15, 3, N'kg', CAST(N'2024-11-29T13:40:35.150' AS DateTime), CAST(N'2025-11-29T13:40:35.150' AS DateTime), CAST(50.00 AS Decimal(18, 2)))
INSERT [dbo].[Materials] ([MaterialId], [MaterialName], [MaterialType], [Quantity], [MinQuantity], [Unit], [ImportDate], [ExpirationDate], [ImportPrice]) VALUES (24, N'Thịt gà', N'Thực phẩm', 50, 10, N'kg', CAST(N'2024-11-29T13:40:35.150' AS DateTime), CAST(N'2024-12-13T13:40:35.150' AS DateTime), CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[Materials] ([MaterialId], [MaterialName], [MaterialType], [Quantity], [MinQuantity], [Unit], [ImportDate], [ExpirationDate], [ImportPrice]) VALUES (25, N'Bột chiên giòn', N'Nguyên liệu', 20, 5, N'kg', CAST(N'2024-11-29T13:40:35.150' AS DateTime), CAST(N'2025-11-29T13:40:35.150' AS DateTime), CAST(30.00 AS Decimal(18, 2)))
INSERT [dbo].[Materials] ([MaterialId], [MaterialName], [MaterialType], [Quantity], [MinQuantity], [Unit], [ImportDate], [ExpirationDate], [ImportPrice]) VALUES (26, N'Bột bắp', N'Nguyên liệu', 10, 2, N'kg', CAST(N'2024-11-29T13:40:35.150' AS DateTime), CAST(N'2026-11-29T13:40:35.150' AS DateTime), CAST(20.00 AS Decimal(18, 2)))
INSERT [dbo].[Materials] ([MaterialId], [MaterialName], [MaterialType], [Quantity], [MinQuantity], [Unit], [ImportDate], [ExpirationDate], [ImportPrice]) VALUES (27, N'Bột bánh xèo', N'Nguyên liệu', 25, 5, N'kg', CAST(N'2024-11-29T13:40:35.150' AS DateTime), CAST(N'2025-11-29T13:40:35.150' AS DateTime), CAST(30.00 AS Decimal(18, 2)))
INSERT [dbo].[Materials] ([MaterialId], [MaterialName], [MaterialType], [Quantity], [MinQuantity], [Unit], [ImportDate], [ExpirationDate], [ImportPrice]) VALUES (28, N'Tôm tươi', N'Thực phẩm', 20, 5, N'kg', CAST(N'2024-11-29T13:40:35.150' AS DateTime), CAST(N'2024-12-06T13:40:35.150' AS DateTime), CAST(150.00 AS Decimal(18, 2)))
INSERT [dbo].[Materials] ([MaterialId], [MaterialName], [MaterialType], [Quantity], [MinQuantity], [Unit], [ImportDate], [ExpirationDate], [ImportPrice]) VALUES (29, N'Thịt ba chỉ', N'Thực phẩm', 30, 5, N'kg', CAST(N'2024-11-29T13:40:35.150' AS DateTime), CAST(N'2024-12-29T13:40:35.150' AS DateTime), CAST(120.00 AS Decimal(18, 2)))
INSERT [dbo].[Materials] ([MaterialId], [MaterialName], [MaterialType], [Quantity], [MinQuantity], [Unit], [ImportDate], [ExpirationDate], [ImportPrice]) VALUES (30, N'Giá đỗ', N'Thực phẩm', 10, 2, N'kg', CAST(N'2024-11-29T13:40:35.150' AS DateTime), CAST(N'2024-12-02T13:40:35.150' AS DateTime), CAST(15.00 AS Decimal(18, 2)))
INSERT [dbo].[Materials] ([MaterialId], [MaterialName], [MaterialType], [Quantity], [MinQuantity], [Unit], [ImportDate], [ExpirationDate], [ImportPrice]) VALUES (31, N'Rau sống', N'Thực phẩm', 15, 5, N'kg', CAST(N'2024-11-29T13:40:35.150' AS DateTime), CAST(N'2024-12-02T13:40:35.150' AS DateTime), CAST(20.00 AS Decimal(18, 2)))
INSERT [dbo].[Materials] ([MaterialId], [MaterialName], [MaterialType], [Quantity], [MinQuantity], [Unit], [ImportDate], [ExpirationDate], [ImportPrice]) VALUES (32, N'Xoài chín', N'Thực phẩm', 10, 2, N'kg', CAST(N'2024-11-29T13:40:35.150' AS DateTime), CAST(N'2024-12-06T13:40:35.150' AS DateTime), CAST(30.00 AS Decimal(18, 2)))
INSERT [dbo].[Materials] ([MaterialId], [MaterialName], [MaterialType], [Quantity], [MinQuantity], [Unit], [ImportDate], [ExpirationDate], [ImportPrice]) VALUES (33, N'Mì trứng', N'Thực phẩm', 40, 10, N'kg', CAST(N'2024-11-29T13:40:35.150' AS DateTime), CAST(N'2024-12-29T13:40:35.150' AS DateTime), CAST(20.00 AS Decimal(18, 2)))
INSERT [dbo].[Materials] ([MaterialId], [MaterialName], [MaterialType], [Quantity], [MinQuantity], [Unit], [ImportDate], [ExpirationDate], [ImportPrice]) VALUES (34, N'Rau cải', N'Thực phẩm', 15, 5, N'kg', CAST(N'2024-11-29T13:40:35.150' AS DateTime), CAST(N'2024-12-04T13:40:35.150' AS DateTime), CAST(15.00 AS Decimal(18, 2)))
INSERT [dbo].[Materials] ([MaterialId], [MaterialName], [MaterialType], [Quantity], [MinQuantity], [Unit], [ImportDate], [ExpirationDate], [ImportPrice]) VALUES (35, N'Cà rốt', N'Thực phẩm', 20, 5, N'kg', CAST(N'2024-11-29T13:40:35.150' AS DateTime), CAST(N'2024-12-13T13:40:35.150' AS DateTime), CAST(20.00 AS Decimal(18, 2)))
INSERT [dbo].[Materials] ([MaterialId], [MaterialName], [MaterialType], [Quantity], [MinQuantity], [Unit], [ImportDate], [ExpirationDate], [ImportPrice]) VALUES (36, N'Bánh tráng', N'Thực phẩm', 50, 10, N'kg', CAST(N'2024-11-29T13:40:35.150' AS DateTime), CAST(N'2025-05-29T13:40:35.150' AS DateTime), CAST(10.00 AS Decimal(18, 2)))
INSERT [dbo].[Materials] ([MaterialId], [MaterialName], [MaterialType], [Quantity], [MinQuantity], [Unit], [ImportDate], [ExpirationDate], [ImportPrice]) VALUES (37, N'Bún tươi', N'Thực phẩm', 40, 10, N'kg', CAST(N'2024-11-29T13:40:35.150' AS DateTime), CAST(N'2024-12-06T13:40:35.150' AS DateTime), CAST(15.00 AS Decimal(18, 2)))
INSERT [dbo].[Materials] ([MaterialId], [MaterialName], [MaterialType], [Quantity], [MinQuantity], [Unit], [ImportDate], [ExpirationDate], [ImportPrice]) VALUES (38, N'Trà xanh', N'Thực phẩm', 20, 5, N'kg', CAST(N'2024-11-29T13:40:35.150' AS DateTime), CAST(N'2025-11-29T13:40:35.150' AS DateTime), CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[Materials] ([MaterialId], [MaterialName], [MaterialType], [Quantity], [MinQuantity], [Unit], [ImportDate], [ExpirationDate], [ImportPrice]) VALUES (39, N'Chanh tươi', N'Thực phẩm', 30, 5, N'kg', CAST(N'2024-11-29T13:40:35.150' AS DateTime), CAST(N'2024-12-06T13:40:35.150' AS DateTime), CAST(25.00 AS Decimal(18, 2)))
INSERT [dbo].[Materials] ([MaterialId], [MaterialName], [MaterialType], [Quantity], [MinQuantity], [Unit], [ImportDate], [ExpirationDate], [ImportPrice]) VALUES (40, N'Dừa nạo', N'Thực phẩm', 15, 5, N'kg', CAST(N'2024-11-29T13:40:35.150' AS DateTime), CAST(N'2024-12-04T13:40:35.150' AS DateTime), CAST(40.00 AS Decimal(18, 2)))
INSERT [dbo].[Materials] ([MaterialId], [MaterialName], [MaterialType], [Quantity], [MinQuantity], [Unit], [ImportDate], [ExpirationDate], [ImportPrice]) VALUES (41, N'Nước cốt dừa', N'Thực phẩm', 10, 2, N'lít', CAST(N'2024-11-29T13:40:35.150' AS DateTime), CAST(N'2024-12-06T13:40:35.150' AS DateTime), CAST(50.00 AS Decimal(18, 2)))
INSERT [dbo].[Materials] ([MaterialId], [MaterialName], [MaterialType], [Quantity], [MinQuantity], [Unit], [ImportDate], [ExpirationDate], [ImportPrice]) VALUES (42, N'Trứng gà', N'Thực phẩm', 60, 10, N'quả', CAST(N'2024-11-29T13:40:35.150' AS DateTime), CAST(N'2024-12-13T13:40:35.150' AS DateTime), CAST(5.00 AS Decimal(18, 2)))
INSERT [dbo].[Materials] ([MaterialId], [MaterialName], [MaterialType], [Quantity], [MinQuantity], [Unit], [ImportDate], [ExpirationDate], [ImportPrice]) VALUES (43, N'Hủ tiếu khô', N'Thực phẩm', 50, 10, N'kg', CAST(N'2024-11-29T13:40:35.150' AS DateTime), CAST(N'2025-05-29T13:40:35.150' AS DateTime), CAST(30.00 AS Decimal(18, 2)))
INSERT [dbo].[Materials] ([MaterialId], [MaterialName], [MaterialType], [Quantity], [MinQuantity], [Unit], [ImportDate], [ExpirationDate], [ImportPrice]) VALUES (44, N'Gan heo', N'Thực phẩm', 10, 3, N'kg', CAST(N'2024-11-29T13:40:35.150' AS DateTime), CAST(N'2024-12-06T13:40:35.150' AS DateTime), CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[Materials] ([MaterialId], [MaterialName], [MaterialType], [Quantity], [MinQuantity], [Unit], [ImportDate], [ExpirationDate], [ImportPrice]) VALUES (45, N'Cua thịt', N'Thực phẩm', 10, 3, N'kg', CAST(N'2024-11-29T13:40:35.150' AS DateTime), CAST(N'2024-12-06T13:40:35.150' AS DateTime), CAST(250.00 AS Decimal(18, 2)))
INSERT [dbo].[Materials] ([MaterialId], [MaterialName], [MaterialType], [Quantity], [MinQuantity], [Unit], [ImportDate], [ExpirationDate], [ImportPrice]) VALUES (46, N'Trứng cút', N'Thực phẩm', 50, 10, N'quả', CAST(N'2024-11-29T13:40:35.150' AS DateTime), CAST(N'2024-12-06T13:40:35.150' AS DateTime), CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[Materials] ([MaterialId], [MaterialName], [MaterialType], [Quantity], [MinQuantity], [Unit], [ImportDate], [ExpirationDate], [ImportPrice]) VALUES (47, N'Xúc xích', N'Thực phẩm', 40, 10, N'kg', CAST(N'2024-11-29T13:40:35.150' AS DateTime), CAST(N'2024-12-29T13:40:35.150' AS DateTime), CAST(120.00 AS Decimal(18, 2)))
INSERT [dbo].[Materials] ([MaterialId], [MaterialName], [MaterialType], [Quantity], [MinQuantity], [Unit], [ImportDate], [ExpirationDate], [ImportPrice]) VALUES (48, N'Khoai tây', N'Thực phẩm', 60, 10, N'kg', CAST(N'2024-11-29T13:40:35.150' AS DateTime), CAST(N'2024-12-29T13:40:35.150' AS DateTime), CAST(20.00 AS Decimal(18, 2)))
INSERT [dbo].[Materials] ([MaterialId], [MaterialName], [MaterialType], [Quantity], [MinQuantity], [Unit], [ImportDate], [ExpirationDate], [ImportPrice]) VALUES (49, N'Bắp', N'Thực phẩm', 30, 10, N'kg', CAST(N'2024-11-29T13:40:35.150' AS DateTime), CAST(N'2024-12-06T13:40:35.150' AS DateTime), CAST(15.00 AS Decimal(18, 2)))
INSERT [dbo].[Materials] ([MaterialId], [MaterialName], [MaterialType], [Quantity], [MinQuantity], [Unit], [ImportDate], [ExpirationDate], [ImportPrice]) VALUES (50, N'Phô mai', N'Thực phẩm', 20, 5, N'kg', CAST(N'2024-11-29T13:40:35.150' AS DateTime), CAST(N'2025-02-28T13:40:35.150' AS DateTime), CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[Materials] ([MaterialId], [MaterialName], [MaterialType], [Quantity], [MinQuantity], [Unit], [ImportDate], [ExpirationDate], [ImportPrice]) VALUES (51, N'Chả cá', N'Thực phẩm', 30, 10, N'kg', CAST(N'2024-11-29T13:40:35.150' AS DateTime), CAST(N'2024-12-29T13:40:35.150' AS DateTime), CAST(180.00 AS Decimal(18, 2)))
INSERT [dbo].[Materials] ([MaterialId], [MaterialName], [MaterialType], [Quantity], [MinQuantity], [Unit], [ImportDate], [ExpirationDate], [ImportPrice]) VALUES (52, N'Đồ uống Coca-Cola', N'Thực phẩm', 20, 5, N'chai', CAST(N'2024-11-29T13:40:35.150' AS DateTime), CAST(N'2024-12-29T13:40:35.150' AS DateTime), CAST(30.00 AS Decimal(18, 2)))
INSERT [dbo].[Materials] ([MaterialId], [MaterialName], [MaterialType], [Quantity], [MinQuantity], [Unit], [ImportDate], [ExpirationDate], [ImportPrice]) VALUES (53, N'Gà', N'Thực phẩm', 50, 10, N'kg', CAST(N'2024-11-29T13:40:35.150' AS DateTime), CAST(N'2025-01-29T13:40:35.150' AS DateTime), CAST(120.00 AS Decimal(18, 2)))
INSERT [dbo].[Materials] ([MaterialId], [MaterialName], [MaterialType], [Quantity], [MinQuantity], [Unit], [ImportDate], [ExpirationDate], [ImportPrice]) VALUES (54, N'Mỡ hành', N'Gia vị', 10, 3, N'kg', CAST(N'2024-11-29T13:40:35.150' AS DateTime), CAST(N'2024-12-13T13:40:35.150' AS DateTime), CAST(10.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Materials] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderItems] ON 

INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1018, 1005, 1, 1, CAST(30000.00 AS Decimal(18, 2)), N'Cơm sườn', 1, N'phần', N'', 0, CAST(N'2024-11-18T18:46:34.573' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1019, 1005, 12, 1, CAST(15000.00 AS Decimal(18, 2)), N'Chả giò', 0, N'Phần', N'', 0, CAST(N'2024-11-18T18:46:34.573' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1020, 1005, 14, 1, CAST(25000.00 AS Decimal(18, 2)), N'Tôm chiên', 0, N'Phần', N'', 0, CAST(N'2024-11-18T18:46:34.573' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1021, 1005, 16, 1, CAST(10000.00 AS Decimal(18, 2)), N'Rau xào', 0, N'Phần', N'', 0, CAST(N'2024-11-18T18:46:34.573' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1022, 1006, 3, 1, CAST(65000.00 AS Decimal(18, 2)), N'Pizza phô mai', 1, N'phần', N'', 4, CAST(N'2024-11-18T18:46:34.573' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1023, 1007, 13, 1, CAST(10000.00 AS Decimal(18, 2)), N'Trà chanh', 1, N'ly', N'', 6, CAST(N'2024-11-18T18:46:34.573' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1024, 1008, 16, 1, CAST(40000.00 AS Decimal(18, 2)), N'Hủ tiếu Nam Vang', 1, N'tô', N'', 3, CAST(N'2024-11-18T18:46:34.573' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1025, 1008, 1, 1, CAST(30000.00 AS Decimal(18, 2)), N'Cơm sườn', 1, N'phần', N'', 2, CAST(N'2024-11-18T18:46:34.573' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1026, 1008, 3, 1, CAST(65000.00 AS Decimal(18, 2)), N'Pizza phô mai', 1, N'phần', N'', 4, CAST(N'2024-11-18T18:46:34.573' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1027, 1008, 15, 1, CAST(20000.00 AS Decimal(18, 2)), N'Bánh mì trứng', 1, N'ổ', N'', 4, CAST(N'2024-11-18T18:46:34.573' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1028, 1008, 14, 1, CAST(25000.00 AS Decimal(18, 2)), N'Kem dừa', 1, N'phần', N'', 5, CAST(N'2024-11-18T18:46:34.573' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1029, 1008, 5, 5, CAST(25000.00 AS Decimal(18, 2)), N'Trà sữa', 1, N'ly', N'', 6, CAST(N'2024-11-18T18:46:34.573' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1030, 1008, 4, 5, CAST(20000.00 AS Decimal(18, 2)), N'Kem trái cây', 1, N'phần', N'', 5, CAST(N'2024-12-20T08:28:18.313' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1031, 1008, 19, 5, CAST(15000.00 AS Decimal(18, 2)), N'Khoai tây chiên', 1, N'phần', N'', 7, CAST(N'2024-12-20T12:09:47.870' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1032, 1008, 21, 3, CAST(7000.00 AS Decimal(18, 2)), N'Phô mai que', 1, N'phần', N'', 7, CAST(N'2024-12-20T08:28:18.313' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1033, 1008, 7, 1, CAST(40000.00 AS Decimal(18, 2)), N'Gà rán', 1, N'phần', N'', 2, CAST(N'2024-12-20T12:09:47.870' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1034, 1008, 1002, 1, CAST(53000.00 AS Decimal(18, 2)), N'Combo cá viên chiên nước mắm + 1 chai cocacola', 1, N'combo', N'', 7, CAST(N'2024-11-20T12:09:47.870' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1035, 1008, 2, 1, CAST(35000.00 AS Decimal(18, 2)), N'Phở bò', 1, N'phần', N'', 3, CAST(N'2024-11-20T12:09:47.870' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1036, 1008, 8, 1, CAST(25000.00 AS Decimal(18, 2)), N'Bánh xèo', 1, N'phần', N'', 2, CAST(N'2024-11-20T12:09:47.870' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1037, 1008, 11, 1, CAST(35000.00 AS Decimal(18, 2)), N'Mì xào bò', 1, N'phần', N'', 3, CAST(N'2024-11-20T12:09:47.870' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1038, 1008, 12, 1, CAST(15000.00 AS Decimal(18, 2)), N'Chả giò', 0, N'Phần', N'', 0, CAST(N'2024-11-20T12:09:47.870' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1039, 1008, 14, 1, CAST(25000.00 AS Decimal(18, 2)), N'Tôm chiên', 0, N'Phần', N'', 0, CAST(N'2024-11-20T12:09:47.870' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1040, 1008, 16, 1, CAST(10000.00 AS Decimal(18, 2)), N'Rau xào', 0, N'Phần', N'', 0, CAST(N'2024-11-20T12:09:47.870' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1041, 1008, 11, 1, CAST(5000.00 AS Decimal(18, 2)), N'Rau sống thêm', 0, N'Phần', N'', 0, CAST(N'2024-11-20T12:09:47.870' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1042, 1008, 2, 1, CAST(5500.00 AS Decimal(18, 2)), N'Trân châu trắng', 0, N'Phần', N'', 0, CAST(N'2024-11-20T12:09:47.870' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1043, 1008, 9, 1, CAST(12000.00 AS Decimal(18, 2)), N'Giò thêm', 0, N'Phần', N'', 0, CAST(N'2024-11-20T12:09:47.870' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1044, 1008, 7, 1, CAST(7000.00 AS Decimal(18, 2)), N'Trứng trần', 0, N'Phần', N'', 0, CAST(N'2024-11-20T12:09:47.870' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1045, 1008, 9, 1, CAST(12000.00 AS Decimal(18, 2)), N'Giò thêm', 0, N'Phần', N'', 0, CAST(N'2024-11-20T12:09:47.870' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1046, 1008, 11, 1, CAST(5000.00 AS Decimal(18, 2)), N'Rau sống thêm', 0, N'Phần', N'', 0, CAST(N'2024-11-20T12:09:47.870' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1047, 1009, 2, 1, CAST(35000.00 AS Decimal(18, 2)), N'Phở bò', 1, N'phần', N'', 3, CAST(N'2024-11-20T12:09:47.870' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1048, 1010, 1, 1, CAST(30000.00 AS Decimal(18, 2)), N'Cơm sườn', 1, N'phần', N'aaaa', 2, CAST(N'2024-11-21T18:31:41.850' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1052, 1011, 1, 1, CAST(30000.00 AS Decimal(18, 2)), N'Cơm sườn', 1, N'phần', N'aaaa', 2, CAST(N'2024-11-21T18:31:41.850' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1056, 1012, 3, 1, CAST(65000.00 AS Decimal(18, 2)), N'Pizza phô mai', 1, N'phần', N'', 4, CAST(N'2024-11-21T18:34:36.133' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1057, 1013, 1, 1, CAST(30000.00 AS Decimal(18, 2)), N'Cơm sườn', 1, N'phần', N'Không lấy mỡ hành nha shop', 2, CAST(N'2024-11-21T18:34:36.133' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1061, 1014, 1, 1, CAST(30000.00 AS Decimal(18, 2)), N'Cơm sườn', 1, N'phần', N'Không lấy mỡ hành nha shop', 2, CAST(N'2024-11-21T18:34:36.133' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1065, 1017, 2, 1, CAST(35000.00 AS Decimal(18, 2)), N'Phở bò', 1, N'phần', N'', 3, CAST(N'2024-11-21T18:34:36.133' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1066, 1016, 2, 1, CAST(35000.00 AS Decimal(18, 2)), N'Phở bò', 1, N'phần', N'', 3, CAST(N'2024-11-21T18:34:36.133' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1067, 1015, 2, 1, CAST(35000.00 AS Decimal(18, 2)), N'Phở bò', 1, N'phần', N'', 3, CAST(N'2024-11-21T18:34:36.133' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1068, 1018, 4, 1, CAST(20000.00 AS Decimal(18, 2)), N'Kem trái cây', 1, N'phần', N'', 5, CAST(N'2024-11-21T18:34:36.133' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1069, 1019, 5, 1, CAST(25000.00 AS Decimal(18, 2)), N'Trà sữa', 1, N'ly', N'', 6, CAST(N'2024-11-21T18:34:36.133' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1071, 1020, 5, 1, CAST(25000.00 AS Decimal(18, 2)), N'Trà sữa', 1, N'ly', N'', 6, CAST(N'2024-11-21T18:34:36.133' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1072, 1021, 2, 1, CAST(35000.00 AS Decimal(18, 2)), N'Phở bò', 1, N'phần', N'', 3, CAST(N'2024-11-21T18:48:12.083' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1074, 1022, 2, 1, CAST(35000.00 AS Decimal(18, 2)), N'Phở bò', 1, N'phần', N'', 3, CAST(N'2024-11-21T18:51:12.677' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1075, 1022, 8, 1, CAST(15000.00 AS Decimal(18, 2)), N'Bò viên thêm', 0, N'Phần', N'', 0, CAST(N'2024-11-21T18:51:26.100' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1076, 1023, 1, 1, CAST(30000.00 AS Decimal(18, 2)), N'Cơm sườn', 1, N'phần', N'', 2, CAST(N'2024-11-21T18:51:12.677' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1077, 1023, 16, 1, CAST(10000.00 AS Decimal(18, 2)), N'Rau xào', 0, N'Phần', N'', 0, CAST(N'2024-11-21T18:51:39.753' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1078, 1023, 14, 1, CAST(25000.00 AS Decimal(18, 2)), N'Tôm chiên', 0, N'Phần', N'', 0, CAST(N'2024-11-21T18:51:39.753' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1079, 1024, 1, 1, CAST(30000.00 AS Decimal(18, 2)), N'Cơm sườn', 1, N'phần', N'Không ăn mở hành nhé', 2, CAST(N'2024-11-21T18:52:49.183' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1080, 1024, 14, 1, CAST(25000.00 AS Decimal(18, 2)), N'Tôm chiên', 0, N'Phần', N'', 0, CAST(N'2024-11-21T18:52:49.197' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1081, 1024, 17, 1, CAST(30000.00 AS Decimal(18, 2)), N'Bò xào', 0, N'Phần', N'', 0, CAST(N'2024-11-21T18:52:49.197' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1082, 1024, 16, 1, CAST(10000.00 AS Decimal(18, 2)), N'Rau xào', 0, N'Phần', N'', 0, CAST(N'2024-11-21T18:52:49.197' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1083, 1024, 12, 1, CAST(15000.00 AS Decimal(18, 2)), N'Chả giò', 0, N'Phần', N'', 0, CAST(N'2024-11-21T18:52:49.197' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1084, 1024, 15, 1, CAST(18000.00 AS Decimal(18, 2)), N'Nạc heo xào', 0, N'Phần', N'', 0, CAST(N'2024-11-21T18:52:49.197' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1085, 1024, 13, 1, CAST(20000.00 AS Decimal(18, 2)), N'Mực chiên', 0, N'Phần', N'', 0, CAST(N'2024-11-21T18:52:49.197' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1086, 1025, 2, 1, CAST(35000.00 AS Decimal(18, 2)), N'Phở bò', 1, N'phần', N'', 3, CAST(N'2024-11-22T10:04:25.687' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1087, 1025, 10, 1, CAST(3000.00 AS Decimal(18, 2)), N'Hành phi', 0, N'Phần', N'', 0, CAST(N'2024-11-22T10:04:25.717' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1088, 1025, 8, 1, CAST(15000.00 AS Decimal(18, 2)), N'Bò viên thêm', 0, N'Phần', N'', 0, CAST(N'2024-11-22T10:04:25.717' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1089, 1026, 15, 1, CAST(20000.00 AS Decimal(18, 2)), N'Bánh mì trứng', 1, N'ổ', N'', 4, CAST(N'2024-11-23T22:55:09.450' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1090, 1026, 3, 1, CAST(65000.00 AS Decimal(18, 2)), N'Pizza phô mai', 1, N'phần', N'', 4, CAST(N'2024-11-23T22:55:09.450' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1091, 1027, 1003, 1, CAST(40000.00 AS Decimal(18, 2)), N'Cơm gà xối mở', 1, N'Phần', N'', 2, CAST(N'2024-11-24T15:39:32.473' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1092, 1027, 14, 1, CAST(25000.00 AS Decimal(18, 2)), N'Tôm chiên', 0, N'Phần', N'', 0, CAST(N'2024-11-24T15:39:32.503' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1093, 1027, 16, 1, CAST(10000.00 AS Decimal(18, 2)), N'Rau xào', 0, N'Phần', N'', 0, CAST(N'2024-11-24T15:39:32.503' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1094, 1028, 1, 1, CAST(30000.00 AS Decimal(18, 2)), N'Cơm sườn', 1, N'phần', N'Không lấy mỡ hàng, cho thêm tốp mỡ', 2, CAST(N'2024-11-25T19:01:09.933' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1095, 1028, 16, 2, CAST(10000.00 AS Decimal(18, 2)), N'Rau xào', 0, N'Phần', N'', 0, CAST(N'2024-11-25T19:01:09.933' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1096, 1028, 17, 1, CAST(30000.00 AS Decimal(18, 2)), N'Bò xào', 0, N'Phần', N'', 0, CAST(N'2024-11-25T19:01:09.933' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1097, 1028, 12, 2, CAST(15000.00 AS Decimal(18, 2)), N'Chả giò', 0, N'Phần', N'', 0, CAST(N'2024-11-25T19:01:09.933' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1098, 1028, 14, 1, CAST(25000.00 AS Decimal(18, 2)), N'Tôm chiên', 0, N'Phần', N'', 0, CAST(N'2024-11-25T19:01:09.933' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1099, 1029, 2, 1, CAST(35000.00 AS Decimal(18, 2)), N'Phở bò', 1, N'phần', N'', 3, CAST(N'2024-11-27T14:09:36.680' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1100, 1029, 3, 1, CAST(65000.00 AS Decimal(18, 2)), N'Pizza phô mai', 1, N'phần', N'', 4, CAST(N'2024-11-27T14:09:36.680' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1101, 1029, 1, 1, CAST(30000.00 AS Decimal(18, 2)), N'Cơm sườn', 1, N'phần', N'Không ăn mỡ hành, mà lấy thêm tốp mỡ', 2, CAST(N'2024-11-27T14:09:36.680' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1102, 1029, 9, 2, CAST(12000.00 AS Decimal(18, 2)), N'Giò thêm', 0, N'Phần', N'', 0, CAST(N'2024-11-27T14:09:36.680' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1103, 1029, 7, 1, CAST(7000.00 AS Decimal(18, 2)), N'Trứng trần', 0, N'Phần', N'', 0, CAST(N'2024-11-27T14:09:36.680' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1104, 1029, 10, 1, CAST(3000.00 AS Decimal(18, 2)), N'Hành phi', 0, N'Phần', N'', 0, CAST(N'2024-11-27T14:09:36.680' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1105, 1029, 14, 1, CAST(25000.00 AS Decimal(18, 2)), N'Tôm chiên', 0, N'Phần', N'', 0, CAST(N'2024-11-27T14:09:36.680' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (1106, 1029, 12, 2, CAST(15000.00 AS Decimal(18, 2)), N'Chả giò', 0, N'Phần', N'', 0, CAST(N'2024-11-27T14:09:36.680' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (2099, 2029, 2, 1, CAST(35000.00 AS Decimal(18, 2)), N'Phở bò', 1, N'phần', N'', 3, CAST(N'2024-11-28T15:23:34.133' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (3099, 3029, 1, 1, CAST(30000.00 AS Decimal(18, 2)), N'Cơm sườn', 1, N'phần', N'Không ăn ....', 2, CAST(N'2024-11-29T17:22:42.653' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (3100, 3029, 12, 2, CAST(15000.00 AS Decimal(18, 2)), N'Chả giò', 0, N'Phần', N'', 0, CAST(N'2024-11-29T17:22:42.653' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (3101, 3029, 14, 1, CAST(25000.00 AS Decimal(18, 2)), N'Tôm chiên', 0, N'Phần', N'', 0, CAST(N'2024-11-29T17:22:42.653' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (3102, 3030, 1, 1, CAST(30000.00 AS Decimal(18, 2)), N'Cơm sườn 2', 1, N'phần', N'aaaaaaaaaaaaaa kkkk', 2, CAST(N'2024-11-30T17:16:53.047' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (3103, 3030, 14, 7, CAST(25000.00 AS Decimal(18, 2)), N'Tôm chiên', 0, N'Phần', N'', 0, CAST(N'2024-11-30T17:16:53.047' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (3104, 3030, 16, 1, CAST(10000.00 AS Decimal(18, 2)), N'Rau xào', 0, N'Phần', N'', 0, CAST(N'2024-11-30T17:16:53.047' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (4102, 4030, 1, 1, CAST(30000.00 AS Decimal(18, 2)), N'Cơm sườn 2', 1, N'phần', N'Không ăn mở hành', 2, CAST(N'2024-12-01T23:12:19.043' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (4103, 4030, 12, 1, CAST(15000.00 AS Decimal(18, 2)), N'Chả giò', 0, N'Phần', N'', 0, CAST(N'2024-12-01T23:12:19.043' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (4104, 4030, 14, 1, CAST(25000.00 AS Decimal(18, 2)), N'Tôm chiên', 0, N'Phần', N'', 0, CAST(N'2024-12-01T23:12:19.043' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (4105, 4031, 1, 1, CAST(30000.00 AS Decimal(18, 2)), N'Cơm sườn', 1, N'phần', N'', 2, CAST(N'2024-12-02T21:15:56.793' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (4106, 4031, 4, 1, CAST(20000.00 AS Decimal(18, 2)), N'Kem trái cây', 1, N'phần', N'', 5, CAST(N'2024-12-02T21:15:56.793' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (4107, 4031, 3, 1, CAST(60000.00 AS Decimal(18, 2)), N'Pizza phô mai', 1, N'phần', N'', 4, CAST(N'2024-12-02T21:15:56.793' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (4108, 4031, 2, 1, CAST(35000.00 AS Decimal(18, 2)), N'Phở bò', 1, N'phần', N'', 3, CAST(N'2024-12-02T21:15:56.793' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (4109, 4031, 12, 1, CAST(15000.00 AS Decimal(18, 2)), N'Chả giò', 0, N'Phần', N'', 0, CAST(N'2024-12-02T21:15:56.793' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (4110, 4031, 16, 1, CAST(10000.00 AS Decimal(18, 2)), N'Rau xào', 0, N'Phần', N'', 0, CAST(N'2024-12-02T21:15:56.793' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (4111, 4031, 14, 1, CAST(25000.00 AS Decimal(18, 2)), N'Tôm chiên', 0, N'Phần', N'', 0, CAST(N'2024-12-02T21:15:56.793' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (4112, 4031, 6, 1, CAST(10000.00 AS Decimal(18, 2)), N'Bánh thêm', 0, N'Phần', N'', 0, CAST(N'2024-12-02T21:15:56.793' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (4113, 4031, 8, 1, CAST(15000.00 AS Decimal(18, 2)), N'Bò viên thêm', 0, N'Phần', N'', 0, CAST(N'2024-12-02T21:15:56.793' AS DateTime))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [FoodItemId], [Quantity], [Price], [FoodName], [IsMainItem], [Unit], [Note], [CategoryId], [OrderTime]) VALUES (4114, 4031, 10, 1, CAST(3000.00 AS Decimal(18, 2)), N'Hành phi', 0, N'Phần', N'', 0, CAST(N'2024-12-02T21:15:56.793' AS DateTime))
SET IDENTITY_INSERT [dbo].[OrderItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderId], [UserId], [OrderTime], [TableId], [TotalAmount], [Status], [Discount], [Tax]) VALUES (1, 1012, CAST(N'2024-11-18T18:46:34.573' AS DateTime), 1, CAST(75200.00 AS Decimal(18, 2)), N'Paid', CAST(12.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([OrderId], [UserId], [OrderTime], [TableId], [TotalAmount], [Status], [Discount], [Tax]) VALUES (2, 1012, CAST(N'2024-11-18T18:50:04.410' AS DateTime), 1, CAST(61100.00 AS Decimal(18, 2)), N'Paid', CAST(12.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([OrderId], [UserId], [OrderTime], [TableId], [TotalAmount], [Status], [Discount], [Tax]) VALUES (3, 1012, CAST(N'2024-11-18T18:51:39.220' AS DateTime), 1, CAST(40420.00 AS Decimal(18, 2)), N'Paid', CAST(12.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([OrderId], [UserId], [OrderTime], [TableId], [TotalAmount], [Status], [Discount], [Tax]) VALUES (4, 1012, CAST(N'2024-11-18T18:52:47.973' AS DateTime), 1, CAST(70500.00 AS Decimal(18, 2)), N'Paid', CAST(12.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([OrderId], [UserId], [OrderTime], [TableId], [TotalAmount], [Status], [Discount], [Tax]) VALUES (5, 1012, CAST(N'2024-11-18T20:55:38.137' AS DateTime), 1, CAST(6020.00 AS Decimal(18, 2)), N'Paid', CAST(20.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([OrderId], [UserId], [OrderTime], [TableId], [TotalAmount], [Status], [Discount], [Tax]) VALUES (6, 1012, CAST(N'2024-11-19T08:23:16.897' AS DateTime), 1, CAST(163200.00 AS Decimal(18, 2)), N'Paid', CAST(10.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([OrderId], [UserId], [OrderTime], [TableId], [TotalAmount], [Status], [Discount], [Tax]) VALUES (7, 1012, CAST(N'2024-11-19T08:28:18.313' AS DateTime), 1, CAST(37600.00 AS Decimal(18, 2)), N'Paid', CAST(12.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([OrderId], [UserId], [OrderTime], [TableId], [TotalAmount], [Status], [Discount], [Tax]) VALUES (8, 1012, CAST(N'2024-11-19T08:28:18.313' AS DateTime), 1, CAST(37600.00 AS Decimal(18, 2)), N'Paid', CAST(12.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([OrderId], [UserId], [OrderTime], [TableId], [TotalAmount], [Status], [Discount], [Tax]) VALUES (9, 1012, CAST(N'2024-11-19T08:28:18.313' AS DateTime), 1, CAST(37600.00 AS Decimal(18, 2)), N'Paid', CAST(12.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([OrderId], [UserId], [OrderTime], [TableId], [TotalAmount], [Status], [Discount], [Tax]) VALUES (1003, 12, CAST(N'2024-11-20T14:02:30.347' AS DateTime), 1, CAST(700000.00 AS Decimal(18, 2)), N'Pain', CAST(12.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([OrderId], [UserId], [OrderTime], [TableId], [TotalAmount], [Status], [Discount], [Tax]) VALUES (1004, 13, CAST(N'2024-11-20T18:02:30.347' AS DateTime), 1, CAST(1000000.00 AS Decimal(18, 2)), N'Pain', CAST(12.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([OrderId], [UserId], [OrderTime], [TableId], [TotalAmount], [Status], [Discount], [Tax]) VALUES (1005, 1012, CAST(N'2024-11-20T12:06:02.390' AS DateTime), 1, CAST(75200.00 AS Decimal(18, 2)), N'Paid', CAST(12.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([OrderId], [UserId], [OrderTime], [TableId], [TotalAmount], [Status], [Discount], [Tax]) VALUES (1006, 1012, CAST(N'2024-11-20T12:09:21.153' AS DateTime), 1, CAST(61100.00 AS Decimal(18, 2)), N'Paid', CAST(12.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([OrderId], [UserId], [OrderTime], [TableId], [TotalAmount], [Status], [Discount], [Tax]) VALUES (1007, 1012, CAST(N'2024-11-20T12:09:47.870' AS DateTime), 1, CAST(9400.00 AS Decimal(18, 2)), N'Paid', CAST(12.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([OrderId], [UserId], [OrderTime], [TableId], [TotalAmount], [Status], [Discount], [Tax]) VALUES (1008, 1012, CAST(N'2024-11-20T12:12:07.643' AS DateTime), 1, CAST(759050.00 AS Decimal(18, 2)), N'Paid', CAST(12.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([OrderId], [UserId], [OrderTime], [TableId], [TotalAmount], [Status], [Discount], [Tax]) VALUES (1009, 1012, CAST(N'2024-11-21T14:09:33.097' AS DateTime), 1, CAST(32900.00 AS Decimal(18, 2)), N'Paid', CAST(12.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([OrderId], [UserId], [OrderTime], [TableId], [TotalAmount], [Status], [Discount], [Tax]) VALUES (1010, 1012, CAST(N'2024-11-21T18:31:41.850' AS DateTime), 1, CAST(75200.00 AS Decimal(18, 2)), N'Paid', CAST(12.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([OrderId], [UserId], [OrderTime], [TableId], [TotalAmount], [Status], [Discount], [Tax]) VALUES (1011, 1012, CAST(N'2024-11-21T18:31:41.850' AS DateTime), 1, CAST(75200.00 AS Decimal(18, 2)), N'Paid', CAST(12.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([OrderId], [UserId], [OrderTime], [TableId], [TotalAmount], [Status], [Discount], [Tax]) VALUES (1012, 1012, CAST(N'2024-11-21T18:34:36.133' AS DateTime), 1, CAST(61100.00 AS Decimal(18, 2)), N'Paid', CAST(12.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([OrderId], [UserId], [OrderTime], [TableId], [TotalAmount], [Status], [Discount], [Tax]) VALUES (1013, 1012, CAST(N'2024-11-21T18:36:46.913' AS DateTime), 1, CAST(75200.00 AS Decimal(18, 2)), N'Paid', CAST(12.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([OrderId], [UserId], [OrderTime], [TableId], [TotalAmount], [Status], [Discount], [Tax]) VALUES (1014, 1012, CAST(N'2024-11-21T18:36:46.913' AS DateTime), 1, CAST(75200.00 AS Decimal(18, 2)), N'Paid', CAST(12.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([OrderId], [UserId], [OrderTime], [TableId], [TotalAmount], [Status], [Discount], [Tax]) VALUES (1015, 1012, CAST(N'2024-11-21T18:36:46.913' AS DateTime), 1, CAST(32900.00 AS Decimal(18, 2)), N'Paid', CAST(12.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([OrderId], [UserId], [OrderTime], [TableId], [TotalAmount], [Status], [Discount], [Tax]) VALUES (1016, 1012, CAST(N'2024-11-21T18:36:46.913' AS DateTime), 1, CAST(32900.00 AS Decimal(18, 2)), N'Paid', CAST(12.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([OrderId], [UserId], [OrderTime], [TableId], [TotalAmount], [Status], [Discount], [Tax]) VALUES (1017, 1012, CAST(N'2024-11-21T18:36:46.913' AS DateTime), 1, CAST(32900.00 AS Decimal(18, 2)), N'Paid', CAST(12.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([OrderId], [UserId], [OrderTime], [TableId], [TotalAmount], [Status], [Discount], [Tax]) VALUES (1018, 1012, CAST(N'2024-11-21T18:43:45.273' AS DateTime), 1, CAST(18800.00 AS Decimal(18, 2)), N'Paid', CAST(12.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([OrderId], [UserId], [OrderTime], [TableId], [TotalAmount], [Status], [Discount], [Tax]) VALUES (1019, 1012, CAST(N'2024-11-21T18:44:04.407' AS DateTime), 1, CAST(30080.00 AS Decimal(18, 2)), N'Paid', CAST(12.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([OrderId], [UserId], [OrderTime], [TableId], [TotalAmount], [Status], [Discount], [Tax]) VALUES (1020, 1012, CAST(N'2024-11-21T18:44:04.407' AS DateTime), 1, CAST(30080.00 AS Decimal(18, 2)), N'Paid', CAST(12.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([OrderId], [UserId], [OrderTime], [TableId], [TotalAmount], [Status], [Discount], [Tax]) VALUES (1021, 1012, CAST(N'2024-11-21T18:48:12.083' AS DateTime), 1, CAST(35720.00 AS Decimal(18, 2)), N'Paid', CAST(12.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([OrderId], [UserId], [OrderTime], [TableId], [TotalAmount], [Status], [Discount], [Tax]) VALUES (1022, 1012, CAST(N'2024-11-21T18:51:12.677' AS DateTime), 1, CAST(47000.00 AS Decimal(18, 2)), N'Paid', CAST(12.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([OrderId], [UserId], [OrderTime], [TableId], [TotalAmount], [Status], [Discount], [Tax]) VALUES (1023, 1012, CAST(N'2024-11-21T18:51:26.110' AS DateTime), 1, CAST(61100.00 AS Decimal(18, 2)), N'Paid', CAST(12.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([OrderId], [UserId], [OrderTime], [TableId], [TotalAmount], [Status], [Discount], [Tax]) VALUES (1024, 1012, CAST(N'2024-11-21T18:52:23.373' AS DateTime), 1, CAST(139120.00 AS Decimal(18, 2)), N'Paid', CAST(12.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([OrderId], [UserId], [OrderTime], [TableId], [TotalAmount], [Status], [Discount], [Tax]) VALUES (1025, 13, CAST(N'2024-11-22T09:53:10.140' AS DateTime), 1, CAST(49820.00 AS Decimal(18, 2)), N'Paid', CAST(12.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([OrderId], [UserId], [OrderTime], [TableId], [TotalAmount], [Status], [Discount], [Tax]) VALUES (1026, 1012, CAST(N'2024-11-23T22:54:01.900' AS DateTime), 1, CAST(79900.00 AS Decimal(18, 2)), N'Paid', CAST(12.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([OrderId], [UserId], [OrderTime], [TableId], [TotalAmount], [Status], [Discount], [Tax]) VALUES (1027, 1012, CAST(N'2024-11-24T15:38:59.383' AS DateTime), 1, CAST(70500.00 AS Decimal(18, 2)), N'Paid', CAST(12.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([OrderId], [UserId], [OrderTime], [TableId], [TotalAmount], [Status], [Discount], [Tax]) VALUES (1028, 1012, CAST(N'2024-11-25T19:01:09.933' AS DateTime), 1, CAST(126900.00 AS Decimal(18, 2)), N'Paid', CAST(12.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([OrderId], [UserId], [OrderTime], [TableId], [TotalAmount], [Status], [Discount], [Tax]) VALUES (1029, 1012, CAST(N'2024-11-27T14:09:36.680' AS DateTime), 1, CAST(205860.00 AS Decimal(18, 2)), N'Paid', CAST(12.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([OrderId], [UserId], [OrderTime], [TableId], [TotalAmount], [Status], [Discount], [Tax]) VALUES (2029, 1012, CAST(N'2024-11-28T15:23:34.133' AS DateTime), 1, CAST(32900.00 AS Decimal(18, 2)), N'Paid', CAST(12.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([OrderId], [UserId], [OrderTime], [TableId], [TotalAmount], [Status], [Discount], [Tax]) VALUES (3029, 1012, CAST(N'2024-11-29T17:22:42.653' AS DateTime), 1, CAST(79900.00 AS Decimal(18, 2)), N'Paid', CAST(12.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([OrderId], [UserId], [OrderTime], [TableId], [TotalAmount], [Status], [Discount], [Tax]) VALUES (3030, 1012, CAST(N'2024-11-30T17:16:53.047' AS DateTime), 1, CAST(202100.00 AS Decimal(18, 2)), N'Paid', CAST(12.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([OrderId], [UserId], [OrderTime], [TableId], [TotalAmount], [Status], [Discount], [Tax]) VALUES (4030, 1012, CAST(N'2024-12-01T23:12:19.043' AS DateTime), 1, CAST(65800.00 AS Decimal(18, 2)), N'Paid', CAST(12.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([OrderId], [UserId], [OrderTime], [TableId], [TotalAmount], [Status], [Discount], [Tax]) VALUES (4031, 1012, CAST(N'2024-12-02T21:15:56.793' AS DateTime), 2, CAST(209620.00 AS Decimal(18, 2)), N'Paid', CAST(12.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Price]) VALUES (1, N'Product A', CAST(100.50 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Name], [Price]) VALUES (2, N'Product B', CAST(50.75 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Name], [Price]) VALUES (3, N'Product C', CAST(25.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Name], [Price]) VALUES (4, N'Product D', CAST(75.20 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Name], [Price]) VALUES (5, N'Product E', CAST(120.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Name], [Price]) VALUES (6, N'Product F', CAST(180.50 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Name], [Price]) VALUES (7, N'Product G', CAST(220.10 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Name], [Price]) VALUES (8, N'Product H', CAST(15.30 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Name], [Price]) VALUES (9, N'Product I', CAST(35.90 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Name], [Price]) VALUES (10, N'Product J', CAST(65.40 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Tables] ON 

INSERT [dbo].[Tables] ([TableId], [TableName]) VALUES (1, N'Bàn 1')
INSERT [dbo].[Tables] ([TableId], [TableName]) VALUES (2, N'Bàn 2')
INSERT [dbo].[Tables] ([TableId], [TableName]) VALUES (3, N'Bàn 3')
INSERT [dbo].[Tables] ([TableId], [TableName]) VALUES (4, N'Bàn 4')
INSERT [dbo].[Tables] ([TableId], [TableName]) VALUES (5, N'Bàn 5')
INSERT [dbo].[Tables] ([TableId], [TableName]) VALUES (6, N'Bàn 6')
INSERT [dbo].[Tables] ([TableId], [TableName]) VALUES (7, N'Bàn 7')
INSERT [dbo].[Tables] ([TableId], [TableName]) VALUES (8, N'Bàn 8')
INSERT [dbo].[Tables] ([TableId], [TableName]) VALUES (9, N'Bàn 9')
INSERT [dbo].[Tables] ([TableId], [TableName]) VALUES (10, N'Bàn 10')
INSERT [dbo].[Tables] ([TableId], [TableName]) VALUES (11, N'Bàn 11')
INSERT [dbo].[Tables] ([TableId], [TableName]) VALUES (12, N'Bàn 12')
INSERT [dbo].[Tables] ([TableId], [TableName]) VALUES (13, N'Bàn 13')
INSERT [dbo].[Tables] ([TableId], [TableName]) VALUES (14, N'Bàn 14')
INSERT [dbo].[Tables] ([TableId], [TableName]) VALUES (15, N'Bàn 15')
INSERT [dbo].[Tables] ([TableId], [TableName]) VALUES (16, N'Bàn 16')
INSERT [dbo].[Tables] ([TableId], [TableName]) VALUES (17, N'Bàn 17')
INSERT [dbo].[Tables] ([TableId], [TableName]) VALUES (18, N'Bàn 18')
INSERT [dbo].[Tables] ([TableId], [TableName]) VALUES (19, N'Bàn 19')
INSERT [dbo].[Tables] ([TableId], [TableName]) VALUES (20, N'Bàn 20')
INSERT [dbo].[Tables] ([TableId], [TableName]) VALUES (21, N'Bàn 21')
INSERT [dbo].[Tables] ([TableId], [TableName]) VALUES (22, N'Bàn 22')
INSERT [dbo].[Tables] ([TableId], [TableName]) VALUES (23, N'Bàn 23')
INSERT [dbo].[Tables] ([TableId], [TableName]) VALUES (24, N'Bàn 24')
SET IDENTITY_INSERT [dbo].[Tables] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [FullName], [Phone], [Password], [Role], [Email], [Address], [Avatar]) VALUES (12, N'Minh Thuận', N'123456789', N'$2a$11$/TCVJGE1md.mUhXJgZ4Z9OIR5nJRYZYKq4aGZSTNKtQ/WRV9bzVoy', N'Staff', N'minhthuan123@gmail.com', N'Phạm Thế Hiển, Quận 8', N'/public/meo.jpg')
INSERT [dbo].[Users] ([UserId], [FullName], [Phone], [Password], [Role], [Email], [Address], [Avatar]) VALUES (13, N'Gia Bảo', N'234567890', N'$2a$11$ImuKzhac9f1vTB/Z06d/9.I.hQeUhDZeP6nhp.mc8F7iO1gPziHEi', N'Manager', N'giabao123@gmail.com', N'Phú Nhuận, Hồ Chí Minh', N'/public/meo.jpg')
INSERT [dbo].[Users] ([UserId], [FullName], [Phone], [Password], [Role], [Email], [Address], [Avatar]) VALUES (1012, N'Thanh Giang', N'0368555059', N'$2a$11$dmewy0ah3/bMepuBvHHozePCa3SCOKQkWhaEFzb8IoLwcThuYlm6O', N'Owner', N'thanhgiang.le1902@gmail.com', N'Huỳnh Tấn Phát, Tân Thuận Tây, Quận 7', N'/public/meo.jpg')
INSERT [dbo].[Users] ([UserId], [FullName], [Phone], [Password], [Role], [Email], [Address], [Avatar]) VALUES (2012, N'Nguyen Thi A', N'0987654321', N'password123', N'User', N'nguyenthia@example.com', N'Hanoi, Vietnam', N'/public/meo.jpg')
INSERT [dbo].[Users] ([UserId], [FullName], [Phone], [Password], [Role], [Email], [Address], [Avatar]) VALUES (2013, N'Tran Minh B', N'0912345678', N'password456', N'Admin', N'tranminhb@example.com', N'Ho Chi Minh City, Vietnam', N'/public/meo.jpg')
INSERT [dbo].[Users] ([UserId], [FullName], [Phone], [Password], [Role], [Email], [Address], [Avatar]) VALUES (2014, N'Le Thi C', N'0908765432', N'password789', N'User', N'lethic@example.com', N'Da Nang, Vietnam', N'/public/meo.jpg')
INSERT [dbo].[Users] ([UserId], [FullName], [Phone], [Password], [Role], [Email], [Address], [Avatar]) VALUES (2015, N'Pham Minh D', N'0981234567', N'password321', N'Admin', N'phaminhd@example.com', N'Hue, Vietnam', N'/public/meo.jpg')
INSERT [dbo].[Users] ([UserId], [FullName], [Phone], [Password], [Role], [Email], [Address], [Avatar]) VALUES (2016, N'Hoang Thi E', N'0902345678', N'password654', N'User', N'hoangthie@example.com', N'Hai Phong, Vietnam', N'/public/meo.jpg')
INSERT [dbo].[Users] ([UserId], [FullName], [Phone], [Password], [Role], [Email], [Address], [Avatar]) VALUES (2017, N'Bui Minh F', N'0913456789', N'password987', N'User', N'buiminhf@example.com', N'Can Tho, Vietnam', N'/public/meo.jpg')
INSERT [dbo].[Users] ([UserId], [FullName], [Phone], [Password], [Role], [Email], [Address], [Avatar]) VALUES (2018, N'Nguyen Thi G', N'0987654322', N'password135', N'User', N'nguyenthig@example.com', N'Vung Tau, Vietnam', N'/public/meo.jpg')
INSERT [dbo].[Users] ([UserId], [FullName], [Phone], [Password], [Role], [Email], [Address], [Avatar]) VALUES (2019, N'Le Thi H', N'0905678901', N'password246', N'Admin', N'lethih@example.com', N'Nha Trang, Vietnam', N'/public/meo.jpg')
INSERT [dbo].[Users] ([UserId], [FullName], [Phone], [Password], [Role], [Email], [Address], [Avatar]) VALUES (2020, N'Tran Minh I', N'0914567890', N'password468', N'User', N'tranminhi@example.com', N'Quang Ninh, Vietnam', N'/public/meo.jpg')
INSERT [dbo].[Users] ([UserId], [FullName], [Phone], [Password], [Role], [Email], [Address], [Avatar]) VALUES (2021, N'Pham Minh J', N'0986543210', N'password579', N'Admin', N'phaminhj@example.com', N'Bac Ninh, Vietnam', N'/public/meo.jpg')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[FoodItem] ADD  DEFAULT ('ph?n') FOR [Unit]
GO
ALTER TABLE [dbo].[FoodItem] ADD  DEFAULT ('available') FOR [Status]
GO
ALTER TABLE [dbo].[AdditionalFood]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[FoodCategory] ([CategoryId])
GO
ALTER TABLE [dbo].[CashRegister]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[DiscountAppliedItems]  WITH CHECK ADD FOREIGN KEY([DiscountId])
REFERENCES [dbo].[Discount] ([DiscountId])
GO
ALTER TABLE [dbo].[DiscountAppliedItems]  WITH CHECK ADD FOREIGN KEY([FoodItemId])
REFERENCES [dbo].[FoodItem] ([FoodItemId])
GO
ALTER TABLE [dbo].[FeeAppliedItems]  WITH CHECK ADD FOREIGN KEY([FeeId])
REFERENCES [dbo].[Fee] ([FeeId])
GO
ALTER TABLE [dbo].[FeeAppliedItems]  WITH CHECK ADD FOREIGN KEY([FoodItemId])
REFERENCES [dbo].[FoodItem] ([FoodItemId])
GO
ALTER TABLE [dbo].[InventoryLog]  WITH CHECK ADD FOREIGN KEY([InventoryId])
REFERENCES [dbo].[Inventory] ([InventoryId])
GO
ALTER TABLE [dbo].[InventoryLog]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD FOREIGN KEY([FoodItemId])
REFERENCES [dbo].[FoodItem] ([FoodItemId])
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([TableId])
REFERENCES [dbo].[Tables] ([TableId])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Materials]  WITH CHECK ADD CHECK  (([MinQuantity]>=(0)))
GO
ALTER TABLE [dbo].[Materials]  WITH CHECK ADD CHECK  (([Quantity]>=(0)))
GO
USE [master]
GO
ALTER DATABASE [TestVueDatabase] SET  READ_WRITE 
GO
