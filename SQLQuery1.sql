USE [master]
GO

/****** Object:  Database [coquies]    Script Date: 02/10/2019 12:48:33 p.m. ******/
CREATE DATABASE [coquies]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'coquies', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.COQUIES\MSSQL\DATA\coquies.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'coquies_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.COQUIES\MSSQL\DATA\coquies_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [coquies] SET COMPATIBILITY_LEVEL = 120
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [coquies].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [coquies] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [coquies] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [coquies] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [coquies] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [coquies] SET ARITHABORT OFF 
GO

ALTER DATABASE [coquies] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [coquies] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [coquies] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [coquies] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [coquies] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [coquies] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [coquies] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [coquies] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [coquies] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [coquies] SET  DISABLE_BROKER 
GO

ALTER DATABASE [coquies] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [coquies] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [coquies] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [coquies] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [coquies] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [coquies] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [coquies] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [coquies] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [coquies] SET  MULTI_USER 
GO

ALTER DATABASE [coquies] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [coquies] SET DB_CHAINING OFF 
GO

ALTER DATABASE [coquies] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [coquies] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO

ALTER DATABASE [coquies] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [coquies] SET  READ_WRITE 
GO


