USE [master]
GO
/****** Object:  Database [RepairRequests]    Script Date: 13.12.2024 17:22:31 ******/
CREATE DATABASE [RepairRequests]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RepairRequests', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\RepairRequests.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RepairRequests_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\RepairRequests_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [RepairRequests] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RepairRequests].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RepairRequests] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RepairRequests] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RepairRequests] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RepairRequests] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RepairRequests] SET ARITHABORT OFF 
GO
ALTER DATABASE [RepairRequests] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [RepairRequests] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RepairRequests] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RepairRequests] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RepairRequests] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RepairRequests] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RepairRequests] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RepairRequests] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RepairRequests] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RepairRequests] SET  ENABLE_BROKER 
GO
ALTER DATABASE [RepairRequests] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RepairRequests] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RepairRequests] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RepairRequests] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RepairRequests] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RepairRequests] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RepairRequests] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RepairRequests] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [RepairRequests] SET  MULTI_USER 
GO
ALTER DATABASE [RepairRequests] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RepairRequests] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RepairRequests] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RepairRequests] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RepairRequests] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RepairRequests] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [RepairRequests] SET QUERY_STORE = OFF
GO
USE [RepairRequests]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 13.12.2024 17:22:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[clientId] [int] NOT NULL,
	[name] [varchar](100) NOT NULL,
	[contactInfo] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[clientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 13.12.2024 17:22:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[commentId] [int] NOT NULL,
	[requestId] [int] NOT NULL,
	[performerId] [int] NOT NULL,
	[commentDate] [datetime] NOT NULL,
	[text] [text] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[commentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipment]    Script Date: 13.12.2024 17:22:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipment](
	[equipmentId] [int] NOT NULL,
	[serialNumber] [varchar](50) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[model] [varchar](100) NULL,
	[location] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[equipmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FaultType]    Script Date: 13.12.2024 17:22:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FaultType](
	[faultTypeId] [int] NOT NULL,
	[name] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[faultTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Performer]    Script Date: 13.12.2024 17:22:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Performer](
	[performerId] [int] NOT NULL,
	[firstName] [varchar](100) NULL,
	[middleName] [varchar](100) NULL,
	[lastName] [varchar](100) NULL,
	[specialization] [varchar](100) NULL,
	[contactInfo] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[performerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RepairRequest]    Script Date: 13.12.2024 17:22:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RepairRequest](
	[requestId] [int] NOT NULL,
	[requestDate] [datetime] NOT NULL,
	[equipmentId] [int] NOT NULL,
	[faultTypeId] [int] NOT NULL,
	[description] [text] NULL,
	[clientId] [int] NOT NULL,
	[statusId] [int] NOT NULL,
	[assignedTo] [int] NULL,
	[completionDate] [datetime] NULL,
	[report] [text] NULL,
 CONSTRAINT [PK__RepairRe__E3C5DE313BB0A1AE] PRIMARY KEY CLUSTERED 
(
	[requestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 13.12.2024 17:22:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[statusId] [int] NOT NULL,
	[name] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[statusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Client] ([clientId], [name], [contactInfo]) VALUES (1, N'ООО "Рога и копыта"', N'info@rogaikopyta.ru')
INSERT [dbo].[Client] ([clientId], [name], [contactInfo]) VALUES (2, N'ИП Иванов Иван Иванович', N'+79991234567')
INSERT [dbo].[Client] ([clientId], [name], [contactInfo]) VALUES (3, N'ОАО "Мегаполис"', N'support@megapolis.ru')
INSERT [dbo].[Client] ([clientId], [name], [contactInfo]) VALUES (4, N'ООО "СтройТех"', N'info@stroytech.ru')
INSERT [dbo].[Client] ([clientId], [name], [contactInfo]) VALUES (5, N'ИП Петров Петр Петрович', N'+79992345678')
GO
INSERT [dbo].[Comment] ([commentId], [requestId], [performerId], [commentDate], [text]) VALUES (1, 1, 1, CAST(N'2023-01-10T11:00:00.000' AS DateTime), N'Проверяю подключение к сети')
INSERT [dbo].[Comment] ([commentId], [requestId], [performerId], [commentDate], [text]) VALUES (2, 2, 2, CAST(N'2023-02-10T12:00:00.000' AS DateTime), N'Замена лампы сканера')
INSERT [dbo].[Comment] ([commentId], [requestId], [performerId], [commentDate], [text]) VALUES (3, 3, 3, CAST(N'2023-03-10T13:00:00.000' AS DateTime), N'Проверяю настройки Wi-Fi')
INSERT [dbo].[Comment] ([commentId], [requestId], [performerId], [commentDate], [text]) VALUES (4, 4, 4, CAST(N'2023-04-10T14:00:00.000' AS DateTime), N'Проверяю картридж')
INSERT [dbo].[Comment] ([commentId], [requestId], [performerId], [commentDate], [text]) VALUES (5, 5, 5, CAST(N'2023-05-10T15:00:00.000' AS DateTime), N'Проверяю жесткий диск')
GO
INSERT [dbo].[Equipment] ([equipmentId], [serialNumber], [name], [model], [location]) VALUES (1, N'SN123456', N'Принтер', N'HP LaserJet Pro', N'Офис 1')
INSERT [dbo].[Equipment] ([equipmentId], [serialNumber], [name], [model], [location]) VALUES (2, N'SN789012', N'Сканер', N'Epson Perfection V39', N'Офис 2')
INSERT [dbo].[Equipment] ([equipmentId], [serialNumber], [name], [model], [location]) VALUES (3, N'SN345678', N'Ноутбук', N'Dell XPS 13', N'Офис 3')
INSERT [dbo].[Equipment] ([equipmentId], [serialNumber], [name], [model], [location]) VALUES (4, N'SN987654', N'МФУ', N'Canon MF733Cdw', N'Офис 4')
INSERT [dbo].[Equipment] ([equipmentId], [serialNumber], [name], [model], [location]) VALUES (5, N'SN567890', N'ПК', N'Lenovo ThinkCentre M720', N'Офис 5')
GO
INSERT [dbo].[FaultType] ([faultTypeId], [name]) VALUES (1, N'Не включается')
INSERT [dbo].[FaultType] ([faultTypeId], [name]) VALUES (2, N'Не сканирует')
INSERT [dbo].[FaultType] ([faultTypeId], [name]) VALUES (3, N'Нет подключения к интернету')
INSERT [dbo].[FaultType] ([faultTypeId], [name]) VALUES (4, N'Не печатает')
INSERT [dbo].[FaultType] ([faultTypeId], [name]) VALUES (5, N'Не загружается')
GO
INSERT [dbo].[Performer] ([performerId], [firstName], [middleName], [lastName], [specialization], [contactInfo]) VALUES (1, N'Петров', N'Петр', N'Петрович', N'Ремонт оргтехники', N'+79991112233')
INSERT [dbo].[Performer] ([performerId], [firstName], [middleName], [lastName], [specialization], [contactInfo]) VALUES (2, N'Сидоров', N'Сидор', N'Сидорович', N'Ремонт компьютеров', N'+79992223344')
INSERT [dbo].[Performer] ([performerId], [firstName], [middleName], [lastName], [specialization], [contactInfo]) VALUES (3, N'Иванов', N'Иван', N'Иванович', N'Сетевое оборудование', N'+79993334455')
INSERT [dbo].[Performer] ([performerId], [firstName], [middleName], [lastName], [specialization], [contactInfo]) VALUES (4, N'Смирнов', N'Алексей', N'Владимирович', N'Ремонт принтеров', N'+79994445566')
INSERT [dbo].[Performer] ([performerId], [firstName], [middleName], [lastName], [specialization], [contactInfo]) VALUES (5, N'Кузнецов', N'Дмитрий', N'Александрович', N'Ремонт ноутбуков', N'+79995556677')
GO
INSERT [dbo].[RepairRequest] ([requestId], [requestDate], [equipmentId], [faultTypeId], [description], [clientId], [statusId], [assignedTo], [completionDate], [report]) VALUES (1, CAST(N'2023-01-10T10:00:00.000' AS DateTime), 1, 1, N'Принтер не включается', 1, 2, 1, CAST(N'2023-01-10T12:00:00.000' AS DateTime), NULL)
INSERT [dbo].[RepairRequest] ([requestId], [requestDate], [equipmentId], [faultTypeId], [description], [clientId], [statusId], [assignedTo], [completionDate], [report]) VALUES (2, CAST(N'2023-02-10T11:00:00.000' AS DateTime), 2, 2, N'Сканер не сканирует документы', 2, 3, 2, CAST(N'2023-02-10T12:00:00.000' AS DateTime), N'Замена лампы сканера')
INSERT [dbo].[RepairRequest] ([requestId], [requestDate], [equipmentId], [faultTypeId], [description], [clientId], [statusId], [assignedTo], [completionDate], [report]) VALUES (3, CAST(N'2023-03-10T12:00:00.000' AS DateTime), 3, 3, N'Ноутбук не подключается к Wi-Fi', 3, 1, 3, CAST(N'2023-03-10T12:00:00.000' AS DateTime), NULL)
INSERT [dbo].[RepairRequest] ([requestId], [requestDate], [equipmentId], [faultTypeId], [description], [clientId], [statusId], [assignedTo], [completionDate], [report]) VALUES (4, CAST(N'2023-04-10T13:00:00.000' AS DateTime), 4, 4, N'МФУ не печатает', 4, 2, 4, CAST(N'2023-04-10T12:00:00.000' AS DateTime), NULL)
INSERT [dbo].[RepairRequest] ([requestId], [requestDate], [equipmentId], [faultTypeId], [description], [clientId], [statusId], [assignedTo], [completionDate], [report]) VALUES (5, CAST(N'2023-05-10T14:00:00.000' AS DateTime), 5, 5, N'ПК не загружается', 5, 1, 2, CAST(N'2023-05-10T12:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Status] ([statusId], [name]) VALUES (1, N'В ожидании')
INSERT [dbo].[Status] ([statusId], [name]) VALUES (2, N'В работе')
INSERT [dbo].[Status] ([statusId], [name]) VALUES (3, N'Выполнено')
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([performerId])
REFERENCES [dbo].[Performer] ([performerId])
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK__Comment__request__778AC167] FOREIGN KEY([requestId])
REFERENCES [dbo].[RepairRequest] ([requestId])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK__Comment__request__778AC167]
GO
ALTER TABLE [dbo].[RepairRequest]  WITH CHECK ADD FOREIGN KEY([assignedTo])
REFERENCES [dbo].[Performer] ([performerId])
GO
ALTER TABLE [dbo].[RepairRequest]  WITH CHECK ADD FOREIGN KEY([clientId])
REFERENCES [dbo].[Client] ([clientId])
GO
ALTER TABLE [dbo].[RepairRequest]  WITH CHECK ADD FOREIGN KEY([equipmentId])
REFERENCES [dbo].[Equipment] ([equipmentId])
GO
ALTER TABLE [dbo].[RepairRequest]  WITH CHECK ADD FOREIGN KEY([faultTypeId])
REFERENCES [dbo].[FaultType] ([faultTypeId])
GO
ALTER TABLE [dbo].[RepairRequest]  WITH CHECK ADD FOREIGN KEY([statusId])
REFERENCES [dbo].[Status] ([statusId])
GO
USE [master]
GO
ALTER DATABASE [RepairRequests] SET  READ_WRITE 
GO
