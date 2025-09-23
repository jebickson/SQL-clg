--Input (SQL Code):
--Method 1: Primary Key Constraint in-line without name
--CREATE TABLE Student
--(
--    ID int PRIMARY KEY,
--    NAME varchar(30),
--    ADDRESS varchar(50)
--);
--insert into Student values(1,'jebi','1/44a valasaravakkam,chennai');
--insert into Student values(2,'sam','ramapuram,tamil nadu');
--select * from Student;
---Method 2: Primary Key Constraint in-line with name
--Constraint Name: pk_ID

--CREATE TABLE Student
--(
--    ID int CONSTRAINT pk_ID PRIMARY KEY,
--    NAME varchar(30),
--    ADDRESS varchar(50)
--);
--Method 3: Primary Key Constraint out-of-line with name
--Constraint Name: pk_ID
--CREATE TABLE Student
--(
--    ID int,
--    NAME varchar(30),
--    ADDRESS varchar(50),
--    CONSTRAINT pk_ID PRIMARY KEY (ID)
--);
--Method 4: Adding a PRIMARY KEY Constraint after Creation

--ALTER TABLE Student 
--ADD CONSTRAINT pk_ID PRIMARY KEY (ID);

--Output (from SQL command line):

--SQL> CREATE TABLE Student
--  2  (
--  3     ID int,
-- 4     NAME varchar(30),
--  5     ADDRESS varchar(50),
--  6     CONSTRAINT pk_ID PRIMARY KEY (ID)
--  7  );

--Table created.
