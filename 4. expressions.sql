-- Общее число просмотров категорий.
SELECT SUM(value_of_views) as general_amount_for_categories FROM categories;

-- Общее число просмотров товаров.
SELECT SUM(views_value) as general_amount_for_products FROM products;

-- Число пользователей, которые посещали сайт ночью (с 0:00 до 08:00), утром (с 08:01 до 12:00), днём (с 12:01 до 18:00) и вечером.
-- UNION
SELECT CONCAT('At night: ', COUNT(user_id)) AS amount_of_users 
	FROM ip_adresses 
	WHERE HOUR(visited_at) >= 0 AND HOUR(visited_at) <= 8
UNION
SELECT CONCAT('At morning: ', COUNT(user_id))
	FROM ip_adresses 
	WHERE HOUR(visited_at) > 8 AND HOUR(visited_at) <= 12
UNION
SELECT CONCAT('On day: ', COUNT(user_id))
	FROM ip_adresses 
	WHERE HOUR(visited_at) > 12 AND HOUR(visited_at) <= 18
UNION
SELECT CONCAT('In evening: ', COUNT(user_id))
	FROM ip_adresses 
	WHERE HOUR(visited_at) > 18 AND HOUR(visited_at) < 24;

-- Топ-5 самых просматриваемых товаров.
SELECT name, views_value 
	FROM products 
	ORDER BY views_value DESC
	LIMIT 5;

-- Топ-5 самых покупаемых товаров
SELECT name, purchases_value 
	FROM products 
	ORDER BY purchases_value DESC
	LIMIT 5;

-- Топ-5 самых посещаемых магазинов
SELECT sh.id, sh.shop_name, COUNT(u.shop_id) AS amount_of_shops
	FROM shops AS sh
		JOIN users AS u
		ON u.shop_id = sh.id
	GROUP BY sh.id
	ORDER BY amount_of_shops DESC
	LIMIT 5;

-- Наличие определённого товара в магазинах.
SELECT p.id, p.name, s.shop_name
	FROM products AS p
		JOIN products_in_shops AS pr
		ON pr.have_or_not = 1 AND pr.product_id = p.id
		JOIN shops AS s
		ON pr.shop_id = s.id
	WHERE p.id = 7;

-- Количество ip адресов из определённого города
SELECT c.city_name, COUNT(i.id)
	FROM cities AS c
		JOIN ip_adresses AS i
		ON i.city_id = c.id
	WHERE c.id = 7;

-- Количество пользователей из определённого города.
SELECT c.city_name, COUNT(u.id)
	FROM cities AS c
		JOIN users AS u
		ON u.city_id = c.id
	WHERE c.id = 7;

-- Товары, участвующие в определённой распродаже.
SELECT s.name, p.name
	FROM sales AS s
		JOIN products AS p
		ON p.sale_id = s.id
	WHERE s.id = 2;

-- Товары, цена которых не превышает 7000 рублей.
SELECT name, price 
	FROM products
	WHERE price <= 7000
	ORDER BY name;
	
	
	
	
	
	

