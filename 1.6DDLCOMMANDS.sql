Input (SQL Code)

Method 1: Check Constraint in-line without name

CREATE TABLE dept (
    deptno INT CHECK (deptno BETWEEN 10 AND 99),
    dname VARCHAR(15) CHECK (dname = UPPER(dname)),
    loc VARCHAR(10) CHECK (loc IN ('DALLAS', 'BOSTON', 'NEW YORK', 'CHICAGO'))
);
INSERT INTO dept VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO dept VALUES (20, 'RESEARCH', 'DALLAS');
INSERT INTO dept VALUES (30, 'SALES', 'CHICAGO');
INSERT INTO dept VALUES (40, 'MARKETING', 'BOSTON');
INSERT INTO dept VALUES (50, 'FINANCE', 'CHICAGO');



Method 2: Check Constraint in-line with name

CREATE TABLE dept01 (
    deptno INT,
    dname VARCHAR(15),
    loc VARCHAR(10),
    CONSTRAINT checkdeptno CHECK (deptno BETWEEN 10 AND 99),
    CONSTRAINT checkdname CHECK (dname = UPPER(dname)),
    CONSTRAINT checkloc CHECK (loc IN ('DALLAS', 'BOSTON', 'NEW YORK', 'CHICAGO'))
);
INSERT INTO dept01 VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO dept01 VALUES (20, 'RESEARCH', 'DALLAS');
INSERT INTO dept01 VALUES (30, 'SALES', 'CHICAGO');
INSERT INTO dept01 VALUES (40, 'MARKETING', 'BOSTON');
INSERT INTO dept01 VALUES (50, 'FINANCE', 'CHICAGO');

select * from dept;
select * from dept01;