USE [master]
GO
/****** Object:  Database [Test]    Script Date: 11/14/2012 13:39:41 ******/
CREATE DATABASE [Test] ON  PRIMARY 
( NAME = N'Test', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Test.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Test_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Test_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Test] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Test].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Test] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Test] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Test] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Test] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Test] SET ARITHABORT OFF
GO
ALTER DATABASE [Test] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Test] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Test] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Test] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Test] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Test] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Test] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Test] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Test] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Test] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Test] SET  DISABLE_BROKER
GO
ALTER DATABASE [Test] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Test] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Test] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Test] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Test] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Test] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Test] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Test] SET  READ_WRITE
GO
ALTER DATABASE [Test] SET RECOVERY SIMPLE
GO
ALTER DATABASE [Test] SET  MULTI_USER
GO
ALTER DATABASE [Test] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Test] SET DB_CHAINING OFF
GO
USE [Test]
GO
/****** Object:  Table [dbo].[SMSGateway]    Script Date: 11/14/2012 13:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SMSGateway](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](20) NOT NULL,
	[Pass] [varchar](20) NOT NULL,
	[OperatorName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_SMSGateway] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[SMSGateway] ON
INSERT [dbo].[SMSGateway] ([ID], [UserName], [Pass], [OperatorName]) VALUES (1, N'User1', N'Pass1', N'Vip')
INSERT [dbo].[SMSGateway] ([ID], [UserName], [Pass], [OperatorName]) VALUES (2, N'User2', N'Pass2', N'Telenor')
INSERT [dbo].[SMSGateway] ([ID], [UserName], [Pass], [OperatorName]) VALUES (3, N'User3', N'Pass3', N'Mts')
SET IDENTITY_INSERT [dbo].[SMSGateway] OFF
/****** Object:  Table [dbo].[Application]    Script Date: 11/14/2012 13:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Application](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[DllPath] [nvarchar](500) NOT NULL,
	[Description] [nvarchar](500) NULL,
 CONSTRAINT [PK_Application] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Application] ON
INSERT [dbo].[Application] ([ID], [Name], [DllPath], [Description]) VALUES (1, N'Test', N'LMG.Services.Test.dll', N'Test MOMT service')
INSERT [dbo].[Application] ([ID], [Name], [DllPath], [Description]) VALUES (2, N'Booking', N'LMG.Services.QMSBooking.dll', N'Ticket booking service ')
INSERT [dbo].[Application] ([ID], [Name], [DllPath], [Description]) VALUES (3, N'Subscription', N'LMG.Services.Subscription.dll', N'Subscription service')
SET IDENTITY_INSERT [dbo].[Application] OFF
/****** Object:  Table [dbo].[Price]    Script Date: 11/14/2012 13:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Price](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[SMSGatewayID] [int] NULL,
	[ServiceCategory] [nvarchar](50) NULL,
	[LmgPart] [decimal](18, 2) NULL,
	[OperatorPart] [decimal](18, 2) NULL,
	[ThirdPart] [decimal](18, 2) NULL,
	[Currency] [varchar](10) NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_Price] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Price] ON
INSERT [dbo].[Price] ([ID], [SMSGatewayID], [ServiceCategory], [LmgPart], [OperatorPart], [ThirdPart], [Currency], [Description]) VALUES (1, 1, N'V-60', CAST(3.00 AS Decimal(18, 2)), CAST(27.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)), N'RSD', N'60 RSD - 10% LMG Share, 50% GSM share')
INSERT [dbo].[Price] ([ID], [SMSGatewayID], [ServiceCategory], [LmgPart], [OperatorPart], [ThirdPart], [Currency], [Description]) VALUES (2, 1, N'V-120', CAST(6.00 AS Decimal(18, 2)), CAST(54.00 AS Decimal(18, 2)), CAST(60.00 AS Decimal(18, 2)), N'RSD', N'120 RSD - 10% LMG Share, 50% GSM share')
INSERT [dbo].[Price] ([ID], [SMSGatewayID], [ServiceCategory], [LmgPart], [OperatorPart], [ThirdPart], [Currency], [Description]) VALUES (3, 2, N'TL60', CAST(3.00 AS Decimal(18, 2)), CAST(27.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)), N'RSD', N'60 RSD - 10% LMG Share, 50% GSM share')
INSERT [dbo].[Price] ([ID], [SMSGatewayID], [ServiceCategory], [LmgPart], [OperatorPart], [ThirdPart], [Currency], [Description]) VALUES (4, 2, N'TL120', CAST(6.00 AS Decimal(18, 2)), CAST(54.00 AS Decimal(18, 2)), CAST(60.00 AS Decimal(18, 2)), N'RSD', N'120 RSD - 10% LMG Share, 50% GSM share')
INSERT [dbo].[Price] ([ID], [SMSGatewayID], [ServiceCategory], [LmgPart], [OperatorPart], [ThirdPart], [Currency], [Description]) VALUES (5, 3, N'6512', CAST(3.00 AS Decimal(18, 2)), CAST(27.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)), N'RSD', N'60 RSD - 10% LMG Share, 50% GSM share')
INSERT [dbo].[Price] ([ID], [SMSGatewayID], [ServiceCategory], [LmgPart], [OperatorPart], [ThirdPart], [Currency], [Description]) VALUES (6, 3, N'7845', CAST(6.00 AS Decimal(18, 2)), CAST(54.00 AS Decimal(18, 2)), CAST(60.00 AS Decimal(18, 2)), N'RSD', N'120 RSD - 10% LMG Share, 50% GSM share')
SET IDENTITY_INSERT [dbo].[Price] OFF
/****** Object:  Table [dbo].[Rule]    Script Date: 11/14/2012 13:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rule](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ShortCode] [varchar](50) NOT NULL,
	[Keyword] [nvarchar](50) NOT NULL,
	[SMSGatewayID] [int] NOT NULL,
	[PriceID] [bigint] NULL,
	[ApplicationID] [int] NULL,
 CONSTRAINT [PK_Rule] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Rule] ON
INSERT [dbo].[Rule] ([ID], [ShortCode], [Keyword], [SMSGatewayID], [PriceID], [ApplicationID]) VALUES (1, N'1111', N'Key1', 1, 1, 1)
INSERT [dbo].[Rule] ([ID], [ShortCode], [Keyword], [SMSGatewayID], [PriceID], [ApplicationID]) VALUES (2, N'1111', N'Key1', 2, 3, 1)
INSERT [dbo].[Rule] ([ID], [ShortCode], [Keyword], [SMSGatewayID], [PriceID], [ApplicationID]) VALUES (3, N'1111', N'Key1', 3, 5, 1)
INSERT [dbo].[Rule] ([ID], [ShortCode], [Keyword], [SMSGatewayID], [PriceID], [ApplicationID]) VALUES (5, N'2222', N'Key2', 1, 2, 2)
INSERT [dbo].[Rule] ([ID], [ShortCode], [Keyword], [SMSGatewayID], [PriceID], [ApplicationID]) VALUES (6, N'2222', N'Key2', 2, 4, 2)
INSERT [dbo].[Rule] ([ID], [ShortCode], [Keyword], [SMSGatewayID], [PriceID], [ApplicationID]) VALUES (8, N'2222', N'Key2', 3, 6, 2)
SET IDENTITY_INSERT [dbo].[Rule] OFF
/****** Object:  ForeignKey [FK_Price_SMSGateway]    Script Date: 11/14/2012 13:39:42 ******/
ALTER TABLE [dbo].[Price]  WITH CHECK ADD  CONSTRAINT [FK_Price_SMSGateway] FOREIGN KEY([SMSGatewayID])
REFERENCES [dbo].[SMSGateway] ([ID])
GO
ALTER TABLE [dbo].[Price] CHECK CONSTRAINT [FK_Price_SMSGateway]
GO
/****** Object:  ForeignKey [FK_Rule_Application]    Script Date: 11/14/2012 13:39:42 ******/
ALTER TABLE [dbo].[Rule]  WITH CHECK ADD  CONSTRAINT [FK_Rule_Application] FOREIGN KEY([ApplicationID])
REFERENCES [dbo].[Application] ([ID])
GO
ALTER TABLE [dbo].[Rule] CHECK CONSTRAINT [FK_Rule_Application]
GO
/****** Object:  ForeignKey [FK_Rule_Price]    Script Date: 11/14/2012 13:39:42 ******/
ALTER TABLE [dbo].[Rule]  WITH CHECK ADD  CONSTRAINT [FK_Rule_Price] FOREIGN KEY([PriceID])
REFERENCES [dbo].[Price] ([ID])
GO
ALTER TABLE [dbo].[Rule] CHECK CONSTRAINT [FK_Rule_Price]
GO
/****** Object:  ForeignKey [FK_Rule_SMSGateway]    Script Date: 11/14/2012 13:39:42 ******/
ALTER TABLE [dbo].[Rule]  WITH CHECK ADD  CONSTRAINT [FK_Rule_SMSGateway] FOREIGN KEY([SMSGatewayID])
REFERENCES [dbo].[SMSGateway] ([ID])
GO
ALTER TABLE [dbo].[Rule] CHECK CONSTRAINT [FK_Rule_SMSGateway]
GO
