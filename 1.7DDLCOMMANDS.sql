-- Input (SQL Code):
Method 1: Default Constraint in CREATE TABLE

CREATE TABLE Sales1 (
    Sale_Id INT NOT NULL UNIQUE,
    Sale_Amount INT NOT NULL,
    Vendor_Name VARCHAR(255) DEFAULT 'Unknown Vendor',
    Sale_Date DATE,
    Profit INT
);

-- Perhaps you need a different "datestyle" setting
-- insert values
INSERT INTO Sales1 VALUES (1, 10000, 'Abc Trader', '2010-04-22', 1000);
INSERT INTO Sales1 VALUES (2, 20000, 'XYZ mill', '2096-01-22', 2000);
INSERT INTO Sales1 VALUES (3, 30000, 'jeb', '2015-07-23', 1500);
INSERT INTO Sales1 VALUES (4, 40000, 'jazz', '2011-09-08', 800);
INSERT INTO Sales1 VALUES (5, 50000, 'misa', '2010-04-22', 3000);

SELECT * FROM Sales1;

Method 2: Default Constraint in ALTER TABLE
ALTER TABLE Sales1
MODIFY COLUMN Vendor_Name VARCHAR(255) DEFAULT 'Unknown Vendor';
