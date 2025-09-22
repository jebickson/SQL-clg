-- Step 1: Create table
CREATE TABLE products (
    product_id   INT PRIMARY KEY,
    product_name VARCHAR(100),
    list_price   DECIMAL(10,2),
    category_id  INT
);

-- Step 2: Insert values
INSERT INTO products (product_id, product_name, list_price, category_id) VALUES
(1, 'ADATA ASU800SS-128GT-C', 52.65, 5),
(2, 'ADATA ASU800SS-512GT-C', 136.69, 5),
(3, 'AMD 100-5056062',       1499.99, 2);

-- Step 3: Query
SELECT product_name, 
       list_price, 
       category_id,
       ROUND( ( SELECT AVG(list_price) 
                FROM products p1 
                WHERE p1.category_id = p2.category_id ), 2) AS avg_list_price
FROM products p2
ORDER BY product_name;

-- Step 4: Expected Output

-- PRODUCT_NAME              LIST_PRICE   CATEGORY_ID   AVG_LIST_PRICE
-- -----------------------   ----------   -----------   --------------
-- ADATA ASU800SS-128GT-C     52.65            5              94.67
-- ADATA ASU800SS-512GT-C    136.69            5              94.67
-- AMD 100-5056062          1499.99            2            1499.99