Input (SQL Code):
Method 1: Primary Key Constraint in-line without name
CREATE TABLE Student (
    ID INT PRIMARY KEY,
    NAME VARCHAR(30),
    ADDRESS VARCHAR(50)
);

INSERT INTO Student VALUES (1, 'KEVIN', 'SSN Nagar,chennai');
INSERT INTO Student VALUES (2, 'ANU', 'Quarter 4,ramapuram');

SELECT * FROM Student;

Method 2: Primary Key Constraint in-line with name
Constraint Name: pk_ID

CREATE TABLE Student2 (
    ID INT,
    NAME VARCHAR(30),
    ADDRESS VARCHAR(50),
    CONSTRAINT pk_ID PRIMARY KEY (ID)
);

INSERT INTO Student2 VALUES (1, 'jebi', 'KK Nagar,chennai');
INSERT INTO Student2 VALUES (2, 'sK', 'Lakshmi Nagar,tamil nadu');

SELECT * FROM Student2;

Method 3: Primary Key Constraint out-of-line with name
Constraint Name: pk_ID
CREATE TABLE Student3 (
    ID INT,
    NAME VARCHAR(30),
    ADDRESS VARCHAR(50),
    CONSTRAINT pk_ID PRIMARY KEY (ID)
);

INSERT INTO Student3 VALUES (1, 'jOE', 'AMET Nagar,chennai');
INSERT INTO Student3 VALUES (2, 'KOTLIN', 'KLN Nagar,tamil nadu');

SELECT * FROM Student3;

Method 4: Adding a PRIMARY KEY Constraint after Creation
CREATE TABLE Student4 (
    ID INT,
    NAME VARCHAR(30),
    ADDRESS VARCHAR(50)
);

-- Add the constraint after creation
ALTER TABLE Student4 
ADD CONSTRAINT pk_ID PRIMARY KEY (ID);

-- Insert values
INSERT INTO Student4 VALUES (1, 'ROSIE', 'KK Nagar,chennai');
INSERT INTO Student4 VALUES (2, 'LOVE', 'North street,tamil nadu');

SELECT * FROM Student4;
