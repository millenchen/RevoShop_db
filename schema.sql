CREATE TABLE users(
	id 			UUID 			NOT NULL 		PRIMARY KEY DEFAULT gen_random_uuid(),
	name		VARCHAR(100)	NOT NULL,
	email		VARCHAR(225)	NOT NULL 		UNIQUE,
	created		TIMESTAMPTZ		NOT NULL 		DEFAULT now()
);

CREATE TABLE categories(
	id 			UUID			NOT NULL		PRIMARY KEY DEFAULT gen_random_uuid(),
	name 		VARCHAR(100)	NOT NULL		UNIQUE,
	description	TEXT
);

CREATE TABLE products(
	id 			UUID			NOT NULL		PRIMARY KEY DEFAULT gen_random_uuid(),
	category_id	UUID			NOT NULL		REFERENCES categories(id),
	name		VARCHAR(100)	NOT NULL,
	price		NUMERIC			NOT NULL,
	stock		INTEGER
);

CREATE TABLE orders(
	id 			UUID			NOT NULL 		PRIMARY KEY DEFAULT gen_random_uuid(),
	user_id		UUID			NOT NULL		REFERENCES users(id),
	status		VARCHAR(20)		NOT NULL		DEFAULT 'pending',
	total_price	NUMERIC			NOT NULL		DEFAULT 0,
	created		TIMESTAMPTZ		NOT NULL		DEFAULT now()
);

CREATE TABLE order_items(
	id 			UUID 			NOT NULL		PRIMARY KEY DEFAULT gen_random_uuid(),
	order_id	UUID			NOT NULL		REFERENCES orders(id),
	product_id	UUID			NOT NULL		REFERENCES products(id),
	quantity	INTEGER			NOT NULL,
	unit_price	NUMERIC			NOT NULL
);
