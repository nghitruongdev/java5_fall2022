DROP DATABASE IF EXISTS `J5Shop`;

CREATE DATABASE IF NOT EXISTS `J5Shop`;

USE `J5Shop`;

/* SQLINES DEMO *** le [dbo].[accounts]    Script Date: 5/31/2022 9:25:30 AM ******/
/* SET ANSI_NULLS ON */

/* SET QUOTED_IDENTIFIER ON */

/* SET ANSI_PADDING ON */


CREATE TABLE `accounts`
(
    `username`  varchar(50)  NOT NULL,
    `activated` Tinyint      NOT NULL,
    `admin`     Tinyint      NOT NULL,
    `email`     varchar(50)  NULL,
    `fullname`  nvarchar(50) NULL,
    `password`  varchar(50)  NULL,
    `photo`     varchar(50)  NULL,
    PRIMARY KEY (`username` ASC)
);

/* SET ANSI_PADDING OFF */

/* SQLINES DEMO *** le [dbo].[categories]    Script Date: 5/31/2022 9:25:31 AM ******/
/* SET ANSI_NULLS ON */

/* SET QUOTED_IDENTIFIER ON */

/* SET ANSI_PADDING ON */


CREATE TABLE `categories`
(
    `id`   varchar(50)  NOT NULL,
    `name` nvarchar(50) NULL,
    PRIMARY KEY (`id` ASC)
);

/* SET ANSI_PADDING OFF */

/* SQLINES DEMO *** le [dbo].[orderdetails]    Script Date: 5/31/2022 9:25:31 AM ******/
/* SET ANSI_NULLS ON */

/* SET QUOTED_IDENTIFIER ON */


CREATE TABLE `order_details`
(
    `id`        int AUTO_INCREMENT NOT NULL,
    `price`     Double             NULL,
    `quantity`  int                NULL,
    `orderid`   int                NULL,
    `productid` int                NULL,
    PRIMARY KEY (`id` ASC)
);

/* SQLINES DEMO *** le [dbo].[orders]    Script Date: 5/31/2022 9:25:31 AM ******/
/* SET ANSI_NULLS ON */

/* SET QUOTED_IDENTIFIER ON */

/* SET ANSI_PADDING ON */


CREATE TABLE `orders`
(
    `id`         int AUTO_INCREMENT NOT NULL,
    `address`    nvarchar(50)       NULL,
    `createdate` date               NULL,
    `username`   varchar(50)        NULL,
    PRIMARY KEY (`id` ASC)
);

/* SET ANSI_PADDING OFF */

/* SQLINES DEMO *** le [dbo].[products]    Script Date: 5/31/2022 9:25:31 AM ******/
/* SET ANSI_NULLS ON */

/* SET QUOTED_IDENTIFIER ON */

/* SET ANSI_PADDING ON */

CREATE TABLE `products`
(
    `id`         int AUTO_INCREMENT NOT NULL,
    `available`  Tinyint            NULL,
    `createdate` date               NULL,
    `image`      varchar(50)        NULL,
    `name`       nvarchar(50)       NULL,
    `price`      Double             NULL,
    `categoryid` varchar(50)        NULL,
    PRIMARY KEY (`id` ASC)
);

/* SET ANSI_PADDING OFF */

INSERT `accounts` (`username`, `activated`, `admin`, `email`, `fullname`, `password`, `photo`)
VALUES ('phucnh', 1, 1, 'phucnhps19246@fpt.edu.vn', 'Nguyễn Hoàng Phúc', '123', 'phucnh.jpg');
INSERT `categories` (`id`, `name`)
VALUES ('DM01', 'Tẩy trang');
INSERT `categories` (`id`, `name`)
VALUES ('DM02', 'Sữa rửa mặt');
INSERT `categories` (`id`, `name`)
VALUES ('DM03', 'Toner - Xịt khoáng');
INSERT `categories` (`id`, `name`)
VALUES ('DM04', 'TEST');
/* SET IDENTITY_INSERT [dbo].[products] ON */

INSERT `products` (`id`, `available`, `createdate`, `image`, `name`, `price`, `categoryid`)
VALUES (1, 1, CAST('2022-03-01' AS Date), '1.jpg', 'Good night cleanser', 190000, 'DM02');
INSERT `products` (`id`, `available`, `createdate`, `image`, `name`, `price`, `categoryid`)
VALUES (2, 1, CAST('2022-03-02' AS Date), '2.jpg', 'Fairy Water', 350000, 'DM03');
INSERT `products` (`id`, `available`, `createdate`, `image`, `name`, `price`, `categoryid`)
VALUES (3, 1, CAST('2022-03-03' AS Date), '3.jpg', 'Velvet Dream', 380000, 'DM03');
INSERT `products` (`id`, `available`, `createdate`, `image`, `name`, `price`, `categoryid`)
VALUES (4, 1, CAST('2022-03-04' AS Date), '4.jpg', 'Tricky Duet', 190000, 'DM02');
INSERT `products` (`id`, `available`, `createdate`, `image`, `name`, `price`, `categoryid`)
VALUES (5, 1, CAST('2022-03-04' AS Date), '5.jpg', 'Rough Love', 380000, 'DM03');
INSERT `products` (`id`, `available`, `createdate`, `image`, `name`, `price`, `categoryid`)
VALUES (6, 1, CAST('2022-03-05' AS Date), '6.jpg', 'Tender Wonder', 350000, 'DM03');
INSERT `products` (`id`, `available`, `createdate`, `image`, `name`, `price`, `categoryid`)
VALUES (7, 1, CAST('2022-03-05' AS Date), '7.jpg', 'Emmie B5 Cleanser', 230000, 'DM02');
ALTER TABLE `order_details`
    ADD FOREIGN KEY (`orderid`)
        REFERENCES `orders` (`id`);

ALTER TABLE `order_details`
    ADD FOREIGN KEY (`productid`)
        REFERENCES `products` (`id`);

ALTER TABLE `orders`
    ADD FOREIGN KEY (`username`)
        REFERENCES `accounts` (`username`);

ALTER TABLE `products`
    ADD FOREIGN KEY (`categoryid`)
        REFERENCES `categories` (`id`);