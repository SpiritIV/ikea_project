-- Представление для товаров и категорий низкого уровня.
CREATE OR REPLACE VIEW products_and_down_lvl_categories(name, category_name) AS 
	SELECT p.name, do.name 
		FROM products AS p
			JOIN down_lvl_category_of_products AS do 
			ON do.id=p.down_lvl_category_of_products_id;
			
SELECT * FROM products_and_down_lvl_categories;

-- Представление для категорий и категорий товаров.
CREATE OR REPLACE VIEW categories_and_categories_of_products(name, category_products, category_rooms, category_services) AS 
	SELECT c.name, cp.name, cr.name, cs.name
		FROM categories AS c
			LEFT JOIN category_of_products AS cp 
			ON cp.category_id=c.id
			LEFT JOIN category_rooms AS cr 
			ON cr.category_id=c.id
			LEFT JOIN category_services AS cs 
			ON cs.category_id=c.id;
			
SELECT * FROM categories_and_categories_of_products;

-- Представление для городов и названий магазинов.
CREATE OR REPLACE VIEW cities_and_shops(city, shop_name) AS
	SELECT c.city_name, s.shop_name
		FROM shops AS s
			JOIN cities AS c
			ON s.city_id = c.id
	ORDER BY c.city_name;

SELECT * FROM cities_and_shops;


/*Triggers
* Sample for creation of new user.
*/
DELIMITER //
CREATE TRIGGER table_regulator_insert BEFORE INSERT ON users
FOR EACH ROW
BEGIN
	SET NEW.name = COALESCE(NEW.name, 'Fill field!');
	SET NEW.e_mail = COALESCE(NEW.e_mail, 'Fill field!');
END//





