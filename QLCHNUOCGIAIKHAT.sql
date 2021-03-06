USE [master]
GO
/****** Object:  Database [QLCHNUOCGIAIKHAT]    Script Date: 03/29/2020 3:47:30 PM ******/
CREATE DATABASE [QLCHNUOCGIAIKHAT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLCHNUOCGIAIKHAT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MYDIR\MSSQL\DATA\QLCHNUOCGIAIKHAT.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLCHNUOCGIAIKHAT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MYDIR\MSSQL\DATA\QLCHNUOCGIAIKHAT_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QLCHNUOCGIAIKHAT] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLCHNUOCGIAIKHAT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLCHNUOCGIAIKHAT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLCHNUOCGIAIKHAT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLCHNUOCGIAIKHAT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLCHNUOCGIAIKHAT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLCHNUOCGIAIKHAT] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLCHNUOCGIAIKHAT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLCHNUOCGIAIKHAT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLCHNUOCGIAIKHAT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLCHNUOCGIAIKHAT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLCHNUOCGIAIKHAT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLCHNUOCGIAIKHAT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLCHNUOCGIAIKHAT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLCHNUOCGIAIKHAT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLCHNUOCGIAIKHAT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLCHNUOCGIAIKHAT] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLCHNUOCGIAIKHAT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLCHNUOCGIAIKHAT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLCHNUOCGIAIKHAT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLCHNUOCGIAIKHAT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLCHNUOCGIAIKHAT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLCHNUOCGIAIKHAT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLCHNUOCGIAIKHAT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLCHNUOCGIAIKHAT] SET RECOVERY FULL 
GO
ALTER DATABASE [QLCHNUOCGIAIKHAT] SET  MULTI_USER 
GO
ALTER DATABASE [QLCHNUOCGIAIKHAT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLCHNUOCGIAIKHAT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLCHNUOCGIAIKHAT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLCHNUOCGIAIKHAT] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLCHNUOCGIAIKHAT] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLCHNUOCGIAIKHAT', N'ON'
GO
ALTER DATABASE [QLCHNUOCGIAIKHAT] SET QUERY_STORE = OFF
GO
USE [QLCHNUOCGIAIKHAT]
GO
/****** Object:  Table [dbo].[CT_DDH]    Script Date: 03/29/2020 3:47:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_DDH](
	[SODDH] [nchar](10) NOT NULL,
	[MANGK] [nchar](10) NOT NULL,
	[SLDAT] [real] NULL,
 CONSTRAINT [PK_CT_DDH] PRIMARY KEY CLUSTERED 
(
	[SODDH] ASC,
	[MANGK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CT_HOADON]    Script Date: 03/29/2020 3:47:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_HOADON](
	[SOHD] [nchar](10) NOT NULL,
	[MANGK] [nchar](10) NOT NULL,
	[SLKHMUA] [real] NULL,
	[DGBAN] [real] NULL,
 CONSTRAINT [PK_CT_HOADON] PRIMARY KEY CLUSTERED 
(
	[SOHD] ASC,
	[MANGK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CT_PGH]    Script Date: 03/29/2020 3:47:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_PGH](
	[SOPGH] [nchar](10) NOT NULL,
	[MANGK] [nchar](10) NOT NULL,
	[SLGIAO] [real] NULL,
	[DGGIAO] [real] NULL,
 CONSTRAINT [PK_CT_PGH] PRIMARY KEY CLUSTERED 
(
	[SOPGH] ASC,
	[MANGK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CT_PH]    Script Date: 03/29/2020 3:47:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_PH](
	[SOPH] [nchar](10) NOT NULL,
	[MANGK] [nchar](10) NOT NULL,
	[SLHEN] [real] NULL,
 CONSTRAINT [PK_CT_PH] PRIMARY KEY CLUSTERED 
(
	[SOPH] ASC,
	[MANGK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DDH]    Script Date: 03/29/2020 3:47:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DDH](
	[SODDH] [nchar](10) NOT NULL,
	[NGAYDH] [datetime] NULL,
	[MANCC] [nchar](10) NULL,
 CONSTRAINT [PK_DDH] PRIMARY KEY CLUSTERED 
(
	[SODDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HOADON]    Script Date: 03/29/2020 3:47:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOADON](
	[SOHD] [nchar](10) NOT NULL,
	[NGAYLAPHD] [datetime] NULL,
	[MAKH] [nchar](10) NULL,
 CONSTRAINT [PK_HOADON] PRIMARY KEY CLUSTERED 
(
	[SOHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KH]    Script Date: 03/29/2020 3:47:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KH](
	[MAKH] [nchar](10) NOT NULL,
	[TENKH] [nvarchar](50) NULL,
	[DCKH] [nvarchar](50) NULL,
	[DTKH] [nchar](10) NULL,
 CONSTRAINT [PK_KH] PRIMARY KEY CLUSTERED 
(
	[MAKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOAINGK]    Script Date: 03/29/2020 3:47:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOAINGK](
	[MALOAINGK] [nchar](10) NOT NULL,
	[TENLOAINGK] [nvarchar](50) NULL,
	[MANCC] [nchar](10) NULL,
 CONSTRAINT [PK_LOAINGK] PRIMARY KEY CLUSTERED 
(
	[MALOAINGK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NGK]    Script Date: 03/29/2020 3:47:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NGK](
	[MANGK] [nchar](10) NOT NULL,
	[TENNGK] [nvarchar](50) NULL,
	[QUYCACH] [nchar](10) NULL,
	[MALOAINGK] [nchar](10) NULL,
 CONSTRAINT [PK_NGK] PRIMARY KEY CLUSTERED 
(
	[MANGK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NHACC]    Script Date: 03/29/2020 3:47:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHACC](
	[MANCC] [nchar](10) NOT NULL,
	[TENNCC] [nvarchar](50) NULL,
	[DIACHINCC] [nvarchar](50) NULL,
	[DTNCC] [nchar](10) NULL,
 CONSTRAINT [PK_NHACC] PRIMARY KEY CLUSTERED 
(
	[MANCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PHIEUGH]    Script Date: 03/29/2020 3:47:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHIEUGH](
	[SOPGH] [nchar](10) NOT NULL,
	[NGAYGH] [datetime] NULL,
	[SODDH] [nchar](10) NULL,
 CONSTRAINT [PK_PHIEUGH] PRIMARY KEY CLUSTERED 
(
	[SOPGH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PHIEUHEN]    Script Date: 03/29/2020 3:47:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHIEUHEN](
	[SOPH] [nchar](10) NOT NULL,
	[NGAYLAPPH] [datetime] NULL,
	[NGAYHENGIAO] [datetime] NULL,
	[MAKH] [nchar](10) NULL,
 CONSTRAINT [PK_PHIEUHEN] PRIMARY KEY CLUSTERED 
(
	[SOPH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PHIEUTRANO]    Script Date: 03/29/2020 3:47:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHIEUTRANO](
	[SOPTN] [nchar](10) NOT NULL,
	[NGAYTRA] [datetime] NULL,
	[SOTIENTRA] [real] NULL,
	[SOHD] [nchar](10) NULL,
 CONSTRAINT [PK_PHIEUTRANO] PRIMARY KEY CLUSTERED 
(
	[SOPTN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CT_DDH] ([SODDH], [MANGK], [SLDAT]) VALUES (N'DDH01     ', N'CC1       ', 20)
INSERT [dbo].[CT_DDH] ([SODDH], [MANGK], [SLDAT]) VALUES (N'DDH01     ', N'CC2       ', 15)
INSERT [dbo].[CT_DDH] ([SODDH], [MANGK], [SLDAT]) VALUES (N'DDH01     ', N'PS1       ', 18)
INSERT [dbo].[CT_DDH] ([SODDH], [MANGK], [SLDAT]) VALUES (N'DDH01     ', N'SV2       ', 12)
INSERT [dbo].[CT_DDH] ([SODDH], [MANGK], [SLDAT]) VALUES (N'DDH02     ', N'C2        ', 10)
INSERT [dbo].[CT_DDH] ([SODDH], [MANGK], [SLDAT]) VALUES (N'DDH02     ', N'CC2       ', 30)
INSERT [dbo].[CT_DDH] ([SODDH], [MANGK], [SLDAT]) VALUES (N'DDH02     ', N'ST1       ', 15)
INSERT [dbo].[CT_DDH] ([SODDH], [MANGK], [SLDAT]) VALUES (N'DDH02     ', N'SV1       ', 5)
INSERT [dbo].[CT_DDH] ([SODDH], [MANGK], [SLDAT]) VALUES (N'DDH03     ', N'OD        ', 45)
INSERT [dbo].[CT_DDH] ([SODDH], [MANGK], [SLDAT]) VALUES (N'DDH04     ', N'CC1       ', 8)
INSERT [dbo].[CT_DDH] ([SODDH], [MANGK], [SLDAT]) VALUES (N'DDH04     ', N'ST2       ', 12)
INSERT [dbo].[CT_HOADON] ([SOHD], [MANGK], [SLKHMUA], [DGBAN]) VALUES (N'HD01      ', N'CC1       ', 20, 6000)
INSERT [dbo].[CT_HOADON] ([SOHD], [MANGK], [SLKHMUA], [DGBAN]) VALUES (N'HD01      ', N'CC2       ', 50, 5000)
INSERT [dbo].[CT_HOADON] ([SOHD], [MANGK], [SLKHMUA], [DGBAN]) VALUES (N'HD02      ', N'ST1       ', 40, 10000)
INSERT [dbo].[CT_HOADON] ([SOHD], [MANGK], [SLKHMUA], [DGBAN]) VALUES (N'HD03      ', N'SV2       ', 60, 5000)
INSERT [dbo].[CT_HOADON] ([SOHD], [MANGK], [SLKHMUA], [DGBAN]) VALUES (N'HD04      ', N'PS2       ', 25, 5000)
INSERT [dbo].[CT_HOADON] ([SOHD], [MANGK], [SLKHMUA], [DGBAN]) VALUES (N'HD05      ', N'C2        ', 80, 9000)
INSERT [dbo].[CT_HOADON] ([SOHD], [MANGK], [SLKHMUA], [DGBAN]) VALUES (N'HD05      ', N'CC1       ', 100, 6000)
INSERT [dbo].[CT_HOADON] ([SOHD], [MANGK], [SLKHMUA], [DGBAN]) VALUES (N'HD05      ', N'SV1       ', 12, 8000)
INSERT [dbo].[CT_HOADON] ([SOHD], [MANGK], [SLKHMUA], [DGBAN]) VALUES (N'HD06      ', N'OD        ', 55, 1000)
INSERT [dbo].[CT_HOADON] ([SOHD], [MANGK], [SLKHMUA], [DGBAN]) VALUES (N'HD06      ', N'ST2       ', 60, 11000)
INSERT [dbo].[CT_PGH] ([SOPGH], [MANGK], [SLGIAO], [DGGIAO]) VALUES (N'PGH01     ', N'CC1       ', 15, 5000)
INSERT [dbo].[CT_PGH] ([SOPGH], [MANGK], [SLGIAO], [DGGIAO]) VALUES (N'PGH01     ', N'CC2       ', 15, 4000)
INSERT [dbo].[CT_PGH] ([SOPGH], [MANGK], [SLGIAO], [DGGIAO]) VALUES (N'PGH01     ', N'SV2       ', 10, 4000)
INSERT [dbo].[CT_PGH] ([SOPGH], [MANGK], [SLGIAO], [DGGIAO]) VALUES (N'PGH02     ', N'SV2       ', 2, 4000)
INSERT [dbo].[CT_PGH] ([SOPGH], [MANGK], [SLGIAO], [DGGIAO]) VALUES (N'PGH03     ', N'C2        ', 10, 8000)
INSERT [dbo].[CT_PGH] ([SOPGH], [MANGK], [SLGIAO], [DGGIAO]) VALUES (N'PGH03     ', N'CC2       ', 30, 5000)
INSERT [dbo].[CT_PGH] ([SOPGH], [MANGK], [SLGIAO], [DGGIAO]) VALUES (N'PGH03     ', N'PS2       ', 10, 4000)
INSERT [dbo].[CT_PGH] ([SOPGH], [MANGK], [SLGIAO], [DGGIAO]) VALUES (N'PGH03     ', N'ST1       ', 15, 9000)
INSERT [dbo].[CT_PH] ([SOPH], [MANGK], [SLHEN]) VALUES (N'PH01      ', N'OD        ', 8)
INSERT [dbo].[CT_PH] ([SOPH], [MANGK], [SLHEN]) VALUES (N'PH01      ', N'ST2       ', 10)
INSERT [dbo].[CT_PH] ([SOPH], [MANGK], [SLHEN]) VALUES (N'PH02      ', N'CC1       ', 20)
INSERT [dbo].[CT_PH] ([SOPH], [MANGK], [SLHEN]) VALUES (N'PH03      ', N'CC2       ', 9)
INSERT [dbo].[CT_PH] ([SOPH], [MANGK], [SLHEN]) VALUES (N'PH03      ', N'ST1       ', 7)
INSERT [dbo].[CT_PH] ([SOPH], [MANGK], [SLHEN]) VALUES (N'PH03      ', N'SV2       ', 12)
INSERT [dbo].[DDH] ([SODDH], [NGAYDH], [MANCC]) VALUES (N'DDH01     ', CAST(N'2011-05-10T00:00:00.000' AS DateTime), N'NC1       ')
INSERT [dbo].[DDH] ([SODDH], [NGAYDH], [MANCC]) VALUES (N'DDH02     ', CAST(N'2011-05-20T00:00:00.000' AS DateTime), N'NC1       ')
INSERT [dbo].[DDH] ([SODDH], [NGAYDH], [MANCC]) VALUES (N'DDH03     ', CAST(N'2011-05-26T00:00:00.000' AS DateTime), N'NC2       ')
INSERT [dbo].[DDH] ([SODDH], [NGAYDH], [MANCC]) VALUES (N'DDH04     ', CAST(N'2011-06-03T00:00:00.000' AS DateTime), N'NC2       ')
INSERT [dbo].[HOADON] ([SOHD], [NGAYLAPHD], [MAKH]) VALUES (N'HD01      ', CAST(N'2010-05-10T00:00:00.000' AS DateTime), N'KH01      ')
INSERT [dbo].[HOADON] ([SOHD], [NGAYLAPHD], [MAKH]) VALUES (N'HD02      ', CAST(N'2010-05-20T00:00:00.000' AS DateTime), N'KH01      ')
INSERT [dbo].[HOADON] ([SOHD], [NGAYLAPHD], [MAKH]) VALUES (N'HD03      ', CAST(N'2010-06-05T00:00:00.000' AS DateTime), N'KH02      ')
INSERT [dbo].[HOADON] ([SOHD], [NGAYLAPHD], [MAKH]) VALUES (N'HD04      ', CAST(N'2010-06-16T00:00:00.000' AS DateTime), N'KH02      ')
INSERT [dbo].[HOADON] ([SOHD], [NGAYLAPHD], [MAKH]) VALUES (N'HD05      ', CAST(N'2010-06-22T00:00:00.000' AS DateTime), N'KH02      ')
INSERT [dbo].[HOADON] ([SOHD], [NGAYLAPHD], [MAKH]) VALUES (N'HD06      ', CAST(N'2010-07-08T00:00:00.000' AS DateTime), N'KH03      ')
INSERT [dbo].[KH] ([MAKH], [TENKH], [DCKH], [DTKH]) VALUES (N'KH01      ', N'Cửa hàng BT', N'112 KTN', N'0203948893')
INSERT [dbo].[KH] ([MAKH], [TENKH], [DCKH], [DTKH]) VALUES (N'KH02      ', N'Cửa hàng Trà', N'3 KDW', N'0294482   ')
INSERT [dbo].[KH] ([MAKH], [TENKH], [DCKH], [DTKH]) VALUES (N'KH03      ', N'Siêu thị Coop', N'13 DL', N'0304898   ')
INSERT [dbo].[LOAINGK] ([MALOAINGK], [TENLOAINGK], [MANCC]) VALUES (N'NK1       ', N'Nước ngọt có gas', N'NC1       ')
INSERT [dbo].[LOAINGK] ([MALOAINGK], [TENLOAINGK], [MANCC]) VALUES (N'NK2       ', N'Nước ngọt không gas', N'NC2       ')
INSERT [dbo].[LOAINGK] ([MALOAINGK], [TENLOAINGK], [MANCC]) VALUES (N'NK3       ', N'Trà', N'NC1       ')
INSERT [dbo].[LOAINGK] ([MALOAINGK], [TENLOAINGK], [MANCC]) VALUES (N'NK4       ', N'Sữa', N'NC2       ')
INSERT [dbo].[NGK] ([MANGK], [TENNGK], [QUYCACH], [MALOAINGK]) VALUES (N'C2        ', N'Trà C2', N'Chai      ', N'NK2       ')
INSERT [dbo].[NGK] ([MANGK], [TENNGK], [QUYCACH], [MALOAINGK]) VALUES (N'CC1       ', N'Coca Cola', N'Chai      ', N'NK1       ')
INSERT [dbo].[NGK] ([MANGK], [TENNGK], [QUYCACH], [MALOAINGK]) VALUES (N'CC2       ', N'Coca Cola', N'Lon       ', N'NK1       ')
INSERT [dbo].[NGK] ([MANGK], [TENNGK], [QUYCACH], [MALOAINGK]) VALUES (N'ML1       ', N'Sữa tươi tiệt trùng', N'Bịch      ', N'NK1       ')
INSERT [dbo].[NGK] ([MANGK], [TENNGK], [QUYCACH], [MALOAINGK]) VALUES (N'NO1       ', N'Number One', N'Chai      ', N'NK1       ')
INSERT [dbo].[NGK] ([MANGK], [TENNGK], [QUYCACH], [MALOAINGK]) VALUES (N'NO2       ', N'Number One', N'Lon       ', N'NK1       ')
INSERT [dbo].[NGK] ([MANGK], [TENNGK], [QUYCACH], [MALOAINGK]) VALUES (N'OD        ', N'Trà xanh 0 độ', N'Chai      ', N'NK2       ')
INSERT [dbo].[NGK] ([MANGK], [TENNGK], [QUYCACH], [MALOAINGK]) VALUES (N'PS1       ', N'Pepsi', N'Chai      ', N'NK1       ')
INSERT [dbo].[NGK] ([MANGK], [TENNGK], [QUYCACH], [MALOAINGK]) VALUES (N'PS2       ', N'Pepsi', N'Lon       ', N'NK1       ')
INSERT [dbo].[NGK] ([MANGK], [TENNGK], [QUYCACH], [MALOAINGK]) VALUES (N'ST1       ', N'Sting dâu', N'Chai      ', N'NK1       ')
INSERT [dbo].[NGK] ([MANGK], [TENNGK], [QUYCACH], [MALOAINGK]) VALUES (N'ST2       ', N'Sting dâu', N'Lon       ', N'NK1       ')
INSERT [dbo].[NGK] ([MANGK], [TENNGK], [QUYCACH], [MALOAINGK]) VALUES (N'SV1       ', N'SevenUp', N'Chai      ', N'NK1       ')
INSERT [dbo].[NGK] ([MANGK], [TENNGK], [QUYCACH], [MALOAINGK]) VALUES (N'SV2       ', N'SevenUp', N'Lon       ', N'NK1       ')
INSERT [dbo].[NGK] ([MANGK], [TENNGK], [QUYCACH], [MALOAINGK]) VALUES (N'WT1       ', N'Nước uống đóng chai', N'Chai      ', N'NK2       ')
INSERT [dbo].[NHACC] ([MANCC], [TENNCC], [DIACHINCC], [DTNCC]) VALUES (N'NC1       ', N'Công ty NGK quốc tế CocaCola', N'Xa lộ Hà Nội, Thử Đức, HCM', N'0108388992')
INSERT [dbo].[NHACC] ([MANCC], [TENNCC], [DIACHINCC], [DTNCC]) VALUES (N'NC2       ', N'Công ty NGK quốc tế Pepsi', N'Bến Chương Dương, Quận 1, HCM', N'020483921 ')
INSERT [dbo].[NHACC] ([MANCC], [TENNCC], [DIACHINCC], [DTNCC]) VALUES (N'NC3       ', N'Công ty NGK Bến Chương Dương', N'Hàm Tử, Q5, HCM', N'020389484 ')
INSERT [dbo].[PHIEUGH] ([SOPGH], [NGAYGH], [SODDH]) VALUES (N'PGH01     ', CAST(N'2010-05-12T00:00:00.000' AS DateTime), N'DDH01     ')
INSERT [dbo].[PHIEUGH] ([SOPGH], [NGAYGH], [SODDH]) VALUES (N'PGH02     ', CAST(N'2010-05-15T00:00:00.000' AS DateTime), N'DDH01     ')
INSERT [dbo].[PHIEUGH] ([SOPGH], [NGAYGH], [SODDH]) VALUES (N'PGH03     ', CAST(N'2010-05-21T00:00:00.000' AS DateTime), N'DDH02     ')
INSERT [dbo].[PHIEUGH] ([SOPGH], [NGAYGH], [SODDH]) VALUES (N'PGH04     ', CAST(N'2010-05-22T00:00:00.000' AS DateTime), N'DDH02     ')
INSERT [dbo].[PHIEUGH] ([SOPGH], [NGAYGH], [SODDH]) VALUES (N'PGH05     ', CAST(N'2010-05-28T00:00:00.000' AS DateTime), N'DDH03     ')
INSERT [dbo].[PHIEUHEN] ([SOPH], [NGAYLAPPH], [NGAYHENGIAO], [MAKH]) VALUES (N'PH01      ', CAST(N'2010-05-08T00:00:00.000' AS DateTime), CAST(N'2010-06-09T00:00:00.000' AS DateTime), N'KH01      ')
INSERT [dbo].[PHIEUHEN] ([SOPH], [NGAYLAPPH], [NGAYHENGIAO], [MAKH]) VALUES (N'PH02      ', CAST(N'2010-05-25T00:00:00.000' AS DateTime), CAST(N'2010-06-28T00:00:00.000' AS DateTime), N'KH02      ')
INSERT [dbo].[PHIEUHEN] ([SOPH], [NGAYLAPPH], [NGAYHENGIAO], [MAKH]) VALUES (N'PH03      ', CAST(N'2010-06-01T00:00:00.000' AS DateTime), CAST(N'2010-06-02T00:00:00.000' AS DateTime), N'KH03      ')
INSERT [dbo].[PHIEUTRANO] ([SOPTN], [NGAYTRA], [SOTIENTRA], [SOHD]) VALUES (N'PTN01     ', CAST(N'2010-05-18T00:00:00.000' AS DateTime), 500000, N'HD01      ')
INSERT [dbo].[PHIEUTRANO] ([SOPTN], [NGAYTRA], [SOTIENTRA], [SOHD]) VALUES (N'PTN02     ', CAST(N'2010-06-01T00:00:00.000' AS DateTime), 350000, N'HD01      ')
INSERT [dbo].[PHIEUTRANO] ([SOPTN], [NGAYTRA], [SOTIENTRA], [SOHD]) VALUES (N'PTN03     ', CAST(N'2010-06-02T00:00:00.000' AS DateTime), 650000, N'HD02      ')
INSERT [dbo].[PHIEUTRANO] ([SOPTN], [NGAYTRA], [SOTIENTRA], [SOHD]) VALUES (N'PTN04     ', CAST(N'2010-06-15T00:00:00.000' AS DateTime), 1020000, N'HD03      ')
INSERT [dbo].[PHIEUTRANO] ([SOPTN], [NGAYTRA], [SOTIENTRA], [SOHD]) VALUES (N'PTN05     ', CAST(N'2010-07-01T00:00:00.000' AS DateTime), 1080000, N'HD03      ')
ALTER TABLE [dbo].[CT_DDH]  WITH CHECK ADD  CONSTRAINT [FK_CT_DDH_DDH] FOREIGN KEY([SODDH])
REFERENCES [dbo].[DDH] ([SODDH])
GO
ALTER TABLE [dbo].[CT_DDH] CHECK CONSTRAINT [FK_CT_DDH_DDH]
GO
ALTER TABLE [dbo].[CT_DDH]  WITH CHECK ADD  CONSTRAINT [FK_CT_DDH_NGK] FOREIGN KEY([MANGK])
REFERENCES [dbo].[NGK] ([MANGK])
GO
ALTER TABLE [dbo].[CT_DDH] CHECK CONSTRAINT [FK_CT_DDH_NGK]
GO
ALTER TABLE [dbo].[CT_HOADON]  WITH CHECK ADD  CONSTRAINT [FK_CT_HOADON_HOADON] FOREIGN KEY([SOHD])
REFERENCES [dbo].[HOADON] ([SOHD])
GO
ALTER TABLE [dbo].[CT_HOADON] CHECK CONSTRAINT [FK_CT_HOADON_HOADON]
GO
ALTER TABLE [dbo].[CT_HOADON]  WITH CHECK ADD  CONSTRAINT [FK_CT_HOADON_NGK] FOREIGN KEY([MANGK])
REFERENCES [dbo].[NGK] ([MANGK])
GO
ALTER TABLE [dbo].[CT_HOADON] CHECK CONSTRAINT [FK_CT_HOADON_NGK]
GO
ALTER TABLE [dbo].[CT_PGH]  WITH CHECK ADD  CONSTRAINT [FK_CT_PGH_NGK] FOREIGN KEY([MANGK])
REFERENCES [dbo].[NGK] ([MANGK])
GO
ALTER TABLE [dbo].[CT_PGH] CHECK CONSTRAINT [FK_CT_PGH_NGK]
GO
ALTER TABLE [dbo].[CT_PGH]  WITH CHECK ADD  CONSTRAINT [FK_CT_PGH_PHIEUGH] FOREIGN KEY([SOPGH])
REFERENCES [dbo].[PHIEUGH] ([SOPGH])
GO
ALTER TABLE [dbo].[CT_PGH] CHECK CONSTRAINT [FK_CT_PGH_PHIEUGH]
GO
ALTER TABLE [dbo].[CT_PH]  WITH CHECK ADD  CONSTRAINT [FK_CT_PH_NGK] FOREIGN KEY([MANGK])
REFERENCES [dbo].[NGK] ([MANGK])
GO
ALTER TABLE [dbo].[CT_PH] CHECK CONSTRAINT [FK_CT_PH_NGK]
GO
ALTER TABLE [dbo].[CT_PH]  WITH CHECK ADD  CONSTRAINT [FK_CT_PH_PHIEUHEN] FOREIGN KEY([SOPH])
REFERENCES [dbo].[PHIEUHEN] ([SOPH])
GO
ALTER TABLE [dbo].[CT_PH] CHECK CONSTRAINT [FK_CT_PH_PHIEUHEN]
GO
ALTER TABLE [dbo].[DDH]  WITH CHECK ADD  CONSTRAINT [FK_DDH_NHACC] FOREIGN KEY([MANCC])
REFERENCES [dbo].[NHACC] ([MANCC])
GO
ALTER TABLE [dbo].[DDH] CHECK CONSTRAINT [FK_DDH_NHACC]
GO
ALTER TABLE [dbo].[HOADON]  WITH CHECK ADD  CONSTRAINT [FK_HOADON_KH] FOREIGN KEY([MAKH])
REFERENCES [dbo].[KH] ([MAKH])
GO
ALTER TABLE [dbo].[HOADON] CHECK CONSTRAINT [FK_HOADON_KH]
GO
ALTER TABLE [dbo].[LOAINGK]  WITH CHECK ADD  CONSTRAINT [FK_LOAINGK_NHACC] FOREIGN KEY([MANCC])
REFERENCES [dbo].[NHACC] ([MANCC])
GO
ALTER TABLE [dbo].[LOAINGK] CHECK CONSTRAINT [FK_LOAINGK_NHACC]
GO
ALTER TABLE [dbo].[NGK]  WITH CHECK ADD  CONSTRAINT [FK_NGK_LOAINGK] FOREIGN KEY([MALOAINGK])
REFERENCES [dbo].[LOAINGK] ([MALOAINGK])
GO
ALTER TABLE [dbo].[NGK] CHECK CONSTRAINT [FK_NGK_LOAINGK]
GO
ALTER TABLE [dbo].[PHIEUGH]  WITH CHECK ADD  CONSTRAINT [FK_PHIEUGH_DDH] FOREIGN KEY([SODDH])
REFERENCES [dbo].[DDH] ([SODDH])
GO
ALTER TABLE [dbo].[PHIEUGH] CHECK CONSTRAINT [FK_PHIEUGH_DDH]
GO
ALTER TABLE [dbo].[PHIEUHEN]  WITH CHECK ADD  CONSTRAINT [FK_PHIEUHEN_KH] FOREIGN KEY([MAKH])
REFERENCES [dbo].[KH] ([MAKH])
GO
ALTER TABLE [dbo].[PHIEUHEN] CHECK CONSTRAINT [FK_PHIEUHEN_KH]
GO
ALTER TABLE [dbo].[PHIEUTRANO]  WITH CHECK ADD  CONSTRAINT [FK_PHIEUTRANO_HOADON] FOREIGN KEY([SOHD])
REFERENCES [dbo].[HOADON] ([SOHD])
GO
ALTER TABLE [dbo].[PHIEUTRANO] CHECK CONSTRAINT [FK_PHIEUTRANO_HOADON]
GO
USE [master]
GO
ALTER DATABASE [QLCHNUOCGIAIKHAT] SET  READ_WRITE 
GO
