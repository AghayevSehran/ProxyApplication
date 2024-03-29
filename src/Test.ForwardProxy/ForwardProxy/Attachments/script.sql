USE [master]
GO

/****** Object:  Database [RailroadReservation]    Script Date: 14/04/2023 12:46:32 ******/
CREATE DATABASE [RailroadReservation]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RailroadReservation', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\RailroadReservation.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RailroadReservation_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\RailroadReservation_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [RailroadReservation] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RailroadReservation].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RailroadReservation] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RailroadReservation] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RailroadReservation] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RailroadReservation] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RailroadReservation] SET ARITHABORT OFF 
GO
ALTER DATABASE [RailroadReservation] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RailroadReservation] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RailroadReservation] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RailroadReservation] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RailroadReservation] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RailroadReservation] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RailroadReservation] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RailroadReservation] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RailroadReservation] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RailroadReservation] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RailroadReservation] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RailroadReservation] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RailroadReservation] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RailroadReservation] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RailroadReservation] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RailroadReservation] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RailroadReservation] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RailroadReservation] SET RECOVERY FULL 
GO
ALTER DATABASE [RailroadReservation] SET  MULTI_USER 
GO
ALTER DATABASE [RailroadReservation] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RailroadReservation] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RailroadReservation] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RailroadReservation] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RailroadReservation] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RailroadReservation] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'RailroadReservation', N'ON'
GO
ALTER DATABASE [RailroadReservation] SET QUERY_STORE = OFF
GO
USE [RailroadReservation]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 14/04/2023 12:46:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[InsertedBy] [int] NULL,
	[InsertedDate] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 14/04/2023 12:46:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[InsertedBy] [int] NULL,
	[InsertedDate] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 14/04/2023 12:46:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CityId] [int] NOT NULL,
	[CountryId] [int] NOT NULL,
	[Latitude] [decimal](8, 6) NULL,
	[Longitude] [decimal](9, 6) NULL,
	[InsertedBy] [int] NULL,
	[InsertedDate] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[People]    Script Date: 14/04/2023 12:46:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[People](
	[Id] [int] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[IdentityCode] [nchar](10) NOT NULL,
	[Phone] [nchar](10) NOT NULL,
	[InsertedBy] [int] NULL,
	[InsertedDate] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_People] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 14/04/2023 12:46:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[InsertedBy] [int] NULL,
	[InsertedDate] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 14/04/2023 12:46:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rooms](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoomNumber] [nvarchar](50) NOT NULL,
	[RoomTypeId] [int] NOT NULL,
	[TrainId] [int] NOT NULL,
	[InsertedBy] [int] NULL,
	[InsertedDate] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Rooms] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomTypes]    Script Date: 14/04/2023 12:46:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[InsertedBy] [int] NULL,
	[InsertedDate] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_RoomTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RouteDetails]    Script Date: 14/04/2023 12:46:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RouteDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RouteId] [int] NOT NULL,
	[StationId] [int] NOT NULL,
	[OrderNumber] [smallint] NULL,
	[ArrivalDuration] [time](5) NULL,
	[InsertedBy] [int] NULL,
	[InsertedDate] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_RouteDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Routes]    Script Date: 14/04/2023 12:46:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Routes](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[InsertedBy] [int] NULL,
	[InsertedDate] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Routs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 14/04/2023 12:46:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RouteId] [int] NOT NULL,
	[TrainId] [int] NOT NULL,
	[DepartureDate] [date] NOT NULL,
	[InsertedBy] [int] NULL,
	[InsertedDate] [datetime] NOT NULL,
	[UpdatedBy] [bit] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Schedule] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Seats]    Script Date: 14/04/2023 12:46:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seats](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](10) NOT NULL,
	[SeatTypeId] [int] NOT NULL,
	[RoomId] [int] NOT NULL,
	[SeatStateId] [tinyint] NOT NULL,
	[InsertedBy] [int] NULL,
	[InsertedDate] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Seats] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SeatStates]    Script Date: 14/04/2023 12:46:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SeatStates](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[InsertedBy] [int] NULL,
	[InsertedDate] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_SeatStates] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SeatTypes]    Script Date: 14/04/2023 12:46:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SeatTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[InsertedBy] [int] NULL,
	[InsertedDate] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_SeatTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stations]    Script Date: 14/04/2023 12:46:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[LocationId] [int] NOT NULL,
	[InsertedBy] [int] NULL,
	[InsertedDate] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Stations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketDetails]    Script Date: 14/04/2023 12:46:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketDetails](
	[Id] [int] NOT NULL,
	[TicketId] [int] NOT NULL,
	[RoomId] [int] NOT NULL,
	[SeatId] [int] NOT NULL,
	[PersonId] [int] NOT NULL,
 CONSTRAINT [PK_TicketDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tickets]    Script Date: 14/04/2023 12:46:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tickets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartureStationId] [int] NOT NULL,
	[DestinationStationId] [int] NOT NULL,
	[DepartureDate] [datetime] NOT NULL,
	[Price] [money] NOT NULL,
	[RouteId] [int] NOT NULL,
	[UserId] [int] NULL,
	[InsertedBy] [int] NULL,
	[InsertedDate] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Tickets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trains]    Script Date: 14/04/2023 12:46:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trains](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TrainNumber] [nvarchar](50) NOT NULL,
	[Descrition] [nvarchar](150) NULL,
	[InsertedBy] [int] NULL,
	[InsertedDate] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Trains] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 14/04/2023 12:46:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Password] [char](64) NOT NULL,
	[PersonId] [int] NOT NULL,
	[InsertedBy] [int] NULL,
	[InsertedDate] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersRoles]    Script Date: 14/04/2023 12:46:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersRoles](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[InsertedBy] [int] NULL,
	[InsertedDate] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_UsersRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cities] ADD  CONSTRAINT [DF_Cities_InsertedDate]  DEFAULT (getdate()) FOR [InsertedDate]
GO
ALTER TABLE [dbo].[Cities] ADD  CONSTRAINT [DF_Cities_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Countries] ADD  CONSTRAINT [DF_Countries_InsertedDate]  DEFAULT (getdate()) FOR [InsertedDate]
GO
ALTER TABLE [dbo].[Countries] ADD  CONSTRAINT [DF_Countries_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Locations] ADD  CONSTRAINT [DF_Locations_InsertedDate]  DEFAULT (getdate()) FOR [InsertedDate]
GO
ALTER TABLE [dbo].[Locations] ADD  CONSTRAINT [DF_Locations_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[People] ADD  CONSTRAINT [DF_People_InsertedDate]  DEFAULT (getdate()) FOR [InsertedDate]
GO
ALTER TABLE [dbo].[People] ADD  CONSTRAINT [DF_People_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Roles] ADD  CONSTRAINT [DF_Roles_InsertedDate]  DEFAULT (getdate()) FOR [InsertedDate]
GO
ALTER TABLE [dbo].[Roles] ADD  CONSTRAINT [DF_Roles_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Rooms] ADD  CONSTRAINT [DF_Rooms_InsertedDate]  DEFAULT (getdate()) FOR [InsertedDate]
GO
ALTER TABLE [dbo].[Rooms] ADD  CONSTRAINT [DF_Rooms_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[RoomTypes] ADD  CONSTRAINT [DF_RoomTypes_InsertedDate]  DEFAULT (getdate()) FOR [InsertedDate]
GO
ALTER TABLE [dbo].[RoomTypes] ADD  CONSTRAINT [DF_RoomTypes_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[RouteDetails] ADD  CONSTRAINT [DF_RouteDetails_InsertedDate]  DEFAULT (getdate()) FOR [InsertedDate]
GO
ALTER TABLE [dbo].[RouteDetails] ADD  CONSTRAINT [DF_RouteDetails_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Routes] ADD  CONSTRAINT [DF_Routes_InsertedDate]  DEFAULT (getdate()) FOR [InsertedDate]
GO
ALTER TABLE [dbo].[Routes] ADD  CONSTRAINT [DF_Routs_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Schedule] ADD  CONSTRAINT [DF_Schedule_InsertedDate]  DEFAULT (getdate()) FOR [InsertedDate]
GO
ALTER TABLE [dbo].[Schedule] ADD  CONSTRAINT [DF_Schedule_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Seats] ADD  CONSTRAINT [DF_Seats_InsertedDate]  DEFAULT (getdate()) FOR [InsertedDate]
GO
ALTER TABLE [dbo].[Seats] ADD  CONSTRAINT [DF_Seats_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[SeatStates] ADD  CONSTRAINT [DF_SeatStates_InsertedDate]  DEFAULT (getdate()) FOR [InsertedDate]
GO
ALTER TABLE [dbo].[SeatStates] ADD  CONSTRAINT [DF_SeatStates_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[SeatTypes] ADD  CONSTRAINT [DF_SeatTypes_InsertedDate]  DEFAULT (getdate()) FOR [InsertedDate]
GO
ALTER TABLE [dbo].[SeatTypes] ADD  CONSTRAINT [DF_SeatTypes_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Stations] ADD  CONSTRAINT [DF_Stations_InsertedDate]  DEFAULT (getdate()) FOR [InsertedDate]
GO
ALTER TABLE [dbo].[Stations] ADD  CONSTRAINT [DF_Stations_Deleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Tickets] ADD  CONSTRAINT [DF_Tickets_InsertedDate]  DEFAULT (getdate()) FOR [InsertedDate]
GO
ALTER TABLE [dbo].[Tickets] ADD  CONSTRAINT [DF_Tickets_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Trains] ADD  CONSTRAINT [DF_Trains_InsertedDate]  DEFAULT (getdate()) FOR [InsertedDate]
GO
ALTER TABLE [dbo].[Trains] ADD  CONSTRAINT [DF_Trains_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_InsertedDate]  DEFAULT (getdate()) FOR [InsertedDate]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[UsersRoles] ADD  CONSTRAINT [DF_UsersRoles_InsertedDate]  DEFAULT (getdate()) FOR [InsertedDate]
GO
ALTER TABLE [dbo].[UsersRoles] ADD  CONSTRAINT [DF_UsersRoles_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Locations]  WITH CHECK ADD  CONSTRAINT [FK_Locations_Cities] FOREIGN KEY([CityId])
REFERENCES [dbo].[Cities] ([Id])
GO
ALTER TABLE [dbo].[Locations] CHECK CONSTRAINT [FK_Locations_Cities]
GO
ALTER TABLE [dbo].[Locations]  WITH CHECK ADD  CONSTRAINT [FK_Locations_Countries] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Countries] ([Id])
GO
ALTER TABLE [dbo].[Locations] CHECK CONSTRAINT [FK_Locations_Countries]
GO
ALTER TABLE [dbo].[Rooms]  WITH CHECK ADD  CONSTRAINT [FK_Rooms_RoomTypes] FOREIGN KEY([RoomTypeId])
REFERENCES [dbo].[RoomTypes] ([Id])
GO
ALTER TABLE [dbo].[Rooms] CHECK CONSTRAINT [FK_Rooms_RoomTypes]
GO
ALTER TABLE [dbo].[Rooms]  WITH CHECK ADD  CONSTRAINT [FK_Rooms_Trains] FOREIGN KEY([TrainId])
REFERENCES [dbo].[Trains] ([Id])
GO
ALTER TABLE [dbo].[Rooms] CHECK CONSTRAINT [FK_Rooms_Trains]
GO
ALTER TABLE [dbo].[RouteDetails]  WITH CHECK ADD  CONSTRAINT [FK_RouteDetails_Routes] FOREIGN KEY([RouteId])
REFERENCES [dbo].[Routes] ([Id])
GO
ALTER TABLE [dbo].[RouteDetails] CHECK CONSTRAINT [FK_RouteDetails_Routes]
GO
ALTER TABLE [dbo].[RouteDetails]  WITH CHECK ADD  CONSTRAINT [FK_RouteDetails_Stations] FOREIGN KEY([StationId])
REFERENCES [dbo].[Stations] ([Id])
GO
ALTER TABLE [dbo].[RouteDetails] CHECK CONSTRAINT [FK_RouteDetails_Stations]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Routes] FOREIGN KEY([RouteId])
REFERENCES [dbo].[Routes] ([Id])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_Routes]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Trains] FOREIGN KEY([TrainId])
REFERENCES [dbo].[Trains] ([Id])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_Trains]
GO
ALTER TABLE [dbo].[Seats]  WITH CHECK ADD  CONSTRAINT [FK_Seats_Rooms] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Rooms] ([Id])
GO
ALTER TABLE [dbo].[Seats] CHECK CONSTRAINT [FK_Seats_Rooms]
GO
ALTER TABLE [dbo].[Seats]  WITH CHECK ADD  CONSTRAINT [FK_Seats_SeatStates] FOREIGN KEY([SeatStateId])
REFERENCES [dbo].[SeatStates] ([Id])
GO
ALTER TABLE [dbo].[Seats] CHECK CONSTRAINT [FK_Seats_SeatStates]
GO
ALTER TABLE [dbo].[Seats]  WITH CHECK ADD  CONSTRAINT [FK_Seats_SeatTypes] FOREIGN KEY([SeatTypeId])
REFERENCES [dbo].[SeatTypes] ([Id])
GO
ALTER TABLE [dbo].[Seats] CHECK CONSTRAINT [FK_Seats_SeatTypes]
GO
ALTER TABLE [dbo].[Stations]  WITH CHECK ADD  CONSTRAINT [FK_Stations_Locations] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Locations] ([Id])
GO
ALTER TABLE [dbo].[Stations] CHECK CONSTRAINT [FK_Stations_Locations]
GO
ALTER TABLE [dbo].[TicketDetails]  WITH CHECK ADD  CONSTRAINT [FK_TicketDetails_People] FOREIGN KEY([PersonId])
REFERENCES [dbo].[People] ([Id])
GO
ALTER TABLE [dbo].[TicketDetails] CHECK CONSTRAINT [FK_TicketDetails_People]
GO
ALTER TABLE [dbo].[TicketDetails]  WITH CHECK ADD  CONSTRAINT [FK_TicketDetails_Rooms] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Rooms] ([Id])
GO
ALTER TABLE [dbo].[TicketDetails] CHECK CONSTRAINT [FK_TicketDetails_Rooms]
GO
ALTER TABLE [dbo].[TicketDetails]  WITH CHECK ADD  CONSTRAINT [FK_TicketDetails_Seats] FOREIGN KEY([SeatId])
REFERENCES [dbo].[Seats] ([Id])
GO
ALTER TABLE [dbo].[TicketDetails] CHECK CONSTRAINT [FK_TicketDetails_Seats]
GO
ALTER TABLE [dbo].[TicketDetails]  WITH CHECK ADD  CONSTRAINT [FK_TicketDetails_Tickets] FOREIGN KEY([TicketId])
REFERENCES [dbo].[Tickets] ([Id])
GO
ALTER TABLE [dbo].[TicketDetails] CHECK CONSTRAINT [FK_TicketDetails_Tickets]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_Routes] FOREIGN KEY([RouteId])
REFERENCES [dbo].[Routes] ([Id])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_Routes]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_People] FOREIGN KEY([PersonId])
REFERENCES [dbo].[People] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_People]
GO
ALTER TABLE [dbo].[UsersRoles]  WITH CHECK ADD  CONSTRAINT [FK_UsersRoles_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[UsersRoles] CHECK CONSTRAINT [FK_UsersRoles_Roles]
GO
ALTER TABLE [dbo].[UsersRoles]  WITH CHECK ADD  CONSTRAINT [FK_UsersRoles_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UsersRoles] CHECK CONSTRAINT [FK_UsersRoles_Users]
GO
USE [master]
GO
ALTER DATABASE [RailroadReservation] SET  READ_WRITE 
GO
