#Config datasource MySQL
# spring.datasource.url=jdbc:mysql://localhost:3306/shop_java5
# spring.datasource.username=spring_user
# spring.datasource.password=password
# spring.jpa.database-platform=org.hibernate.dialect.MySQL5InnoDBDialect
# spring.jpa.hibernate.ddl-auto=none
# spring.jpa.show-sql=true
# spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver

# Run the script by root account
uninstall plugin validate_password;
#
UNINSTALL COMPONENT 'file://component_validate_password';

DROP
DATABASE IF EXISTS `shop_java5`;

CREATE
DATABASE IF NOT EXISTS `shop_java5`;

DROP
USER IF EXISTS 'spring_user'@'%';

CREATE
USER 'spring_user'@'%' IDENTIFIED BY 'password';

GRANT ALL
ON `shop_java5`.* TO 'spring_user'@'%';

FLUSH
PRIVILEGES;


USE
`shop_java5`;

CREATE TABLE categories
(
    id   NVARCHAR(50) PRIMARY KEY,
    name NVARCHAR(255) NULL,
    note LONGTEXT NULL
);

CREATE TABLE `products`
(
    id          NVARCHAR(50) PRIMARY KEY,
    name        NVARCHAR(255) NULL,
    price       DECIMAL(12, 3) NULL,
    description LONGTEXT NULL,
    img         NVARCHAR(255) NULL,
    quantity    INT NULL,
    category_id NVARCHAR(50)
);

CREATE TABLE `users`
(
    id         INT AUTO_INCREMENT PRIMARY KEY,
    username   NVARCHAR(50) NOT NULL,
    `password` NVARCHAR(50) NULL,
    full_name  NVARCHAR(50) NULL,
    email      NVARCHAR(50) NULL,
    phone      NCHAR(10) NULL,
    `role`     INT NULL,
    img        NVARCHAR(50) NULL,
    address    NVARCHAR(255) NULL
);

CREATE TABLE `orders`
(
    id      INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    total   DECIMAL(12, 3) NOT NULL,
    phone   VARCHAR(11)    NOT NULL,
    address NVARCHAR(255) NOT NULL
);

CREATE TABLE `order_details`
(
    id         INT AUTO_INCREMENT PRIMARY KEY,
    order_id   INT,
    product_id NVARCHAR(50),
    quantity   INT            NOT NULL,
    price      DECIMAL(12, 3) NOT NULL
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
        ON
UPDATE CASCADE
ON
DELETE NO ACTION
;

INSERT INTO categories(id, name, note)
VALUES ('dm01', 'Túi Xách', 'dien thoai'),
       ('dm02', 'Ví', NULL),
       ('dm03', 'Điện Thoại', NULL),
       ('dm04', 'Quần Áo', 'bán quần áo');


INSERT INTO products(id, name, price, description, img, quantity, category_id)
VALUES ('sp01', 'Túi Xách Hiệu', 5000000, 'mu sai gon', 'tuixach4.jpg', 10, 'dm01'),
       ('sp02', 'Túi Xách Second', 100000, 'mu ha noi', 'tuixach3.jpg', 10, 'dm01'),
       ('sp03', 'ví', 8888000, 'vi', 'vi4.jpg', 10, 'dm02'),
       ('sp04', 'Ví ABC', 67890445, NULL, 'vi3.jpg', 10, 'dm02'),
       ('sp05', 'Túi Xách', 566655, 'mu abc', 'tuixach.jpg', 10, 'dm01'),
       ('sp06', 'Túi Xách US', 43536565, 'Mu Abc chuyên', 'tuixach1.jpg', 10, 'dm01'),
       ('sp07', 'Túi Xách Việt Nam', 32432434, 'Túi Xách việt', 'tuixach2.jpg', 10, 'dm01'),
       ('sp08', 'Ví Chính Hãng', 45443545, 'Ví CHính hãng', 'vi.jpg', 10, 'dm02'),
       ('sp09', 'Ví Đẹp', 345676879, 'Ví Đẹp', 'vi2.jpg', 10, 'dm02'),
       ('sp10', 'Vi Xinh', 6000000, 'Ví', 'vi3.jpg', 10, 'dm02');


INSERT INTO `users`(username, `password`, full_name, email, phone, `role`)
VALUES ('tula', '111', 'Lê Anh Tú', 'tula@fpt.edu.vn', '0908125123', 1),
       ('duynt', '222', 'Nguyễn Trần Duy', 'duynt@fpt.edu.vn', '0988444111', 0);
