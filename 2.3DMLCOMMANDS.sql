--Input (SQL Code)
--Create Table

CREATE TABLE Employee1 (
    Id INT,
    Name CHAR(100),
    Salary DECIMAL(8,2)
);

INSERT INTO Employee1 VALUES (1, 'Anurag', 85000.00);
INSERT INTO Employee1 VALUES (2, 'Mohanty', 500000.00);
INSERT INTO Employee1 VALUES (3, 'Test1', 55000.00);
INSERT INTO Employee1 VALUES (4, 'Jebickson', 42000.00);
INSERT INTO Employee1 VALUES (5, 'Sambit', 30000.00);

SET SQL_SAFE_UPDATES = 0;

DELETE FROM Employee1 WHERE Id = 3;
DELETE FROM Employee1 WHERE Id = 4;
DELETE FROM Employee1 WHERE Id = 5;

SET SQL_SAFE_UPDATES = 1; -- Re-enable it afterward for safety

SELECT * FROM Employee1;