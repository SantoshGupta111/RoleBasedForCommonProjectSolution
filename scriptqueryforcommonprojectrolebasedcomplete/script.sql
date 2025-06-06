USE [master]
GO
/****** Object:  Database [LMS_ProjectDB_07_2024]    Script Date: 7/25/2024 11:30:41 PM ******/
CREATE DATABASE [LMS_ProjectDB_07_2024]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LMS_ProjectDB_07_2024', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\LMS_ProjectDB_07_2024.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LMS_ProjectDB_07_2024_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\LMS_ProjectDB_07_2024_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [LMS_ProjectDB_07_2024] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LMS_ProjectDB_07_2024].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LMS_ProjectDB_07_2024] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LMS_ProjectDB_07_2024] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LMS_ProjectDB_07_2024] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LMS_ProjectDB_07_2024] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LMS_ProjectDB_07_2024] SET ARITHABORT OFF 
GO
ALTER DATABASE [LMS_ProjectDB_07_2024] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LMS_ProjectDB_07_2024] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LMS_ProjectDB_07_2024] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LMS_ProjectDB_07_2024] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LMS_ProjectDB_07_2024] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LMS_ProjectDB_07_2024] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LMS_ProjectDB_07_2024] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LMS_ProjectDB_07_2024] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LMS_ProjectDB_07_2024] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LMS_ProjectDB_07_2024] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LMS_ProjectDB_07_2024] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LMS_ProjectDB_07_2024] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LMS_ProjectDB_07_2024] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LMS_ProjectDB_07_2024] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LMS_ProjectDB_07_2024] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LMS_ProjectDB_07_2024] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LMS_ProjectDB_07_2024] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LMS_ProjectDB_07_2024] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LMS_ProjectDB_07_2024] SET  MULTI_USER 
GO
ALTER DATABASE [LMS_ProjectDB_07_2024] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LMS_ProjectDB_07_2024] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LMS_ProjectDB_07_2024] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LMS_ProjectDB_07_2024] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LMS_ProjectDB_07_2024] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LMS_ProjectDB_07_2024] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [LMS_ProjectDB_07_2024] SET QUERY_STORE = OFF
GO
USE [LMS_ProjectDB_07_2024]
GO
/****** Object:  Table [dbo].[ActivationLink]    Script Date: 7/25/2024 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActivationLink](
	[ActivationLinkId] [int] NOT NULL,
	[UserId] [varchar](10) NULL,
	[ActivationCode] [varchar](50) NULL,
	[IsActivated] [bit] NULL,
	[ExpiryDate] [datetime] NULL,
	[EmailID] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ActivationLinkId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ErrorLog]    Script Date: 7/25/2024 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrorLog](
	[ErrorLogID] [int] IDENTITY(1,1) NOT NULL,
	[ErrorMessage] [nvarchar](max) NULL,
	[StackTrace] [nvarchar](max) NULL,
	[Timestamp] [datetime] NULL,
	[UserID] [int] NULL,
	[AdditionalInfo] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ErrorLogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_cityName]    Script Date: 7/25/2024 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_cityName](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [nvarchar](50) NULL,
	[IsActive] [bigint] NULL,
 CONSTRAINT [PK_tbl_cityName] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_countryName]    Script Date: 7/25/2024 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_countryName](
	[CountryID] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [nvarchar](50) NULL,
	[IsActive] [bigint] NULL,
 CONSTRAINT [PK_tbl_countryName] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_departmentName]    Script Date: 7/25/2024 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_departmentName](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](50) NULL,
	[IsActive] [bigint] NULL,
 CONSTRAINT [PK_tbl_departmentName] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_designationName]    Script Date: 7/25/2024 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_designationName](
	[DesignationID] [int] IDENTITY(1,1) NOT NULL,
	[DesignationName] [nvarchar](50) NULL,
	[IsActive] [bigint] NULL,
 CONSTRAINT [PK_tbl_designationName] PRIMARY KEY CLUSTERED 
(
	[DesignationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_locationcodeName]    Script Date: 7/25/2024 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_locationcodeName](
	[LocationCodeID] [int] IDENTITY(1,1) NOT NULL,
	[LocationCodeName] [nvarchar](50) NULL,
	[IsActive] [bigint] NULL,
 CONSTRAINT [PK_tbl_locationcodeName] PRIMARY KEY CLUSTERED 
(
	[LocationCodeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_MainMenu]    Script Date: 7/25/2024 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_MainMenu](
	[MenuID] [int] IDENTITY(1,1) NOT NULL,
	[MenuName] [nvarchar](50) NULL,
	[MenuUrl] [nvarchar](200) NULL,
	[MenuDescription] [nvarchar](200) NULL,
	[DisplaySequence] [int] NULL,
	[IsActive] [bit] NULL,
	[RoleID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[OldRoleID] [int] NULL,
 CONSTRAINT [PK_tbl_MainMenu] PRIMARY KEY CLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_RolePermissions]    Script Date: 7/25/2024 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_RolePermissions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NULL,
	[SubMenuID] [int] NULL,
	[CanEdit] [bit] NULL,
	[CanView] [bit] NULL,
	[CanDelete] [bit] NULL,
	[CanInsert] [bit] NULL,
	[canDownload] [bit] NULL,
	[MainMenuID] [int] NULL,
 CONSTRAINT [PK_tbl_RolePermissions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_roles]    Script Date: 7/25/2024 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[IsActive] [int] NULL,
 CONSTRAINT [PK_tbl_roles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_stateName]    Script Date: 7/25/2024 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_stateName](
	[StateID] [int] IDENTITY(1,1) NOT NULL,
	[StateName] [nvarchar](50) NULL,
	[IsActive] [bigint] NULL,
 CONSTRAINT [PK_tbl_stateName] PRIMARY KEY CLUSTERED 
(
	[StateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_submenu]    Script Date: 7/25/2024 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_submenu](
	[SubMenuID] [int] IDENTITY(1,1) NOT NULL,
	[SubMenuName] [nvarchar](50) NULL,
	[SubMenuUrl] [nvarchar](200) NULL,
	[SubMenuDescription] [nvarchar](500) NULL,
	[SubMenuDisplaySequence] [int] NULL,
	[IsActive] [bit] NULL,
	[MainMenuID] [int] NULL,
	[RoleID] [int] NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_submenu] PRIMARY KEY CLUSTERED 
(
	[SubMenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_userpassword]    Script Date: 7/25/2024 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_userpassword](
	[UID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[IsActive] [bigint] NULL,
 CONSTRAINT [PK_tbl_userpassword] PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_UserRegistration]    Script Date: 7/25/2024 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_UserRegistration](
	[UID] [int] IDENTITY(1,1) NOT NULL,
	[EMPNO] [varchar](10) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Detail] [nvarchar](500) NULL,
	[RegistrationDate] [datetime] NULL,
	[RoleID] [bigint] NULL,
	[Gender] [nvarchar](10) NULL,
	[DOB] [datetime] NULL,
	[EmailID] [nvarchar](50) NULL,
	[MobileNo] [nvarchar](15) NULL,
	[CurrentAddress] [nvarchar](500) NULL,
	[PermanentAddress] [nvarchar](500) NULL,
	[UserImage] [nvarchar](50) NULL,
	[UserImagePath] [nvarchar](500) NULL,
	[CountryID] [int] NULL,
	[StateID] [int] NULL,
	[CityID] [int] NULL,
	[DepartmentID] [int] NULL,
	[DesignationID] [int] NULL,
	[IsActive] [bit] NULL,
	[IsLockedAccount] [bit] NULL,
	[LoginAttempted] [smallint] NULL,
	[IsChangedDefaultPassword] [bit] NULL,
	[IsAttemptedPassword] [bit] NULL,
	[UserType] [smallint] NULL,
	[LocationZoneID] [int] NULL,
	[IsAuthenticated] [bit] NULL,
	[IsAuthorized] [bit] NULL,
	[DocFileUpload] [nvarchar](500) NULL,
	[IsApprovedThroughEmailID] [bit] NULL,
	[DocFileName] [nvarchar](100) NULL,
 CONSTRAINT [PK_Tbl_UserRegistration] PRIMARY KEY CLUSTERED 
(
	[EMPNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ActivationLink] ([ActivationLinkId], [UserId], [ActivationCode], [IsActivated], [ExpiryDate], [EmailID]) VALUES (2016, N'EMP-000031', N'77F6B020-5BD6-48F0-BFDB-0EDD60A7328E', 0, CAST(N'2023-07-26T01:10:44.253' AS DateTime), NULL)
INSERT [dbo].[ActivationLink] ([ActivationLinkId], [UserId], [ActivationCode], [IsActivated], [ExpiryDate], [EmailID]) VALUES (2017, N'EMP-000032', N'AA598C53-C6D5-4192-95FF-B83248294F80', 0, CAST(N'2023-07-26T01:11:31.130' AS DateTime), NULL)
INSERT [dbo].[ActivationLink] ([ActivationLinkId], [UserId], [ActivationCode], [IsActivated], [ExpiryDate], [EmailID]) VALUES (2018, N'EMP-000033', N'0EDC2D4B-3B84-490E-A314-A145C379BA9F', 0, CAST(N'2023-07-26T01:49:19.080' AS DateTime), N'sgupta.gupta79@gmail.com')
INSERT [dbo].[ActivationLink] ([ActivationLinkId], [UserId], [ActivationCode], [IsActivated], [ExpiryDate], [EmailID]) VALUES (2019, N'EMP-000034', N'94A8CB96-312D-47FF-BD6F-7F771901ED4A', 0, CAST(N'2024-07-22T17:54:45.047' AS DateTime), N'sgupta.gupt88a79@gmail.com')
GO
SET IDENTITY_INSERT [dbo].[ErrorLog] ON 

INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (1, N'Email ID already exists', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at DAL.Users.UserRegistrationDb.NewInsertUserRegistration(UserRegistrationDTO& _NewInsertUser) in F:\MIDASPC\MidasPCTouchSolution\DAL\Users\UserRegistrationDb.cs:line 35
   at BAL.Users.UserRegistrationRepository.NewInsertUserRegistration(UserRegistrationDTO& _NewInsertUser) in F:\MIDASPC\MidasPCTouchSolution\BAL\Users\UserRegistrationRepository.cs:line 18
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 68', CAST(N'2023-07-04T02:00:22.900' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (2, N'Mobile no already exists', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at DAL.Users.UserRegistrationDb.NewInsertUserRegistration(UserRegistrationDTO& _NewInsertUser) in F:\MIDASPC\MidasPCTouchSolution\DAL\Users\UserRegistrationDb.cs:line 35
   at BAL.Users.UserRegistrationRepository.NewInsertUserRegistration(UserRegistrationDTO& _NewInsertUser) in F:\MIDASPC\MidasPCTouchSolution\BAL\Users\UserRegistrationRepository.cs:line 18
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 68', CAST(N'2023-07-04T02:08:41.470' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (3, N'Object reference not set to an instance of an object.', N'   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 227
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 63', CAST(N'2023-07-23T17:18:21.057' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (4, N'Object reference not set to an instance of an object.', N'   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 227
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 63', CAST(N'2023-07-23T17:21:09.530' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (5, N'Object reference not set to an instance of an object.', N'   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 227
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 63', CAST(N'2023-07-23T17:21:43.923' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (6, N'Violation of UNIQUE KEY constraint ''UQ__Activati__ED413B8E8D701A17''. Cannot insert duplicate key in object ''dbo.ActivationLink''. The duplicate key value is (<NULL>).
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at DAL.Users.UserRegistrationDb.NewInsertUserRegistration(UserRegistrationDTO& _NewInsertUser) in F:\MIDASPC\MidasPCTouchSolution\DAL\Users\UserRegistrationDb.cs:line 44
   at BAL.Users.UserRegistrationRepository.NewInsertUserRegistration(UserRegistrationDTO& _NewInsertUser) in F:\MIDASPC\MidasPCTouchSolution\BAL\Users\UserRegistrationRepository.cs:line 18
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 80', CAST(N'2023-07-25T01:08:10.083' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (7, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-13T23:15:32.827' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (8, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-13T23:16:47.577' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (9, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-13T23:17:45.603' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (10, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-13T23:24:07.240' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (11, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-13T23:24:38.657' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (12, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-13T23:26:55.617' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (13, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-13T23:27:20.473' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (14, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-13T23:27:33.777' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (15, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-13T23:27:51.093' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (16, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-13T23:31:45.627' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (17, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-13T23:32:54.673' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (18, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-13T23:33:25.817' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (19, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-13T23:33:31.210' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (20, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-13T23:33:48.927' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (21, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-13T23:34:23.283' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (22, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-13T23:35:05.617' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (23, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-13T23:35:22.077' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (24, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-13T23:35:26.577' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (25, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-13T23:37:03.417' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (26, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-13T23:43:26.897' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (27, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-13T23:43:38.860' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (28, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-13T23:47:18.247' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (29, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-13T23:48:32.700' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (30, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-13T23:49:54.897' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (31, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-13T23:51:12.480' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (32, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-13T23:55:22.443' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (33, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-13T23:56:10.633' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (34, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-13T23:58:44.367' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (35, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-13T23:59:15.590' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (36, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-13T23:59:44.190' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (37, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-14T00:01:43.733' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (38, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-14T00:03:35.057' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (39, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-14T00:03:39.297' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (40, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-14T00:04:29.417' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (41, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-14T00:04:33.807' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (42, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-14T00:04:38.720' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (43, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-14T00:05:16.360' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (44, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-14T00:06:08.377' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (45, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-14T00:06:27.480' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (46, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-14T00:06:57.233' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (47, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-14T00:07:18.207' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (48, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-14T00:07:25.037' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (49, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-14T00:07:29.040' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (50, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-14T00:07:43.653' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (51, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-14T00:10:19.417' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (52, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-14T00:10:36.653' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (53, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-14T00:10:42.633' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (54, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-14T00:12:33.890' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (55, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-14T00:14:00.620' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (56, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-14T00:14:24.237' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (57, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-14T00:14:34.273' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (58, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-14T00:15:11.857' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (59, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-14T00:15:22.887' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (60, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-14T00:16:02.380' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (61, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-14T00:17:02.183' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (62, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-14T00:17:17.090' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (63, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-14T00:17:49.097' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (64, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-14T00:18:47.777' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (65, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-14T00:19:23.757' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (66, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-14T00:20:25.157' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (67, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-14T00:21:15.943' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (68, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-14T00:21:30.910' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (69, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-14T00:24:28.310' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (70, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-14T00:25:24.290' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (71, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-14T00:26:05.733' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (72, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-14T00:28:28.213' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (73, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-14T00:29:40.933' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (74, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-14T00:30:34.240' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (75, N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.Convert.ToInt32(String value)
   at UIExecute.Account.UserRegistration.GetNewUserRegistrationFromForm() in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 266
   at UIExecute.Account.UserRegistration.NewUserRegistration(Object Sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Account\UserRegistration.aspx.cs:line 66', CAST(N'2023-08-14T00:30:56.200' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (76, N'Procedure or function ''sp_updateSubMenus'' expects parameter ''@SubMenuID'', which was not supplied.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at DAL.Menus.SubMenuDb.UpdateSubMenu(SubMenuDTO& _updateSubMenu) in F:\MIDASPC\MidasPCTouchSolution\DAL\Menus\SubMenuDb.cs:line 70
   at BAL.Menus.SubMenuRepository.UpdateSubMenu(SubMenuDTO& _updateSubMenu) in F:\MIDASPC\MidasPCTouchSolution\BAL\Menus\SubMenuRepository.cs:line 23
   at UIExecute.Menu.Updatesubmenu.editSubMenu(Object sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Menu\Updatesubmenu.aspx.cs:line 90', CAST(N'2024-07-04T23:41:52.383' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (77, N'Procedure or function ''sp_updateSubMenus'' expects parameter ''@SubMenuID'', which was not supplied.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at DAL.Menus.SubMenuDb.UpdateSubMenu(SubMenuDTO& _updateSubMenu) in F:\MIDASPC\MidasPCTouchSolution\DAL\Menus\SubMenuDb.cs:line 70
   at BAL.Menus.SubMenuRepository.UpdateSubMenu(SubMenuDTO& _updateSubMenu) in F:\MIDASPC\MidasPCTouchSolution\BAL\Menus\SubMenuRepository.cs:line 23
   at UIExecute.Menu.Updatesubmenu.editSubMenu(Object sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Menu\Updatesubmenu.aspx.cs:line 90', CAST(N'2024-07-04T23:44:18.703' AS DateTime), NULL, NULL)
INSERT [dbo].[ErrorLog] ([ErrorLogID], [ErrorMessage], [StackTrace], [Timestamp], [UserID], [AdditionalInfo]) VALUES (78, N'Procedure or function ''sp_updateSubMenus'' expects parameter ''@MainMenuID'', which was not supplied.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at DAL.Menus.SubMenuDb.UpdateSubMenu(SubMenuDTO& _updateSubMenu) in F:\MIDASPC\MidasPCTouchSolution\DAL\Menus\SubMenuDb.cs:line 71
   at BAL.Menus.SubMenuRepository.UpdateSubMenu(SubMenuDTO& _updateSubMenu) in F:\MIDASPC\MidasPCTouchSolution\BAL\Menus\SubMenuRepository.cs:line 23
   at UIExecute.Menu.Updatesubmenu.editSubMenu(Object sender, EventArgs e) in F:\MIDASPC\MidasPCTouchSolution\UIExecute\Menu\Updatesubmenu.aspx.cs:line 90', CAST(N'2024-07-04T23:56:43.260' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[ErrorLog] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_cityName] ON 

INSERT [dbo].[tbl_cityName] ([CityID], [CityName], [IsActive]) VALUES (1, N'LUCKNOW', 1)
INSERT [dbo].[tbl_cityName] ([CityID], [CityName], [IsActive]) VALUES (2, N'PATNA', 1)
INSERT [dbo].[tbl_cityName] ([CityID], [CityName], [IsActive]) VALUES (3, N'OUTSTATION', 1)
INSERT [dbo].[tbl_cityName] ([CityID], [CityName], [IsActive]) VALUES (4, N'CALCUTTA', 1)
INSERT [dbo].[tbl_cityName] ([CityID], [CityName], [IsActive]) VALUES (5, N'CHENNAI', 1)
INSERT [dbo].[tbl_cityName] ([CityID], [CityName], [IsActive]) VALUES (6, N'TRIVANDRUM', 1)
INSERT [dbo].[tbl_cityName] ([CityID], [CityName], [IsActive]) VALUES (7, N'DELHI', 1)
INSERT [dbo].[tbl_cityName] ([CityID], [CityName], [IsActive]) VALUES (8, N'ROHTAK', 1)
INSERT [dbo].[tbl_cityName] ([CityID], [CityName], [IsActive]) VALUES (9, N'MUMBAI', 1)
INSERT [dbo].[tbl_cityName] ([CityID], [CityName], [IsActive]) VALUES (10, N'VARANASI', 1)
INSERT [dbo].[tbl_cityName] ([CityID], [CityName], [IsActive]) VALUES (11, N'MADRAS', 1)
SET IDENTITY_INSERT [dbo].[tbl_cityName] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_countryName] ON 

INSERT [dbo].[tbl_countryName] ([CountryID], [CountryName], [IsActive]) VALUES (1, N'India', 1)
INSERT [dbo].[tbl_countryName] ([CountryID], [CountryName], [IsActive]) VALUES (2, N'USA', 0)
SET IDENTITY_INSERT [dbo].[tbl_countryName] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_departmentName] ON 

INSERT [dbo].[tbl_departmentName] ([DepartmentID], [DepartmentName], [IsActive]) VALUES (1, N'Sales', 1)
INSERT [dbo].[tbl_departmentName] ([DepartmentID], [DepartmentName], [IsActive]) VALUES (2, N'Service', 1)
INSERT [dbo].[tbl_departmentName] ([DepartmentID], [DepartmentName], [IsActive]) VALUES (3, N'Customer Support', 1)
INSERT [dbo].[tbl_departmentName] ([DepartmentID], [DepartmentName], [IsActive]) VALUES (4, N'Account', 1)
INSERT [dbo].[tbl_departmentName] ([DepartmentID], [DepartmentName], [IsActive]) VALUES (5, N'Marketing', 1)
INSERT [dbo].[tbl_departmentName] ([DepartmentID], [DepartmentName], [IsActive]) VALUES (6, N'Operations', 1)
SET IDENTITY_INSERT [dbo].[tbl_departmentName] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_designationName] ON 

INSERT [dbo].[tbl_designationName] ([DesignationID], [DesignationName], [IsActive]) VALUES (1, N'COO', 1)
INSERT [dbo].[tbl_designationName] ([DesignationID], [DesignationName], [IsActive]) VALUES (2, N'GM', 1)
INSERT [dbo].[tbl_designationName] ([DesignationID], [DesignationName], [IsActive]) VALUES (3, N'Sr.Manager', 1)
INSERT [dbo].[tbl_designationName] ([DesignationID], [DesignationName], [IsActive]) VALUES (4, N'Manager', 1)
INSERT [dbo].[tbl_designationName] ([DesignationID], [DesignationName], [IsActive]) VALUES (5, N'AM', 1)
INSERT [dbo].[tbl_designationName] ([DesignationID], [DesignationName], [IsActive]) VALUES (6, N'TL', 1)
INSERT [dbo].[tbl_designationName] ([DesignationID], [DesignationName], [IsActive]) VALUES (7, N'ATL', 1)
INSERT [dbo].[tbl_designationName] ([DesignationID], [DesignationName], [IsActive]) VALUES (8, N'Sr.Agent', 1)
INSERT [dbo].[tbl_designationName] ([DesignationID], [DesignationName], [IsActive]) VALUES (9, N'Agent', 1)
SET IDENTITY_INSERT [dbo].[tbl_designationName] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_locationcodeName] ON 

INSERT [dbo].[tbl_locationcodeName] ([LocationCodeID], [LocationCodeName], [IsActive]) VALUES (1, N'South', 1)
INSERT [dbo].[tbl_locationcodeName] ([LocationCodeID], [LocationCodeName], [IsActive]) VALUES (2, N'North', 1)
INSERT [dbo].[tbl_locationcodeName] ([LocationCodeID], [LocationCodeName], [IsActive]) VALUES (3, N'East', 1)
INSERT [dbo].[tbl_locationcodeName] ([LocationCodeID], [LocationCodeName], [IsActive]) VALUES (4, N'West', 1)
SET IDENTITY_INSERT [dbo].[tbl_locationcodeName] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_MainMenu] ON 

INSERT [dbo].[tbl_MainMenu] ([MenuID], [MenuName], [MenuUrl], [MenuDescription], [DisplaySequence], [IsActive], [RoleID], [CreatedDate], [UpdateDate], [OldRoleID]) VALUES (1, N'Registration', N'~/Account/Home.aspx', N'New Registration for users', 2, 1, 2, CAST(N'2023-06-10T16:18:39.170' AS DateTime), CAST(N'2024-07-03T00:01:35.933' AS DateTime), 2)
INSERT [dbo].[tbl_MainMenu] ([MenuID], [MenuName], [MenuUrl], [MenuDescription], [DisplaySequence], [IsActive], [RoleID], [CreatedDate], [UpdateDate], [OldRoleID]) VALUES (2, N'Users', N'~/Account/Home.aspx', N'testingAbout', 3, 1, 2, CAST(N'2023-06-10T23:59:55.333' AS DateTime), NULL, NULL)
INSERT [dbo].[tbl_MainMenu] ([MenuID], [MenuName], [MenuUrl], [MenuDescription], [DisplaySequence], [IsActive], [RoleID], [CreatedDate], [UpdateDate], [OldRoleID]) VALUES (3, N'FileU', N'~/Account/Home.aspx', N'testingFile', 2, 1, 3, CAST(N'2023-06-11T00:00:39.857' AS DateTime), CAST(N'2023-07-16T02:35:02.940' AS DateTime), 3)
INSERT [dbo].[tbl_MainMenu] ([MenuID], [MenuName], [MenuUrl], [MenuDescription], [DisplaySequence], [IsActive], [RoleID], [CreatedDate], [UpdateDate], [OldRoleID]) VALUES (4, N'Account', N'~/Account/Home.aspx', N'testingAccount', 1, 1, 3, CAST(N'2023-06-11T00:02:02.453' AS DateTime), NULL, NULL)
INSERT [dbo].[tbl_MainMenu] ([MenuID], [MenuName], [MenuUrl], [MenuDescription], [DisplaySequence], [IsActive], [RoleID], [CreatedDate], [UpdateDate], [OldRoleID]) VALUES (5, N'Sales', N'~/Account/Home.aspx', N'testingSales', 2, 1, 3, CAST(N'2023-06-11T00:02:45.510' AS DateTime), NULL, NULL)
INSERT [dbo].[tbl_MainMenu] ([MenuID], [MenuName], [MenuUrl], [MenuDescription], [DisplaySequence], [IsActive], [RoleID], [CreatedDate], [UpdateDate], [OldRoleID]) VALUES (6, N'Employee', N'~/Account/Home.aspx', N'Employee Detail', 1, 1, 1, CAST(N'2023-06-21T00:49:34.177' AS DateTime), NULL, NULL)
INSERT [dbo].[tbl_MainMenu] ([MenuID], [MenuName], [MenuUrl], [MenuDescription], [DisplaySequence], [IsActive], [RoleID], [CreatedDate], [UpdateDate], [OldRoleID]) VALUES (7, N'Menu Management', N'~/Account/Home.aspx', N'Menu Management all', 2, 1, 1, CAST(N'2023-06-21T01:00:46.517' AS DateTime), NULL, NULL)
INSERT [dbo].[tbl_MainMenu] ([MenuID], [MenuName], [MenuUrl], [MenuDescription], [DisplaySequence], [IsActive], [RoleID], [CreatedDate], [UpdateDate], [OldRoleID]) VALUES (8, N'Role Management', N'~/Account/Home.aspx', N'Role Management all', 3, 1, 1, CAST(N'2023-06-21T01:01:00.930' AS DateTime), NULL, NULL)
INSERT [dbo].[tbl_MainMenu] ([MenuID], [MenuName], [MenuUrl], [MenuDescription], [DisplaySequence], [IsActive], [RoleID], [CreatedDate], [UpdateDate], [OldRoleID]) VALUES (1006, N'Ecom Management', N'~/Ecommerce_Admin/EcomHome.aspx', N'Ecommerce Management', 1, 1, 13, CAST(N'2023-08-20T01:02:19.920' AS DateTime), CAST(N'2023-08-20T19:12:07.927' AS DateTime), 13)
INSERT [dbo].[tbl_MainMenu] ([MenuID], [MenuName], [MenuUrl], [MenuDescription], [DisplaySequence], [IsActive], [RoleID], [CreatedDate], [UpdateDate], [OldRoleID]) VALUES (1007, N'VerificationMenu', N'~/Account/Home.aspx', N'verification Menu', 2, 1, 7, CAST(N'2024-06-30T21:40:17.783' AS DateTime), CAST(N'2024-07-01T23:53:09.110' AS DateTime), 7)
INSERT [dbo].[tbl_MainMenu] ([MenuID], [MenuName], [MenuUrl], [MenuDescription], [DisplaySequence], [IsActive], [RoleID], [CreatedDate], [UpdateDate], [OldRoleID]) VALUES (1008, N'HomeVerification', N'~/Account/Home.aspx', N'test', 2, 1, 7, CAST(N'2024-06-30T21:58:11.047' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[tbl_MainMenu] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_RolePermissions] ON 

INSERT [dbo].[tbl_RolePermissions] ([ID], [RoleID], [SubMenuID], [CanEdit], [CanView], [CanDelete], [CanInsert], [canDownload], [MainMenuID]) VALUES (1, 2, 1, 0, 0, 0, 0, 0, 1)
INSERT [dbo].[tbl_RolePermissions] ([ID], [RoleID], [SubMenuID], [CanEdit], [CanView], [CanDelete], [CanInsert], [canDownload], [MainMenuID]) VALUES (2, 2, 2, 0, 0, 0, 0, 0, 2)
INSERT [dbo].[tbl_RolePermissions] ([ID], [RoleID], [SubMenuID], [CanEdit], [CanView], [CanDelete], [CanInsert], [canDownload], [MainMenuID]) VALUES (3, 3, 3, 0, 0, 0, 0, 0, 3)
INSERT [dbo].[tbl_RolePermissions] ([ID], [RoleID], [SubMenuID], [CanEdit], [CanView], [CanDelete], [CanInsert], [canDownload], [MainMenuID]) VALUES (4, 3, 4, 0, 0, 0, 0, 0, 4)
INSERT [dbo].[tbl_RolePermissions] ([ID], [RoleID], [SubMenuID], [CanEdit], [CanView], [CanDelete], [CanInsert], [canDownload], [MainMenuID]) VALUES (5, 3, 5, 0, 0, 0, 0, 0, 5)
INSERT [dbo].[tbl_RolePermissions] ([ID], [RoleID], [SubMenuID], [CanEdit], [CanView], [CanDelete], [CanInsert], [canDownload], [MainMenuID]) VALUES (6, 2, 6, 0, 0, 0, 0, 0, 1)
INSERT [dbo].[tbl_RolePermissions] ([ID], [RoleID], [SubMenuID], [CanEdit], [CanView], [CanDelete], [CanInsert], [canDownload], [MainMenuID]) VALUES (7, 1, 7, 0, 0, 1, 0, 0, 6)
INSERT [dbo].[tbl_RolePermissions] ([ID], [RoleID], [SubMenuID], [CanEdit], [CanView], [CanDelete], [CanInsert], [canDownload], [MainMenuID]) VALUES (8, 1, 8, 1, 1, 1, 0, 0, 8)
INSERT [dbo].[tbl_RolePermissions] ([ID], [RoleID], [SubMenuID], [CanEdit], [CanView], [CanDelete], [CanInsert], [canDownload], [MainMenuID]) VALUES (9, 1, 9, 0, 0, 0, 0, 0, 7)
INSERT [dbo].[tbl_RolePermissions] ([ID], [RoleID], [SubMenuID], [CanEdit], [CanView], [CanDelete], [CanInsert], [canDownload], [MainMenuID]) VALUES (10, 1, 10, 0, 0, 0, 0, 0, 7)
INSERT [dbo].[tbl_RolePermissions] ([ID], [RoleID], [SubMenuID], [CanEdit], [CanView], [CanDelete], [CanInsert], [canDownload], [MainMenuID]) VALUES (11, 1, 11, 1, 1, 1, 1, 0, 7)
INSERT [dbo].[tbl_RolePermissions] ([ID], [RoleID], [SubMenuID], [CanEdit], [CanView], [CanDelete], [CanInsert], [canDownload], [MainMenuID]) VALUES (12, 1, 12, 0, 0, 0, 0, 0, 7)
INSERT [dbo].[tbl_RolePermissions] ([ID], [RoleID], [SubMenuID], [CanEdit], [CanView], [CanDelete], [CanInsert], [canDownload], [MainMenuID]) VALUES (13, 3, 1008, 0, 0, 0, 0, 0, 4)
INSERT [dbo].[tbl_RolePermissions] ([ID], [RoleID], [SubMenuID], [CanEdit], [CanView], [CanDelete], [CanInsert], [canDownload], [MainMenuID]) VALUES (14, 3, 1009, 0, 0, 1, 1, 0, 3)
INSERT [dbo].[tbl_RolePermissions] ([ID], [RoleID], [SubMenuID], [CanEdit], [CanView], [CanDelete], [CanInsert], [canDownload], [MainMenuID]) VALUES (15, 1, 1010, 0, 0, 0, 0, 0, 6)
INSERT [dbo].[tbl_RolePermissions] ([ID], [RoleID], [SubMenuID], [CanEdit], [CanView], [CanDelete], [CanInsert], [canDownload], [MainMenuID]) VALUES (16, 1, 1011, 1, 1, 1, 1, 0, 7)
INSERT [dbo].[tbl_RolePermissions] ([ID], [RoleID], [SubMenuID], [CanEdit], [CanView], [CanDelete], [CanInsert], [canDownload], [MainMenuID]) VALUES (17, 1, 1012, 1, 1, 1, 1, 0, 7)
INSERT [dbo].[tbl_RolePermissions] ([ID], [RoleID], [SubMenuID], [CanEdit], [CanView], [CanDelete], [CanInsert], [canDownload], [MainMenuID]) VALUES (18, 1, 1013, 1, 1, 1, 0, 0, 7)
INSERT [dbo].[tbl_RolePermissions] ([ID], [RoleID], [SubMenuID], [CanEdit], [CanView], [CanDelete], [CanInsert], [canDownload], [MainMenuID]) VALUES (19, 1, 1014, 1, 1, 1, 0, 0, 7)
INSERT [dbo].[tbl_RolePermissions] ([ID], [RoleID], [SubMenuID], [CanEdit], [CanView], [CanDelete], [CanInsert], [canDownload], [MainMenuID]) VALUES (20, 3, 1015, 0, 1, 0, 1, 0, 4)
INSERT [dbo].[tbl_RolePermissions] ([ID], [RoleID], [SubMenuID], [CanEdit], [CanView], [CanDelete], [CanInsert], [canDownload], [MainMenuID]) VALUES (21, 1, 1016, 0, 0, 0, 0, 0, 8)
INSERT [dbo].[tbl_RolePermissions] ([ID], [RoleID], [SubMenuID], [CanEdit], [CanView], [CanDelete], [CanInsert], [canDownload], [MainMenuID]) VALUES (22, 13, 1017, 0, 0, 0, 1, 0, 1006)
INSERT [dbo].[tbl_RolePermissions] ([ID], [RoleID], [SubMenuID], [CanEdit], [CanView], [CanDelete], [CanInsert], [canDownload], [MainMenuID]) VALUES (23, 13, 1018, 0, 0, 0, 1, 0, 1006)
INSERT [dbo].[tbl_RolePermissions] ([ID], [RoleID], [SubMenuID], [CanEdit], [CanView], [CanDelete], [CanInsert], [canDownload], [MainMenuID]) VALUES (24, 7, 1019, 0, 1, 0, 0, 0, 1007)
INSERT [dbo].[tbl_RolePermissions] ([ID], [RoleID], [SubMenuID], [CanEdit], [CanView], [CanDelete], [CanInsert], [canDownload], [MainMenuID]) VALUES (25, 7, 1020, 0, 1, 0, 0, 0, 1008)
SET IDENTITY_INSERT [dbo].[tbl_RolePermissions] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_roles] ON 

INSERT [dbo].[tbl_roles] ([RoleID], [RoleName], [CreatedDate], [IsActive]) VALUES (1, N'IT-Head', CAST(N'2023-06-19T23:17:32.000' AS DateTime), 1)
INSERT [dbo].[tbl_roles] ([RoleID], [RoleName], [CreatedDate], [IsActive]) VALUES (2, N'Admin', CAST(N'2023-06-19T23:17:43.000' AS DateTime), 1)
INSERT [dbo].[tbl_roles] ([RoleID], [RoleName], [CreatedDate], [IsActive]) VALUES (3, N'User', CAST(N'2023-06-19T23:17:58.000' AS DateTime), 1)
INSERT [dbo].[tbl_roles] ([RoleID], [RoleName], [CreatedDate], [IsActive]) VALUES (4, N'Account', CAST(N'2023-06-19T23:18:05.000' AS DateTime), 1)
INSERT [dbo].[tbl_roles] ([RoleID], [RoleName], [CreatedDate], [IsActive]) VALUES (5, N'Sales', CAST(N'2023-06-19T23:18:12.000' AS DateTime), 1)
INSERT [dbo].[tbl_roles] ([RoleID], [RoleName], [CreatedDate], [IsActive]) VALUES (6, N'Service', CAST(N'2023-06-19T23:18:19.000' AS DateTime), 1)
INSERT [dbo].[tbl_roles] ([RoleID], [RoleName], [CreatedDate], [IsActive]) VALUES (7, N'Verification', CAST(N'2023-06-19T23:18:26.000' AS DateTime), 1)
INSERT [dbo].[tbl_roles] ([RoleID], [RoleName], [CreatedDate], [IsActive]) VALUES (8, N'Sales&Service', CAST(N'2023-06-19T23:18:34.000' AS DateTime), 1)
INSERT [dbo].[tbl_roles] ([RoleID], [RoleName], [CreatedDate], [IsActive]) VALUES (9, N'Sales&Verification', CAST(N'2023-06-19T23:18:40.000' AS DateTime), 1)
INSERT [dbo].[tbl_roles] ([RoleID], [RoleName], [CreatedDate], [IsActive]) VALUES (10, N'Center-Head', CAST(N'2023-06-19T23:18:59.000' AS DateTime), 1)
INSERT [dbo].[tbl_roles] ([RoleID], [RoleName], [CreatedDate], [IsActive]) VALUES (11, N'Sales-Service-Verification', CAST(N'2023-06-19T23:19:10.000' AS DateTime), 1)
INSERT [dbo].[tbl_roles] ([RoleID], [RoleName], [CreatedDate], [IsActive]) VALUES (12, N'None', CAST(N'2023-06-19T23:19:20.000' AS DateTime), 1)
INSERT [dbo].[tbl_roles] ([RoleID], [RoleName], [CreatedDate], [IsActive]) VALUES (13, N'EcomAdmin', CAST(N'2023-08-20T00:57:39.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tbl_roles] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_stateName] ON 

INSERT [dbo].[tbl_stateName] ([StateID], [StateName], [IsActive]) VALUES (1, N'Andhra Pradesh', 1)
INSERT [dbo].[tbl_stateName] ([StateID], [StateName], [IsActive]) VALUES (2, N'Arunachal Pradesh', 1)
INSERT [dbo].[tbl_stateName] ([StateID], [StateName], [IsActive]) VALUES (3, N'Assam', 1)
INSERT [dbo].[tbl_stateName] ([StateID], [StateName], [IsActive]) VALUES (4, N'Bihar', 1)
INSERT [dbo].[tbl_stateName] ([StateID], [StateName], [IsActive]) VALUES (5, N'Chhattisgarh', 1)
INSERT [dbo].[tbl_stateName] ([StateID], [StateName], [IsActive]) VALUES (6, N'Goa', 1)
INSERT [dbo].[tbl_stateName] ([StateID], [StateName], [IsActive]) VALUES (7, N'Gujarat', 1)
INSERT [dbo].[tbl_stateName] ([StateID], [StateName], [IsActive]) VALUES (8, N'Haryana', 1)
INSERT [dbo].[tbl_stateName] ([StateID], [StateName], [IsActive]) VALUES (9, N'Himachal Pradesh', 1)
INSERT [dbo].[tbl_stateName] ([StateID], [StateName], [IsActive]) VALUES (10, N'Jharkhand', 1)
INSERT [dbo].[tbl_stateName] ([StateID], [StateName], [IsActive]) VALUES (11, N'Karnataka', 1)
INSERT [dbo].[tbl_stateName] ([StateID], [StateName], [IsActive]) VALUES (12, N'Kerala', 1)
INSERT [dbo].[tbl_stateName] ([StateID], [StateName], [IsActive]) VALUES (13, N'Madhya Pradesh', 1)
INSERT [dbo].[tbl_stateName] ([StateID], [StateName], [IsActive]) VALUES (14, N'Maharashtra', 1)
INSERT [dbo].[tbl_stateName] ([StateID], [StateName], [IsActive]) VALUES (15, N'Manipur', 1)
INSERT [dbo].[tbl_stateName] ([StateID], [StateName], [IsActive]) VALUES (16, N'Meghalaya', 1)
INSERT [dbo].[tbl_stateName] ([StateID], [StateName], [IsActive]) VALUES (17, N'Mizoram', 1)
INSERT [dbo].[tbl_stateName] ([StateID], [StateName], [IsActive]) VALUES (18, N'Nagaland', 1)
INSERT [dbo].[tbl_stateName] ([StateID], [StateName], [IsActive]) VALUES (19, N'Odisha', 1)
INSERT [dbo].[tbl_stateName] ([StateID], [StateName], [IsActive]) VALUES (20, N'Punjab', 1)
INSERT [dbo].[tbl_stateName] ([StateID], [StateName], [IsActive]) VALUES (21, N'Rajasthan', 1)
INSERT [dbo].[tbl_stateName] ([StateID], [StateName], [IsActive]) VALUES (22, N'Sikkim', 1)
INSERT [dbo].[tbl_stateName] ([StateID], [StateName], [IsActive]) VALUES (23, N'Tamil Nadu', 1)
INSERT [dbo].[tbl_stateName] ([StateID], [StateName], [IsActive]) VALUES (24, N'Telangana', 1)
INSERT [dbo].[tbl_stateName] ([StateID], [StateName], [IsActive]) VALUES (25, N'Tripura', 1)
INSERT [dbo].[tbl_stateName] ([StateID], [StateName], [IsActive]) VALUES (26, N'Uttar Pradesh', 1)
INSERT [dbo].[tbl_stateName] ([StateID], [StateName], [IsActive]) VALUES (27, N'Uttarakhand', 1)
INSERT [dbo].[tbl_stateName] ([StateID], [StateName], [IsActive]) VALUES (28, N'', 1)
INSERT [dbo].[tbl_stateName] ([StateID], [StateName], [IsActive]) VALUES (29, N'West Bengal', 1)
SET IDENTITY_INSERT [dbo].[tbl_stateName] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_submenu] ON 

INSERT [dbo].[tbl_submenu] ([SubMenuID], [SubMenuName], [SubMenuUrl], [SubMenuDescription], [SubMenuDisplaySequence], [IsActive], [MainMenuID], [RoleID], [CreatedDate]) VALUES (1, N'NewRegisration', N'/Account/UserRegistration.aspx', N'testing sub menu', 1, 1, 1, 2, CAST(N'2023-06-11T20:12:50.027' AS DateTime))
INSERT [dbo].[tbl_submenu] ([SubMenuID], [SubMenuName], [SubMenuUrl], [SubMenuDescription], [SubMenuDisplaySequence], [IsActive], [MainMenuID], [RoleID], [CreatedDate]) VALUES (2, N'Find User', N'/Account/UsersDetail.aspx', N'testing sub menu', 2, 1, 2, 2, CAST(N'2023-06-11T20:13:37.390' AS DateTime))
INSERT [dbo].[tbl_submenu] ([SubMenuID], [SubMenuName], [SubMenuUrl], [SubMenuDescription], [SubMenuDisplaySequence], [IsActive], [MainMenuID], [RoleID], [CreatedDate]) VALUES (3, N'MyFile', N'/Account/Newadmissionform.aspx', N'testing sub menu', 3, 1, 3, 3, CAST(N'2023-06-11T20:14:08.047' AS DateTime))
INSERT [dbo].[tbl_submenu] ([SubMenuID], [SubMenuName], [SubMenuUrl], [SubMenuDescription], [SubMenuDisplaySequence], [IsActive], [MainMenuID], [RoleID], [CreatedDate]) VALUES (4, N'MyAccount', N'/Account/UserRegistration.aspx', N'testing sub menu', 2, 1, 4, 3, CAST(N'2023-06-11T20:14:49.463' AS DateTime))
INSERT [dbo].[tbl_submenu] ([SubMenuID], [SubMenuName], [SubMenuUrl], [SubMenuDescription], [SubMenuDisplaySequence], [IsActive], [MainMenuID], [RoleID], [CreatedDate]) VALUES (5, N'MySales', N'/Menu/MySales.aspx', N'testing sub menu', 1, 1, 5, 3, CAST(N'2023-06-11T20:15:18.190' AS DateTime))
INSERT [dbo].[tbl_submenu] ([SubMenuID], [SubMenuName], [SubMenuUrl], [SubMenuDescription], [SubMenuDisplaySequence], [IsActive], [MainMenuID], [RoleID], [CreatedDate]) VALUES (6, N'New Role', N'/Account/CreateRoles.aspx', N'testst', 3, 1, 1, 2, CAST(N'2023-06-12T00:16:44.040' AS DateTime))
INSERT [dbo].[tbl_submenu] ([SubMenuID], [SubMenuName], [SubMenuUrl], [SubMenuDescription], [SubMenuDisplaySequence], [IsActive], [MainMenuID], [RoleID], [CreatedDate]) VALUES (7, N'Change Password', N'/Account/ChangePassword.aspx', N'changepassword activity123', 1, 1, 6, 1, CAST(N'2023-06-21T00:50:59.867' AS DateTime))
INSERT [dbo].[tbl_submenu] ([SubMenuID], [SubMenuName], [SubMenuUrl], [SubMenuDescription], [SubMenuDisplaySequence], [IsActive], [MainMenuID], [RoleID], [CreatedDate]) VALUES (8, N'Create New Role', N'/Account/CreateRoles.aspx', N'new create role name', 2, 1, 8, 1, CAST(N'2023-06-21T01:02:40.707' AS DateTime))
INSERT [dbo].[tbl_submenu] ([SubMenuID], [SubMenuName], [SubMenuUrl], [SubMenuDescription], [SubMenuDisplaySequence], [IsActive], [MainMenuID], [RoleID], [CreatedDate]) VALUES (9, N'New Main-Menu', N'/Menu/CreateMenu.aspx', N'new create Menu Head name', 3, 1, 7, 1, CAST(N'2023-06-21T01:03:51.230' AS DateTime))
INSERT [dbo].[tbl_submenu] ([SubMenuID], [SubMenuName], [SubMenuUrl], [SubMenuDescription], [SubMenuDisplaySequence], [IsActive], [MainMenuID], [RoleID], [CreatedDate]) VALUES (10, N'New Sub-Menu', N'/Menu/CreateSubMenu.aspx', N'new create Sub-Menu Head name', 1, 1, 7, 1, CAST(N'2023-06-21T01:04:14.177' AS DateTime))
INSERT [dbo].[tbl_submenu] ([SubMenuID], [SubMenuName], [SubMenuUrl], [SubMenuDescription], [SubMenuDisplaySequence], [IsActive], [MainMenuID], [RoleID], [CreatedDate]) VALUES (11, N'ALLEmployee', N'/Account/usersDetail.aspx', N'testt', 1, 1, 7, 1, CAST(N'2023-06-25T01:13:09.787' AS DateTime))
INSERT [dbo].[tbl_submenu] ([SubMenuID], [SubMenuName], [SubMenuUrl], [SubMenuDescription], [SubMenuDisplaySequence], [IsActive], [MainMenuID], [RoleID], [CreatedDate]) VALUES (12, N'Role Permissions', N'/Menu/DataDetails/RolePermissionToSubMenu.aspx', N'RolePermission', 3, 1, 7, 1, CAST(N'2023-06-25T15:05:48.127' AS DateTime))
INSERT [dbo].[tbl_submenu] ([SubMenuID], [SubMenuName], [SubMenuUrl], [SubMenuDescription], [SubMenuDisplaySequence], [IsActive], [MainMenuID], [RoleID], [CreatedDate]) VALUES (1008, N'ALLEmployee', N'/Account/usersDetail.aspx', N'tests', 2, 1, 4, 3, CAST(N'2023-06-29T17:00:35.323' AS DateTime))
INSERT [dbo].[tbl_submenu] ([SubMenuID], [SubMenuName], [SubMenuUrl], [SubMenuDescription], [SubMenuDisplaySequence], [IsActive], [MainMenuID], [RoleID], [CreatedDate]) VALUES (1009, N'Contact Us', N'/Account/ContactUs.aspx', N'contact us', 2, 1, 3, 3, CAST(N'2023-07-05T23:14:33.350' AS DateTime))
INSERT [dbo].[tbl_submenu] ([SubMenuID], [SubMenuName], [SubMenuUrl], [SubMenuDescription], [SubMenuDisplaySequence], [IsActive], [MainMenuID], [RoleID], [CreatedDate]) VALUES (1010, N'AdmissionForm', N'/Account/Newadmissionform.aspx', N'admission form of college', 1, 1, 6, 1, CAST(N'2023-07-06T00:56:38.340' AS DateTime))
INSERT [dbo].[tbl_submenu] ([SubMenuID], [SubMenuName], [SubMenuUrl], [SubMenuDescription], [SubMenuDisplaySequence], [IsActive], [MainMenuID], [RoleID], [CreatedDate]) VALUES (1011, N'MainMenuDetails', N'/Menu/DataDetails/Mainmenudetails.aspx', N'MainMenuDetails for Updation', 3, 1, 7, 1, CAST(N'2023-07-07T00:21:55.400' AS DateTime))
INSERT [dbo].[tbl_submenu] ([SubMenuID], [SubMenuName], [SubMenuUrl], [SubMenuDescription], [SubMenuDisplaySequence], [IsActive], [MainMenuID], [RoleID], [CreatedDate]) VALUES (1012, N'SubMenuDetails', N'/Menu/DataDetails/Submenudetails.aspx', N'SubMenuDetails for Updation', 1, 1, 7, 1, CAST(N'2023-07-07T00:22:20.567' AS DateTime))
INSERT [dbo].[tbl_submenu] ([SubMenuID], [SubMenuName], [SubMenuUrl], [SubMenuDescription], [SubMenuDisplaySequence], [IsActive], [MainMenuID], [RoleID], [CreatedDate]) VALUES (1013, N'UpdateMainMenu', N'/Menu/Updatemainmenu.aspx', N'Update MainMenu', 2, 1, 7, 1, CAST(N'2023-07-07T00:23:09.790' AS DateTime))
INSERT [dbo].[tbl_submenu] ([SubMenuID], [SubMenuName], [SubMenuUrl], [SubMenuDescription], [SubMenuDisplaySequence], [IsActive], [MainMenuID], [RoleID], [CreatedDate]) VALUES (1014, N'UpdateSubMenu', N'/Menu/Updatesubmenu.aspx', N'Update SubMenu', 3, 1, 7, 1, CAST(N'2023-07-07T00:23:42.227' AS DateTime))
INSERT [dbo].[tbl_submenu] ([SubMenuID], [SubMenuName], [SubMenuUrl], [SubMenuDescription], [SubMenuDisplaySequence], [IsActive], [MainMenuID], [RoleID], [CreatedDate]) VALUES (1015, N'ABCD', N'/Account/MyAbcd.aspx', N'abcd', 2, 1, 4, 3, CAST(N'2023-07-11T01:14:38.680' AS DateTime))
INSERT [dbo].[tbl_submenu] ([SubMenuID], [SubMenuName], [SubMenuUrl], [SubMenuDescription], [SubMenuDisplaySequence], [IsActive], [MainMenuID], [RoleID], [CreatedDate]) VALUES (1016, N'Role Assign to Users', N'/Account/RoleAssigneToUsers.aspx', N'Role assign to users', 2, 1, 8, 1, CAST(N'2023-07-12T00:30:23.023' AS DateTime))
INSERT [dbo].[tbl_submenu] ([SubMenuID], [SubMenuName], [SubMenuUrl], [SubMenuDescription], [SubMenuDisplaySequence], [IsActive], [MainMenuID], [RoleID], [CreatedDate]) VALUES (1017, N'New Category', N'/Ecommerce_Admin/NewCategory.aspx', N'New Category for Product', 1, 1, 1006, 13, CAST(N'2023-08-20T01:06:56.840' AS DateTime))
INSERT [dbo].[tbl_submenu] ([SubMenuID], [SubMenuName], [SubMenuUrl], [SubMenuDescription], [SubMenuDisplaySequence], [IsActive], [MainMenuID], [RoleID], [CreatedDate]) VALUES (1018, N'New Product', N'../Ecommerce_Admin/NewProduct.aspx', N'Add New Product accordingly Category ID', 2, 1, 1006, 13, CAST(N'2023-08-21T01:32:21.493' AS DateTime))
INSERT [dbo].[tbl_submenu] ([SubMenuID], [SubMenuName], [SubMenuUrl], [SubMenuDescription], [SubMenuDisplaySequence], [IsActive], [MainMenuID], [RoleID], [CreatedDate]) VALUES (1019, N'VerificationSubMenu', N'../Menu/VerificationSubMenu.aspx', N'VerificationSubMenu', 1, 1, 1007, 7, CAST(N'2024-06-30T21:41:01.240' AS DateTime))
INSERT [dbo].[tbl_submenu] ([SubMenuID], [SubMenuName], [SubMenuUrl], [SubMenuDescription], [SubMenuDisplaySequence], [IsActive], [MainMenuID], [RoleID], [CreatedDate]) VALUES (1020, N'subhomeverification', N'../Menu/homesubverification.aspx', N'test', 3, 1, 1008, 7, CAST(N'2024-06-30T21:59:09.983' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_submenu] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_userpassword] ON 

INSERT [dbo].[tbl_userpassword] ([UID], [UserID], [UserName], [Password], [IsActive]) VALUES (1, 2, N'EMP-000002', N'Manish@1', 1)
INSERT [dbo].[tbl_userpassword] ([UID], [UserID], [UserName], [Password], [IsActive]) VALUES (2, 3, N'EMP-000003', N'LMQ99XJp', 1)
INSERT [dbo].[tbl_userpassword] ([UID], [UserID], [UserName], [Password], [IsActive]) VALUES (3, 4, N'EMP-000004', N'QQqQwtyH', 1)
INSERT [dbo].[tbl_userpassword] ([UID], [UserID], [UserName], [Password], [IsActive]) VALUES (4, 5, N'EMP-000005', N'4a5AYELK', 1)
INSERT [dbo].[tbl_userpassword] ([UID], [UserID], [UserName], [Password], [IsActive]) VALUES (5, 6, N'EMP-000006', N'XQ9ubtQx', 1)
INSERT [dbo].[tbl_userpassword] ([UID], [UserID], [UserName], [Password], [IsActive]) VALUES (6, 7, N'EMP-000007', N'KCQnnuvb', 1)
INSERT [dbo].[tbl_userpassword] ([UID], [UserID], [UserName], [Password], [IsActive]) VALUES (7, 8, N'EMP-000008', N'hHQW4UzO', 1)
INSERT [dbo].[tbl_userpassword] ([UID], [UserID], [UserName], [Password], [IsActive]) VALUES (8, 9, N'EMP-000009', N'NwTX2KCs', 1)
INSERT [dbo].[tbl_userpassword] ([UID], [UserID], [UserName], [Password], [IsActive]) VALUES (9, 10, N'EMP-000010', N'q54WKJx8', 1)
INSERT [dbo].[tbl_userpassword] ([UID], [UserID], [UserName], [Password], [IsActive]) VALUES (10, 11, N'EMP-000011', N'y5Womx8M', 1)
INSERT [dbo].[tbl_userpassword] ([UID], [UserID], [UserName], [Password], [IsActive]) VALUES (11, 12, N'EMP-000012', N'f6zMadDo', 1)
INSERT [dbo].[tbl_userpassword] ([UID], [UserID], [UserName], [Password], [IsActive]) VALUES (12, 13, N'EMP-000013', N'QbdZMKh5', 1)
INSERT [dbo].[tbl_userpassword] ([UID], [UserID], [UserName], [Password], [IsActive]) VALUES (13, 14, N'EMP-000014', N'OuAMaaHK', 1)
INSERT [dbo].[tbl_userpassword] ([UID], [UserID], [UserName], [Password], [IsActive]) VALUES (14, 15, N'EMP-000015', N'1Oh6L4p0', 1)
INSERT [dbo].[tbl_userpassword] ([UID], [UserID], [UserName], [Password], [IsActive]) VALUES (15, 16, N'EMP-000016', N'be1gRqMH', 1)
INSERT [dbo].[tbl_userpassword] ([UID], [UserID], [UserName], [Password], [IsActive]) VALUES (16, 17, N'EMP-000017', N'1jjKNA5o', 1)
INSERT [dbo].[tbl_userpassword] ([UID], [UserID], [UserName], [Password], [IsActive]) VALUES (17, 18, N'EMP-000018', N'jT7UHNvd', 1)
INSERT [dbo].[tbl_userpassword] ([UID], [UserID], [UserName], [Password], [IsActive]) VALUES (18, 19, N'EMP-000019', N'2TiSVYmQ', 1)
INSERT [dbo].[tbl_userpassword] ([UID], [UserID], [UserName], [Password], [IsActive]) VALUES (1006, 1008, N'EMP-000020', N'UbX0oYt8', 1)
INSERT [dbo].[tbl_userpassword] ([UID], [UserID], [UserName], [Password], [IsActive]) VALUES (1007, 1009, N'EMP-000021', N'erLrqWiJ', 1)
INSERT [dbo].[tbl_userpassword] ([UID], [UserID], [UserName], [Password], [IsActive]) VALUES (1008, 1010, N'EMP-000022', N'9bKZnoz1', 1)
INSERT [dbo].[tbl_userpassword] ([UID], [UserID], [UserName], [Password], [IsActive]) VALUES (2008, 2010, N'EMP-000023', N'r4qdsVsD', 1)
INSERT [dbo].[tbl_userpassword] ([UID], [UserID], [UserName], [Password], [IsActive]) VALUES (2009, 2011, N'EMP-000024', N'97e0dxxp', 1)
INSERT [dbo].[tbl_userpassword] ([UID], [UserID], [UserName], [Password], [IsActive]) VALUES (2010, 2012, N'EMP-000025', N'8B0Go8uY', 1)
INSERT [dbo].[tbl_userpassword] ([UID], [UserID], [UserName], [Password], [IsActive]) VALUES (2011, 2013, N'EMP-000026', N'az9HrFZx', 1)
INSERT [dbo].[tbl_userpassword] ([UID], [UserID], [UserName], [Password], [IsActive]) VALUES (2012, 2014, N'EMP-000027', N'dJTnx4Vx', 1)
INSERT [dbo].[tbl_userpassword] ([UID], [UserID], [UserName], [Password], [IsActive]) VALUES (2013, 2015, N'EMP-000028', N'NP5fGq5x', 1)
INSERT [dbo].[tbl_userpassword] ([UID], [UserID], [UserName], [Password], [IsActive]) VALUES (2014, 2016, N'EMP-000029', N'Ho5kh76d', 1)
INSERT [dbo].[tbl_userpassword] ([UID], [UserID], [UserName], [Password], [IsActive]) VALUES (2015, 2017, N'EMP-000030', N'ouiPXfag', 1)
INSERT [dbo].[tbl_userpassword] ([UID], [UserID], [UserName], [Password], [IsActive]) VALUES (2016, 2018, N'EMP-000031', N'363qR3YF', 1)
INSERT [dbo].[tbl_userpassword] ([UID], [UserID], [UserName], [Password], [IsActive]) VALUES (2017, 2019, N'EMP-000032', N'zvBM17mE', 1)
INSERT [dbo].[tbl_userpassword] ([UID], [UserID], [UserName], [Password], [IsActive]) VALUES (2018, 2020, N'EMP-000033', N'99DwjYSM', 1)
INSERT [dbo].[tbl_userpassword] ([UID], [UserID], [UserName], [Password], [IsActive]) VALUES (2019, 2021, N'EMP-000034', N'Px86B4QO', 1)
SET IDENTITY_INSERT [dbo].[tbl_userpassword] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_UserRegistration] ON 

INSERT [dbo].[Tbl_UserRegistration] ([UID], [EMPNO], [FirstName], [LastName], [Password], [Detail], [RegistrationDate], [RoleID], [Gender], [DOB], [EmailID], [MobileNo], [CurrentAddress], [PermanentAddress], [UserImage], [UserImagePath], [CountryID], [StateID], [CityID], [DepartmentID], [DesignationID], [IsActive], [IsLockedAccount], [LoginAttempted], [IsChangedDefaultPassword], [IsAttemptedPassword], [UserType], [LocationZoneID], [IsAuthenticated], [IsAuthorized], [DocFileUpload], [IsApprovedThroughEmailID], [DocFileName]) VALUES (1, N'EMP-000001', N'Santosh', N'Kumar', N'santosh@1', N'Testing project', CAST(N'2023-06-09T00:10:18.600' AS DateTime), 2, N'Male', CAST(N'2023-07-11T00:00:00.000' AS DateTime), N'sgupta.gupta7@gmail.com', N'8521454545', NULL, NULL, N'kinjal.jpg', N'~/Account/UserUploadImages/kinjal.jpg', 1, 4, 4, 5, 6, 1, NULL, NULL, 1, NULL, NULL, 2, 1, 1, N'~/Account/DocFileUpload/AdminDetail.txt', 1, N'Profile.txt')
INSERT [dbo].[Tbl_UserRegistration] ([UID], [EMPNO], [FirstName], [LastName], [Password], [Detail], [RegistrationDate], [RoleID], [Gender], [DOB], [EmailID], [MobileNo], [CurrentAddress], [PermanentAddress], [UserImage], [UserImagePath], [CountryID], [StateID], [CityID], [DepartmentID], [DesignationID], [IsActive], [IsLockedAccount], [LoginAttempted], [IsChangedDefaultPassword], [IsAttemptedPassword], [UserType], [LocationZoneID], [IsAuthenticated], [IsAuthorized], [DocFileUpload], [IsApprovedThroughEmailID], [DocFileName]) VALUES (2, N'EMP-000002', N'Manish', N'Singh', N'Manish@1', N'testing manish', CAST(N'2023-06-09T00:57:38.303' AS DateTime), 3, N'Male', CAST(N'2023-07-11T00:00:00.000' AS DateTime), N'sgupta.gupta7@gmail.com', N'8521454545', NULL, NULL, N'kinjal.jpg', N'~/Account/UserUploadImages/kinjal.jpg', 1, 4, 4, 5, 6, 1, NULL, NULL, 1, NULL, NULL, 2, 1, 1, N'~/Account/DocFileUpload/AdminDetail.txt', 1, N'Profile.txt')
INSERT [dbo].[Tbl_UserRegistration] ([UID], [EMPNO], [FirstName], [LastName], [Password], [Detail], [RegistrationDate], [RoleID], [Gender], [DOB], [EmailID], [MobileNo], [CurrentAddress], [PermanentAddress], [UserImage], [UserImagePath], [CountryID], [StateID], [CityID], [DepartmentID], [DesignationID], [IsActive], [IsLockedAccount], [LoginAttempted], [IsChangedDefaultPassword], [IsAttemptedPassword], [UserType], [LocationZoneID], [IsAuthenticated], [IsAuthorized], [DocFileUpload], [IsApprovedThroughEmailID], [DocFileName]) VALUES (3, N'EMP-000003', N'Ashok', N'Kumar', N'ashok', N'Testing Ashok Address', CAST(N'2023-06-18T01:20:25.283' AS DateTime), 2, N'Male', CAST(N'2023-07-11T00:00:00.000' AS DateTime), N'sgupta.gupta7@gmail.com', N'8521454545', NULL, NULL, N'kinjal.jpg', N'~/Account/UserUploadImages/kinjal.jpg', 1, 4, 4, 5, 6, 1, NULL, NULL, 1, NULL, NULL, 2, 1, 1, N'~/Account/DocFileUpload/AdminDetail.txt', 1, N'Profile.txt')
INSERT [dbo].[Tbl_UserRegistration] ([UID], [EMPNO], [FirstName], [LastName], [Password], [Detail], [RegistrationDate], [RoleID], [Gender], [DOB], [EmailID], [MobileNo], [CurrentAddress], [PermanentAddress], [UserImage], [UserImagePath], [CountryID], [StateID], [CityID], [DepartmentID], [DesignationID], [IsActive], [IsLockedAccount], [LoginAttempted], [IsChangedDefaultPassword], [IsAttemptedPassword], [UserType], [LocationZoneID], [IsAuthenticated], [IsAuthorized], [DocFileUpload], [IsApprovedThroughEmailID], [DocFileName]) VALUES (4, N'EMP-000004', N'testing', N'test', N'test', N'testing', CAST(N'2023-06-18T17:40:36.030' AS DateTime), 4, N'Male', CAST(N'2023-07-11T00:00:00.000' AS DateTime), N'sgupta.gupta7@gmail.com', N'8521454545', NULL, NULL, N'kinjal.jpg', N'~/Account/UserUploadImages/kinjal.jpg', 1, 4, 4, 5, 6, 1, NULL, NULL, 1, NULL, NULL, 2, 1, 1, N'~/Account/DocFileUpload/AdminDetail.txt', 1, N'Profile.txt')
INSERT [dbo].[Tbl_UserRegistration] ([UID], [EMPNO], [FirstName], [LastName], [Password], [Detail], [RegistrationDate], [RoleID], [Gender], [DOB], [EmailID], [MobileNo], [CurrentAddress], [PermanentAddress], [UserImage], [UserImagePath], [CountryID], [StateID], [CityID], [DepartmentID], [DesignationID], [IsActive], [IsLockedAccount], [LoginAttempted], [IsChangedDefaultPassword], [IsAttemptedPassword], [UserType], [LocationZoneID], [IsAuthenticated], [IsAuthorized], [DocFileUpload], [IsApprovedThroughEmailID], [DocFileName]) VALUES (5, N'EMP-000005', N'emptest', N'test', N'4a5AYELK', N'testet', CAST(N'2023-06-18T19:43:44.553' AS DateTime), 13, N'Male', CAST(N'2023-07-11T00:00:00.000' AS DateTime), N'sgupta.gupta7@gmail.com', N'8521454545', NULL, NULL, N'kinjal.jpg', N'~/Account/UserUploadImages/kinjal.jpg', 1, 4, 4, 5, 6, 1, NULL, NULL, 1, NULL, NULL, 1, 1, 1, N'~/Account/DocFileUpload/AdminDetail.txt', 1, N'Profile.txt')
INSERT [dbo].[Tbl_UserRegistration] ([UID], [EMPNO], [FirstName], [LastName], [Password], [Detail], [RegistrationDate], [RoleID], [Gender], [DOB], [EmailID], [MobileNo], [CurrentAddress], [PermanentAddress], [UserImage], [UserImagePath], [CountryID], [StateID], [CityID], [DepartmentID], [DesignationID], [IsActive], [IsLockedAccount], [LoginAttempted], [IsChangedDefaultPassword], [IsAttemptedPassword], [UserType], [LocationZoneID], [IsAuthenticated], [IsAuthorized], [DocFileUpload], [IsApprovedThroughEmailID], [DocFileName]) VALUES (6, N'EMP-000006', N'document', N'docfile', N'XQ9ubtQx', N'tests', CAST(N'2023-06-18T23:50:50.237' AS DateTime), 7, N'Male', CAST(N'2023-07-11T00:00:00.000' AS DateTime), N'sgupta.gupta7@gmail.com', N'8521454545', NULL, NULL, N'kinjal.jpg', N'~/Account/UserUploadImages/kinjal.jpg', 1, 4, 4, 5, 6, 1, NULL, 0, 1, NULL, NULL, 3, 1, 1, N'~/Account/DocFileUpload/AdminDetail.txt', 1, N'Profile.txt')
INSERT [dbo].[Tbl_UserRegistration] ([UID], [EMPNO], [FirstName], [LastName], [Password], [Detail], [RegistrationDate], [RoleID], [Gender], [DOB], [EmailID], [MobileNo], [CurrentAddress], [PermanentAddress], [UserImage], [UserImagePath], [CountryID], [StateID], [CityID], [DepartmentID], [DesignationID], [IsActive], [IsLockedAccount], [LoginAttempted], [IsChangedDefaultPassword], [IsAttemptedPassword], [UserType], [LocationZoneID], [IsAuthenticated], [IsAuthorized], [DocFileUpload], [IsApprovedThroughEmailID], [DocFileName]) VALUES (7, N'EMP-000007', N'Priyansh', N'Gupta', N'Priyansh@1', N'PriyanshDetail saved', CAST(N'2023-06-21T00:41:17.260' AS DateTime), 1, N'Male', CAST(N'2023-07-11T00:00:00.000' AS DateTime), N'sgupta.gupta7@gmail.com', N'8521454545', NULL, NULL, N'kinjal.jpg', N'~/Account/UserUploadImages/kinjal.jpg', 1, 4, 4, 5, 6, 1, NULL, 0, 1, NULL, NULL, 2, 1, 1, N'~/Account/DocFileUpload/connect JF.txt', 1, N'Profile.txt')
INSERT [dbo].[Tbl_UserRegistration] ([UID], [EMPNO], [FirstName], [LastName], [Password], [Detail], [RegistrationDate], [RoleID], [Gender], [DOB], [EmailID], [MobileNo], [CurrentAddress], [PermanentAddress], [UserImage], [UserImagePath], [CountryID], [StateID], [CityID], [DepartmentID], [DesignationID], [IsActive], [IsLockedAccount], [LoginAttempted], [IsChangedDefaultPassword], [IsAttemptedPassword], [UserType], [LocationZoneID], [IsAuthenticated], [IsAuthorized], [DocFileUpload], [IsApprovedThroughEmailID], [DocFileName]) VALUES (8, N'EMP-000008', N'Thursday', N'Today', N'hHQW4UzO', N'test', CAST(N'2023-06-22T19:39:54.613' AS DateTime), 12, N'Male', CAST(N'2023-07-11T00:00:00.000' AS DateTime), N'sgupta.gupta7@gmail.com', N'8521454545', NULL, NULL, N'kinjal.jpg', N'~/Account/UserUploadImages/kinjal.jpg', 1, 4, 4, 5, 6, 1, NULL, 0, 1, NULL, NULL, 4, 0, 0, N'~/Account/DocFileUpload/connect JF.txt', 1, N'Profile.txt')
INSERT [dbo].[Tbl_UserRegistration] ([UID], [EMPNO], [FirstName], [LastName], [Password], [Detail], [RegistrationDate], [RoleID], [Gender], [DOB], [EmailID], [MobileNo], [CurrentAddress], [PermanentAddress], [UserImage], [UserImagePath], [CountryID], [StateID], [CityID], [DepartmentID], [DesignationID], [IsActive], [IsLockedAccount], [LoginAttempted], [IsChangedDefaultPassword], [IsAttemptedPassword], [UserType], [LocationZoneID], [IsAuthenticated], [IsAuthorized], [DocFileUpload], [IsApprovedThroughEmailID], [DocFileName]) VALUES (9, N'EMP-000009', N'teststst', N'tstsets', N'NwTX2KCs', N'sfsdfs', CAST(N'2023-06-22T20:16:06.060' AS DateTime), 12, N'Male', CAST(N'2023-07-11T00:00:00.000' AS DateTime), N'sgupta.gupta7@gmail.com', N'8521454545', NULL, NULL, N'kinjal.jpg', N'~/Account/UserUploadImages/kinjal.jpg', 1, 4, 4, 5, 6, 1, NULL, 0, 1, NULL, NULL, 1, 0, 0, N'~/Account/DocFileUpload/AdminDetail.txt', 1, N'Profile.txt')
INSERT [dbo].[Tbl_UserRegistration] ([UID], [EMPNO], [FirstName], [LastName], [Password], [Detail], [RegistrationDate], [RoleID], [Gender], [DOB], [EmailID], [MobileNo], [CurrentAddress], [PermanentAddress], [UserImage], [UserImagePath], [CountryID], [StateID], [CityID], [DepartmentID], [DesignationID], [IsActive], [IsLockedAccount], [LoginAttempted], [IsChangedDefaultPassword], [IsAttemptedPassword], [UserType], [LocationZoneID], [IsAuthenticated], [IsAuthorized], [DocFileUpload], [IsApprovedThroughEmailID], [DocFileName]) VALUES (10, N'EMP-000010', N'testststddggg', N'tstsets', N'q54WKJx8', N'sfsdfs', CAST(N'2023-06-22T20:18:26.377' AS DateTime), 12, N'Male', CAST(N'2023-07-11T00:00:00.000' AS DateTime), N'sgupta.gupta7@gmail.com', N'8521454545', NULL, NULL, N'kinjal.jpg', N'~/Account/UserUploadImages/kinjal.jpg', 1, 4, 4, 5, 6, 1, NULL, 0, 1, NULL, NULL, 1, 0, 0, N'~/Account/DocFileUpload/connect JF.txt', 1, N'Profile.txt')
INSERT [dbo].[Tbl_UserRegistration] ([UID], [EMPNO], [FirstName], [LastName], [Password], [Detail], [RegistrationDate], [RoleID], [Gender], [DOB], [EmailID], [MobileNo], [CurrentAddress], [PermanentAddress], [UserImage], [UserImagePath], [CountryID], [StateID], [CityID], [DepartmentID], [DesignationID], [IsActive], [IsLockedAccount], [LoginAttempted], [IsChangedDefaultPassword], [IsAttemptedPassword], [UserType], [LocationZoneID], [IsAuthenticated], [IsAuthorized], [DocFileUpload], [IsApprovedThroughEmailID], [DocFileName]) VALUES (11, N'EMP-000011', N'ttttt', N'gdgg', N'y5Womx8M', N'testt', CAST(N'2023-06-22T23:25:40.150' AS DateTime), 12, N'Male', CAST(N'2023-07-11T00:00:00.000' AS DateTime), N'sgupta.gupta7@gmail.com', N'8521454545', NULL, NULL, N'kinjal.jpg', N'~/Account/UserUploadImages/kinjal.jpg', 1, 4, 4, 5, 6, 1, NULL, 0, 1, NULL, NULL, 2, 0, 0, N'~/Account/DocFileUpload/testingDocFile.doc', 1, N'Profile.txt')
INSERT [dbo].[Tbl_UserRegistration] ([UID], [EMPNO], [FirstName], [LastName], [Password], [Detail], [RegistrationDate], [RoleID], [Gender], [DOB], [EmailID], [MobileNo], [CurrentAddress], [PermanentAddress], [UserImage], [UserImagePath], [CountryID], [StateID], [CityID], [DepartmentID], [DesignationID], [IsActive], [IsLockedAccount], [LoginAttempted], [IsChangedDefaultPassword], [IsAttemptedPassword], [UserType], [LocationZoneID], [IsAuthenticated], [IsAuthorized], [DocFileUpload], [IsApprovedThroughEmailID], [DocFileName]) VALUES (12, N'EMP-000012', N'EmailTesting', N'testing', N'f6zMadDo', N'testst', CAST(N'2023-06-23T23:20:59.990' AS DateTime), 12, N'Male', CAST(N'2023-07-11T00:00:00.000' AS DateTime), N'sgupta.gupta7@gmail.com', N'8521454545', NULL, NULL, N'kinjal.jpg', N'~/Account/UserUploadImages/kinjal.jpg', 1, 4, 4, 5, 6, 1, NULL, 0, 1, NULL, NULL, 1, 0, 0, N'~/Account/DocFileUpload/testingDocFile.doc', 1, N'Profile.txt')
INSERT [dbo].[Tbl_UserRegistration] ([UID], [EMPNO], [FirstName], [LastName], [Password], [Detail], [RegistrationDate], [RoleID], [Gender], [DOB], [EmailID], [MobileNo], [CurrentAddress], [PermanentAddress], [UserImage], [UserImagePath], [CountryID], [StateID], [CityID], [DepartmentID], [DesignationID], [IsActive], [IsLockedAccount], [LoginAttempted], [IsChangedDefaultPassword], [IsAttemptedPassword], [UserType], [LocationZoneID], [IsAuthenticated], [IsAuthorized], [DocFileUpload], [IsApprovedThroughEmailID], [DocFileName]) VALUES (13, N'EMP-000013', N'testst', N'test', N'QbdZMKh5', N'tstt', CAST(N'2023-06-23T23:29:48.147' AS DateTime), 12, N'Male', CAST(N'2023-07-11T00:00:00.000' AS DateTime), N'sgupta.gupta7@gmail.com', N'8521454545', NULL, NULL, N'kinjal.jpg', N'~/Account/UserUploadImages/kinjal.jpg', 1, 4, 4, 5, 6, 1, NULL, 0, 1, NULL, NULL, 2, 0, 0, N'~/Account/DocFileUpload/testingDocFile.doc', 1, N'Profile.txt')
INSERT [dbo].[Tbl_UserRegistration] ([UID], [EMPNO], [FirstName], [LastName], [Password], [Detail], [RegistrationDate], [RoleID], [Gender], [DOB], [EmailID], [MobileNo], [CurrentAddress], [PermanentAddress], [UserImage], [UserImagePath], [CountryID], [StateID], [CityID], [DepartmentID], [DesignationID], [IsActive], [IsLockedAccount], [LoginAttempted], [IsChangedDefaultPassword], [IsAttemptedPassword], [UserType], [LocationZoneID], [IsAuthenticated], [IsAuthorized], [DocFileUpload], [IsApprovedThroughEmailID], [DocFileName]) VALUES (14, N'EMP-000014', N'today', N'testing', N'OuAMaaHK', N'fsdfs', CAST(N'2023-06-23T23:35:16.387' AS DateTime), 12, N'Male', CAST(N'2023-07-11T00:00:00.000' AS DateTime), N'sgupta.gupta7@gmail.com', N'8521454545', NULL, NULL, N'kinjal.jpg', N'~/Account/UserUploadImages/kinjal.jpg', 1, 4, 4, 5, 6, 1, NULL, 0, 1, NULL, NULL, 1, 0, 0, N'~/Account/DocFileUpload/testingDocFile.doc', 1, N'Profile.txt')
INSERT [dbo].[Tbl_UserRegistration] ([UID], [EMPNO], [FirstName], [LastName], [Password], [Detail], [RegistrationDate], [RoleID], [Gender], [DOB], [EmailID], [MobileNo], [CurrentAddress], [PermanentAddress], [UserImage], [UserImagePath], [CountryID], [StateID], [CityID], [DepartmentID], [DesignationID], [IsActive], [IsLockedAccount], [LoginAttempted], [IsChangedDefaultPassword], [IsAttemptedPassword], [UserType], [LocationZoneID], [IsAuthenticated], [IsAuthorized], [DocFileUpload], [IsApprovedThroughEmailID], [DocFileName]) VALUES (15, N'EMP-000015', N'again testing', N'testin', N'1Oh6L4p0', N'sdfsf', CAST(N'2023-06-23T23:44:12.863' AS DateTime), 12, N'Male', CAST(N'2023-07-11T00:00:00.000' AS DateTime), N'sgupta.gupta7@gmail.com', N'8521454545', NULL, NULL, N'kinjal.jpg', N'~/Account/UserUploadImages/kinjal.jpg', 1, 4, 4, 5, 6, 1, NULL, 0, 1, NULL, NULL, 1, 0, 0, N'~/Account/DocFileUpload/testingDocFile.doc', 1, N'Profile.txt')
INSERT [dbo].[Tbl_UserRegistration] ([UID], [EMPNO], [FirstName], [LastName], [Password], [Detail], [RegistrationDate], [RoleID], [Gender], [DOB], [EmailID], [MobileNo], [CurrentAddress], [PermanentAddress], [UserImage], [UserImagePath], [CountryID], [StateID], [CityID], [DepartmentID], [DesignationID], [IsActive], [IsLockedAccount], [LoginAttempted], [IsChangedDefaultPassword], [IsAttemptedPassword], [UserType], [LocationZoneID], [IsAuthenticated], [IsAuthorized], [DocFileUpload], [IsApprovedThroughEmailID], [DocFileName]) VALUES (16, N'EMP-000016', N'next testing', N'test', N'be1gRqMH', N'tsetst', CAST(N'2023-06-23T23:57:12.673' AS DateTime), 12, N'Male', CAST(N'2023-07-11T00:00:00.000' AS DateTime), N'sgupta.gupta7@gmail.com', N'8521454545', NULL, NULL, N'kinjal.jpg', N'~/Account/UserUploadImages/kinjal.jpg', 1, 4, 4, 5, 6, 1, NULL, 0, 1, NULL, NULL, 1, 0, 0, N'~/Account/DocFileUpload/testingDocFile.doc', 1, N'Profile.txt')
INSERT [dbo].[Tbl_UserRegistration] ([UID], [EMPNO], [FirstName], [LastName], [Password], [Detail], [RegistrationDate], [RoleID], [Gender], [DOB], [EmailID], [MobileNo], [CurrentAddress], [PermanentAddress], [UserImage], [UserImagePath], [CountryID], [StateID], [CityID], [DepartmentID], [DesignationID], [IsActive], [IsLockedAccount], [LoginAttempted], [IsChangedDefaultPassword], [IsAttemptedPassword], [UserType], [LocationZoneID], [IsAuthenticated], [IsAuthorized], [DocFileUpload], [IsApprovedThroughEmailID], [DocFileName]) VALUES (17, N'EMP-000017', N'sdfsdf', N'sfsdf', N'1jjKNA5o', N'tset', CAST(N'2023-06-24T00:20:05.187' AS DateTime), 12, N'Male', CAST(N'2023-07-11T00:00:00.000' AS DateTime), N'sgupta.gupta7@gmail.com', N'8521454545', NULL, NULL, N'kinjal.jpg', N'~/Account/UserUploadImages/kinjal.jpg', 1, 4, 4, 5, 6, 1, NULL, 0, 1, NULL, NULL, 1, 0, 0, N'~/Account/DocFileUpload/testingDocFile.doc', 1, N'Profile.txt')
INSERT [dbo].[Tbl_UserRegistration] ([UID], [EMPNO], [FirstName], [LastName], [Password], [Detail], [RegistrationDate], [RoleID], [Gender], [DOB], [EmailID], [MobileNo], [CurrentAddress], [PermanentAddress], [UserImage], [UserImagePath], [CountryID], [StateID], [CityID], [DepartmentID], [DesignationID], [IsActive], [IsLockedAccount], [LoginAttempted], [IsChangedDefaultPassword], [IsAttemptedPassword], [UserType], [LocationZoneID], [IsAuthenticated], [IsAuthorized], [DocFileUpload], [IsApprovedThroughEmailID], [DocFileName]) VALUES (18, N'EMP-000018', N'test', N'fsdf', N'jT7UHNvd', N'fsdfa', CAST(N'2023-06-24T00:23:39.953' AS DateTime), 12, N'Male', CAST(N'2023-07-11T00:00:00.000' AS DateTime), N'sgupta.gupta7@gmail.com', N'8521454545', NULL, NULL, N'kinjal.jpg', N'~/Account/UserUploadImages/kinjal.jpg', 1, 4, 4, 5, 6, 1, NULL, 0, 1, NULL, NULL, 1, 0, 0, N'~/Account/DocFileUpload/testingDocFile.doc', 1, N'Profile.txt')
INSERT [dbo].[Tbl_UserRegistration] ([UID], [EMPNO], [FirstName], [LastName], [Password], [Detail], [RegistrationDate], [RoleID], [Gender], [DOB], [EmailID], [MobileNo], [CurrentAddress], [PermanentAddress], [UserImage], [UserImagePath], [CountryID], [StateID], [CityID], [DepartmentID], [DesignationID], [IsActive], [IsLockedAccount], [LoginAttempted], [IsChangedDefaultPassword], [IsAttemptedPassword], [UserType], [LocationZoneID], [IsAuthenticated], [IsAuthorized], [DocFileUpload], [IsApprovedThroughEmailID], [DocFileName]) VALUES (19, N'EMP-000019', N'capta', N'test', N'2TiSVYmQ', N'fsfsa', CAST(N'2023-06-24T01:05:47.097' AS DateTime), 12, N'Male', CAST(N'2023-07-11T00:00:00.000' AS DateTime), N'sgupta.gupta7@gmail.com', N'8521454545', NULL, NULL, N'kinjal.jpg', N'~/Account/UserUploadImages/kinjal.jpg', 1, 4, 4, 5, 6, 1, NULL, 0, 1, NULL, NULL, 1, 0, 0, N'~/Account/DocFileUpload/testingDocFile.doc', 1, N'Profile.txt')
INSERT [dbo].[Tbl_UserRegistration] ([UID], [EMPNO], [FirstName], [LastName], [Password], [Detail], [RegistrationDate], [RoleID], [Gender], [DOB], [EmailID], [MobileNo], [CurrentAddress], [PermanentAddress], [UserImage], [UserImagePath], [CountryID], [StateID], [CityID], [DepartmentID], [DesignationID], [IsActive], [IsLockedAccount], [LoginAttempted], [IsChangedDefaultPassword], [IsAttemptedPassword], [UserType], [LocationZoneID], [IsAuthenticated], [IsAuthorized], [DocFileUpload], [IsApprovedThroughEmailID], [DocFileName]) VALUES (1008, N'EMP-000020', N'test3july', N'testing', N'UbX0oYt8', N'tests', CAST(N'2023-07-04T01:24:42.270' AS DateTime), 12, N'Female', CAST(N'2023-07-11T00:00:00.000' AS DateTime), N'sgupta.gupta7@gmail.com', N'8521454545', NULL, NULL, N'kinjal.jpg', N'~/Account/UserUploadImages/kinjal.jpg', 1, 4, 4, 5, 6, 1, NULL, 0, 1, NULL, NULL, 2, 0, 0, N'~/Account/DocFileUpload/testingDocFile.doc', 1, NULL)
INSERT [dbo].[Tbl_UserRegistration] ([UID], [EMPNO], [FirstName], [LastName], [Password], [Detail], [RegistrationDate], [RoleID], [Gender], [DOB], [EmailID], [MobileNo], [CurrentAddress], [PermanentAddress], [UserImage], [UserImagePath], [CountryID], [StateID], [CityID], [DepartmentID], [DesignationID], [IsActive], [IsLockedAccount], [LoginAttempted], [IsChangedDefaultPassword], [IsAttemptedPassword], [UserType], [LocationZoneID], [IsAuthenticated], [IsAuthorized], [DocFileUpload], [IsApprovedThroughEmailID], [DocFileName]) VALUES (1009, N'EMP-000021', N'errorlog testing', N'testing', N'erLrqWiJ', N'', CAST(N'2023-07-04T02:09:12.680' AS DateTime), 12, N'Female', CAST(N'2023-07-11T00:00:00.000' AS DateTime), N'sgupta.gupta7@gmail.com', N'8521454545', NULL, NULL, N'kinjal.jpg', N'~/Account/UserUploadImages/kinjal.jpg', 1, 4, 4, 5, 6, 1, NULL, 0, 1, NULL, NULL, 2, 0, 0, N'~/Account/DocFileUpload/testingDocFile.doc', 1, N'testingDocFile.doc')
INSERT [dbo].[Tbl_UserRegistration] ([UID], [EMPNO], [FirstName], [LastName], [Password], [Detail], [RegistrationDate], [RoleID], [Gender], [DOB], [EmailID], [MobileNo], [CurrentAddress], [PermanentAddress], [UserImage], [UserImagePath], [CountryID], [StateID], [CityID], [DepartmentID], [DesignationID], [IsActive], [IsLockedAccount], [LoginAttempted], [IsChangedDefaultPassword], [IsAttemptedPassword], [UserType], [LocationZoneID], [IsAuthenticated], [IsAuthorized], [DocFileUpload], [IsApprovedThroughEmailID], [DocFileName]) VALUES (1010, N'EMP-000022', N'skumar', N'gupta', N'9bKZnoz1', N'sdfasd', CAST(N'2023-07-17T00:35:42.463' AS DateTime), 12, N'Female', CAST(N'2023-07-11T00:00:00.000' AS DateTime), N'sgupta.gupta7@gmail.com', N'8521454545', NULL, NULL, N'kinjal.jpg', N'~/Account/UserUploadImages/kinjal.jpg', 1, 4, 4, 5, 6, 1, NULL, 0, 1, NULL, NULL, 1, 0, 0, N'~/Account/DocFileUpload/testingDocFile.doc', 1, N'testingDocFile.doc')
INSERT [dbo].[Tbl_UserRegistration] ([UID], [EMPNO], [FirstName], [LastName], [Password], [Detail], [RegistrationDate], [RoleID], [Gender], [DOB], [EmailID], [MobileNo], [CurrentAddress], [PermanentAddress], [UserImage], [UserImagePath], [CountryID], [StateID], [CityID], [DepartmentID], [DesignationID], [IsActive], [IsLockedAccount], [LoginAttempted], [IsChangedDefaultPassword], [IsAttemptedPassword], [UserType], [LocationZoneID], [IsAuthenticated], [IsAuthorized], [DocFileUpload], [IsApprovedThroughEmailID], [DocFileName]) VALUES (2010, N'EMP-000023', N'ttttt', N'ttt', N'r4qdsVsD', N'', CAST(N'2023-07-23T23:19:21.617' AS DateTime), 12, N'Male', CAST(N'2023-07-23T23:19:07.573' AS DateTime), N'sgupta.gupta7@gmail.com', N'8521454545', NULL, NULL, NULL, NULL, 1, 2, 2, 2, 2, 1, NULL, 0, 1, NULL, NULL, 2, 0, 0, NULL, 1, NULL)
INSERT [dbo].[Tbl_UserRegistration] ([UID], [EMPNO], [FirstName], [LastName], [Password], [Detail], [RegistrationDate], [RoleID], [Gender], [DOB], [EmailID], [MobileNo], [CurrentAddress], [PermanentAddress], [UserImage], [UserImagePath], [CountryID], [StateID], [CityID], [DepartmentID], [DesignationID], [IsActive], [IsLockedAccount], [LoginAttempted], [IsChangedDefaultPassword], [IsAttemptedPassword], [UserType], [LocationZoneID], [IsAuthenticated], [IsAuthorized], [DocFileUpload], [IsApprovedThroughEmailID], [DocFileName]) VALUES (2011, N'EMP-000024', N'sdfsfsdf', N'fsdfsdf', N'97e0dxxp', N'sdfsa', CAST(N'2023-07-24T00:17:10.707' AS DateTime), 12, N'Male', CAST(N'2023-07-24T00:16:44.013' AS DateTime), N'sgupta.gupta7@gmail.com', N'8521454545', NULL, NULL, N'kinjal.jpg', N'~/Account/UserUploadImages/kinjal.jpg', 1, 2, 2, 2, 2, 1, NULL, 0, 1, NULL, NULL, 2, 0, 0, N'~/Account/DocFileUpload/testingDocFile.doc', 1, N'testingDocFile.doc')
INSERT [dbo].[Tbl_UserRegistration] ([UID], [EMPNO], [FirstName], [LastName], [Password], [Detail], [RegistrationDate], [RoleID], [Gender], [DOB], [EmailID], [MobileNo], [CurrentAddress], [PermanentAddress], [UserImage], [UserImagePath], [CountryID], [StateID], [CityID], [DepartmentID], [DesignationID], [IsActive], [IsLockedAccount], [LoginAttempted], [IsChangedDefaultPassword], [IsAttemptedPassword], [UserType], [LocationZoneID], [IsAuthenticated], [IsAuthorized], [DocFileUpload], [IsApprovedThroughEmailID], [DocFileName]) VALUES (2012, N'EMP-000025', N'ttttt', N'tttt', N'8B0Go8uY', N'fdsfas', CAST(N'2023-07-24T19:06:11.487' AS DateTime), 12, N'Male', CAST(N'2023-07-17T00:00:00.000' AS DateTime), N'sgupta.gupta7@gmail.com', N'8521454545', NULL, NULL, N'Birds.jpg', N'~/Account/UserUploadImages/Birds.jpg', 1, 2, 2, 2, 2, 1, NULL, 0, 1, NULL, NULL, 4, 0, 0, N'~/Account/DocFileUpload/welcome.doc', 1, N'welcome.doc')
INSERT [dbo].[Tbl_UserRegistration] ([UID], [EMPNO], [FirstName], [LastName], [Password], [Detail], [RegistrationDate], [RoleID], [Gender], [DOB], [EmailID], [MobileNo], [CurrentAddress], [PermanentAddress], [UserImage], [UserImagePath], [CountryID], [StateID], [CityID], [DepartmentID], [DesignationID], [IsActive], [IsLockedAccount], [LoginAttempted], [IsChangedDefaultPassword], [IsAttemptedPassword], [UserType], [LocationZoneID], [IsAuthenticated], [IsAuthorized], [DocFileUpload], [IsApprovedThroughEmailID], [DocFileName]) VALUES (2013, N'EMP-000026', N'jkjkkjk', N'sdfsggdg', N'az9HrFZx', N'fsadfa', CAST(N'2023-07-24T19:49:02.127' AS DateTime), 12, N'Male', CAST(N'1939-07-02T00:00:00.000' AS DateTime), N'sgupta.gupta7@gmail.com', N'8521454545', N'sdfafsaf', N'sdfsdf', N'kinjal.jpg', N'~/Account/UserUploadImages/kinjal.jpg', 1, 2, 2, 2, 2, 1, NULL, 0, 1, NULL, NULL, 2, 0, 0, N'~/Account/DocFileUpload/welcome.doc', 1, N'welcome.doc')
INSERT [dbo].[Tbl_UserRegistration] ([UID], [EMPNO], [FirstName], [LastName], [Password], [Detail], [RegistrationDate], [RoleID], [Gender], [DOB], [EmailID], [MobileNo], [CurrentAddress], [PermanentAddress], [UserImage], [UserImagePath], [CountryID], [StateID], [CityID], [DepartmentID], [DesignationID], [IsActive], [IsLockedAccount], [LoginAttempted], [IsChangedDefaultPassword], [IsAttemptedPassword], [UserType], [LocationZoneID], [IsAuthenticated], [IsAuthorized], [DocFileUpload], [IsApprovedThroughEmailID], [DocFileName]) VALUES (2014, N'EMP-000027', N'again testing', N'testing', N'dJTnx4Vx', N'ffs', CAST(N'2023-07-25T00:51:55.947' AS DateTime), 12, N'Male', CAST(N'2023-07-13T00:00:00.000' AS DateTime), N'sgupta.gupta7@gmail.com', N'8521454545', N'sfsdf', N'fsdfds', N'kinjal.jpg', N'~/Account/UserUploadImages/kinjal.jpg', 1, 2, 2, 2, 2, 1, NULL, 0, 1, NULL, NULL, 2, 0, 0, N'~/Account/DocFileUpload/testingDocFile.doc', 1, N'testingDocFile.doc')
INSERT [dbo].[Tbl_UserRegistration] ([UID], [EMPNO], [FirstName], [LastName], [Password], [Detail], [RegistrationDate], [RoleID], [Gender], [DOB], [EmailID], [MobileNo], [CurrentAddress], [PermanentAddress], [UserImage], [UserImagePath], [CountryID], [StateID], [CityID], [DepartmentID], [DesignationID], [IsActive], [IsLockedAccount], [LoginAttempted], [IsChangedDefaultPassword], [IsAttemptedPassword], [UserType], [LocationZoneID], [IsAuthenticated], [IsAuthorized], [DocFileUpload], [IsApprovedThroughEmailID], [DocFileName]) VALUES (2015, N'EMP-000028', N'activation', N'testing', N'NP5fGq5x', N'fsf', CAST(N'2023-07-25T01:04:05.997' AS DateTime), 12, N'Male', CAST(N'2023-07-13T00:00:00.000' AS DateTime), N'sgupta.gupta7@gmail.com', N'8521454545', N'dfsd', N'fsdfsdf', N'Birds.jpg', N'~/Account/UserUploadImages/Birds.jpg', 1, 2, 2, 2, 2, 1, NULL, 0, 1, NULL, NULL, 2, 0, 0, N'~/Account/DocFileUpload/welcome.doc', 1, N'welcome.doc')
INSERT [dbo].[Tbl_UserRegistration] ([UID], [EMPNO], [FirstName], [LastName], [Password], [Detail], [RegistrationDate], [RoleID], [Gender], [DOB], [EmailID], [MobileNo], [CurrentAddress], [PermanentAddress], [UserImage], [UserImagePath], [CountryID], [StateID], [CityID], [DepartmentID], [DesignationID], [IsActive], [IsLockedAccount], [LoginAttempted], [IsChangedDefaultPassword], [IsAttemptedPassword], [UserType], [LocationZoneID], [IsAuthenticated], [IsAuthorized], [DocFileUpload], [IsApprovedThroughEmailID], [DocFileName]) VALUES (2016, N'EMP-000029', N'activation', N'testing', N'Ho5kh76d', N'fsf', CAST(N'2023-07-25T01:06:22.203' AS DateTime), 12, N'Male', CAST(N'2023-07-11T00:00:00.000' AS DateTime), N'sgupta.gupta7@gmail.com', N'8521454545', N'dfsd', N'fsdfsdf', N'kinjal.jpg', N'~/Account/UserUploadImages/kinjal.jpg', 1, 2, 2, 2, 2, 1, NULL, 0, 1, NULL, NULL, 2, 0, 0, N'~/Account/DocFileUpload/welcome.doc', 1, N'welcome.doc')
INSERT [dbo].[Tbl_UserRegistration] ([UID], [EMPNO], [FirstName], [LastName], [Password], [Detail], [RegistrationDate], [RoleID], [Gender], [DOB], [EmailID], [MobileNo], [CurrentAddress], [PermanentAddress], [UserImage], [UserImagePath], [CountryID], [StateID], [CityID], [DepartmentID], [DesignationID], [IsActive], [IsLockedAccount], [LoginAttempted], [IsChangedDefaultPassword], [IsAttemptedPassword], [UserType], [LocationZoneID], [IsAuthenticated], [IsAuthorized], [DocFileUpload], [IsApprovedThroughEmailID], [DocFileName]) VALUES (2017, N'EMP-000030', N'activation', N'testing', N'ouiPXfag', N'fsf', CAST(N'2023-07-25T01:08:09.920' AS DateTime), 12, N'Male', CAST(N'2023-07-11T00:00:00.000' AS DateTime), N'sgupta.gupta7@gmail.com', N'8521454545', N'dfsd', N'fsdfsdf', N'Birds.jpg', N'~/Account/UserUploadImages/Birds.jpg', 1, 2, 2, 2, 2, 1, NULL, 0, 1, NULL, NULL, 2, 0, 0, N'~/Account/DocFileUpload/welcome.doc', 1, N'welcome.doc')
INSERT [dbo].[Tbl_UserRegistration] ([UID], [EMPNO], [FirstName], [LastName], [Password], [Detail], [RegistrationDate], [RoleID], [Gender], [DOB], [EmailID], [MobileNo], [CurrentAddress], [PermanentAddress], [UserImage], [UserImagePath], [CountryID], [StateID], [CityID], [DepartmentID], [DesignationID], [IsActive], [IsLockedAccount], [LoginAttempted], [IsChangedDefaultPassword], [IsAttemptedPassword], [UserType], [LocationZoneID], [IsAuthenticated], [IsAuthorized], [DocFileUpload], [IsApprovedThroughEmailID], [DocFileName]) VALUES (2018, N'EMP-000031', N'activation', N'testing', N'363qR3YF', N'fsf', CAST(N'2023-07-25T01:10:44.207' AS DateTime), 12, N'Male', CAST(N'2023-07-11T00:00:00.000' AS DateTime), N'sgupta.gupta7@gmail.com', N'8521454545', N'dfsd', N'fsdfsdf', N'Birds.jpg', N'~/Account/UserUploadImages/Birds.jpg', 1, 2, 2, 2, 2, 1, NULL, 0, 1, NULL, NULL, 2, 0, 0, N'~/Account/DocFileUpload/welcome.doc', 1, N'welcome.doc')
INSERT [dbo].[Tbl_UserRegistration] ([UID], [EMPNO], [FirstName], [LastName], [Password], [Detail], [RegistrationDate], [RoleID], [Gender], [DOB], [EmailID], [MobileNo], [CurrentAddress], [PermanentAddress], [UserImage], [UserImagePath], [CountryID], [StateID], [CityID], [DepartmentID], [DesignationID], [IsActive], [IsLockedAccount], [LoginAttempted], [IsChangedDefaultPassword], [IsAttemptedPassword], [UserType], [LocationZoneID], [IsAuthenticated], [IsAuthorized], [DocFileUpload], [IsApprovedThroughEmailID], [DocFileName]) VALUES (2019, N'EMP-000032', N'activation', N'testing', N'zvBM17mE', N'fsf', CAST(N'2023-07-25T01:11:31.093' AS DateTime), 12, N'Male', CAST(N'2023-07-11T00:00:00.000' AS DateTime), N'sgupta.gupta7@gmail.com', N'8521454545', N'dfsd', N'fsdfsdf', N'Birds.jpg', N'~/Account/UserUploadImages/Birds.jpg', 1, 2, 2, 2, 2, 1, NULL, 0, 1, NULL, NULL, 2, 0, 0, N'~/Account/DocFileUpload/welcome.doc', 1, N'welcome.doc')
INSERT [dbo].[Tbl_UserRegistration] ([UID], [EMPNO], [FirstName], [LastName], [Password], [Detail], [RegistrationDate], [RoleID], [Gender], [DOB], [EmailID], [MobileNo], [CurrentAddress], [PermanentAddress], [UserImage], [UserImagePath], [CountryID], [StateID], [CityID], [DepartmentID], [DesignationID], [IsActive], [IsLockedAccount], [LoginAttempted], [IsChangedDefaultPassword], [IsAttemptedPassword], [UserType], [LocationZoneID], [IsAuthenticated], [IsAuthorized], [DocFileUpload], [IsApprovedThroughEmailID], [DocFileName]) VALUES (2020, N'EMP-000033', N'testing teing', N'fsfs', N'99DwjYSM', N'fsdfs', CAST(N'2023-07-25T01:49:19.067' AS DateTime), 12, N'Male', CAST(N'2023-07-04T00:00:00.000' AS DateTime), N'sgupta.gupta79@gmail.com', N'1425142512', N'dfs', N'tets', N'Birds.jpg', N'~/Account/UserUploadImages/Birds.jpg', 1, 7, 5, 6, 4, 1, NULL, 0, 1, NULL, NULL, 4, 0, 0, N'~/Account/DocFileUpload/welcome.doc', 1, N'welcome.doc')
INSERT [dbo].[Tbl_UserRegistration] ([UID], [EMPNO], [FirstName], [LastName], [Password], [Detail], [RegistrationDate], [RoleID], [Gender], [DOB], [EmailID], [MobileNo], [CurrentAddress], [PermanentAddress], [UserImage], [UserImagePath], [CountryID], [StateID], [CityID], [DepartmentID], [DesignationID], [IsActive], [IsLockedAccount], [LoginAttempted], [IsChangedDefaultPassword], [IsAttemptedPassword], [UserType], [LocationZoneID], [IsAuthenticated], [IsAuthorized], [DocFileUpload], [IsApprovedThroughEmailID], [DocFileName]) VALUES (2021, N'EMP-000034', N'testJuly24', N'fsdfsd', N'Px86B4QO', N'sfsfs', CAST(N'2024-07-21T17:54:45.030' AS DateTime), 12, N'Male', CAST(N'2024-07-17T00:00:00.000' AS DateTime), N'sgupta.gupt88a79@gmail.com', N'5485784585', N'dfsd', N'fsdf', N'img1.jpg', N'~/Account/UserUploadImages/img1.jpg', 1, 2, 2, 2, 3, 1, NULL, 0, 0, NULL, NULL, 2, 0, 0, N'~/Account/DocFileUpload/SANTOSH GUPTA.doc', 0, N'SANTOSH GUPTA.doc')
SET IDENTITY_INSERT [dbo].[Tbl_UserRegistration] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Activati__ED413B8EC9C42267]    Script Date: 7/25/2024 11:30:41 PM ******/
ALTER TABLE [dbo].[ActivationLink] ADD UNIQUE NONCLUSTERED 
(
	[ActivationCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tbl_UserRegistration] ADD  CONSTRAINT [DF_Tbl_UserRegistration_IsApprovedThroughEmailID]  DEFAULT ((0)) FOR [IsApprovedThroughEmailID]
GO
ALTER TABLE [dbo].[ActivationLink]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Tbl_UserRegistration] ([EMPNO])
GO
ALTER TABLE [dbo].[tbl_MainMenu]  WITH CHECK ADD  CONSTRAINT [FK_MainMenu_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[tbl_roles] ([RoleID])
GO
ALTER TABLE [dbo].[tbl_MainMenu] CHECK CONSTRAINT [FK_MainMenu_Roles]
GO
ALTER TABLE [dbo].[tbl_RolePermissions]  WITH CHECK ADD  CONSTRAINT [FK_RolePermission_SubMenu] FOREIGN KEY([SubMenuID])
REFERENCES [dbo].[tbl_submenu] ([SubMenuID])
GO
ALTER TABLE [dbo].[tbl_RolePermissions] CHECK CONSTRAINT [FK_RolePermission_SubMenu]
GO
ALTER TABLE [dbo].[tbl_submenu]  WITH CHECK ADD  CONSTRAINT [FK_SubMenu_MainMenu] FOREIGN KEY([MainMenuID])
REFERENCES [dbo].[tbl_MainMenu] ([MenuID])
GO
ALTER TABLE [dbo].[tbl_submenu] CHECK CONSTRAINT [FK_SubMenu_MainMenu]
GO
/****** Object:  StoredProcedure [dbo].[sp_assignroletousers]    Script Date: 7/25/2024 11:30:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

--exec sp_assignroletousers 'EMP-000001',3,''
CREATE PROCEDURE [dbo].[sp_assignroletousers]

	@EMPNO varchar(10),
	@RoleID int,
	@ERROR VARCHAR(100) OUT
	
	AS
BEGIN 
      SET NOCOUNT ON; 

    -- Insert statements for procedure here
	if not exists (select 1 from tbl_userregistration where EMPNO=@EMPNO and RoleID!=12)
	
	begin
	
	update tbl_userregistration set RoleID=@RoleID,IsAuthorized=1 where EMPNO=@EMPNO 

	-- IsAuthorized=1 -Means- user has registered and got credential i.e. (Login & Password) but not any Role assigned for this any access..
	-- so during the role assigned to user automatically updated into userregistration Table as  IsAuthorized=1 otherwise by default is 0

	
	SET @ERROR=@EMPNO+' Role inserted Successfully'

END

ELSE

BEGIN

SET @ERROR=@EMPNO + ' Already Role assigned to user'

END

END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_createrole]    Script Date: 7/25/2024 11:30:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

--exec sp_createrole 'admin','2023-06-07',1,''
CREATE PROCEDURE [dbo].[sp_createrole]

	@RoleName nvarchar(50),
	@CreatedDate datetime,
	@IsActive int,
	@ERROR VARCHAR(100) OUT
	
	AS
BEGIN 
      SET NOCOUNT ON; 

    -- Insert statements for procedure here
	if not exists (select 1 from tbl_roles where RoleName=@RoleName)
	
	begin
	
	insert into tbl_roles(RoleName,CreatedDate,IsActive)values
	(@RoleName,@CreatedDate,@IsActive)

	
	SET @ERROR=@RoleName+' Role inserted Successfully'

END

ELSE

BEGIN

SET @ERROR=@RoleName + ' Already RoleName Exists'

END

END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_GeGetAllAssignedUsersWithRoleID]    Script Date: 7/25/2024 11:30:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

 --EXEC sp_sp_GetAllUsersForRoleAssign @EMPNO='EMP-000004'

 -- This sp is used for Search by EMPNO or without EMPNO 
 --means all users which is users assigned with roleID(excluding NONE 12)
 --Authenticated & Authorized Employee List:
CREATE PROCEDURE [dbo].[sp_GeGetAllAssignedUsersWithRoleID]
    @EMPNO VARCHAR(10) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @sqlQuery NVARCHAR(MAX) =
    'SELECT DATEDIFF(YEAR, U.DOB, GETDATE()) AS Age, U.UID, U.EMPNO, U.FirstName, U.LastName, U.DOB, U.StateID, U.RoleID,
    U.Detail, U.UserImagePath, CONVERT(VARCHAR, U.RegistrationDate, 103) AS RegistrationDate,
    R.RoleName, U.emailid, U.MobileNo, U.Gender, U.DocFileUpload, U.docfileName, U.IsActive, U.IsAuthenticated, U.IsAuthorized,
    U.IsApprovedThroughEmailID, U.IsChangedDefaultPassword, U.CurrentAddress, U.PermanentAddress,
    CTR.CountryName, STA.StateName, CIT.CityName, DEPT.DepartmentName, DESG.DesignationName, LOC.LocationCodeName
    FROM Tbl_UserRegistration U 
    LEFT JOIN tbl_roles R ON U.RoleID = R.RoleID
    LEFT JOIN tbl_countryName CTR ON U.CountryID = CTR.CountryID
    LEFT JOIN tbl_StateName STA ON U.StateID = STA.StateID
    LEFT JOIN tbl_cityName CIT ON U.CityID = CIT.CityID
    LEFT JOIN tbl_departmentName DEPT ON U.DepartmentID = DEPT.DepartmentID
    LEFT JOIN tbl_designationName DESG ON U.DesignationID = DESG.DesignationID
    LEFT JOIN tbl_locationcodeName LOC ON U.LocationZoneID = LOC.LocationCodeID
    WHERE U.IsChangedDefaultPassword = 1 AND U.IsApprovedThroughEmailID = 1 
	AND U.IsAuthenticated=1 AND U.IsAuthorized=1
	AND U.RoleID != 12 AND U.IsActive = 1 AND U.IsLockedAccount IS NULL';
	--U.IsAuthenticated, U.IsAuthorized added on 2nd July 24

    -- Append EMPNO condition if provided
    IF @EMPNO IS NOT NULL
    BEGIN
        SET @sqlQuery += ' AND U.EMPNO = @EMPNO';
    END;

    EXEC sp_executesql @sqlQuery, N'@EMPNO VARCHAR(10)', @EMPNO;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_getAllCity]    Script Date: 7/25/2024 11:30:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
--exec sp_getAllCity

Create PROCEDURE [dbo].[sp_getAllCity]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select CityID,CityName,Isactive from tbl_cityName(nolock) where IsActive=1
END
GO
/****** Object:  StoredProcedure [dbo].[sp_getAllCountry]    Script Date: 7/25/2024 11:30:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
--exec sp_getAllCountry

CREATE PROCEDURE [dbo].[sp_getAllCountry]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select countryID,CountryName,Isactive from tbl_countryName(nolock) where IsActive=1
END
GO
/****** Object:  StoredProcedure [dbo].[sp_getAllDepartment]    Script Date: 7/25/2024 11:30:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
--exec sp_getAllDepartment

Create PROCEDURE [dbo].[sp_getAllDepartment]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select DepartmentID,DepartmentName,Isactive from tbl_departmentName(nolock) where IsActive=1
END
GO
/****** Object:  StoredProcedure [dbo].[sp_getAllDesignation]    Script Date: 7/25/2024 11:30:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
--exec sp_getAllDesignation

Create PROCEDURE [dbo].[sp_getAllDesignation]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select DesignationID,DesignationName,Isactive from tbl_designationName(nolock) where IsActive=1
END
GO
/****** Object:  StoredProcedure [dbo].[sp_getAllLocationZoen]    Script Date: 7/25/2024 11:30:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
--exec sp_getAllLocationZoen

create PROCEDURE [dbo].[sp_getAllLocationZoen]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select locationcodeID,Locationcodename,Isactive from tbl_locationcodeName(nolock) where IsActive=1
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllMain_sub_Menu]    Script Date: 7/25/2024 11:30:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--exec sp_GetAllMain_sub_Menu

CREATE PROC  [dbo].[sp_GetAllMain_sub_Menu]
 
As    
  Begin
   
 
  SELECT 
    CASE 
        WHEN ROW_NUMBER() OVER (PARTITION BY MM.MenuName ORDER BY SM.SubMenuID) = 1 
        THEN MM.MenuName 
        ELSE NULL 
    END AS MenuName,
    R.RoleName,
    SM.SubMenuID,
    SM.SubMenuName,
    SM.SubMenuUrl,
    SM.SubMenuDescription,
    SM.SubMenuDisplaySequence,
    SM.IsActive,
    SM.MainMenuID,
    SM.RoleID,
    SM.CreatedDate
FROM 
    tbl_submenu SM (NOLOCK)
LEFT JOIN 
    tbl_MainMenu MM ON MM.MenuID = SM.MainMenuID
LEFT JOIN 
    tbl_roles R ON SM.RoleID = R.RoleID
ORDER BY 
    SM.RoleID, MM.MenuName


END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllMainMenu]    Script Date: 7/25/2024 11:30:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
 --exec sp_GetAllMainMenu
create PROCEDURE [dbo].[sp_GetAllMainMenu]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	--SELECT FIrstName+' '+LastName as UserName, * from tbl_userregistration(nolock)
		
select M.MenuID,M.MenuName, m.MenuUrl,m.MenuDescription, m.DisplaySequence,m.CreatedDate,R.RoleName from tbl_mainmenu(noLock) M
left join tbl_roles(nolock) R on
M.RoleID=R.RoleID


END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllMainMenuWithAndWithoutByMainMenuID_OR_RoleID]    Script Date: 7/25/2024 11:30:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
 

 -- Without parameter
--EXEC sp_GetAllMainMenuWithAndWithoutByMainMenuID_OR_RoleID;

-- With parameter
--EXEC sp_GetAllMainMenuWithAndWithoutByMainMenuID_OR_RoleID @MenuID = 2;
--EXEC sp_GetAllMainMenuWithAndWithoutByMainMenuID_OR_RoleID @RoleID = 1;

CREATE PROCEDURE [dbo].[sp_GetAllMainMenuWithAndWithoutByMainMenuID_OR_RoleID]

(
  @MenuID INT = NULL,
  @RoleID INT = NULL
)
AS
BEGIN
  SET NOCOUNT ON;

  IF (@MenuID IS NULL AND @RoleID IS NULL)
  BEGIN
    SELECT 
      MM.Menuid,
      MM.MenuName,
      MM.MenuUrl,
      MM.MenuName + ' -> ' + MM.MenuUrl AS MenunameUrl,
      MM.MenuDescription,
      MM.IsActive,
      MM.DisplaySequence,
      MM.CreatedDate,
      MM.RoleID,
      R.RoleName
    FROM 
      tbl_MainMenu MM (NOLOCK)
    LEFT JOIN    
      tbl_roles R ON MM.RoleID = R.RoleID
    ORDER BY 
      MM.RoleID, MM.MenuName
  END
  ELSE IF (@MenuID IS NOT NULL AND @RoleID IS NULL)
  BEGIN
    SELECT 
      MM.Menuid,
      MM.MenuName,
      MM.MenuUrl,
      MM.MenuName + ' -> ' + MM.MenuUrl AS MenunameUrl,
      MM.MenuDescription,
      MM.IsActive,
      MM.DisplaySequence,
      MM.CreatedDate,
      MM.RoleID,
      R.RoleName
    FROM 
      tbl_MainMenu MM (NOLOCK)
    LEFT JOIN    
      tbl_roles R ON MM.RoleID = R.RoleID
    WHERE
      MM.MenuID = @MenuID
    ORDER BY 
      MM.RoleID, MM.MenuName
  END
  ELSE IF (@MenuID IS NULL AND @RoleID IS NOT NULL)
  BEGIN
    SELECT 
      MM.Menuid,
      MM.MenuName,
      MM.MenuUrl,
      MM.MenuName + ' -> ' + MM.MenuUrl AS MenunameUrl,
      MM.MenuDescription,
      MM.IsActive,
      MM.DisplaySequence,
      MM.CreatedDate,
      MM.RoleID,
      R.RoleName
    FROM 
      tbl_MainMenu MM (NOLOCK)
    LEFT JOIN    
      tbl_roles R ON MM.RoleID = R.RoleID
    WHERE
      MM.RoleID = @RoleID
    ORDER BY 
      MM.RoleID, MM.MenuName
  END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllMainMenuWithAndWithoutByMainMenuID_OR_RoleID_USE_CTE]    Script Date: 7/25/2024 11:30:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
 

 -- Without parameter
--EXEC sp_GetAllMainMenuWithAndWithoutByMainMenuID_OR_RoleID_USE_CTE;

-- With parameter
--EXEC sp_GetAllMainMenuWithAndWithoutByMainMenuID_OR_RoleID_USE_CTE @MenuID = 2;
--EXEC sp_GetAllMainMenuWithAndWithoutByMainMenuID_OR_RoleID_USE_CTE @RoleID = 1;

-- This sp means-  Multiple condition either one of them   

--   This SP is same work and same result.. method is different: sp_GetAllMainMenuWithAndWithoutByMainMenuID_OR_RoleID
CREATE PROCEDURE [dbo].[sp_GetAllMainMenuWithAndWithoutByMainMenuID_OR_RoleID_USE_CTE]

(
  @MenuID INT = NULL,
  @RoleID INT = NULL
)
AS
BEGIN
  SET NOCOUNT ON;

  WITH CTE AS (
    SELECT 
      MM.Menuid,
      MM.MenuName,
      MM.MenuUrl,
      MM.MenuName + ' -> ' + MM.MenuUrl AS MenunameUrl,
      MM.MenuDescription,
      MM.IsActive,
      MM.DisplaySequence,
      MM.CreatedDate,
      MM.RoleID,
      R.RoleName,
      CASE
        WHEN @MenuID IS NULL AND @RoleID IS NULL THEN 1
        WHEN @MenuID IS NOT NULL AND @RoleID IS NULL AND MM.MenuID = @MenuID THEN 1
        WHEN @MenuID IS NULL AND @RoleID IS NOT NULL AND MM.RoleID = @RoleID THEN 1
        ELSE 0
      END AS ConditionMatch
    FROM 
      tbl_MainMenu MM (NOLOCK)
    LEFT JOIN    
      tbl_roles R ON MM.RoleID = R.RoleID
  )
  SELECT 
    Menuid,
    MenuName,
    MenuUrl,
    MenunameUrl,
    MenuDescription,
    IsActive,
    DisplaySequence,
    CreatedDate,
    RoleID,
    RoleName
  FROM 
    CTE
  WHERE
    ConditionMatch = 1
  ORDER BY 
    RoleID, MenuName
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllMainMenuWithAndWithoutMainMenuID]    Script Date: 7/25/2024 11:30:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
 

 -- Without parameter
--EXEC sp_GetAllMainMenuWithAndWithoutMainMenuID 

-- With parameter
--EXEC sp_GetAllMainMenuWithAndWithoutMainMenuID 3

CREATE PROCEDURE [dbo].[sp_GetAllMainMenuWithAndWithoutMainMenuID]

@MenuID int =null   

--  optional parameter is here if you want with where EMPNO then result with empno wise if you want all then  all display
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	--SELECT FIrstName+' '+LastName as UserName, * from tbl_userregistration(nolock)


	if @MenuID is null

	BEGIN

SELECT 
	MM.Menuid,
    MM.MenuName,
	MM.MenuUrl,
	MM.MenuName+ ' -> '+MM.MenuUrl as MenunameUrl,
	MM.MenuDescription,
	MM.IsActive,
	MM.DisplaySequence,
	MM.CreatedDate,
	MM.RoleID,
	R.RoleName

FROM 
    tbl_MainMenu MM (NOLOCK)
LEFT JOIN    
    tbl_roles R ON MM.RoleID = R.RoleID


ORDER BY 
    MM.RoleID, MM.MenuName
	   
END

ELSE

	SELECT 
	MM.Menuid,
    MM.MenuName,
	MM.MenuUrl,
	MM.MenuName+ ' -> '+MM.MenuUrl as MenunameUrl,
	MM.MenuDescription,
	MM.IsActive,
	MM.DisplaySequence,
	MM.CreatedDate,
	MM.RoleID,
	R.RoleName

FROM 
    tbl_MainMenu MM (NOLOCK)
LEFT JOIN    
    tbl_roles R ON MM.RoleID = R.RoleID

	where MM.MenuID=@MenuID

ORDER BY 
    MM.RoleID, MM.MenuName

END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllMainMenuWithAndWithoutRoleID]    Script Date: 7/25/2024 11:30:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
 

 -- Without parameter
--EXEC sp_GetAllMainMenuWithAndWithoutRoleID 

-- With parameter
--EXEC sp_GetAllMainMenuWithAndWithoutRoleID 3

create PROCEDURE [dbo].[sp_GetAllMainMenuWithAndWithoutRoleID]

@RoleID int =null   

--  optional parameter is here if you want with where EMPNO then result with empno wise if you want all then  all display
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	--SELECT FIrstName+' '+LastName as UserName, * from tbl_userregistration(nolock)


	if @RoleID is null

	BEGIN

SELECT 
	MM.Menuid,
    MM.MenuName,
	MM.MenuUrl,
	MM.MenuName+ ' -> '+MM.MenuUrl as MenunameUrl,
	MM.MenuDescription,
	MM.IsActive,
	MM.DisplaySequence,
	MM.CreatedDate,
	MM.RoleID,
	R.RoleName

FROM 
    tbl_MainMenu MM (NOLOCK)
LEFT JOIN    
    tbl_roles R ON MM.RoleID = R.RoleID


ORDER BY 
    MM.RoleID, MM.MenuName
	   
END

ELSE

	SELECT 
	MM.Menuid,
    MM.MenuName,
	MM.MenuUrl,
	MM.MenuName+ ' -> '+MM.MenuUrl as MenunameUrl,
	MM.MenuDescription,
	MM.IsActive,
	MM.DisplaySequence,
	MM.CreatedDate,
	MM.RoleID,
	R.RoleName

FROM 
    tbl_MainMenu MM (NOLOCK)
LEFT JOIN    
    tbl_roles R ON MM.RoleID = R.RoleID

	where MM.RoleID=@RoleID

ORDER BY 
    MM.RoleID, MM.MenuName

END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllRoles]    Script Date: 7/25/2024 11:30:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
 --exec sp_GetAllRoles
CREATE PROCEDURE [dbo].[sp_GetAllRoles] 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from tbl_roles(nolock) where IsActive=1
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllRolesAssignedToMainMenu]    Script Date: 7/25/2024 11:30:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
 --exec sp_GetAllRolesAssignedToMainMenu
create PROCEDURE [dbo].[sp_GetAllRolesAssignedToMainMenu]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from tbl_roles(nolock) where IsActive=1
	and roleid in(select roleid from tbl_mainmenu)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_getAllState]    Script Date: 7/25/2024 11:30:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
--exec sp_getAllState

Create PROCEDURE [dbo].[sp_getAllState]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select StateId,StateName,Isactive from tbl_stateName(nolock) where IsActive=1
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllSubMenuWithAndWithoutByMainMenuID_OR_RoleID]    Script Date: 7/25/2024 11:30:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
 

 -- With parameter
--EXEC sp_GetAllSubMenuWithAndWithoutByMainMenuID_OR_RoleID @MainMenuID=6
--EXEC sp_GetAllSubMenuWithAndWithoutByMainMenuID_OR_RoleID @RoleID=1


-- WithOut parameter
--EXEC sp_GetAllSubMenuWithAndWithoutByMainMenuID_OR_RoleID

CREATE PROCEDURE [dbo].[sp_GetAllSubMenuWithAndWithoutByMainMenuID_OR_RoleID]
(
@MainMenuID int =null,
@RoleID int=null

)
--  optional parameter is here if you want with where EMPNO then result with empno wise if you want all then  all display
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	--SELECT FIrstName+' '+LastName as UserName, * from tbl_userregistration(nolock)
		
	IF(@MainMenuID is NULL AND @RoleID is NULL)
			   
	BEGIN
SELECT 
 CASE 
        WHEN ROW_NUMBER() OVER (PARTITION BY MM.MenuName ORDER BY SM.SubMenuID) = 1 
        THEN MM.MenuName 
        ELSE NULL 
    END AS MenuName,
    --MM.MenuName,
    R.RoleName,
    SM.SubMenuID,
    SM.SubMenuName,
    SM.SubMenuUrl,
    SM.SubMenuDescription,
    SM.SubMenuDisplaySequence,
    SM.IsActive,
    SM.MainMenuID,
    SM.RoleID,
    SM.CreatedDate,
	RP.CanEdit,
	RP.CanView,
	RP.CanDelete,
	RP.CanInsert
FROM 
    tbl_submenu SM (NOLOCK)
LEFT JOIN 
    tbl_MainMenu MM ON MM.MenuID = SM.MainMenuID
LEFT JOIN 
    tbl_roles R ON SM.RoleID = R.RoleID

INNER JOIN tbl_RolePermissions RP
	on RP.SubMenuID=SM.SubMenuID and RP.RoleID=SM.RoleID and RP.MainMenuID=SM.MainMenuID

ORDER BY 
    SM.RoleID, MM.MenuName

END

ELSE IF(@MainMenuID IS NOT NULL AND @RoleID IS NULL)

BEGIN

	SELECT 
    CASE 
        WHEN ROW_NUMBER() OVER (PARTITION BY MM.MenuName ORDER BY SM.SubMenuID) = 1 
        THEN MM.MenuName 
        ELSE NULL 
    END AS MenuName,
    --MM.MenuName,
    R.RoleName,
    SM.SubMenuID,
    SM.SubMenuName,
    SM.SubMenuUrl,
    SM.SubMenuDescription,
    SM.SubMenuDisplaySequence,
    SM.IsActive,
    SM.MainMenuID,
    SM.RoleID,
    SM.CreatedDate,
	RP.CanEdit,
	RP.CanView,
	RP.CanDelete,
	RP.CanInsert
FROM 
    tbl_submenu SM (NOLOCK)
LEFT JOIN 
    tbl_MainMenu MM ON MM.MenuID = SM.MainMenuID
LEFT JOIN 
    tbl_roles R ON SM.RoleID = R.RoleID

INNER JOIN tbl_RolePermissions RP
	on RP.SubMenuID=SM.SubMenuID and RP.RoleID=SM.RoleID and RP.MainMenuID=SM.MainMenuID

	where SM.MainMenuID=@MainMenuID

ORDER BY 
    SM.RoleID, MM.MenuName

END

ELSE IF(@MainMenuID IS NULL AND @RoleID IS NOT NULL)

BEGIN

	SELECT 
   CASE 
        WHEN ROW_NUMBER() OVER (PARTITION BY MM.MenuName ORDER BY SM.SubMenuID) = 1 
        THEN MM.MenuName 
        ELSE NULL 
    END AS MenuName,
    --MM.MenuName,
    R.RoleName,
    SM.SubMenuID,
    SM.SubMenuName,
    SM.SubMenuUrl,
    SM.SubMenuDescription,
    SM.SubMenuDisplaySequence,
    SM.IsActive,
    SM.MainMenuID,
    SM.RoleID,
    SM.CreatedDate,
	RP.CanEdit,
	RP.CanView,
	RP.CanDelete,
	RP.CanInsert
FROM 
    tbl_submenu SM (NOLOCK)
LEFT JOIN 
    tbl_MainMenu MM ON MM.MenuID = SM.MainMenuID
LEFT JOIN 
    tbl_roles R ON SM.RoleID = R.RoleID

INNER JOIN tbl_RolePermissions RP
	on RP.SubMenuID=SM.SubMenuID and RP.RoleID=SM.RoleID and RP.MainMenuID=SM.MainMenuID

	where SM.RoleID=@RoleID

ORDER BY 
    SM.RoleID, MM.MenuName

END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllSubMenuWithAndWithoutSubMenuID]    Script Date: 7/25/2024 11:30:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
 

 -- Without parameter
--EXEC sp_GetAllSubMenuWithAndWithoutSubMenuID 

-- With parameter
--EXEC sp_GetAllSubMenuWithAndWithoutSubMenuID 3

CREATE PROCEDURE [dbo].[sp_GetAllSubMenuWithAndWithoutSubMenuID]

@SubMenuID int =null   

--  optional parameter is here if you want with where EMPNO then result with empno wise if you want all then  all display
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	--SELECT FIrstName+' '+LastName as UserName, * from tbl_userregistration(nolock)


	if @SubMenuID is null

	BEGIN

SELECT 
    MM.MenuName,
    R.RoleName,
    SM.SubMenuID,
    SM.SubMenuName,
    SM.SubMenuUrl,
    SM.SubMenuDescription,
    SM.SubMenuDisplaySequence,
    SM.IsActive,
    SM.MainMenuID,
    SM.RoleID,
    SM.CreatedDate,
	RP.CanEdit,
	RP.CanView,
	RP.CanDelete,
	RP.CanInsert
FROM 
    tbl_submenu SM (NOLOCK)
LEFT JOIN 
    tbl_MainMenu MM ON MM.MenuID = SM.MainMenuID
LEFT JOIN 
    tbl_roles R ON SM.RoleID = R.RoleID

INNER JOIN tbl_RolePermissions RP
	on RP.SubMenuID=SM.SubMenuID and RP.RoleID=SM.RoleID and RP.MainMenuID=SM.MainMenuID

ORDER BY 
    SM.RoleID, MM.MenuName



END

ELSE

	SELECT 
    MM.MenuName,
    R.RoleName,
    SM.SubMenuID,
    SM.SubMenuName,
    SM.SubMenuUrl,
    SM.SubMenuDescription,
    SM.SubMenuDisplaySequence,
    SM.IsActive,
    SM.MainMenuID,
    SM.RoleID,
    SM.CreatedDate,
	RP.CanEdit,
	RP.CanView,
	RP.CanDelete,
	RP.CanInsert
FROM 
    tbl_submenu SM (NOLOCK)
LEFT JOIN 
    tbl_MainMenu MM ON MM.MenuID = SM.MainMenuID
LEFT JOIN 
    tbl_roles R ON SM.RoleID = R.RoleID

INNER JOIN tbl_RolePermissions RP
	on RP.SubMenuID=SM.SubMenuID and RP.RoleID=SM.RoleID and RP.MainMenuID=SM.MainMenuID

	where SM.SubMenuID=@SubMenuID

ORDER BY 
    SM.RoleID, MM.MenuName

END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllUsers]    Script Date: 7/25/2024 11:30:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
 --exec sp_GetAllUsers
CREATE PROCEDURE [dbo].[sp_GetAllUsers] 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	--SELECT FIrstName+' '+LastName as UserName, * from tbl_userregistration(nolock)

select U.FIrstName+' '+U.LastName as UserName, U.UID,U.EMPNO,U.FirstName,U.LastName,
U.Detail,U.UserImagePath, Convert(varchar,U.RegistrationDate,103)as RegistrationDate,
R.RoleName,U.emailid,U.MobileNo,U.Gender,U.DocFileUpload,U.docfileName,U.IsActive,U.IsAuthenticated,U.IsAuthorized,
U.IsApprovedThroughEmailID,U.IsChangedDefaultPassword,U.CurrentAddress,U.PermanentAddress,
CTR.CountryName,STA.StateName,CIT.CityName,DEPT.DepartmentName,DESG.DesignationName,LOC.LocationCodeName
from Tbl_UserRegistration(noLock) U 
LEFT JOIN tbl_roles(nolock) R on U.RoleID=R.RoleID
LEFT JOIN tbl_countryName(nolock) CTR on U.CountryID=CTR.CountryID
LEFT JOIN tbl_StateName(nolock) STA on U.StateID=STA.StateID
LEFT JOIN tbl_cityName (nolock) CIT on U.CityID=CIT.CityID
LEFT JOIN tbl_departmentName(nolock) DEPT on U.DepartmentID=DEPT.DepartmentID
LEFT JOIN tbl_designationName(nolock) DESG on U.DesignationID=DESG.DesignationID
LEFT JOIN tbl_locationcodeName(nolock) LOC on U.LocationZoneID=LOC.LocationCodeID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllUsersByEmpno]    Script Date: 7/25/2024 11:30:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
 

 -- Without parameter
--EXEC sp_GetAllUsersByEmpno 

-- With parameter
--EXEC sp_GetAllUsersByEmpno 'EMP-000001'

CREATE PROCEDURE [dbo].[sp_GetAllUsersByEmpno] 

@EMPNO varchar(10) =null   

--  optional parameter is here if you want with where EMPNO then result with empno wise if you want all then  all display
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	--SELECT FIrstName+' '+LastName as UserName, * from tbl_userregistration(nolock)


	if @EMPNO is null

	BEGIN

select U.FIrstName+' '+U.LastName as UserName,U.Password, U.UID,U.EMPNO,U.FirstName,U.LastName,U.Detail,U.RegistrationDate,R.RoleName 
from Tbl_UserRegistration(nolock) U 
left join tbl_roles(nolock) R on
U.RoleID=R.RoleID

END

ELSE

	select U.FIrstName+' '+U.LastName as UserName,U.Password, U.UID,U.EMPNO,U.FirstName,U.LastName,U.Detail,U.RegistrationDate,R.RoleName 
	from Tbl_UserRegistration(noLock) U 
left join tbl_roles(nolock) R on
U.RoleID=R.RoleID where U.EMPNO=@EMPNO 

END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetMainMenuHeader]    Script Date: 7/25/2024 11:30:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--exec sp_GetMainMenuHeader 1

create PROC  [dbo].[sp_GetMainMenuHeader]

(  
  
@RoleId int  

  
)  
As    
  Begin

 select MenuID,MenuName,MenuUrl,MenuDescription,DisplaySequence,IsActive,RoleID,CreatedDate from tbl_mainmenu(nolock) where RoleID=@RoleId
  
  End
GO
/****** Object:  StoredProcedure [dbo].[sp_GetMainMenuHeaderTitle]    Script Date: 7/25/2024 11:30:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--exec sp_GetMainMenuHeaderTitle 1

CREATE PROC  [dbo].[sp_GetMainMenuHeaderTitle]

(  
  
@MenuID int  

  
)  
As    
  Begin

select MenuID,MenuName,MenuUrl,MenuDescription,DisplaySequence,IsActive,RoleID,CreatedDate from tbl_mainmenu(nolock) 
where MenuID=@MenuID and IsActive=1
 
 
 
  End
GO
/****** Object:  StoredProcedure [dbo].[sp_GetMenuBySelectRole]    Script Date: 7/25/2024 11:30:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--exec sp_GetMenuBySelectRole 1

CREATE PROC  [dbo].[sp_GetMenuBySelectRole]

(  
  
@RoleId int  

  
)  
As    
  Begin

 select MenuID,MenuName from tbl_mainmenu(nolock) where RoleID=@RoleId
  
  End
GO
/****** Object:  StoredProcedure [dbo].[sp_GetProductByCustomPaging]    Script Date: 7/25/2024 11:30:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
 --exec sp_GetProductByCustomPaging 1,5

 -- For Detail Help:   link https://www.yogihosting.com/asp-net-gridview-custom-paging/

CREATE PROCEDURE [dbo].[sp_GetProductByCustomPaging]
    @PageNo INT,
    @PageSize INT
AS
BEGIN
    DECLARE @qry NVARCHAR(2000);

    SET @qry = 'SELECT * FROM (
        SELECT ROW_NUMBER() OVER (ORDER BY EMPNO DESC) AS RowNum,
            U.FirstName AS FIrstName,
            U.LastName,
            U.UID,
            U.EMPNO,
            U.Detail,
            U.UserImagePath, 
            CONVERT(VARCHAR, U.RegistrationDate, 103) AS RegistrationDate,
            R.RoleName,
            U.emailid,
            U.MobileNo,
            U.Gender,
            U.DocFileUpload
        FROM Tbl_UserRegistration (NOLOCK) U
        LEFT JOIN tbl_roles (NOLOCK) R ON U.RoleID = R.RoleID
        WHERE 1=1
    ) AS a
    WHERE a.RowNum BETWEEN ((' + CAST(@PageNo AS NVARCHAR(5)) + ' - 1) * ' + CAST(@PageSize AS NVARCHAR(5)) + ' + 1)
        AND (' + CAST(@PageNo AS NVARCHAR(5)) + ' * ' + CAST(@PageSize AS NVARCHAR(5)) + ')';

    SET @qry = @qry + ';SELECT COUNT(*) AS Total FROM tbl_userregistration';

    EXEC sp_executesql @qry;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetSubMenuID]    Script Date: 7/25/2024 11:30:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--exec sp_GetSubMenuID 1,7,'/Menu/DataDetails/RolePermissionToSubMenu.aspx'

CREATE PROC  [dbo].[sp_GetSubMenuID] 
(  
  
@RoleID int,
@MainMenuID int,
@SubMenuUrl nvarchar(200)

  
)  
As    
  Begin

 select  SM.SubMenuID,SM.SubMenuName,SM.SubMenuUrl,SM.SubMenuDescription,SM.SubMenuDisplaySequence,SM.IsActive,SM.MainMenuID,SM.RoleID,SM.CreatedDate 
 from tbl_submenu SM(nolock) 
 where SM.RoleID=@RoleID 
 and SM.MainMenuID=@MainMenuID
 and SM.SubMenuUrl=@SubMenuUrl
  
 
  End
GO
/****** Object:  StoredProcedure [dbo].[sp_GetSubMenuOnClickMainMenu]    Script Date: 7/25/2024 11:30:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--exec sp_GetSubMenuOnClickMainMenu 1

CREATE PROC  [dbo].[sp_GetSubMenuOnClickMainMenu]

(  
  
@MainMenuID int  

  
)  
As    
  Begin

 select  SM.SubMenuID,SM.SubMenuName,SM.SubMenuUrl,SM.SubMenuDescription,SM.SubMenuDisplaySequence,SM.IsActive,SM.MainMenuID,SM.RoleID,SM.CreatedDate 
 from tbl_submenu SM(nolock) 
  where SM.MainMenuID=@MainMenuID
  
 
  End
GO
/****** Object:  StoredProcedure [dbo].[sp_GetSubMenuOnClickOnRoles]    Script Date: 7/25/2024 11:30:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--exec sp_GetSubMenuOnClickOnRoles 1

CREATE PROC  [dbo].[sp_GetSubMenuOnClickOnRoles]

(  
  
@RoleID int  
  
)  
As    
  Begin

 SELECT 
    CASE 
        WHEN ROW_NUMBER() OVER (PARTITION BY MM.MenuName ORDER BY SM.SubMenuID) = 1 
        THEN MM.MenuName 
        ELSE NULL 
    END AS MenuName,
		
    SM.SubMenuId,
    SM.SubMenuName,
	SM.SubMenuUrl,
    SM.MainMenuId,
	Rp.ID,
    RP.RoleId,
    RP.CanView,
    RP.CanEdit,
    RP.CanDelete,
    RP.CanInsert,
	RP.candownload
	
FROM
    tbl_SubMenu  SM with(Nolock)
JOIN
    tbl_RolePermissions RP with(Nolock) ON SM.SubMenuId = RP.SubMenuId

LEFT JOIN 
    tbl_MainMenu MM with(nolock) ON MM.MenuID = SM.MainMenuID

	where SM.RoleID=@RoleID

	ORDER BY 
    SM.RoleID, MM.MenuName

	
  
 
  End
GO
/****** Object:  StoredProcedure [dbo].[sp_GetValidLogin]    Script Date: 7/25/2024 11:30:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
CREATE PROC  [dbo].[sp_GetValidLogin]  
(    
    
@EMPNO nvarchar(50),    
@password nvarchar(50)  
  
)    
As      
  Begin  
  
select * from Tbl_UserRegistration where EMPNO=@EMPNO and password=@password  
    
--	if need case sensetive ( if UPPER case then type UPPER , if LOWER case then lower)
--	SELECT * FROM tbl_userregistration WHERE empno
--COLLATE Latin1_general_CS_AS =@EMPNO AND [PASSWORD] COLLATE Latin1_general_CS_AS=@password 


  End  
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertSubMenuWithRolePermission]    Script Date: 7/25/2024 11:30:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_InsertSubMenuWithRolePermission]

    @SubMenuName nvarchar(50),
	@SubMenuUrl nvarchar(200),
	@SubMenuDescription nvarchar(200),
	@SubMenuDisplaySequence int,
	@IsActive bit,
	@MainMenuID int,
	@RoleId int,
	@CreatedDate datetime,
 --   @CanView BIT,
 --   @CanEdit BIT,
 --   @CanDelete BIT,
 --   @CanInsert BIT,
	--@CanNone BIT,
	@ERROR varchar(100) out


AS
BEGIN 
      SET NOCOUNT ON; 

	  if not exists (select 1 from tbl_submenu where mainmenuid=@MainMenuID and RoleID=@RoleId and SubMenuName=@SubMenuName)

	  Begin

    -- Insert the submenu into SubMenu table
    insert into tbl_submenu(SubMenuName,SubMenuUrl,SubMenuDescription,SubMenuDisplaySequence,IsActive,MainMenuID,RoleID,CreatedDate)values
	(@SubMenuName, @SubMenuUrl,@SubMenuDescription,@SubMenuDisplaySequence,@IsActive,@MainMenuID, @RoleId,getdate())

    -- Get the SubMenuId of the inserted submenu
    DECLARE @SubMenuId INT;
    SET @SubMenuId = SCOPE_IDENTITY();

    -- Insert the role permissions into RolePermission table
    INSERT INTO tbl_RolePermissions (RoleId, SubMenuId, CanView, CanEdit, CanDelete, CanInsert,CanDownload,MainMenuID)
	 VALUES (@RoleId, @SubMenuId, 0,0,0,0,0,@MainMenuID);
   -- VALUES (@RoleId, @SubMenuId, @CanView, @CanEdit, @CanDelete, @CanInsert,@CanNone);


SET @ERROR=@SubMenuName+' SubMenu Name inserted Successfully'

END

ELSE

BEGIN

SET @ERROR=@SubMenuName + ' SubMenu Name Already Exists for the same ROLE and Menu'

END

END
GO
/****** Object:  StoredProcedure [dbo].[sp_newinsertMenus]    Script Date: 7/25/2024 11:30:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

--Exec sp_newinsertuser 'santosh','Kumar','ram@1','Ramtesting'
-- Please mention only Varchar(10) if EMPNO auto incremenent with one number with alfa and number.in DB table structure

--exec sp_newinsertMenus 

CREATE PROCEDURE [dbo].[sp_newinsertMenus]
	
	@MenuName nvarchar(50),
	@MenuUrl nvarchar(200),
	@MenuDescription nvarchar(200),
	@DisplaySequence int,
	@IsActive bit,
	@RoleId int,
	@ERROR varchar(100) out

	AS
BEGIN 
      SET NOCOUNT ON; 

	  if not exists (select 1 from tbl_mainmenu where MenuName=@MenuName and RoleID=@RoleID)

	  Begin

    -- Insert statements for procedure here
	insert into tbl_mainmenu(MenuName,MenuUrl,MenuDescription,DisplaySequence,IsActive,RoleID,CreatedDate)values
	(@MenuName, @MenuUrl,@MenuDescription,@DisplaySequence,@IsActive,@RoleId,getdate())

	SET @ERROR=@MenuName+' Menu Name inserted Successfully'

END

ELSE

BEGIN

SET @ERROR=@MenuName + ' Menu Name Already Exists'

END

END
GO
/****** Object:  StoredProcedure [dbo].[sp_NewInsertSubMenu]    Script Date: 7/25/2024 11:30:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

--Exec sp_newinsertuser 'santosh','Kumar','ram@1','Ramtesting'
-- Please mention only Varchar(10) if EMPNO auto incremenent with one number with alfa and number.in DB table structure

--exec sp_NewInsertSubMenu 

CREATE PROCEDURE [dbo].[sp_NewInsertSubMenu]
	
	@SubMenuName nvarchar(50),
	@SubMenuUrl nvarchar(200),
	@SubMenuDescription nvarchar(200),
	@SubMenuDisplaySequence int,
	@IsActive bit,
	@MainMenuID int,
	@RoleId int,
	@CreatedDate datetime,
	@ERROR varchar(100) out

	AS
BEGIN 
      SET NOCOUNT ON; 

	  if not exists (select 1 from tbl_submenu where mainmenuid=@MainMenuID and RoleID=@RoleId and SubMenuName=@SubMenuName)

	  Begin

    -- Insert statements for procedure here
	insert into tbl_submenu(SubMenuName,SubMenuUrl,SubMenuDescription,SubMenuDisplaySequence,IsActive,MainMenuID,RoleID,CreatedDate)values
	(@SubMenuName, @SubMenuUrl,@SubMenuDescription,@SubMenuDisplaySequence,@IsActive,@MainMenuID, @RoleId,getdate())

	SET @ERROR=@SubMenuName+' SubMenu Name inserted Successfully'

END

ELSE

BEGIN

SET @ERROR=@SubMenuName + ' SubMenu Name Already Exists for the same ROLE and Menu'

END

END
GO
/****** Object:  StoredProcedure [dbo].[sp_newinsertuser]    Script Date: 7/25/2024 11:30:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

--Exec sp_newinsertuser 'santosh','Kumar','ram@1','Ramtesting'
-- Please mention only Varchar(10) if EMPNO auto incremenent with one number with alfa and number.in DB table structure

CREATE PROCEDURE [dbo].[sp_newinsertuser]
	@FirstName nvarchar(50),
	@LastName nvarchar(50),
	@Password nvarchar(50),
	@Detail nvarchar(500),
	@DOB datetime,
	@Gender nvarchar(15),
	@EmailID nvarchar(50),
	@MobileNo nvarchar(15),
	@UserImage nvarchar(50),
	@UserImagePath nvarchar(500),
	@countryID int,
	@StateID int,
	@CityID int,
	@DepartmentID int,
	@DesignationID int,
	@LocationZoneID int,
	@CurrentAddress nvarchar(200),
	@PermanentAddress nvarchar(200),
	--@IsAuthenticated bit,  -- if create registration first time by default authentication value will be 0 after first login 1 will update
	--@IsAuthorized bit,  ---- if create registration first time by default authentication value will be 0 after first login & roleid assigned then value will be 1  update
	@DocFileUpload nvarchar(500),   -- any document uploading
	@docfileName nvarchar(100)
	--@LoginAttempted int,  ---- if create registration first time by default authentication value will be 0 after first login 1 will update
	--@IsChangedDefaultPassword bit -- if create registration first time by default password has generated & value will be 0 after changed password by users then it will be value  1  update
	-- IsApprovedThroughEmailID -    Set 0 insert by default setting in SQL design duering column name create (Bind filed)

	AS
BEGIN 
      SET NOCOUNT ON; 

	  -- Use of  catch (SqlException ex) with try in c# if submit code
            
	  -- check if the Email ID already exists
	  if EXISTS(select 1 from tbl_userregistration where EmailID=@EmailID)

	  Begin

	  --Email already exists, return an error message
	  RAISERROR('Email ID already exists',16,1)

	  RETURN;
	  END

	  -- check if the mobile number exists, return an error message
	  if EXISTS(select 1 from tbl_userregistration where MobileNo=@MobileNo)

	  Begin
	  --Mobile no already exists, return an error message

	  RAISERROR('Mobile no already exists',16,1)
	  
	  RETURN;
	  END

	 

declare @EMPNO VARCHAR(10)           
Select @EMPNO = 'EMP-'+ Replicate('0',(col_length('Tbl_UserRegistration','EMPNO'))-(4+len(1+convert(int,isNull(max(Substring(EMPNO,5,10)),0))))) +convert(varchar(7),(1+convert(int,isNull(max(Substring(EMPNO,5,10)),0)))) from             
Tbl_UserRegistration 


    -- Insert statements for procedure here
	-- Here RoleID is created 12 (means- None (RoleName) by default, after that we will decide for assign the role
	insert into Tbl_UserRegistration(EMPNO,FirstName,LastName,[Password],Detail,DOB,Gender,EmailID,MobileNo,RegistrationDate,RoleID,UserImage,UserImagePath,CountryID,StateID,CityID,DepartmentID,DesignationID,LocationZoneID,
	currentaddress,permanentaddress,IsAuthenticated,IsAuthorized,DocFileUpload,LoginAttempted,IsChangedDefaultPassword,IsActive,DocFileName)values
	(@EMPNO,@FirstName,@LastName,@Password,@Detail,@DOB,@Gender,@EmailID,@MobileNo,getdate(),12,@UserImage,@UserImagePath,@countryID,@StateID,@CityID,@DepartmentID,@DesignationID, @LocationZoneID,@currentaddress,@permanentaddress,0,0,@DocFileUpload,0,0,1,@docfileName)

	-- Return success message or other desired output
	select 'Registration created successfully' AS Result;

--check bydefault password during the new create registration
select @EMPNO as EMPNO
insert into tbl_userpassword([UserId],UserName,[password],isactive)
values (SCOPE_IDENTITY(), @EMPNO,@Password,1)

-- for ActivationLink after verify on his Email ID after new registration
DECLARE @CurrentDateTime DATETIME = GETDATE();
DECLARE @ExpirationDateTime DATETIME = DATEADD(DAY, 1, @CurrentDateTime); -- add expire time for one day 24 hours
DECLARE @ActivationCode NVARCHAR(50) = NEWID(); -- unique id generate [guid]

select @EMPNO as EMPNO,@EmailID as EmailID
insert into
ActivationLink
(
ActivationLinkId,UserId,ActivationCode,IsActivated,ExpiryDate,EmailID)
values(SCOPE_IDENTITY(),@EMPNO,@ActivationCode,0,@ExpirationDateTime,@EmailID
)

END
GO
/****** Object:  StoredProcedure [dbo].[sp_SearchUserRegistrationsWithOneOrMultipleCondition]    Script Date: 7/25/2024 11:30:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

 --EXEC sp_SearchUserRegistrationsWithOneOrMultipleCondition @FromDate ='2023-07-01', @ToDate ='2023-06-30';


CREATE PROCEDURE [dbo].[sp_SearchUserRegistrationsWithOneOrMultipleCondition]
	
	@FirstName NVARCHAR(50) = NULL,
    @LastName NVARCHAR(50) = NULL,
    @FromDate DATETIME = NULL,
    @ToDate DATETIME = NULL,
    @MinAge INT = NULL,
    @MaxAge INT = NULL,
    @EmailID NVARCHAR(100) = NULL,
    @MobileNo NVARCHAR(20) = NULL,
    @StateID INT = NULL,
    @CityID INT = NULL,
    --@DOB DATE = NULL,
	@RoleID INT=NULL,
	@LocationZoneID INT=NULL,
	@Gender nvarchar(50)=NULL

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- selecting with SELECT statements.
	SET NOCOUNT ON;

DECLARE @sqlQuery NVARCHAR(MAX) =
'select DATEDIFF(YEAR, U.DOB, GETDATE())AS Age, U.UID,U.EMPNO,U.FirstName,U.LastName,U.DOB,U.StateID,U.RoleID,
U.Detail,U.UserImagePath, Convert(varchar,U.RegistrationDate,103)as RegistrationDate,
R.RoleName,U.emailid,U.MobileNo,U.Gender,U.DocFileUpload,U.docfileName,U.IsActive,U.IsAuthenticated,U.IsAuthorized,
U.IsApprovedThroughEmailID,U.IsChangedDefaultPassword,U.CurrentAddress,U.PermanentAddress,
CTR.CountryName,STA.StateName,CIT.CityName,DEPT.DepartmentName,DESG.DesignationName,LOC.LocationCodeName
from Tbl_UserRegistration(noLock) U 
LEFT JOIN tbl_roles(nolock) R on U.RoleID=R.RoleID
LEFT JOIN tbl_countryName(nolock) CTR on U.CountryID=CTR.CountryID
LEFT JOIN tbl_StateName(nolock) STA on U.StateID=STA.StateID
LEFT JOIN tbl_cityName (nolock) CIT on U.CityID=CIT.CityID
LEFT JOIN tbl_departmentName(nolock) DEPT on U.DepartmentID=DEPT.DepartmentID
LEFT JOIN tbl_designationName(nolock) DESG on U.DesignationID=DESG.DesignationID
LEFT JOIN tbl_locationcodeName(nolock) LOC on U.LocationZoneID=LOC.LocationCodeID
WHERE 1=1';

   IF (@FirstName IS NOT NULL)
        SET @sqlQuery += 'AND U.FirstName LIKE ''%' + @FirstName + '%'' ';

    IF (@LastName IS NOT NULL)
        SET @sqlQuery += 'AND U.LastName LIKE ''%' + @LastName + '%'' ';

		IF (@FromDate IS NOT NULL AND @ToDate IS NOT NULL)
        SET @sqlQuery += ' AND U.RegistrationDate BETWEEN ''' + CONVERT(NVARCHAR, @FromDate, 23) + ''' AND ''' + CONVERT(NVARCHAR, @ToDate, 23) + '''';
		
		IF (@MinAge IS NOT NULL AND @MaxAge is NOT NULL)
        SET @sqlQuery += 'AND DATEDIFF(YEAR, DOB, GETDATE()) BETWEEN ' + CONVERT(NVARCHAR, @MinAge) + ' AND '+Convert(Nvarchar,@MaxAge)+ ' ';
		
     --IF (@FromDate IS NOT NULL)
        --SET @sqlQuery += 'AND U.RegistrationDate >= ''' + CONVERT(NVARCHAR, @FromDate, 23) + ''' ';

     --IF (@ToDate IS NOT NULL)
     --SET @sqlQuery += 'AND U.RegistrationDate <= ''' + CONVERT(NVARCHAR, @ToDate, 23) + ''' ';

    --IF (@MinAge IS NOT NULL)
    --    SET @sqlQuery += 'AND DATEDIFF(YEAR, DOB, GETDATE()) >= ' + CONVERT(NVARCHAR, @MinAge) + ' ';

    --IF (@MaxAge IS NOT NULL)
    --    SET @sqlQuery += 'AND DATEDIFF(YEAR, DOB, GETDATE()) <= ' + CONVERT(NVARCHAR, @MaxAge) + ' ';

    IF (@EmailID IS NOT NULL)
        SET @sqlQuery += 'AND U.EmailID LIKE ''%' + @EmailID + '%'' ';

    IF (@MobileNo IS NOT NULL)
        SET @sqlQuery += 'AND U.MobileNo LIKE ''%' + @MobileNo + '%'' ';

    IF (@StateID IS NOT NULL AND @StateID <> -1)
        SET @sqlQuery += 'AND U.StateID = ' + CONVERT(NVARCHAR, @StateID) + ' ';

    IF (@CityID IS NOT NULL AND @CityID <> -1)
        SET @sqlQuery += 'AND U.CityID = ' + CONVERT(NVARCHAR, @CityID) + ' ';

    --IF (@DOB IS NOT NULL)
    --    SET @sqlQuery += 'AND DOB = ''' + CONVERT(NVARCHAR, @DOB, 23) + ''' ';

    IF (@RoleID IS NOT NULL AND @RoleID <> -1)
        SET @sqlQuery += 'AND U.RoleID = ' + CONVERT(NVARCHAR, @RoleID) + ' ';

    IF (@LocationZoneID IS NOT NULL AND @LocationZoneID <> -1)
        SET @sqlQuery += 'AND U.LocationZoneID = ' + CONVERT(NVARCHAR, @LocationZoneID) + ' ';

    IF (@Gender IS NOT NULL)
        SET @sqlQuery += 'AND U.Gender = ''' + @Gender + ''' ';

SET @sqlQuery += ' ORDER BY NEWID();';	

    --EXEC sp_executesql @sqlQuery;
	EXEC sp_executesql @sqlQuery, N'@FromDate DATETIME, @ToDate DATETIME', @FromDate, @ToDate;

   -- Make sure to declare the @FromDate parameter as nullable in the sp_executesql
	--DECLARE @params NVARCHAR(MAX) = N'@FromDate DATETIME, @ToDate DATETIME, @StateID INT, @CityID INT, @RoleID INT, @LocationZoneID INT, @Gender NVARCHAR(50)';

    --EXEC sp_executesql @sqlQuery, @params, @FromDate, @ToDate, @StateID, @CityID, @RoleID, @LocationZoneID, @Gender;


END
GO
/****** Object:  StoredProcedure [dbo].[sp_sp_GetAllUsersForRoleAssign]    Script Date: 7/25/2024 11:30:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

 --EXEC sp_sp_GetAllUsersForRoleAssign @EMPNO='EMP-000004'

 -- This below SP is used for option.   search with all and with EMPCODE:
CREATE PROCEDURE [dbo].[sp_sp_GetAllUsersForRoleAssign] 
    @EMPNO VARCHAR(10) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @sqlQuery NVARCHAR(MAX) =
    'SELECT DATEDIFF(YEAR, U.DOB, GETDATE()) AS Age, U.UID, U.EMPNO, U.FirstName, U.LastName, U.DOB, U.StateID, U.RoleID,
    U.Detail, U.UserImagePath, CONVERT(VARCHAR, U.RegistrationDate, 103) AS RegistrationDate,
    R.RoleName, U.emailid, U.MobileNo, U.Gender, U.DocFileUpload, U.docfileName, U.IsActive, U.IsAuthenticated, U.IsAuthorized,
    U.IsApprovedThroughEmailID, U.IsChangedDefaultPassword, U.CurrentAddress, U.PermanentAddress,
    CTR.CountryName, STA.StateName, CIT.CityName, DEPT.DepartmentName, DESG.DesignationName, LOC.LocationCodeName
    FROM Tbl_UserRegistration U 
    LEFT JOIN tbl_roles R ON U.RoleID = R.RoleID
    LEFT JOIN tbl_countryName CTR ON U.CountryID = CTR.CountryID
    LEFT JOIN tbl_StateName STA ON U.StateID = STA.StateID
    LEFT JOIN tbl_cityName CIT ON U.CityID = CIT.CityID
    LEFT JOIN tbl_departmentName DEPT ON U.DepartmentID = DEPT.DepartmentID
    LEFT JOIN tbl_designationName DESG ON U.DesignationID = DESG.DesignationID
    LEFT JOIN tbl_locationcodeName LOC ON U.LocationZoneID = LOC.LocationCodeID
    WHERE U.IsChangedDefaultPassword = 1 AND U.IsApprovedThroughEmailID = 1 
	AND U.RoleID = 12 AND U.IsActive = 1 AND U.IsLockedAccount IS NULL';

    -- Append EMPNO condition if provided
    IF @EMPNO IS NOT NULL
    BEGIN
        SET @sqlQuery += ' AND U.EMPNO = @EMPNO';
    END;

    EXEC sp_executesql @sqlQuery, N'@EMPNO VARCHAR(10)', @EMPNO;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_updatedefaultpasswordInRegistration]    Script Date: 7/25/2024 11:30:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_updatedefaultpasswordInRegistration]
	-- Add the parameters for the stored procedure here

	@EMPNO varchar(10),
	@password nvarchar(50)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update tbl_userregistration set [password]=@password , IsChangedDefaultPassword=1 , IsAuthenticated=1 where EMPNO=@EMPNO

END
GO
/****** Object:  StoredProcedure [dbo].[sp_updateMainMenus]    Script Date: 7/25/2024 11:30:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

--Exec sp_newinsertuser 'santosh','Kumar','ram@1','Ramtesting'
-- Please mention only Varchar(10) if EMPNO auto incremenent with one number with alfa and number.in DB table structure

--exec sp_newinsertMenus 
CREATE PROCEDURE [dbo].[sp_updateMainMenus]
(
	@MenuID int,
	@MenuName nvarchar(50),
	@MenuUrl nvarchar(200),
	@MenuDescription nvarchar(200),
	@DisplaySequence int,
	@IsActive bit,
	@RoleId int,
	--@UpdateDate datetime,
	@ERROR varchar(100) out
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRANSACTION;

	BEGIN TRY

	IF NOT EXISTS (SELECT 1 FROM tbl_mainmenu WHERE MenuName = @MenuName AND RoleID = @RoleId)
	BEGIN
		-- Update tbl_MainMenu, ensuring RoleID is updated in tbl_subMenu and tbl_rolePermissions
		UPDATE tbl_MainMenu
		SET
			MenuName = @MenuName,
			MenuUrl = @MenuUrl,
			MenuDescription = @MenuDescription,
			DisplaySequence = @DisplaySequence,
			IsActive = @IsActive,
			RoleID = @RoleId,
			UpdateDate=getdate(),
			OldRoleID=@RoleId
		WHERE
			MenuID = @MenuID;

		UPDATE tbl_subMenu
		SET
			RoleID = @RoleId
		WHERE
			MainMenuID = @MenuID;

		UPDATE tbl_RolePermissions
		SET
			RoleID = @RoleId
		WHERE
			MainMenuID = @MenuID;

		SET @ERROR = @MenuName + ' Menu Name updated Successfully';

		COMMIT;
	END
	ELSE
	BEGIN
		SET @ERROR = @MenuName + ' Menu Name Already Exists';
		ROLLBACK;
	END;

	END TRY
	BEGIN CATCH
		SET @ERROR = 'An error occurred while updating the menu name.';

		ROLLBACK;
	END CATCH;

END;
GO
/****** Object:  StoredProcedure [dbo].[sp_updatepassword]    Script Date: 7/25/2024 11:30:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

--exec sp_createrole 'admin','2023-06-07',1,''
CREATE PROCEDURE [dbo].[sp_updatepassword]

	@EMPNO varchar(10),
	@password nvarchar(50),

	@ERROR VARCHAR(100) OUT
	
	AS
BEGIN 
      SET NOCOUNT ON; 

    -- Insert statements for procedure here
	--  Check here  OLD password input should be correct in textbox as "txtoldpassword" in UI page

	if not exists (select 1 from tbl_userregistration where EMPNO=@EMPNO and Password=@password)
	
	begin
	
	update tbl_userregistration set Password=@password where EMPNO=@EMPNO

	
	SET @ERROR=@EMPNO+' password updated Successfully'

END

--ELSE

--BEGIN

--SET @ERROR=@EMPNO + ' Please input correct old password'

--END

END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_updateRolePermissionByRoleID]    Script Date: 7/25/2024 11:30:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--exec sp_updateRolePermissionByRoleID 1,1,0,0,0

CREATE PROCEDURE [dbo].[sp_updateRolePermissionByRoleID]
(
    @ID int, 
	--  Here should be  where condition ID  not Role ID because  
	--One by one will be update if we want. not all on one time

    @CanEdit BIT,
    @CanView BIT,
    @CanDelete BIT,
    @CanInsert BIT
)
AS
BEGIN
    UPDATE tbl_RolePermissions
    SET CanEdit = @CanEdit,
        CanView = @CanView,
        CanDelete = @CanDelete,
        CanInsert = @CanInsert
    WHERE ID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_updateSubMenus]    Script Date: 7/25/2024 11:30:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

--Exec sp_newinsertuser 'santosh','Kumar','ram@1','Ramtesting'
-- Please mention only Varchar(10) if EMPNO auto incremenent with one number with alfa and number.in DB table structure

--exec sp_newinsertMenus 
-- created on 4th July 24
create PROCEDURE [dbo].[sp_updateSubMenus]
(
	@SubMenuID int,
	@SubMenuName nvarchar(50),
	@SubMenuUrl nvarchar(200),
	@SubMenuDescription nvarchar(200),
	@SubMenuDisplaySequence int,
	@IsActive bit,
	@MainMenuID int,
	@RoleID int,
	--@UpdateDate datetime,
	@ERROR varchar(100) out
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRANSACTION;

	BEGIN TRY

	IF NOT EXISTS (SELECT 1 FROM tbl_submenu WHERE SubMenuName = @SubMenuName AND MainMenuID=@MainMenuID AND RoleID = @RoleId)
	BEGIN
		-- Update tbl_MainMenu, ensuring RoleID is updated in tbl_subMenu and tbl_rolePermissions
		UPDATE tbl_submenu
		SET
			SubMenuName = @SubMenuName,
			SubMenuUrl = @SubMenuUrl,
			SubMenuDescription = @SubMenuDescription,
			SubMenuDisplaySequence = @SubMenuDisplaySequence,
			IsActive = @IsActive
			--UpdateDate=getdate()
			
		WHERE
			SubMenuID = @SubMenuID;
		
		--  no need here for updation.  if need for updation in update submenu 
		--form then click on link for link of [Edit-Role Accebility]

		--UPDATE tbl_RolePermissions
		--SET
		--	RoleID = @RoleId
		--WHERE
		--	SubMenuID = @SubMenuID;

		SET @ERROR = @SubMenuName + ' SubMenu Name updated Successfully';

		COMMIT;
	END
	ELSE
	BEGIN
		SET @ERROR = @SubMenuName + ' SubMenu Name Already Exists';
		ROLLBACK;
	END;

	END TRY
	BEGIN CATCH
		SET @ERROR = 'An error occurred while updating the submenu name.';

		ROLLBACK;
	END CATCH;

END;
GO
USE [master]
GO
ALTER DATABASE [LMS_ProjectDB_07_2024] SET  READ_WRITE 
GO
