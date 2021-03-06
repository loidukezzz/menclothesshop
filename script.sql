USE [master]
GO
/****** Object:  Database [ONLINESHOP]    Script Date: 3/27/2022 4:25:34 AM ******/
CREATE DATABASE [ONLINESHOP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ONLINESHOP', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ONLINESHOP.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ONLINESHOP_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ONLINESHOP_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ONLINESHOP] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ONLINESHOP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ONLINESHOP] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ONLINESHOP] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ONLINESHOP] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ONLINESHOP] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ONLINESHOP] SET ARITHABORT OFF 
GO
ALTER DATABASE [ONLINESHOP] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ONLINESHOP] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ONLINESHOP] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ONLINESHOP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ONLINESHOP] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ONLINESHOP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ONLINESHOP] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ONLINESHOP] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ONLINESHOP] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ONLINESHOP] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ONLINESHOP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ONLINESHOP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ONLINESHOP] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ONLINESHOP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ONLINESHOP] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ONLINESHOP] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ONLINESHOP] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ONLINESHOP] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ONLINESHOP] SET  MULTI_USER 
GO
ALTER DATABASE [ONLINESHOP] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ONLINESHOP] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ONLINESHOP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ONLINESHOP] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ONLINESHOP] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ONLINESHOP]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/27/2022 4:25:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Slug] [nchar](50) NOT NULL,
	[Image] [nvarchar](100) NOT NULL,
	[ParentId] [int] NOT NULL,
	[DataScroll] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Contact]    Script Date: 3/27/2022 4:25:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](150) NULL,
	[Phone] [nchar](10) NOT NULL,
	[Fax] [nchar](20) NULL,
	[Email] [nchar](50) NOT NULL,
	[LinkFB] [nvarchar](500) NULL,
	[LinkGoogleMap] [nvarchar](500) NULL,
	[Detail] [nvarchar](max) NULL,
	[Created_at] [datetime] NULL,
	[Created_by] [nvarchar](50) NULL,
	[Updated_at] [datetime] NULL,
	[Updated_by] [nvarchar](50) NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Menus]    Script Date: 3/27/2022 4:25:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Link] [nvarchar](50) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[Orders] [int] NOT NULL,
	[Position] [nvarchar](50) NOT NULL,
	[TableId] [int] NOT NULL,
	[PareantId] [int] NOT NULL,
	[Created_at] [datetime] NULL,
	[Created_by] [nvarchar](50) NULL,
	[Updated_at] [datetime] NULL,
	[Updated_by] [nvarchar](50) NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Menus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[News]    Script Date: 3/27/2022 4:25:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[Slug] [nchar](50) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Image] [nchar](100) NOT NULL,
	[ShortDes] [nvarchar](100) NOT NULL,
	[FullDecription] [nvarchar](500) NOT NULL,
	[UploadTime] [datetime] NULL,
	[UploadBy] [nvarchar](50) NULL,
	[UpdateTime] [datetime] NULL,
	[UpdateBy] [nvarchar](50) NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order]    Script Date: 3/27/2022 4:25:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](max) NULL,
	[IdUser] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExportDate] [datetime] NULL,
	[DeliveryAddress] [nvarchar](max) NULL,
	[DeliveryName] [nvarchar](max) NULL,
	[DeliveryPhone] [nvarchar](50) NULL,
	[DeliveryEmail] [nvarchar](50) NULL,
	[Updated_at] [datetime] NULL,
	[Updated_by] [nvarchar](50) NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 3/27/2022 4:25:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[Id] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Price] [real] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Amount] [real] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 3/27/2022 4:25:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Slug] [nchar](50) NOT NULL,
	[Image] [nchar](100) NOT NULL,
	[CategoryId] [int] NULL,
	[ShortDes] [nvarchar](100) NOT NULL,
	[TopicId] [int] NULL,
	[FullDecription] [nvarchar](500) NOT NULL,
	[Price] [float] NOT NULL,
	[Position] [nvarchar](50) NULL,
	[PriceSale] [float] NULL,
	[HotSale] [int] NULL,
	[DealOfWeek] [int] NULL,
	[UploadTime] [datetime] NULL,
	[UploadBy] [nvarchar](50) NULL,
	[UpdateTime] [datetime] NULL,
	[UpdateBy] [nvarchar](50) NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sliders]    Script Date: 3/27/2022 4:25:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sliders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Link] [nvarchar](50) NOT NULL,
	[Position] [nvarchar](50) NOT NULL,
	[Img] [nvarchar](50) NOT NULL,
	[Orders] [int] NOT NULL,
	[ShortDesc] [nvarchar](50) NULL,
	[FullDecription] [nvarchar](max) NULL,
	[Created_at] [datetime] NULL,
	[Created_by] [nvarchar](50) NULL,
	[Updated_at] [datetime] NULL,
	[Updated_by] [nvarchar](50) NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Sliders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Topics]    Script Date: 3/27/2022 4:25:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topics](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Slug] [nvarchar](50) NULL,
	[ParentId] [int] NULL,
	[Orders] [int] NULL,
	[Metakey] [nvarchar](50) NOT NULL,
	[Metadesc] [nvarchar](50) NOT NULL,
	[Created_at] [datetime] NULL,
	[Created_by] [nvarchar](50) NULL,
	[Updated_at] [datetime] NULL,
	[Updated_by] [nvarchar](50) NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Topics] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/27/2022 4:25:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[idUser] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Account] [nvarchar](50) NOT NULL,
	[Adress] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[idUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name], [Slug], [Image], [ParentId], [DataScroll]) VALUES (1, N'ÁO', N'ao                                                ', N'1', 0, N'collapseOne')
INSERT [dbo].[Category] ([Id], [Name], [Slug], [Image], [ParentId], [DataScroll]) VALUES (2, N'QUẦN', N'quan                                              ', N'1', 0, N'collapseTwo')
INSERT [dbo].[Category] ([Id], [Name], [Slug], [Image], [ParentId], [DataScroll]) VALUES (3, N'PHỤ KIỆN', N'phu-kien                                          ', N'1', 0, N'collapseThree')
INSERT [dbo].[Category] ([Id], [Name], [Slug], [Image], [ParentId], [DataScroll]) VALUES (19, N'ƯU ĐÃI', N'uu-dai                                            ', N'81850457_2554830358094127_4639630304015810560_n_20210424091952.png', 0, N'collapseFour')
INSERT [dbo].[Category] ([Id], [Name], [Slug], [Image], [ParentId], [DataScroll]) VALUES (21, N'ÁO THUN', N'ao-thun                                           ', N'1', 1, NULL)
INSERT [dbo].[Category] ([Id], [Name], [Slug], [Image], [ParentId], [DataScroll]) VALUES (23, N'ÁO KHOÁC', N'ao-khoac                                          ', N'1', 1, NULL)
INSERT [dbo].[Category] ([Id], [Name], [Slug], [Image], [ParentId], [DataScroll]) VALUES (24, N'ÁO SƠ MI', N'ao-so-mi                                          ', N'1', 1, NULL)
INSERT [dbo].[Category] ([Id], [Name], [Slug], [Image], [ParentId], [DataScroll]) VALUES (25, N'QUẦN TÂY', N'quan-tay                                          ', N'1', 2, NULL)
INSERT [dbo].[Category] ([Id], [Name], [Slug], [Image], [ParentId], [DataScroll]) VALUES (26, N'QUẦN JEAN', N'quan-jean                                         ', N'1', 2, NULL)
INSERT [dbo].[Category] ([Id], [Name], [Slug], [Image], [ParentId], [DataScroll]) VALUES (27, N'QUẦN SHORT', N'quần short                                        ', N'1', 2, NULL)
INSERT [dbo].[Category] ([Id], [Name], [Slug], [Image], [ParentId], [DataScroll]) VALUES (28, N'GIÀY DÉP NAM', N'giay-dep-nam                                      ', N'1', 0, N'collapseFive')
INSERT [dbo].[Category] ([Id], [Name], [Slug], [Image], [ParentId], [DataScroll]) VALUES (29, N'MŨ NAM', N'mu-nam                                            ', N'1', 3, NULL)
INSERT [dbo].[Category] ([Id], [Name], [Slug], [Image], [ParentId], [DataScroll]) VALUES (30, N'VÍ NAM', N'vi-nam                                            ', N'1', 3, NULL)
INSERT [dbo].[Category] ([Id], [Name], [Slug], [Image], [ParentId], [DataScroll]) VALUES (31, N'DÂY NỊT', N'day-nit                                           ', N'1', 3, NULL)
INSERT [dbo].[Category] ([Id], [Name], [Slug], [Image], [ParentId], [DataScroll]) VALUES (33, N'GIÀY THỂ THAO', N'giay-the-thao                                     ', N'1', 28, NULL)
INSERT [dbo].[Category] ([Id], [Name], [Slug], [Image], [ParentId], [DataScroll]) VALUES (34, N'GIÀY SANDAL', N'giay-sandal                                       ', N'1', 28, NULL)
INSERT [dbo].[Category] ([Id], [Name], [Slug], [Image], [ParentId], [DataScroll]) VALUES (35, N'BA LÔ', N'ba-lo                                             ', N'1', 0, N'collapseSix')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([Id], [Name], [Address], [Phone], [Fax], [Email], [LinkFB], [LinkGoogleMap], [Detail], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (1, N'loi', N'46/24', N'0379191764', N'56465561            ', N'thanhacr@gmail.com                                ', N'https://www.facebook.com/', N'https://www.google.com/maps/place/15+%C', N'1', NULL, NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[Contact] OFF
SET IDENTITY_INSERT [dbo].[Menus] ON 

INSERT [dbo].[Menus] ([Id], [Name], [Link], [Type], [Orders], [Position], [TableId], [PareantId], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (9, N'Best Sellers', N'1', N'1', 1, N'1', 1, 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Menus] ([Id], [Name], [Link], [Type], [Orders], [Position], [TableId], [PareantId], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (10, N'New Arrivals', N'1', N'1', 1, N'1', 1, 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Menus] ([Id], [Name], [Link], [Type], [Orders], [Position], [TableId], [PareantId], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (11, N'Hot Sales', N'1', N'1', 1, N'1', 1, 0, NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Menus] OFF
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([Id], [Name], [Slug], [CategoryId], [Image], [ShortDes], [FullDecription], [UploadTime], [UploadBy], [UpdateTime], [UpdateBy], [Status]) VALUES (3, N'What Curling Irons Are The Best Ones', N'gucci                                             ', 2, N'blog-1.jpg                                                                                          ', N'ádsadada453', N'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[News] ([Id], [Name], [Slug], [CategoryId], [Image], [ShortDes], [FullDecription], [UploadTime], [UploadBy], [UpdateTime], [UpdateBy], [Status]) VALUES (4, N'Eternity Bands Do Last Forever', N'enternity-bands                                   ', 2, N'blog-2.jpg                                                                                          ', N'ádas', N'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[News] ([Id], [Name], [Slug], [CategoryId], [Image], [ShortDes], [FullDecription], [UploadTime], [UploadBy], [UpdateTime], [UpdateBy], [Status]) VALUES (5, N'The Health Benefits Of Sunglasses', N'health-of-sungglasses                             ', 2, N'blog-3.jpg                                                                                          ', N'dfsdfsd', N'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.', NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[News] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Name], [Slug], [Image], [CategoryId], [ShortDes], [TopicId], [FullDecription], [Price], [Position], [PriceSale], [HotSale], [DealOfWeek], [UploadTime], [UploadBy], [UpdateTime], [UpdateBy], [Status]) VALUES (1, N'giày nam a1', N'giay-nam-a1                                       ', N'product-1.jpg                                                                                       ', 34, N'new ', 1, N'Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable
                            cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening
                            with placket.', 50000, N'new-arrivals', 30000, 1, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Product] ([Id], [Name], [Slug], [Image], [CategoryId], [ShortDes], [TopicId], [FullDecription], [Price], [Position], [PriceSale], [HotSale], [DealOfWeek], [UploadTime], [UploadBy], [UpdateTime], [UpdateBy], [Status]) VALUES (2, N'ao khoac nam c1', N'ao-khoac-nam-c1                                   ', N'product-2.jpg                                                                                       ', 23, N'sale', 1, N'Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable
                            cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening
                            with placket.', 95000, N'hot-sales', 70000, 1, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Product] ([Id], [Name], [Slug], [Image], [CategoryId], [ShortDes], [TopicId], [FullDecription], [Price], [Position], [PriceSale], [HotSale], [DealOfWeek], [UploadTime], [UploadBy], [UpdateTime], [UpdateBy], [Status]) VALUES (3, N'giày nam a2', N'giay-nam-a2                                       ', N'product-3.jpg                                                                                       ', 33, N'new ', 1, N'Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable
                            cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening
                            with placket.', 70000, N'new-arrivals', 60000, 1, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Product] ([Id], [Name], [Slug], [Image], [CategoryId], [ShortDes], [TopicId], [FullDecription], [Price], [Position], [PriceSale], [HotSale], [DealOfWeek], [UploadTime], [UploadBy], [UpdateTime], [UpdateBy], [Status]) VALUES (4, N'áo khoác nam tay dài x1', N'ao-khoac-nam-tay-dai-x1                           ', N'product-4.jpg                                                                                       ', 23, N'sale', 1, N'Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable
                            cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening
                            with placket.', 150000, N'hot-sales', 120000, 1, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Product] ([Id], [Name], [Slug], [Image], [CategoryId], [ShortDes], [TopicId], [FullDecription], [Price], [Position], [PriceSale], [HotSale], [DealOfWeek], [UploadTime], [UploadBy], [UpdateTime], [UpdateBy], [Status]) VALUES (6, N'áo thun nam đen c1', N'ao-thun-nam-den-c1                                ', N'product-5.jpg                                                                                       ', 19, N'new ', 1, N'Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable
                            cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening
                            with placket.', 70000, N'new-arrivals', 30000, 1, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Product] ([Id], [Name], [Slug], [Image], [CategoryId], [ShortDes], [TopicId], [FullDecription], [Price], [Position], [PriceSale], [HotSale], [DealOfWeek], [UploadTime], [UploadBy], [UpdateTime], [UpdateBy], [Status]) VALUES (8, N'khăn tắm cao cấp 2a', N'khan-tam-cao-cap-2a                               ', N'product-6.jpg                                                                                       ', 3, N'sale', 1, N'Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable
                            cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening
                            with placket.', 90000, N'hot-sales', 30000, 1, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Product] ([Id], [Name], [Slug], [Image], [CategoryId], [ShortDes], [TopicId], [FullDecription], [Price], [Position], [PriceSale], [HotSale], [DealOfWeek], [UploadTime], [UploadBy], [UpdateTime], [UpdateBy], [Status]) VALUES (9, N'ba lô da h1', N'ba-lo-da-h1                                       ', N'product-7.jpg                                                                                       ', 35, N'new ', 1, N'Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable
                            cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening
                            with placket.', 150000, N'new-arrivals', 99000, 1, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Product] ([Id], [Name], [Slug], [Image], [CategoryId], [ShortDes], [TopicId], [FullDecription], [Price], [Position], [PriceSale], [HotSale], [DealOfWeek], [UploadTime], [UploadBy], [UpdateTime], [UpdateBy], [Status]) VALUES (10, N'áo sơ mi xanh dương g1', N'ao-so-mi-xanh-duong-g1                            ', N'product-8.jpg                                                                                       ', 24, N'sale', 1, N'Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable
                            cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening
                            with placket.', 99000, N'hot-sales', 79000, 1, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Product] ([Id], [Name], [Slug], [Image], [CategoryId], [ShortDes], [TopicId], [FullDecription], [Price], [Position], [PriceSale], [HotSale], [DealOfWeek], [UploadTime], [UploadBy], [UpdateTime], [UpdateBy], [Status]) VALUES (11, N'ba lô thời trang ', N'ba-lo-thoi-trang                                  ', N'product-sale.png                                                                                    ', 35, N'DEAL OF WEEK', 1, N'Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable
                            cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening
                            with placket.', 99000, N'*', 79000, 0, 1, NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[Sliders] ON 

INSERT [dbo].[Sliders] ([Id], [Name], [Link], [Position], [Img], [Orders], [ShortDesc], [FullDecription], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (1, N'Summer Collection', N'sodsdfds', N'1', N'hero-1.jpg', 1, N'Fall - Winter Collections 2030', N'A specialist label creating luxury essentials. Ethically crafted with an unwavering
                                commitment to exceptional quality.', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Sliders] ([Id], [Name], [Link], [Position], [Img], [Orders], [ShortDesc], [FullDecription], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (8, N'Summer Collection', N'dfdsf', N'1', N'hero-2.jpg', 1, N'Fall - Winter Collections 2030', N'A specialist label creating luxury essentials. Ethically crafted with an unwavering
                                commitment to exceptional quality.', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Sliders] ([Id], [Name], [Link], [Position], [Img], [Orders], [ShortDesc], [FullDecription], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (12, N'
Clothing Collections 2030', N'dfsdfsd', N'banner', N'banner-1.jpg', 2, N'7 offset-lg-4', N'banner__item ', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Sliders] ([Id], [Name], [Link], [Position], [Img], [Orders], [ShortDesc], [FullDecription], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (13, N'Accessories', N'fsdsdf', N'banner', N'banner-2.jpg', 2, N'5', N'banner__item banner__item--middle', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Sliders] ([Id], [Name], [Link], [Position], [Img], [Orders], [ShortDesc], [FullDecription], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (14, N'Shoes Spring 2030', N'FSDFSD', N'banner', N'banner-3.jpg', 2, N'7', N'banner__item banner__item--last', NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Sliders] OFF
SET IDENTITY_INSERT [dbo].[Topics] ON 

INSERT [dbo].[Topics] ([Id], [Name], [Slug], [ParentId], [Orders], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (1, N'Best Sellers', N'best-sell', 0, 1, N'*', N'1', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Topics] ([Id], [Name], [Slug], [ParentId], [Orders], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (2, N'New Arrivals', N'new', 0, 1, N'.new-arrivals', N'1', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Topics] ([Id], [Name], [Slug], [ParentId], [Orders], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (3, N'Hot Sales', N'hot-sale', 0, 1, N'.hot-sales', N'1', NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Topics] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([idUser], [FirstName], [LastName], [Email], [Password], [Phone], [Account], [Adress]) VALUES (2, N'MAI', N'LOI', N'xuanloi.2017mwg@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'0379191764', N'user', N'46/24 duong 22, phuong phuoc long b quan 9')
INSERT [dbo].[Users] ([idUser], [FirstName], [LastName], [Email], [Password], [Phone], [Account], [Adress]) VALUES (4, N'mai', N'loi', N'user1@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'05159156161', N'user1', N'46/24, duong 61, phuong phuoc long b, tp thu duc')
SET IDENTITY_INSERT [dbo].[Users] OFF
USE [master]
GO
ALTER DATABASE [ONLINESHOP] SET  READ_WRITE 
GO
