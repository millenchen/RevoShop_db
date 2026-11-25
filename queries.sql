SELECT products.name, products.price, products.stock
FROM products
WHERE products.stock > 0
ORDER BY products.price DESC
LIMIT 5;
