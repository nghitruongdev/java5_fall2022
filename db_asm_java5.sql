#Config datasource MySQL
# spring.datasource.url=jdbc:mysql://localhost:3306/shop_java5
# spring.datasource.username=spring_user
# spring.datasource.password=password
# spring.jpa.database-platform=org.hibernate.dialect.MySQL5InnoDBDialect
# spring.jpa.hibernate.ddl-auto=none
# spring.jpa.show-sql=true
# spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver

-- # Run the script by root account
-- uninstall plugin validate_password;
-- # UNINSTALL COMPONENT 'file://component_validate_password';

DROP DATABASE IF EXISTS `shop_java5`;

CREATE DATABASE IF NOT EXISTS `shop_java5`;

DROP USER IF EXISTS 'spring_user'@'%';

CREATE USER 'spring_user'@'%' IDENTIFIED BY 'password';

GRANT ALL ON `shop_java5`.* TO 'spring_user'@'%';

FLUSH PRIVILEGES;


USE `shop_java5`;

CREATE TABLE categories
(
    id   NVARCHAR(50) PRIMARY KEY,
    name NVARCHAR(255) NULL,
    note LONGTEXT      NULL
);

CREATE TABLE `products`
(
    id          NVARCHAR(50) PRIMARY KEY ,
    name        NVARCHAR(255)  NULL,
    price       DECIMAL(12, 3) NULL,
    description LONGTEXT       NULL,
    img         NVARCHAR(255)  NULL,
    quantity    INT            NULL,
    category_id NVARCHAR(50)
);

CREATE TABLE `users`
(
    id         INT AUTO_INCREMENT PRIMARY KEY ,
    username   NVARCHAR(50)       NOT NULL,
    `password` NVARCHAR(50)       NULL,
    full_name  NVARCHAR(50)       NULL,
    email      NVARCHAR(50)       NULL,
    phone      NCHAR(10)          NULL,
    `role`     INT                NULL
);

CREATE TABLE `orders`
(
    id      INT AUTO_INCREMENT PRIMARY KEY ,
    user_id INT,
    total   DECIMAL(12, 3)     NOT NULL,
    phone   VARCHAR(11)        NOT NULL,
    address NVARCHAR(255)      NOT NULL
);

CREATE TABLE `order_details`
(
    id         INT AUTO_INCREMENT PRIMARY KEY,
    order_id   INT,
    product_id NVARCHAR(50),
    quantity   INT                NOT NULL,
    price      DECIMAL(12, 3)     NOT NULL
);

ALTER TABLE `products`
    ADD CONSTRAINT fk_product_category FOREIGN KEY (category_id) REFERENCES `categories` (id)
        ON UPDATE CASCADE ON DELETE NO ACTION
;


ALTER TABLE `orders`
    ADD CONSTRAINT fk_users_orders FOREIGN KEY (user_id) REFERENCES `users` (id)
        ON UPDATE CASCADE ON DELETE NO ACTION
;

ALTER TABLE `order_details`
    ADD CONSTRAINT fk_orders_order_details FOREIGN KEY (order_id) REFERENCES `orders` (id)
        ON UPDATE CASCADE ON DELETE NO ACTION,
    ADD CONSTRAINT fk_orders_products FOREIGN KEY (product_id) REFERENCES `products` (id)
        ON UPDATE CASCADE ON DELETE NO ACTION
;

INSERT INTO categories(id, name, note)
VALUES ('ct1','Tee','Áo phông 2hands'),
('ct2','Polo','Áo Polo 2hands'),
('ct3','Hoodie & Sweater','Hoodie và Sweater 2hands'),
('ct4','Cargo Pants','Cargo Pants 2hands'),
('ct5','Jean','Jean 2hands'),
('ct6','accessories','accessories 2hands');

INSERT INTO products(id, name, price, description, img, quantity, category_id)
VALUES  ('sp01','áo thun trơn trắng',150000.000,'Sản phẩm áo thun nam siêu thoáng mát','tee1.jpg',10,'ct1'),
('sp02','áo thun trơn đen',150000.000,'Sản phẩm áo thun đen siêu thoáng mát, đễ phối đồ','tee2.jpg',10,'ct1'),
('sp03','áo balo đen trơn',150000.000,'Áo balo đen trơn phù hợp ngày hè, vải mát 100% cotton','tee3.jpg',10,'ct1'),
('sp04','áo sơmi nam trắng',150000.000,'Sản phẩm áo sơmi nam phù hợp cho dân văn phòng mang đi làm','tee4.jpg',10,'ct1'),
('sp05','áo thun họa tiết rồng',150000.000,'Sản phẩm áo thun nam họa tiết rồng cực đẹp','tee5.jpg',10,'ct1'),
('sp06','áo thun cháy phố',150000.000,'Siêu phẩm áo thun nam cực đẹp dành cho dân chơi đi cháy phố cùng bạn gái','tee6.jpg',10,'ct1'),
('sp07','áo thun basic đen',150000.000,'Sản phẩm áo thun nam đen dành cho những tính đồ yêu thích sự đơn giản','tee7.jpg',10,'ct1'),
('sp08','áo balo trơn trắng ',150000.000,'Sản phẩm áo balo nam trắng phù hợp cho bạn mang đi tập gym 100% cotton','tee8.jpg',10,'ct1'),
('sp09','áo thun vàng mặt trời',150000.000,'Sản phẩm áo thun vàng mặt trời cho những bạn yêu thích ánh nắng mặt trời và có thể hòa làm 1 với cái năng của sg','tee9.jpg',10,'ct1'),
('sp10','áo thun đỏ mèo',150000.000,'Sản phẩm áo thun in hình mèo siêu đáng yêu và dễ thương','tee10.jpg',10,'ct1'),
-- ct2 polo
('sp11','áo polo trắng ',150000.000,'Sản phẩm áo polo trắng ko họa tiết, đơn giản, không cầu kỳ','polo1.jpg',10,'ct2'),
('sp12','áo polo đen handiovic',150000.000,'Sản phẩm áo polo đen handiovic 100% cotton','polo2.jpg',10,'ct2'),
('sp13','áo polo vàng đất',150000.000,'Sản phẩm áo polo vàng đất có hình cá sấu ','polo3.jpg',10,'ct2'),
('sp14','áo polo trắng trơn ',150000.000,'Sản phẩm áo polo trắng trơn, siêu thoáng mát, 100 cotton','polo4.jpg',10,'ct2'),
('sp15','áo polo xanh lá cây',150000.000,'Sản phẩm áo polo xanh là cây, dành cho những ai có da ngăm đen ','polo5.jpg',10,'ct2'),
('sp16','áo polo nhiều họa tiết',150000.000,'Sản phẩm áo polo nam họa tiết,dành cho nhũng ai yêu thích sự cháy phố và muốn làm trung tâm sự chú ý','polo6.jpg',10,'ct2'),
('sp17','áo polo đen ',150000.000,'Sản phẩm áo polo đen trơn, thoáng mát ngày hè nóng bức, dành cho nhũng tín đồ yêu thích sự đơn giản','polo7.jpg',10,'ct2'),
('sp18','áo polo vàng đỏ',150000.000,'Sản phẩm áo polo nam vàng cổ đỏ, cực kỳ thoáng mát và dễ phối đồ','polo8.jpg',10,'ct2'),
('sp19','áo polo xanh trắng',150000.000,'Sản phẩm áo polo xanh cổ trắng, cực kỳ thoáng mát','polo9.jpg',10,'ct2'),
('sp20','áo polo trắng đen',150000.000,'Sản phẩm áo polo trắng cổ đen, cực kỳ đơn giản và dễ phối đồ','polo10.jpg',10,'ct2'),
-- ct03 Hoodie & Sweater
('sp21','Hoodie trắng đen',150000.000,'Hoodie trắng phối màu cùng đen, form rộng , 100% cotton mang siêu thoáng mát và dễ phối đồ','hoodie1.jpg',10,'ct3'),
('sp22','Hoodie trắng ',150000.000,'Hoodie trắng đơn giản và dễ phối đồ, cam kết 100% cotton form rộng và thoáng mát','hoodie2.jpg',10,'ct3'),
('sp23','Hoodie đen',150000.000,'Hoodie đen đơn giản và dễ phối đồ, cam kết 100% cotton form rộng và thoáng mát','hoodie3.jpg',10,'ct3'),
('sp24','Hoodie xám',150000.000,'Hoodie xám đơn giản và dễ phối đồ, cam kết 100% cotton form rộng và thoáng mát','hoodie4.jpg',10,'ct3'),
('sp25','Hoodie xanh',150000.000,'Hoodie xanh đơn giản và dễ phối đồ, cam kết 100% cotton form rộng và thoáng mát','hoodie5.jpg',10,'ct3'),
('sp26','Sweater đen',150000.000,'Sweater đen đơn giản và dễ phối đồ, cam kết 100% cotton form rộng và thoáng mát','hoodie6.jpg',10,'ct3'),
('sp27','Sweater trắng',150000.000,'Sweater trắng đơn giản và dễ phối đồ, cam kết 100% cotton form rộng và thoáng mát','hoodie7.jpg',10,'ct3'),
('sp28','Sweater xanh',150000.000,'Sweater xanh đơn giản và dễ phối đồ, cam kết 100% cotton form rộng và thoáng mát','hoodie8.jpg',10,'ct3'),
('sp29','Sweater xám',150000.000,'Sweater xám đơn giản và dễ phối đồ, cam kết 100% cotton form rộng và thoáng mát','hoodie9.jpg',10,'ct3'),
('sp30','Sweater đỏ',150000.000,'Sweater đỏ đơn giản và dễ phối đồ, cam kết 100% cotton form rộng và thoáng mát','hoodie10.jpg',10,'ct3'),
-- ct4 Cargo Pants
('sp31','Cargo Pants đen',150000.000,'Cargo Pants cùng với túi hộp to, bạn có thể đựng được rất nhiều đồ cũng như thể hiện phong cách bụi bặm đường phố của mình ','pants1.jpg',10,'ct4'),
('sp32','Cargo Pants nâu',150000.000,'Cargo Pants cùng với túi hộp to, bạn có thể đựng được rất nhiều đồ cũng như thể hiện phong cách bụi bặm đường phố của mình ','pants2.jpg',10,'ct4'),
('sp33','Cargo Pants xanh rêu',150000.000,'Cargo Pants cùng với túi hộp to, bạn có thể đựng được rất nhiều đồ cũng như thể hiện phong cách bụi bặm đường phố của mình ','pants3.jpg',10,'ct4'),
('sp34','Cargo Pants tím',150000.000,'Cargo Pants cùng với túi hộp to, bạn có thể đựng được rất nhiều đồ cũng như thể hiện phong cách bụi bặm đường phố của mình ','pants4.jpg',10,'ct4'),
('sp35','Cargo Pants xám',150000.000,'Cargo Pants cùng với túi hộp to, bạn có thể đựng được rất nhiều đồ cũng như thể hiện phong cách bụi bặm đường phố của mình ','pants5.jpg',10,'ct4'),
('sp36','Cargo Pants váng đất',150000.000,'Cargo Pants cùng với túi hộp to, bạn có thể đựng được rất nhiều đồ cũng như thể hiện phong cách bụi bặm đường phố của mình ','pants6.jpg',10,'ct4'),
('sp37','Cargo Pants xanh',150000.000,'Cargo Pants cùng với túi hộp to, bạn có thể đựng được rất nhiều đồ cũng như thể hiện phong cách bụi bặm đường phố của mình ','pants7.jpg',10,'ct4'),
('sp38','Cargo Pants xanh dương',150000.000,'Cargo Pants cùng với túi hộp to, bạn có thể đựng được rất nhiều đồ cũng như thể hiện phong cách bụi bặm đường phố của mình ','pants8.jpg',10,'ct4'),
('sp39','Cargo Pants trắng ',150000.000,'Cargo Pants cùng với túi hộp to, bạn có thể đựng được rất nhiều đồ cũng như thể hiện phong cách bụi bặm đường phố của mình ','pants9.jpg',10,'ct4'),
('sp40','Cargo Pants hồng',150000.000,'Cargo Pants cùng với túi hộp to, bạn có thể đựng được rất nhiều đồ cũng như thể hiện phong cách bụi bặm đường phố của mình ','pants10.jpg',10,'ct4'),
-- ct5 Jean
('sp41','Jean slimfit Levis',150000.000,'Quần slimfit còn thích hợp với những chàng trai có chiều cao “khiêm tốn”, chỉ cần xắn gấu quần lên vài cm là bạn sẽ trông thanh thoát hơn và năng động ','jean1.jpg',10,'ct5'),
('sp42','Jean Skinny Levis',150000.000,'Chất liệu jeans mỏng, mát và thoải mái được lựa chọn cho việc di chuyển thuận tiện. Skinny-style giúp bạn khoe được những nét đẹp cơ thể một cách khéo léo và cuốn hút nhất mà không làm mất đi vẻ nam tính','jean2.jpg',10,'ct5'),
('sp43','Jean Relaxed Levis',150000.000,' Form quần dành cho những ai muốn “giải phóng” cơ thể mình khỏi sự gò bó và thể hiện tinh thần thoải mái.','jean3.jpg',10,'ct5'),
('sp44','Jean Carrot Levis',150000.000,'Quần carrot fit tương đối giống quần slim tuy nhiên phần hông và phần đùi của quần carrot rộng hơn, ôm dần xuống mắt cá chân. Chính vì thế những người có khuyết điểm phần đùi và hông hơi to có thể lựa chọn quần này để mặc giúp tôn dáng hơn rất nhiều.','jean4.jpg',10,'ct5'),
('sp45','Jean Slim straight fit Levis',150000.000,'Slim straight fit jeans là sự kết hợp của quần Slim fit jeans và Straight fit jeans, Quần slim straight fit phù hợp với người có dáng cao gầy','jean5.jpg',10,'ct5'),
('sp46','Jean Straight fit jeans Levis',150000.000,'Straight fit jeans là dáng quần classic không bao giờ lỗi thời,Quần straight fit jeans phù hợp với hầu hết các dáng người : to, cao, thấp, mập, gầy.','jean6.jpg',10,'ct5'),
('sp47','Athletic fit Levis',150000.000,'Athletic fit jeans là biến thể của dáng quần straight fit jeans, Dáng quần athletic fit có phần mông và hông hơi rộng, dành cho người thích thể thao vận động.','jean7.jpg',10,'ct5'),
('sp48','Jean Tapered fit Levis',150000.000,'Tapered fit jeans là nói đến loại quần có ống quần nhỏ dần về phía gấu quần.','jean8.jpg',10,'ct5'),
('sp49','Jean Regular fit Levis',150000.000,'Dáng quần regular fit có ống quần suông thẳng từ đùi cho đến gấu quần.','jean9.jpg',10,'ct5'),
('sp50','Jean Bootcut  Levis',150000.000,'Dáng quần boot cut có phần hông và đùi giống với straight fit jeans, hần ống quần hơi loe ra tính từ đầu gối đến gấu quần.','jean10.jpg',10,'ct5'),
-- ct6 accessories
('sp51','Nón Gucci',150000.000,'Hàng GUCCI độc lạ, hiếm, không có cái thứ 2','acc1.jpg',10,'ct6'),
('sp52','Nón Burberry',150000.000,'Nón màu xanh đến từ hãng BURBERRY nổi tiếng, đẹp độc lạ','acc12.jpg',10,'ct6'),
('sp53','Belt Paul Smith',150000.000,'Dây thắt lưng đến từ hãng GUCCI','acc3.jpg',10,'ct6'),
('sp54','Sportmax Belt',150000.000,'Dây thắt lưng đến từ hãng GUCCI','acc4.jpg',10,'ct6'),
('sp55','Nón Armani Jeans',150000.000,'Armani Jeans nhà sản xuất nón đứng thứ 15 thế giới','acc5.jpg',10,'ct6'),
('sp56','Hugo Boss Tie',150000.000,'Tie đến từ hãng BOSS dành cho quý ông','acc6.jpg',10,'ct6'),
('sp57','Hugo Boss Tie',150000.000,'Tie đến từ hãng BOSS dành cho quý ông','acc7.jpg',10,'ct6'),
('sp58','Hugo Boss Tie',150000.000,'Tie đến từ hãng BOSS dành cho quý ông','acc8.jpg',10,'ct6'),
('sp59','Prada Bag',150000.000,'Túi xách đến từ hãng Prada','acc9.jpg',10,'ct6'),
('sp60','Michael Kors Wallet',150000.000,'Ví Michael Kors','acc10.jpg',10,'ct6');


INSERT INTO `users`(username, `password`, full_name, email, phone, `role`)
VALUES ('thaian','123','Vũ Quốc Thái An','anvqtps@fpt.edu.vn','0123456789',1),
('xuanhao','123','Nguyễn Xuân Hảo','haonxt@fpt.edu.vn','0988444111',0),
('vinhnghi','123','Trương Vĩnh Nghi','nghitv@fpt.edu.vn','0988444111',1),
('thanhtu','123','Lê Thanh Tú','tultt@fpt.edu.vn','0988444111',0);

insert into `orders`(user_id,total,phone,address) 
value (1,30000.000,03574903655,'nam kỳ khởi nghĩa'),
(2,30000.000,03574903655,'nam kỳ khởi nghĩa'),
(2,30000.000,03574903655,'nam kỳ khởi nghĩa'),
(2,30000.000,03574903655,'nam kỳ khởi nghĩa'),
(2,30000.000,03574903655,'nam kỳ khởi nghĩa'),
(2,30000.000,03574903655,'nam kỳ khởi nghĩa'),
(1,30000.000,03574903655,'nam kỳ khởi nghĩa'),
(1,30000.000,03574903655,'nam kỳ khởi nghĩa'),
(1,30000.000,03574903655,'nam kỳ khởi nghĩa'),
(1,30000.000,03574903655,'nam kỳ khởi nghĩa');

insert into `order_details`(order_id,product_id,quantity,price)
value (1,'sp11',2,300000.000),
(2,'sp33',2,300000.000),
(3,'sp14',2,300000.000),
(4,'sp23',2,300000.000),
-- (5,'sp3',2,300000.000),
(6,'sp30',2,300000.000),
(7,'sp38',2,300000.000),
(8,'sp54',2,300000.000),
(9,'sp22',2,300000.000),
(10,'sp12',2,300000.000);
