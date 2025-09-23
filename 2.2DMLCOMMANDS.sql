--Input (SQL Code)
--Create Table
CREATE TABLE Employee1
(
    Id INT,
    Name CHAR(100),
    Salary NUMBER(8, 2)
);
--Case 1 – Update all rows in the table

UPDATE Employee1 SET Salary = 500000;
--Case 2 – Update rows based on condition

UPDATE Employee1 SET Name = 'Test1', Salary = 55000 WHERE Id = 3;

UPDATE Employee1 SET Salary = 85000 WHERE Name = 'Anurag';
/*
Output (from SQL command line)

SQL> SELECT * FROM Employee1;

 ID  NAME       SALARY
---- ---------- -------
 1   Anurag     50000
 2   Mohanty    35000
 3   Sambit

SQL> UPDATE Employee1 SET Salary = 500000;

4 rows updated.

SQL> UPDATE Employee1 SET Name = 'Test1', Salary = 55000 WHERE Id = 3;

1 row updated.

SQL> UPDATE Employee1 SET Salary = 85000 WHERE Name = 'Anurag';

1 row updated.

SQL> SELECT * FROM Employee1;

 ID  NAME       SALARY
---- ---------- -------
 1   Anurag     85000
 2   Mohanty    500000
 3   Test1      55000
     (NULL)     500000
