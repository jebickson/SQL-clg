--Method 1: NOT NULL constraint in-line with name
CREATE TABLE Student
(
    ID int constraint Stu_NotNull NOT NULL,
    NAME varchar(30) NOT NULL,
    ADDRESS varchar(50)
);
--Method 2: NOT NULL constraint in-line without name
--CREATE TABLE Student
--(
--    ID int NOT NULL,
--    NAME varchar(30) NOT NULL,
--    ADDRESS varchar(50)
INSERT INTO student VALUES (1, 'sam', 'chennai');
INSERT INTO student VALUES (2, 'jebi', 'tamil');

--);
--Method 3: Adding a NOT NULL constraint after Creation
--ALTER TABLE Student
--MODIFY ID int NOT NULL;
select * from Student;