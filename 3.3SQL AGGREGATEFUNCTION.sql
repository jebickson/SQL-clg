- Products table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    list_price DECIMAL(10,2),
    standard_cost DECIMAL(10,2)
);
-- Order items table
CREATE TABLE order_items (
    order_id INT,
    product_id INT,
    quantity INT,
    PRIMARY KEY(order_id, product_id)
);
-- Insert into products
INSERT INTO products (product_id, product_name, list_price, standard_cost) VALUES
(1, 'USB Cable', 199.99, 100.00),
(2, 'Wireless Mouse', 599.00, 300.00),
(3, 'Gaming Keyboard', 2499.00, 1500.00),
(4, 'External Hard Drive 1TB', 4999.00, 3200.00),
(5, 'Laptop Cooling Pad', 999.00, 500.00),
(6, 'Intel SSDPE2ME040T401', 8867.99, 7200.00);

-- Insert into order_items
INSERT INTO order_items (order_id, product_id, quantity) VALUES
(101, 1, 20),
(102, 2, 35),
(103, 3, 15),
(104, 4, 5),
(105, 5, 25),
(106, 6, 10);
SELECT SUM(quantity) AS total_quantity FROM order_items;
SELECT ROUND(AVG(standard_cost), 2) AS avg_std_cost FROM products;
SELECT COUNT(*) AS total_products FROM products;
SELECT MAX(list_price) AS max_price FROM products;
SELECT MIN(list_price) AS min_price FROM products;
