-- ALTER LOGIN [sa] WITH DEFAULT_DATABASE=[master]
-- GO
-- USE [master]
-- GO
-- ALTER LOGIN [sa] WITH PASSWORD='@songlong1'
-- GO

USE [master]
GO

DROP DATABASE IF EXISTS [J5Shop]
GO
CREATE DATABASE [J5Shop]
GO
USE [J5Shop]
GO
/****** Object:  Table [dbo].[accounts]    Script Date: 5/31/2022 9:25:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[accounts]
(
    [username] [varchar](50) NOT NULL,
    [activated] [bit] NOT NULL,
    [admin] [bit] NOT NULL,
    [email] [varchar](50) NULL,
    [fullname] [nvarchar](50) NULL,
    [password] [varchar](50) NULL,
    [photo] [varchar](50) NULL,
    PRIMARY KEY CLUSTERED
(
[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]

    GO
    SET ANSI_PADDING OFF
    GO
/****** Object:  Table [dbo].[categories]    Script Date: 5/31/2022 9:25:31 AM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
    SET ANSI_PADDING ON
    GO
CREATE TABLE [dbo].[categories](
    [id] [varchar](50) NOT NULL,
    [name] [nvarchar](50) NULL,
    PRIMARY KEY CLUSTERED
(
[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]

    GO
    SET ANSI_PADDING OFF
    GO
/****** Object:  Table [dbo].[order_details]    Script Date: 5/31/2022 9:25:31 AM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[order_details](
    [id] [int] IDENTITY(1,1) NOT NULL,
    [price] [float] NULL,
    [quantity] [int] NULL,
    [orderid] [int] NULL,
    [productid] [int] NULL,
    PRIMARY KEY CLUSTERED
(
[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]

    GO
/****** Object:  Table [dbo].[orders]    Script Date: 5/31/2022 9:25:31 AM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
    SET ANSI_PADDING ON
    GO
CREATE TABLE [dbo].[orders](
    [id] [int] IDENTITY(1,1) NOT NULL,
    [address] [nvarchar](50) NULL,
    [createdate] [date] NULL,
    [username] [varchar](50) NULL,
    PRIMARY KEY CLUSTERED
(
[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]

    GO
    SET ANSI_PADDING OFF
    GO
/****** Object:  Table [dbo].[products]    Script Date: 5/31/2022 9:25:31 AM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
    SET ANSI_PADDING ON
    GO
CREATE TABLE [dbo].[products](
    [id] [int] IDENTITY(1,1) NOT NULL,
    [available] [bit] NULL,
    [createdate] [date] NULL,
    [image] [varchar](50) NULL,
    [name] [nvarchar](50) NULL,
    [price] [float] NULL,
    [categoryid] [varchar](50) NULL,
    PRIMARY KEY CLUSTERED
(
[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]

    GO
    SET ANSI_PADDING OFF
    GO
    INSERT [dbo].[accounts] ([username], [activated], [admin], [email], [fullname], [password], [photo]) VALUES (N'phucnh', 1, 1, N'phucnhps19246@fpt.edu.vn', N'Nguyễn Hoàng Phúc', N'123', N'phucnh.jpg')
    INSERT [dbo].[categories] ([id], [name]) VALUES (N'DM01', N'Tẩy trang')
    INSERT [dbo].[categories] ([id], [name]) VALUES (N'DM02', N'Sữa rửa mặt')
    INSERT [dbo].[categories] ([id], [name]) VALUES (N'DM03', N'Toner - Xịt khoáng')
    INSERT [dbo].[categories] ([id], [name]) VALUES (N'DM04', N'TEST')
    SET IDENTITY_INSERT [dbo].[products] ON

    INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (1, 1, CAST(N'2022-03-01' AS Date), N'1.jpg', N'Good night cleanser', 190000, N'DM02')
    INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (2, 1, CAST(N'2022-03-02' AS Date), N'2.jpg', N'Fairy Water', 350000, N'DM03')
    INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (3, 1, CAST(N'2022-03-03' AS Date), N'3.jpg', N'Velvet Dream', 380000, N'DM03')
    INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (4, 1, CAST(N'2022-03-04' AS Date), N'4.jpg', N'Tricky Duet', 190000, N'DM02')
    INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (5, 1, CAST(N'2022-03-04' AS Date), N'5.jpg', N'Rough Love', 380000, N'DM03')
    INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (6, 1, CAST(N'2022-03-05' AS Date), N'6.jpg', N'Tender Wonder', 350000, N'DM03')
    INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (7, 1, CAST(N'2022-03-05' AS Date), N'7.jpg', N'Emmie B5 Cleanser', 230000, N'DM02')
    SET IDENTITY_INSERT [dbo].[products] OFF
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD FOREIGN KEY([orderid])
    REFERENCES [dbo].[orders] ([id])
    GO
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD FOREIGN KEY([productid])
    REFERENCES [dbo].[products] ([id])
    GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([username])
    REFERENCES [dbo].[accounts] ([username])
    GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD FOREIGN KEY([categoryid])
    REFERENCES [dbo].[categories] ([id])
    GO
