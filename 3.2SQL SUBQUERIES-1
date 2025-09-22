-- 1. Create the table
CREATE TABLE products (
    product_id   INT PRIMARY KEY,
    product_name VARCHAR(100),
    list_price   DECIMAL(10,2)
);

-- 2. Insert sample values
INSERT INTO products (product_id, product_name, list_price) VALUES
(10, 'Wireless Mouse', 599.00),
(20, 'Gaming Keyboard', 2499.00),
(30, 'External Hard Drive 1TB', 4999.00),
(40, 'Laptop Cooling Pad', 999.00),
(50, 'Intel SSDPE2ME040T401', 8867.99);
--3.Query
SELECT product_id, 
       product_name, 
       list_price
FROM products
WHERE list_price = (
    SELECT MAX(list_price) 
    FROM products
);
--4.Expected output
product_id | product_name           | list_price
------------------------------------------------
50         | Intel SSDPE2ME040T401  | 8867.99