-- Keys for ip_adresses.
ALTER TABLE ip_adresses
ADD CONSTRAINT ip_adresses_user_id_fk
FOREIGN KEY (user_id)
REFERENCES users(id)
ON DELETE NO ACTION;

ALTER TABLE ip_adresses
ADD CONSTRAINT ip_adresses_city_id_fk
FOREIGN KEY (city_id)
REFERENCES cities(id)
ON DELETE NO ACTION;

-- Keys for users.
ALTER TABLE users
ADD CONSTRAINT users_city_id_fk
FOREIGN KEY (city_id)
REFERENCES cities(id)
ON DELETE NO ACTION;

ALTER TABLE users
ADD CONSTRAINT users_shop_id_fk
FOREIGN KEY (shop_id)
REFERENCES shops(id)
ON DELETE NO ACTION;

-- Keys for shops.
ALTER TABLE shops
ADD CONSTRAINT shops_city_id_fk
FOREIGN KEY (city_id)
REFERENCES cities(id)
ON DELETE NO ACTION;

-- Keys for products_in_shops.
ALTER TABLE products_in_shops
ADD CONSTRAINT products_in_shops_product_id_fk
FOREIGN KEY (product_id)
REFERENCES products(id)
ON DELETE NO ACTION;

ALTER TABLE products_in_shops
ADD CONSTRAINT products_in_shops_shop_id_fk
FOREIGN KEY (shop_id)
REFERENCES shops(id)
ON DELETE NO ACTION;

-- Keys for category_of_products
ALTER TABLE category_of_products
ADD CONSTRAINT category_of_products_category_id_fk
FOREIGN KEY (category_id)
REFERENCES categories(id)
ON DELETE NO ACTION;

-- Keys for down_lvl_category_of_products
ALTER TABLE down_lvl_category_of_products
ADD CONSTRAINT down_lvl_category_of_products_category_id_fk
FOREIGN KEY (category_of_products_id)
REFERENCES category_of_products(id)
ON DELETE NO ACTION;

-- Keys for products
ALTER TABLE products
ADD CONSTRAINT products_sale_id_fk
FOREIGN KEY (sale_id)
REFERENCES sales(id)
ON DELETE NO ACTION;

ALTER TABLE products
ADD CONSTRAINT products_down_lvl_category_of_products_id_fk
FOREIGN KEY (down_lvl_category_of_products_id)
REFERENCES down_lvl_category_of_products(id)
ON DELETE NO ACTION;

ALTER TABLE products
ADD CONSTRAINT products_photo_id_fk
FOREIGN KEY (photo_id)
REFERENCES photos(id)
ON DELETE NO ACTION;

-- Keys for category_rooms.
ALTER TABLE category_rooms
ADD CONSTRAINT category_rooms_category_id_fk
FOREIGN KEY (category_id)
REFERENCES categories(id)
ON DELETE NO ACTION;

-- Keys for category_services.
ALTER TABLE category_services
ADD CONSTRAINT category_services_category_id_fk
FOREIGN KEY (category_id)
REFERENCES categories(id)
ON DELETE NO ACTION;

-- Keys for sales.
ALTER TABLE sales
ADD CONSTRAINT sales_date_id_fk
FOREIGN KEY (date_id)
REFERENCES dates_for_sale(id)
ON DELETE NO ACTION;




