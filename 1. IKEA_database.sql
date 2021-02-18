DROP DATABASE IKEA;
CREATE DATABASE IKEA;
USE IKEA;

DROP TABLE IF EXISTS ip_adresses;
DROP TABLE IF EXISTS cities;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS shops;
DROP TABLE IF EXISTS products_in_shops;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS category_rooms;
DROP TABLE IF EXISTS category_services;
DROP TABLE IF EXISTS category_of_products;
DROP TABLE IF EXISTS down_lvl_category_of_products;
DROP TABLE IF EXISTS photos;
DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS dates_for_sale;
DROP TABLE IF EXISTS views_of_categories;

-- Table for ip adresses.
CREATE TABLE IF NOT EXISTS ip_adresses(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	ip VARCHAR(255) NOT NULL,
	user_id INT UNSIGNED,
	city_id INT UNSIGNED NOT NULL,
	visited_at DATETIME DEFAULT NOW(),
  	leave_at DATETIME DEFAULT NOW() ON UPDATE NOW() 
  
);

-- Table cities.
CREATE TABLE IF NOT EXISTS cities(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	city_name VARCHAR(255) NOT NULL
);

-- Fill table cities.
INSERT INTO `cities` VALUES 
	(1,'Moscow'),
	(2,'Omsk'),
	(3,'St. Petersburg'),
	(4,'Rostov-on-Don'),
	(5,'Adygea-Kuban'),
	(6,'Samara'),
	(7,'Yekaterinburg'),
	(8,'Ufa'),
	(9,'Nizhny Novgorod'),
	(10,'Kazan'),
	(11,'Novosibirsk'),
	(12,'Tumen');

-- Table with users.
CREATE TABLE IF NOT EXISTS users(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	city_id INT UNSIGNED NOT NULL,
	name VARCHAR(255) NOT NULL,
	shop_id INT UNSIGNED NOT NULL,
	e_mail VARCHAR(255) NOT NULL UNIQUE
);

-- Table for shops.
CREATE TABLE IF NOT EXISTS shops(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	city_id INT UNSIGNED NOT NULL,
	shop_name VARCHAR(255) NOT NULL
);

-- Fill table shops.
INSERT INTO `shops` VALUES 
	(1, 1, 'Himki'),
	(2, 1, 'Tepliy stan'),
	(3, 1, 'Belaya dacha'),
	(4, 1, 'Hodinskoye pole'),
	(5, 1, 'Dizain studia Botanicheskiy sad'),
	(6, 1, 'Dizain studia Afimoll'),
	(7, 3, 'Parnas'),
	(8, 3, 'Dibenko'),
	(9, 3, 'Dizain studia Atlantik city'),
	(10, 3, 'Dizain studia Leto'),
	(11, 2, 'IKEA Omsk'),
	(12, 4, 'IKEA Rostov-on-Don'),
	(13, 5, 'IKEA Adygea-Kuban'),
	(14, 6, 'IKEA Samara'),
	(15, 7, 'IKEA Yekaterinburg'),
	(16, 8, 'IKEA Ufa'),
	(17, 9, 'IKEA Nizhny Novgorod'),
	(18, 10, 'IKEA Kazan'),
	(19, 11, 'IKEA Novosibirsk'),
	(20, 12,'Tumen');


CREATE TABLE IF NOT EXISTS products_in_shops(
	have_or_not BOOL NOT NULL,
	shop_id INT UNSIGNED NOT NULL,
	product_id INT UNSIGNED NOT NULL,
	PRIMARY KEY (shop_id, product_id)
);

-- Table categories.
CREATE TABLE IF NOT EXISTS categories(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	value_of_views INT UNSIGNED NOT NULL
);

-- Fill categories.
INSERT INTO `categories` VALUES 
	(1,'Products', 156),
	(2,'Rooms', 100),
	(3,'News', 134),
	(4,'Inspiration', 67),
	(5,'Services', 58);

-- Table category of products.
CREATE TABLE IF NOT EXISTS category_of_products(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	category_id INT UNSIGNED NOT NULL,
	name VARCHAR(255) NOT NULL,
	value_of_views INT UNSIGNED NOT NULL
);

-- Fill category of products.
INSERT INTO `category_of_products` VALUES
	(1, 1, 'Winter edition', 24),
	(2, 1, 'Furniture', 178),
	(3, 1, 'Storage and order', 43),
	(4, 1, 'Textile', 87),
	(5, 1, 'Home decor', 94),
	(6, 1, 'Kitchen and household appliances', 145),
	(7, 1, 'Crockery and cooking utensils', 65),
	(8, 1, 'Beds and mattresses', 97),
	(9, 1, 'Products for kids', 32),
	(10, 1, 'Buthrooms', 63),
	(11, 1, 'Washing and cleaning', 48),
	(12, 1, 'Light', 101);

-- Table lower level for category of products.
CREATE TABLE IF NOT EXISTS down_lvl_category_of_products(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	category_of_products_id INT UNSIGNED NOT NULL,
	name VARCHAR(255) NOT NULL
);

-- Fill for category furniture.
INSERT INTO `down_lvl_category_of_products` VALUES
	(1, 2, 'Sliding wardrobes and wardrobes'),
	(2, 2, 'Shelving and bookcases'),
	(3, 2, 'Tables'),
	(4, 2, 'Chaires'),
	(5, 2, 'Beds'),
	(6, 2, 'Chests of drawers and drawers'),
	(7, 2, 'Upholstered furniture'),
	(8, 2, 'Furniture for TV'),
	(9, 2, 'Cupboards and cabinets'),
	(10, 2, 'Sideboards and console tables'),
	(11, 2, 'Modules and tables on wheels'),
	(12, 2, 'Bar furniture');

-- Table products.
CREATE TABLE IF NOT EXISTS products(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	sale_id INT UNSIGNED,
	down_lvl_category_of_products_id INT UNSIGNED NOT NULL,
	name VARCHAR(255) NOT NULL,
	price INT UNSIGNED NOT NULL,
	views_value INT UNSIGNED NOT NULL,
	purchases_value INT UNSIGNED NOT NULL,
	photo_id INT UNSIGNED NOT NULL,
	info_about_product TEXT NOT NULL
);

-- Fill table of products
INSERT INTO `products` VALUES
	(1, 1, 1, 'ПАКС', 23900, 1, 10, 5, 'Этот стильный снаружи и рационально организованный внутри гардероб гарантированно будет много лет хранить вашу одежду.'),
	(2, 2, 1, 'ФРИТИДС', 13200, 50, 23, 2, 'Двери с петлями для плавного закрывания всегда закрываются бесшумно — даже в разгар жаркого спора.'),
	(3, 3, 1, 'ВИСТХУС', 13200, 34, 2, 3, 'Нижние ящики на колесах - легко передвигаются.'),
	(4, 4, 1, 'КЛЕППСТАД', 6999, 45, 10, 4, 'Просто и практично! Отличное решение, когда вам нужен базовый гардероб с возможностью установить дополнительные полки. '),
	(5, 5, 1, 'БРИМНЭС', 8999, 53, 50, 5, 'Дом должен быть безопасным местом для всей семьи, поэтому обязательно крепите эту мебель к стене с помощью прилагаемого крепежа.'),
	(6, 1, 1, 'ОПХУС', 5530, 42, 34, 6, 'Решения для хранения серии ОПХУС подойдут для самых разных помещений. '),
	(7, 2, 2, 'БИЛЛИ', 11990, 120, 76, 7, 'Выбор настоящих книголюбов, который никогда не выходит из моды.'),
	(8, 3, 2, 'БЕСТО', 36199, 63, 78, 8, 'Благодаря доводчикам ящики закрываются плавно и бесшумно.'),
	(9, 4, 2, 'ХЕЙНЕ', 1299, 124, 110, 9, 'Система хранения ХЕЙНЕ отлично подойдет для гаража, кладовой ли подвала.'),
	(10, 5, 2, 'ЛИАТОРП', 15999, 48, 32, 10, 'Дизайн этой мебели напоминает о неспешном течении загородной жизни.'),
	(11, 1, 2, 'КАЛЛАКС', 7699, 21, 4, 11, 'Легко собрать благодаря подготовленным отверстиям для ножек.'),
	(12, 2, 2, 'АЛЬБЕРТ', 599, 67, 60, 12, 'Необработанное дерево; можно покрыть маслом, воском или морилкой.'),
	(13, 3, 2, 'БРИМНЭС', 5499, 51, 29, 13, 'Съемные полки позволяют регулировать внутреннее пространство в соответствии с потребностями хранения.'),
	(14, 4, 2, 'ХИЛЛИС', 899, 90, 65, 14, 'Можно использовать в помещении и на улице.'),
	(15, 5, 3, 'МИККЕ', 5999, 31, 25, 15, 'Благодаря лаконичному дизайнерскому решению эта мебель прекрасно впишется в любой интерьер.'),
	(16, 1, 3, 'ЛИННМОН', 1999, 85, 32, 16, 'С отверстиями под ножки, легко собирать.'),
	(17, 2, 3, 'ИНГАТОРП', 21999, 21, 19, 17, 'Размер стола легко изменить. Благодаря вкладной доске, хранящейся под столешницей, за столом могут сидеть от 4 до 6 человек.'),
	(18, 3, 3, 'ХЕМНЭС', 14999, 41, 29, 18, 'Вам не придется выбирать: в этом предмете мебели найдется место как для косметики, так и для канцелярских принадлежностей и ноутбука.'),
	(19, 4, 3, 'ЭКЕДАЛЕН', 11999, 20, 16, 19, 'Когда стол не разложен, на поверхности столешницы нет никаких швов.'),
	(20, 5, 3, 'АРКЕЛЬСТОРП', 12999, 33, 12, 20, 'Благодаря лицевой отделке задней панели модуль можно поставить в центр комнаты.');

-- Table for rooms.
CREATE TABLE IF NOT EXISTS category_rooms(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	category_id INT UNSIGNED NOT NULL,
	name VARCHAR(255) NOT NULL
);

-- Fill category rooms.
INSERT INTO `category_rooms` VALUES
	(1, 2, 'Гостиная'),
	(2, 2, 'Спальня'),
	(3, 2, 'Кухня'),
	(4, 2, 'Столовая'),
	(5, 2, 'Детская'),
	(6, 2, 'Рабочий кабинет'),
	(7, 2, 'Прихожая'),
	(8, 2, 'Ванная комната'),
	(9, 2, 'Садовая мебель');

-- Table for services.
CREATE TABLE IF NOT EXISTS category_services(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	category_id INT UNSIGNED NOT NULL,
	name VARCHAR(255) NOT NULL
);

-- Fill category services.
INSERT INTO `category_services` VALUES
	(1, 5, 'Доставка и самовывоз'),
	(2, 5, 'Обмен и возврат'),
	(3, 5, 'Сборка и установка'),
	(4, 5, 'Рассрочка и кредит'),
	(5, 5, 'Планирование'),
	(6, 5, 'Замер'),
	(7, 5, 'Услуга по обустройству дома'),
	(8, 5, 'Пошив изделий'),
	(9, 5, 'Сервис YouDo');

-- Table for photos.
CREATE TABLE IF NOT EXISTS photos(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255) NOT NULL
);

-- Table for sales.
CREATE TABLE IF NOT EXISTS sales(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	discount_value INT UNSIGNED NOT NULL,
	date_id INT UNSIGNED NOT NULL
);

-- Fill sales table.
INSERT INTO `sales` VALUES
	(1, 'Зимняя', 25, 1),
	(2, 'Весенняя', 30, 2),
	(3, 'Семейная', 35, 3),
	(4, 'Летняя', 20, 4),
	(5, 'Новогодняя', 50, 5);
	

-- Dates for sales.
CREATE TABLE IF NOT EXISTS dates_for_sale(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	begin_at DATETIME DEFAULT NOW(),
	finish_at DATETIME DEFAULT NOW()
);

-- Fill dates of sales.
INSERT INTO `dates_for_sale` VALUES
	(1, '2019-12-01', '2019-12-15'),
	(2, '2020-04-05', '2020-04-23'),
	(3, '2020-05-01', '2020-05-10'),
	(4, '2020-07-01', '2020-07-21'),
	(5, '2019-12-27', '2019-12-31');