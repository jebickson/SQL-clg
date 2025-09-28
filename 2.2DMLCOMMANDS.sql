CREATE TABLE Employee1 (
    Id INT,
    Name CHAR(100),
    Salary DECIMAL(8,2)
);

INSERT INTO Employee1 VALUES (1, 'Anurag', 50000.00);
INSERT INTO Employee1 VALUES (2, 'Mohanty', 35000.00);
INSERT INTO Employee1 VALUES (3, 'Sambit', NULL);
INSERT INTO Employee1 VALUES (NULL, NULL, NULL);
INSERT INTO Employee1 VALUES (4, 'Jebickson', 42000.00);



SET SQL_SAFE_UPDATES = 0;

UPDATE Employee1 SET Salary = 500000.00;

SET SQL_SAFE_UPDATES = 1; -- Re-enable it afterward for safety

-- Disable safe update mode
SET SQL_SAFE_UPDATES = 0;

-- Now you can run your updates freely
UPDATE Employee1 SET Name = 'Test1', Salary = 55000.00 WHERE Id = 3;

UPDATE Employee1 SET Salary = 85000.00 WHERE Name = 'Anurag';

-- Re-enable safe update mode for safety
SET SQL_SAFE_UPDATES = 1;


SELECT * FROM Employee1;