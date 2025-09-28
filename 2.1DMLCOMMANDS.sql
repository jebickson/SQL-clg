Input (SQL Code)
Create Table

CREATE TABLE Employee1 (
    Id INT,
    Name CHAR(20),
    Salary DECIMAL(8,2)
);


INSERT INTO Employee1 VALUES (1, 'Anurag', 50000.00);
INSERT INTO Employee1 (Id, Salary, Name) VALUES (2, 35000.00, 'Mohanty');
INSERT INTO Employee1 (Id, Name) VALUES (3, 'Sambit'); -- Salary will be NULL
INSERT INTO Employee1 (Id, Salary, Name) VALUES (NULL, NULL, NULL); -- All NULLs
INSERT INTO Employee1 VALUES (4, 'Jebickson', 42000.00);

SELECT * FROM Employee1;