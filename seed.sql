INSERT INTO users (name, email) VALUES
	('Andi Pratama', 	'andi@example.com'),
	('Budi Santoso', 	'budi@example.com'),
	('Citra Dewi', 		'citra@example.com'),
	('Dian Rahayu', 	'dian@example.com'),
	('Eka Nugraha', 	'eka@example.com');

INSERT INTO categories (name, description) VALUES
	('Electronics', 	'Gadgets dan aksesoris elektronik'),
	('Fashion', 		'Pakaian dan sepatu'),
	('Home & Living', 	'Perabot rumah tangga'),
	('Sports', 			'Perlengkapan olahraga'),
	('Books', 			'Buku dan materi belajar');

INSERT INTO products (category_id, name, price, stock) VALUES
	((SELECT id FROM categories WHERE name = 'Electronics'), 'Wireless Earbuds Pro', 		499000, 80),
	((SELECT id FROM categories WHERE name = 'Electronics'), 'Mechanical Keyboard TKL', 	850000, 40),
	((SELECT id FROM categories WHERE name = 'Fashion'), 	 'Slim Chino Pants', 			279000, 60),
	((SELECT id FROM categories WHERE name = 'Fashion'), 	 'Cotton Oversized Tee', 		149000, 200),
	((SELECT id FROM categories WHERE name = 'Fashion'), 	 'Leather Sneakers', 			599000, 35),
	((SELECT id FROM categories WHERE name = 'Home & Living'), 'Ceramic Mug Set', 			189000, 75),
	((SELECT id FROM categories WHERE name = 'Home & Living'), 'Bamboo Desk Organiser', 	245000, 50),
	((SELECT id FROM categories WHERE name = 'Sports'), 	 'Resistance Band Set', 		175000, 90),
	((SELECT id FROM categories WHERE name = 'Books'), 		 'Clean Code Book', 			320000, 30),
	((SELECT id FROM categories WHERE name = 'Books'), 		 'The Pragmatic Programmer', 	295000, 25);

INSERT INTO orders (user_id, status, total_price) VALUES
	((SELECT id FROM users WHERE name = 'Andi Pratama'), 'delivered', 999000),
	((SELECT id FROM users WHERE name = 'Budi Santoso'), 'shipped', 	 850000),
	((SELECT id FROM users WHERE name = 'Citra Dewi'),   'paid', 	 599000),
	((SELECT id FROM users WHERE name = 'Dian Rahayu'),  'pending',  149000),
	((SELECT id FROM users WHERE name = 'Eka Nugraha'),  'delivered', 1064000);

INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
	((SELECT id FROM orders WHERE status = 'delivered' LIMIT 1),
	 (SELECT id FROM products WHERE name = 'Wireless Earbuds Pro'), 1, 499000),

	((SELECT id FROM orders WHERE status = 'shipped'),
	 (SELECT id FROM products WHERE name = 'Mechanical Keyboard TKL'), 1, 850000),

	((SELECT id FROM orders WHERE status = 'paid'),
	 (SELECT id FROM products WHERE name = 'Leather Sneakers'), 1, 599000),

	((SELECT id FROM orders WHERE status = 'pending'),
	 (SELECT id FROM products WHERE name = 'Cotton Oversized Tee'), 1, 149000);
