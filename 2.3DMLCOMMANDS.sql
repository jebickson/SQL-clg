--Input (SQL Code)
--Create Table

CREATE TABLE Employee1
(
    Id INT,
    Name CHAR(100),
    Salary NUMBER(8, 2)
);
--Case 1 
DELETE FROM Employee1;
--Case 2
DELETE FROM Employee1 WHERE Id = 5;
/*Output (from SQL command line)

SQL> SELECT * FROM Employee1;

 ID  NAME       SALARY
---- ---------- -------
 1   Anurag     85000
 2   Mohanty    500000
 3   Test1      55000

DELETE FROM Employee1 WHERE Id = 3;
SELECT * FROM Employee1;

 ID  NAME       SALARY
---- ---------- -------
 1   Anurag     85000
 2   Mohanty    500000
