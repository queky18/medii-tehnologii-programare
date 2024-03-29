USE [master]
GO
/****** Object:  Database [book_details]  ******/
CREATE DATABASE [book_details]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'book_details', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\book_details.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'book_details_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\book_details_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [book_details] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [book_details].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [book_details] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [book_details] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [book_details] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [book_details] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [book_details] SET ARITHABORT OFF 
GO
ALTER DATABASE [book_details] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [book_details] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [book_details] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [book_details] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [book_details] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [book_details] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [book_details] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [book_details] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [book_details] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [book_details] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [book_details] SET  DISABLE_BROKER 
GO
ALTER DATABASE [book_details] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [book_details] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [book_details] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [book_details] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [book_details] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [book_details] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [book_details] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [book_details] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [book_details] SET  MULTI_USER 
GO
ALTER DATABASE [book_details] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [book_details] SET DB_CHAINING OFF 
GO
ALTER DATABASE [book_details] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [book_details] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [book_details]
GO
/****** Object:  StoredProcedure [dbo].[CrudOperations]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CrudOperations]
@book_id int = 0,
@book_name varchar(MAX)=null,
@book_author varchar(MAX)=null,
@book_ISBN varchar(MAX)=null,
@status varchar(50)
AS
BEGIN
SET NOCOUNT ON;
--- Insert New Records
IF @status='INSERT'
BEGIN
INSERT INTO books(book_name,book_author,book_ISBN) VALUES(@book_name,@book_author,@book_ISBN)
END
--- Select Records in Table
IF @status='SELECT'
BEGIN
SELECT book_id,book_name,book_author,book_ISBN FROM books
END
--- Update Records in Table
IF @status='UPDATE'
BEGIN
UPDATE books SET book_name=@book_name,book_author=@book_author,book_ISBN=@book_ISBN WHERE book_id=@book_id
END
--- Delete Records from Table
IF @status='DELETE'
BEGIN
DELETE FROM books where book_id=@book_id
END
SET NOCOUNT OFF
END
GO
/****** Object:  Table [dbo].[books]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[books](
	[book_id] [int] IDENTITY(1,1) NOT NULL,
	[book_name] [varchar](max) NOT NULL,
	[book_author] [varchar](max) NOT NULL,
	[book_ISBN] [varchar](max) NOT NULL,
 CONSTRAINT [PK_books_1] PRIMARY KEY CLUSTERED 
(
	[book_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
USE [master]
GO
ALTER DATABASE [book_details] SET  READ_WRITE 
GO
