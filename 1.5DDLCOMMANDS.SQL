Input (SQL Code):
Parent Table: dept
CREATE TABLE dept1 (
    deptno INT PRIMARY KEY,
    dname VARCHAR(15),
    loc VARCHAR(10)
);

INSERT INTO dept1 VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO dept1 VALUES (20, 'RESEARCH', 'DALLAS');
INSERT INTO dept1 VALUES (30, 'SALES', 'CHICAGO');

select * from dept1;
Method 1: Foreign Key Constraint in-line without name

CREATE TABLE emp1 (
    empno INT,
    ename VARCHAR(10),
    job VARCHAR(9),
    mgr INT,
    hiredate DATE,
    sal DECIMAL(7,2),
    comm DECIMAL(7,2),
    deptno INT REFERENCES dept1(deptno)
);
INSERT INTO emp1 VALUES (1001, 'Arun', 'Manager', NULL, '2023-01-10', 50000.00, NULL, 10);
INSERT INTO emp1 VALUES (1002, 'Bhavya', 'Clerk', 1001, '2023-02-15', 25000.00, NULL, 20);
INSERT INTO emp1 VALUES (1003, 'Chitra', 'Analyst', 1001, '2023-03-20', 40000.00, NULL, 20);
INSERT INTO emp1 VALUES (1004, 'David', 'Salesman', 1001, '2023-04-25', 30000.00, 5000.00, 30);
INSERT INTO emp1 VALUES (1005, 'Elena', 'Clerk', 1002, '2023-05-30', 22000.00, NULL, 10);

Method 2: Foreign Key Constraint Out-of-line with name

CREATE TABLE emp2 (
    empno INT,
    ename VARCHAR(10),
    job VARCHAR(9),
    mgr INT,
    hiredate DATE,
    sal DECIMAL(7,2),
    comm DECIMAL(7,2),
    deptno INT,
    CONSTRAINT fk_deptno FOREIGN KEY (deptno) REFERENCES dept1(deptno)
);

INSERT INTO emp2 VALUES (1001, 'Arun', 'Manager', NULL, '2023-01-10', 50000.00, NULL, 10);
INSERT INTO emp2 VALUES (1002, 'Bhavya', 'Clerk', 1001, '2023-02-15', 25000.00, NULL, 20);
INSERT INTO emp2 VALUES (1003, 'Chitra', 'Analyst', 1001, '2023-03-20', 40000.00, NULL, 20);
INSERT INTO emp2 VALUES (1004, 'David', 'Salesman', 1001, '2023-04-25', 30000.00, 5000.00, 30);
INSERT INTO emp2 VALUES (1005, 'Elena', 'Clerk', 1002, '2023-05-30', 22000.00, NULL, 10);

Method 3: Foreign Key Constraint in-line with name & ON DELETE CASCADE

CREATE TABLE emp3 (
    empno INT,
    ename VARCHAR(10),
    job VARCHAR(9),
    mgr INT,
    hiredate DATE,
    sal DECIMAL(7,2),
    comm DECIMAL(7,2),
    deptno INT,
    CONSTRAINT fk_deptno_emp3 FOREIGN KEY (deptno)
        REFERENCES dept1(deptno) ON DELETE CASCADE
);


INSERT INTO emp3 VALUES (1001, 'Arun', 'Manager', NULL, '2023-01-10', 50000.00, NULL, 10);
INSERT INTO emp3 VALUES (1002, 'Bhavya', 'Clerk', 1001, '2023-02-15', 25000.00, NULL, 20);
INSERT INTO emp3 VALUES (1003, 'Chitra', 'Analyst', 1001, '2023-03-20', 40000.00, NULL, 20);
INSERT INTO emp3 VALUES (1004, 'David', 'Salesman', 1001, '2023-04-25', 30000.00, 5000.00, 30);
INSERT INTO emp3 VALUES (1005, 'Elena', 'Clerk', 1002, '2023-05-30', 22000.00, NULL, 10);


Method 4: Foreign Key Constraint with ALTER TABLE

CREATE TABLE emp4 (
    empno INT,
    ename VARCHAR(10),
    job VARCHAR(9),
    mgr INT,
    hiredate DATE,
    sal DECIMAL(7,2),
    comm DECIMAL(7,2),
    deptno INT
);

ALTER TABLE emp4
ADD CONSTRAINT fk_deptno_emp4 FOREIGN KEY (deptno)
REFERENCES dept1(deptno) ON DELETE CASCADE;

INSERT INTO emp4 VALUES (1001, 'Arun', 'Manager', NULL, '2023-01-10', 50000.00, NULL, 10);
INSERT INTO emp4 VALUES (1002, 'Bhavya', 'Clerk', 1001, '2023-02-15', 25000.00, NULL, 20);
INSERT INTO emp4 VALUES (1003, 'Chitra', 'Analyst', 1001, '2023-03-20', 40000.00, NULL, 20);
INSERT INTO emp4 VALUES (1004, 'David', 'Salesman', 1001, '2023-04-25', 30000.00, 5000.00, 30);
INSERT INTO emp4 VALUES (1005, 'Elena', 'Clerk', 1002, '2023-05-30', 22000.00, NULL, 10);

SELECT * FROM emp1;
SELECT * FROM emp2;
SELECT * FROM emp3;
SELECT * FROM emp4;