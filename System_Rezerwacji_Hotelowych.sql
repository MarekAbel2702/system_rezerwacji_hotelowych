USE [master]
GO
/****** Object:  Database [System_Rezerwacji_Hotelowych]    Script Date: 10.03.2025 18:31:51 ******/
CREATE DATABASE [System_Rezerwacji_Hotelowych]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'System_Rezerwacji_Hotelowych', FILENAME = N'D:\Folder Marka\Dev-Cpp\bazy danych\MSSQL16.SQLEXPRESS\MSSQL\DATA\System_Rezerwacji_Hotelowych.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'System_Rezerwacji_Hotelowych_log', FILENAME = N'D:\Folder Marka\Dev-Cpp\bazy danych\MSSQL16.SQLEXPRESS\MSSQL\DATA\System_Rezerwacji_Hotelowych_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [System_Rezerwacji_Hotelowych] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [System_Rezerwacji_Hotelowych].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [System_Rezerwacji_Hotelowych] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [System_Rezerwacji_Hotelowych] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [System_Rezerwacji_Hotelowych] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [System_Rezerwacji_Hotelowych] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [System_Rezerwacji_Hotelowych] SET ARITHABORT OFF 
GO
ALTER DATABASE [System_Rezerwacji_Hotelowych] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [System_Rezerwacji_Hotelowych] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [System_Rezerwacji_Hotelowych] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [System_Rezerwacji_Hotelowych] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [System_Rezerwacji_Hotelowych] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [System_Rezerwacji_Hotelowych] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [System_Rezerwacji_Hotelowych] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [System_Rezerwacji_Hotelowych] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [System_Rezerwacji_Hotelowych] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [System_Rezerwacji_Hotelowych] SET  DISABLE_BROKER 
GO
ALTER DATABASE [System_Rezerwacji_Hotelowych] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [System_Rezerwacji_Hotelowych] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [System_Rezerwacji_Hotelowych] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [System_Rezerwacji_Hotelowych] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [System_Rezerwacji_Hotelowych] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [System_Rezerwacji_Hotelowych] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [System_Rezerwacji_Hotelowych] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [System_Rezerwacji_Hotelowych] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [System_Rezerwacji_Hotelowych] SET  MULTI_USER 
GO
ALTER DATABASE [System_Rezerwacji_Hotelowych] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [System_Rezerwacji_Hotelowych] SET DB_CHAINING OFF 
GO
ALTER DATABASE [System_Rezerwacji_Hotelowych] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [System_Rezerwacji_Hotelowych] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [System_Rezerwacji_Hotelowych] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [System_Rezerwacji_Hotelowych] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [System_Rezerwacji_Hotelowych] SET QUERY_STORE = ON
GO
ALTER DATABASE [System_Rezerwacji_Hotelowych] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [System_Rezerwacji_Hotelowych]
GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 10.03.2025 18:31:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rooms](
	[RoomID] [int] IDENTITY(1,1) NOT NULL,
	[RoomNumber] [nvarchar](10) NOT NULL,
	[RoomType] [nvarchar](100) NOT NULL,
	[PricePerNight] [decimal](10, 2) NOT NULL,
	[IsAvailable] [bit] NOT NULL,
	[Capacity] [int] NOT NULL,
 CONSTRAINT [PK__Rooms__3286391982DDD21E] PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__Rooms__AE10E07A0064D23C] UNIQUE NONCLUSTERED 
(
	[RoomNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[AvailableRooms]    Script Date: 10.03.2025 18:31:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[AvailableRooms] AS
SELECT RoomID, RoomNumber, RoomType, PricePerNight
FROM Rooms 
WHERE IsAvailable = 1;
GO
/****** Object:  Table [dbo].[Guests]    Script Date: 10.03.2025 18:31:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Guests](
	[GuestID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](120) NOT NULL,
	[PhoneNumber] [nvarchar](20) NULL,
	[Country] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GuestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 10.03.2025 18:31:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
	[ReservationID] [int] NOT NULL,
	[AmountPaid] [decimal](10, 2) NOT NULL,
	[PaymentDate] [date] NOT NULL,
	[PaymentMethod] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__Payments__9B556A582AF9F607] PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservations]    Script Date: 10.03.2025 18:31:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservations](
	[ReservationID] [int] IDENTITY(1,1) NOT NULL,
	[GuestID] [int] NOT NULL,
	[RoomID] [int] NOT NULL,
	[CheckInDate] [date] NOT NULL,
	[CheckOutDate] [date] NOT NULL,
	[TotalPrice] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK__Reservat__B7EE5F049F58FE40] PRIMARY KEY CLUSTERED 
(
	[ReservationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 10.03.2025 18:31:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[ReviewID] [int] IDENTITY(1,1) NOT NULL,
	[GuestID] [int] NOT NULL,
	[RoomID] [int] NOT NULL,
	[Rating] [int] NOT NULL,
	[Comment] [text] NULL,
 CONSTRAINT [PK__Reviews__74BC79AEA2CFAB5D] PRIMARY KEY CLUSTERED 
(
	[ReviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Payments] ADD  CONSTRAINT [DF__Payments__Paymen__45F365D3]  DEFAULT (getdate()) FOR [PaymentDate]
GO
ALTER TABLE [dbo].[Reservations] ADD  CONSTRAINT [DF__Reservati__Check__403A8C7D]  DEFAULT (getdate()) FOR [CheckInDate]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK__Payments__Reserv__440B1D61] FOREIGN KEY([ReservationID])
REFERENCES [dbo].[Reservations] ([ReservationID])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK__Payments__Reserv__440B1D61]
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [FK__Reservati__Guest__3E52440B] FOREIGN KEY([GuestID])
REFERENCES [dbo].[Guests] ([GuestID])
GO
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [FK__Reservati__Guest__3E52440B]
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [FK__Reservati__RoomI__3F466844] FOREIGN KEY([RoomID])
REFERENCES [dbo].[Rooms] ([RoomID])
GO
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [FK__Reservati__RoomI__3F466844]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK__Reviews__GuestID__48CFD27E] FOREIGN KEY([GuestID])
REFERENCES [dbo].[Guests] ([GuestID])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK__Reviews__GuestID__48CFD27E]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK__Reviews__RoomID__49C3F6B7] FOREIGN KEY([RoomID])
REFERENCES [dbo].[Rooms] ([RoomID])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK__Reviews__RoomID__49C3F6B7]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [CK__Payments__Amount__44FF419A] CHECK  (([AmountPaid]>(0)))
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [CK__Payments__Amount__44FF419A]
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [CK__Reservati__Total__412EB0B6] CHECK  (([TotalPrice]>(0)))
GO
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [CK__Reservati__Total__412EB0B6]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [CK__Reviews__Rating__4AB81AF0] CHECK  (([Rating]>(0) AND [Rating]<=(5)))
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [CK__Reviews__Rating__4AB81AF0]
GO
ALTER TABLE [dbo].[Rooms]  WITH CHECK ADD  CONSTRAINT [CK__Rooms__PricePerN__3B75D760] CHECK  (([PricePerNight]>(0)))
GO
ALTER TABLE [dbo].[Rooms] CHECK CONSTRAINT [CK__Rooms__PricePerN__3B75D760]
GO
/****** Object:  StoredProcedure [dbo].[GetAveragePricePerNight]    Script Date: 10.03.2025 18:31:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*CREATE VIEW AvailableRooms AS
SELECT RoomID, RoomNumber, RoomType, PricePerNight
FROM Rooms 
WHERE IsAvailable = 1;*/

/*CREATE PROCEDURE MakeReservation
	@GuestID INT,
	@RoomID INT,
	@CheckInDate date,
	@CheckOutDate date
AS
BEGIN
	DECLARE @TotalPrice DECIMAL(10, 2);

	SELECT @TotalPrice = DATEDIFF(DAY, @CheckInDate, @CheckOutDate) * 
	PricePerNight
	FROM Rooms WHERE RoomID = @RoomID AND IsAvailable = 1;

	INSERT INTO Reservations (GuestID, RoomID, CheckInDate, CheckOutDate, TotalPrice)
	VALUES (@GuestID, @RoomID, @CheckInDate, @CheckOutDate, @TotalPrice);

	UPDATE Rooms SET IsAvailable = 0 WHERE RoomID = @RoomID;
END

*/

/*CREATE PROCEDURE GetOccupancyRate
	@StartDate Date = NULL,
	@EndDate Date = Null
AS
BEGIN
	SET NOCOUNT ON;

	IF @StartDate IS NULL SET @StartDate = CAST(GETDATE() AS DATE);
	IF @EndDate IS NULL SET @EndDate = @StartDate;

	DECLARE @OccupiedRooms INT;
	SELECT @OccupiedRooms = COUNT(DISTINCT r.RoomID)
	FROM Reservations r
	JOIN Rooms ro ON r.RoomID = ro.RoomID
	WHERE r.CheckInDate <= @EndDate AND r.CheckOutDate > @StartDate;

	DECLARE @TotalRooms INT;
	SELECT @TotalRooms = COUNT(*) FROM Rooms WHERE IsAvailable = 1;

	SELECT @OccupiedRooms AS OccupiedRooms, @TotalRooms AS TotalRooms,
	CASE
		WHEN @TotalRooms = 0 THEN 0
		ELSE CAST(@OccupiedRooms * 100.0 / @TotalRooms AS DECIMAL(5, 2))
	END AS OccupancyRate
END
*/

CREATE PROCEDURE [dbo].[GetAveragePricePerNight]
AS
BEGIN
	SELECT AVG(PricePerNight) AS AvgPrice
	FROM Rooms
END
GO
/****** Object:  StoredProcedure [dbo].[GetOccupancyRate]    Script Date: 10.03.2025 18:31:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*CREATE VIEW AvailableRooms AS
SELECT RoomID, RoomNumber, RoomType, PricePerNight
FROM Rooms 
WHERE IsAvailable = 1;*/

/*CREATE PROCEDURE MakeReservation
	@GuestID INT,
	@RoomID INT,
	@CheckInDate date,
	@CheckOutDate date
AS
BEGIN
	DECLARE @TotalPrice DECIMAL(10, 2);

	SELECT @TotalPrice = DATEDIFF(DAY, @CheckInDate, @CheckOutDate) * 
	PricePerNight
	FROM Rooms WHERE RoomID = @RoomID AND IsAvailable = 1;

	INSERT INTO Reservations (GuestID, RoomID, CheckInDate, CheckOutDate, TotalPrice)
	VALUES (@GuestID, @RoomID, @CheckInDate, @CheckOutDate, @TotalPrice);

	UPDATE Rooms SET IsAvailable = 0 WHERE RoomID = @RoomID;
END

*/

CREATE PROCEDURE [dbo].[GetOccupancyRate]
	@StartDate Date = NULL,
	@EndDate Date = Null
AS
BEGIN
	SET NOCOUNT ON;

	IF @StartDate IS NULL SET @StartDate = CAST(GETDATE() AS DATE);
	IF @EndDate IS NULL SET @EndDate = @StartDate;

	DECLARE @OccupiedRooms INT;
	SELECT @OccupiedRooms = COUNT(DISTINCT r.RoomID)
	FROM Reservations r
	JOIN Rooms ro ON r.RoomID = ro.RoomID
	WHERE r.CheckInDate <= @EndDate AND r.CheckOutDate > @StartDate;

	DECLARE @TotalRooms INT;
	SELECT @TotalRooms = COUNT(*) FROM Rooms WHERE IsAvailable = 1;

	SELECT @OccupiedRooms AS OccupiedRooms, @TotalRooms AS TotalRooms,
	CASE
		WHEN @TotalRooms = 0 THEN 0
		ELSE CAST(@OccupiedRooms * 100.0 / @TotalRooms AS DECIMAL(5, 2))
	END AS OccupancyRate
END
GO
/****** Object:  StoredProcedure [dbo].[MakeReservation]    Script Date: 10.03.2025 18:31:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*CREATE VIEW AvailableRooms AS
SELECT RoomID, RoomNumber, RoomType, PricePerNight
FROM Rooms 
WHERE IsAvailable = 1;*/

CREATE PROCEDURE [dbo].[MakeReservation]
	@GuestID INT,
	@RoomID INT,
	@CheckInDate date,
	@CheckOutDate date
AS
BEGIN
	DECLARE @TotalPrice DECIMAL(10, 2);

	SELECT @TotalPrice = DATEDIFF(DAY, @CheckInDate, @CheckOutDate) * 
	PricePerNight
	FROM Rooms WHERE RoomID = @RoomID AND IsAvailable = 1;

	INSERT INTO Reservations (GuestID, RoomID, CheckInDate, CheckOutDate, TotalPrice)
	VALUES (@GuestID, @RoomID, @CheckInDate, @CheckOutDate, @TotalPrice);

	UPDATE Rooms SET IsAvailable = 0 WHERE RoomID = @RoomID;
END


GO
USE [master]
GO
ALTER DATABASE [System_Rezerwacji_Hotelowych] SET  READ_WRITE 
GO
