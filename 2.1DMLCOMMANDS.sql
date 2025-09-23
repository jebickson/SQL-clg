--Input (SQL Code)
--Create Table

CREATE TABLE Employee1
(
    Id INT,
    Name CHAR(20),
    Salary NUMBER(8,2)
);
--Case 1
INSERT INTO Employee1 VALUES (1, 'Anurag', 50000);
--Case 2
INSERT INTO Employee1 (Id, Salary, Name) VALUES (2, 35000, 'Mohanty');
--Case 3
INSERT INTO Employee1 (Id, Name) VALUES (3, 'Sambit');
--Case 4
INSERT INTO Employee1 (Id, Salary, Name) VALUES (NULL, NULL, NULL);

/*Output (from SQL command line)

SQL> CREATE TABLE Employee1
  2  (
  3     Id INT,
  4     Name CHAR(20),
  5     Salary NUMBER(8,2)
  6  );

Table created.

INSERT INTO Employee1 VALUES (1, 'Anurag', 50000);
INSERT INTO Employee1 (Id, Salary, Name) VALUES (2, 35000, 'Mohanty');
INSERT INTO Employee1 (Id, Name) VALUES (3, 'Sambit');
INSERT INTO Employee1 (Id, Salary, Name) VALUES (NULL, NULL, NULL);
*/