-- Step 1: Create table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    list_price DECIMAL(10,2),
    category_id INT
);


-- Step 2: Insert values
INSERT INTO products (product_id, product_name, list_price, category_id) VALUES
(1, 'ADATA ASU800SS-128GT-C', 52.65, 5),
(2, 'ADATA ASU800SS-512GT-C', 136.69, 5),
(3, 'AMD 100-5056062', 1499.99, 2),
(4, 'Intel Core i7-12700K', 379.99, 2),
(5, 'Samsung 980 PRO 1TB', 129.99, 5);


-- Step 3: Query
SELECT product_name, 
       list_price, 
       category_id,
       ROUND((
           SELECT AVG(p1.list_price)
           FROM products p1
           WHERE p1.category_id = p2.category_id
       ), 2) AS avg_list_price
FROM products p2
ORDER BY product_name;
