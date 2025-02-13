USE [master]
GO
/****** Object:  Database [E-Comm-Site]    Script Date: 02-02-2025 18:28:19 ******/
CREATE DATABASE [E-Comm-Site]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'E-Comm-Site', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\E-Comm-Site.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'E-Comm-Site_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\E-Comm-Site_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [E-Comm-Site] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [E-Comm-Site].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [E-Comm-Site] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [E-Comm-Site] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [E-Comm-Site] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [E-Comm-Site] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [E-Comm-Site] SET ARITHABORT OFF 
GO
ALTER DATABASE [E-Comm-Site] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [E-Comm-Site] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [E-Comm-Site] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [E-Comm-Site] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [E-Comm-Site] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [E-Comm-Site] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [E-Comm-Site] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [E-Comm-Site] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [E-Comm-Site] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [E-Comm-Site] SET  DISABLE_BROKER 
GO
ALTER DATABASE [E-Comm-Site] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [E-Comm-Site] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [E-Comm-Site] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [E-Comm-Site] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [E-Comm-Site] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [E-Comm-Site] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [E-Comm-Site] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [E-Comm-Site] SET RECOVERY FULL 
GO
ALTER DATABASE [E-Comm-Site] SET  MULTI_USER 
GO
ALTER DATABASE [E-Comm-Site] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [E-Comm-Site] SET DB_CHAINING OFF 
GO
ALTER DATABASE [E-Comm-Site] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [E-Comm-Site] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [E-Comm-Site] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [E-Comm-Site] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'E-Comm-Site', N'ON'
GO
ALTER DATABASE [E-Comm-Site] SET QUERY_STORE = OFF
GO
USE [E-Comm-Site]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 02-02-2025 18:28:19 ******/
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
/****** Object:  Table [dbo].[Categories]    Script Date: 02-02-2025 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 02-02-2025 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](max) NOT NULL,
	[Type] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 02-02-2025 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 02-02-2025 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime2](7) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[OrderStatusId] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 02-02-2025 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_OrderStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 02-02-2025 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250131162906_InitialCreate', N'9.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250131164527_UpdateModelRelationships', N'9.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250202114517_Added usertype to Customer', N'9.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250202114915_Added Password and Address to Customer', N'9.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250202120230_Added Orderstatus column for Order', N'9.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250202120746_Added Orderstatusid column for Order', N'9.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250202121400_Added Image column', N'9.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250202122137_Added Image as string column', N'9.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250202123307_Adding Orderstutus for Order', N'9.0.1')
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name]) VALUES (1, N'Electronic Items')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (2, N'Kitchen ')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (3, N'Bath & Bed')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (4, N'Food')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([Id], [UserName], [Type], [Address], [Password]) VALUES (1, N'Divya', N'Admin', N'1/2234455', N'Test@123$')
INSERT [dbo].[Customers] ([Id], [UserName], [Type], [Address], [Password]) VALUES (2, N'Pragathi', N'Admin', N'2/1223', N'Test@123$')
INSERT [dbo].[Customers] ([Id], [UserName], [Type], [Address], [Password]) VALUES (3, N'Gopal', N'Customer', N'3/hrneee', N'Test@123$')
INSERT [dbo].[Customers] ([Id], [UserName], [Type], [Address], [Password]) VALUES (4, N'Sanjay', N'Customer', N'3/eyrnnd', N'Test@123$')
INSERT [dbo].[Customers] ([Id], [UserName], [Type], [Address], [Password]) VALUES (5, N'Sarnya', N'Customer', N'4/aadadjjsj', N'Test@123$')
INSERT [dbo].[Customers] ([Id], [UserName], [Type], [Address], [Password]) VALUES (6, N'Testuser', N'Customer', N'IBM', N'Test@123$')
INSERT [dbo].[Customers] ([Id], [UserName], [Type], [Address], [Password]) VALUES (7, N'Testusers2', N'Admin', N'IBM', N'Test@123$')
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity], [UnitPrice]) VALUES (1, 1, 1, 1, CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity], [UnitPrice]) VALUES (4, 6, 1, 1, CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity], [UnitPrice]) VALUES (5, 6, 2, 1, CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity], [UnitPrice]) VALUES (6, 7, 1, 1, CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity], [UnitPrice]) VALUES (9, 1, 3, 2, CAST(4.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [OrderDate], [CustomerId], [OrderStatusId]) VALUES (1, CAST(N'2025-02-02T00:00:00.0000000' AS DateTime2), 1, 1)
INSERT [dbo].[Orders] ([Id], [OrderDate], [CustomerId], [OrderStatusId]) VALUES (6, CAST(N'2025-02-02T00:00:00.0000000' AS DateTime2), 2, 1)
INSERT [dbo].[Orders] ([Id], [OrderDate], [CustomerId], [OrderStatusId]) VALUES (7, CAST(N'2025-02-01T00:00:00.0000000' AS DateTime2), 3, 3)
INSERT [dbo].[Orders] ([Id], [OrderDate], [CustomerId], [OrderStatusId]) VALUES (8, CAST(N'2025-01-01T00:00:00.0000000' AS DateTime2), 1, 3)
INSERT [dbo].[Orders] ([Id], [OrderDate], [CustomerId], [OrderStatusId]) VALUES (9, CAST(N'2025-01-15T00:00:00.0000000' AS DateTime2), 4, 2)
INSERT [dbo].[Orders] ([Id], [OrderDate], [CustomerId], [OrderStatusId]) VALUES (10, CAST(N'2025-01-29T00:00:00.0000000' AS DateTime2), 3, 2)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderStatus] ON 

INSERT [dbo].[OrderStatus] ([Id], [Status]) VALUES (1, N'Pending')
INSERT [dbo].[OrderStatus] ([Id], [Status]) VALUES (2, N'Shipped')
INSERT [dbo].[OrderStatus] ([Id], [Status]) VALUES (3, N'Delivered')
SET IDENTITY_INSERT [dbo].[OrderStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Price], [CategoryId], [Image]) VALUES (1, N'WireLess mouse', CAST(23456.00 AS Decimal(18, 2)), 1, N'https://lzd-img-global.slatic.net/g/p/dda0ac840d0833b5130a3075562cbdb8.jpg_720x720q80.jpg_.webp')
INSERT [dbo].[Products] ([Id], [Name], [Price], [CategoryId], [Image]) VALUES (2, N'Monitor', CAST(339393.00 AS Decimal(18, 2)), 1, N'https://pisces.bbystatic.com/image2/BestBuy_US/images/products/6425/6425897_sd.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [CategoryId], [Image]) VALUES (3, N'TV', CAST(288200.00 AS Decimal(18, 2)), 1, N'https://images.philips.com/is/image/PhilipsConsumer/220TS2LB_94-IMS-en_IN?$jpglarge$&wid=1250')
INSERT [dbo].[Products] ([Id], [Name], [Price], [CategoryId], [Image]) VALUES (5, N'DELL Laptop', CAST(2345666.00 AS Decimal(18, 2)), 1, N'https://th.bing.com/th/id/R.1429d80f6e5f62fadfc6646e43689e5f?rik=ojmUoMmlb32Tog&riu=http%3a%2f%2fwww.informationq.com%2fwp-content%2fuploads%2f2013%2f11%2fDell-Inspiron-15-3521-15.6-inch-Laptop-Black01.jpg&ehk=pSUmBqiCYQyti2AeZ0mRSr1R6M41QW7qxUuorQ3kEbs%3d&risl=&pid=ImgRaw&r=0')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
/****** Object:  Index [IX_Orders_CustomerId]    Script Date: 02-02-2025 18:28:19 ******/
CREATE NONCLUSTERED INDEX [IX_Orders_CustomerId] ON [dbo].[Orders]
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_OrderStatusId]    Script Date: 02-02-2025 18:28:19 ******/
CREATE NONCLUSTERED INDEX [IX_Orders_OrderStatusId] ON [dbo].[Orders]
(
	[OrderStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_CategoryId]    Script Date: 02-02-2025 18:28:19 ******/
CREATE NONCLUSTERED INDEX [IX_Products_CategoryId] ON [dbo].[Products]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Customers] ADD  DEFAULT (N'') FOR [Type]
GO
ALTER TABLE [dbo].[Customers] ADD  DEFAULT (N'') FOR [Address]
GO
ALTER TABLE [dbo].[Customers] ADD  DEFAULT (N'') FOR [Password]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ((0)) FOR [OrderStatusId]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers_CustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers_CustomerId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_OrderStatus_OrderStatusId] FOREIGN KEY([OrderStatusId])
REFERENCES [dbo].[OrderStatus] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_OrderStatus_OrderStatusId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories_CategoryId]
GO
USE [master]
GO
ALTER DATABASE [E-Comm-Site] SET  READ_WRITE 
GO
