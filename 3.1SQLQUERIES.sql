-- Query 1
CREATE TABLE student1 (
    rollno INT,
    sname VARCHAR(50),
    age INT,
    course VARCHAR(10)
);

INSERT INTO student1 VALUES (6, 'Anu', 23, 'CS');
INSERT INTO student1 VALUES (4, 'Chetan', 20, 'BCA');
INSERT INTO student1 VALUES (5, 'Nihal', 19, 'BBA');
INSERT INTO student1 VALUES (8, 'Arpit', 21, 'CSA');
INSERT INTO student1 VALUES (9, 'Jebickson', 22, 'CS');

SELECT * FROM student1;

-- Query 2
CREATE TABLE customers (
    customer_id INT,
    name VARCHAR(100),
    credit_limit INT
);

INSERT INTO customers VALUES (177, 'United Continental Holdings', 5000);
INSERT INTO customers VALUES (188, 'INTL FCStone', 5000);
INSERT INTO customers VALUES (184, 'Publix Super Markets', 1200);
INSERT INTO customers VALUES (207, 'ConocoPhillips', 2400);
INSERT INTO customers VALUES (199, '3M', 1200);

SELECT customer_id, name, credit_limit FROM customers;

-- Query 3
ALTER TABLE customers ADD address VARCHAR(255);
SET SQL_SAFE_UPDATES = 0;

UPDATE customers SET address = 'Via Frenzy 6903, Roma' WHERE name = '3M';
UPDATE customers SET address = 'Langstr 14, Zuerich, ZH' WHERE name = 'ADP';
UPDATE customers SET address = '2120 E Kimberly Rd, Davenport, IA' WHERE name = 'AECOM';
UPDATE customers SET address = '123 Wall St, New York, NY' WHERE name = 'Publix Super Markets';
UPDATE customers SET address = '456 Market St, San Francisco, CA' WHERE name = 'ConocoPhillips';
SET SQL_SAFE_UPDATES = 1;

SELECT name, address, credit_limit
FROM customers
ORDER BY name ASC;