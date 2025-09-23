--Input (SQL Code)

--Method 1: Check Constraint in-line without name

--CREATE TABLE dept
--(
--    deptno NUMBER CHECK (deptno BETWEEN 10 AND 99),
--    dname VARCHAR2(9) CHECK (dname = UPPER(dname)),
--    loc   VARCHAR2(10) CHECK (loc IN ('DALLAS','BOSTON',
--                                      'NEW YORK','CHICAGO'))
--);

--Method 2: Check Constraint in-line with name

--CREATE TABLE dept01
--(
--    deptno NUMBER CONSTRAINT checkdeptno
--           CHECK (deptno BETWEEN 10 AND 99),
--    dname  VARCHAR2(9) CONSTRAINT checkdname
--           CHECK (dname = UPPER(dname)),
--    loc    VARCHAR2(10) CONSTRAINT checkloc
--           CHECK (loc IN ('DALLAS','BOSTON',
--                          'NEW YORK','CHICAGO'))
--);
/*
Output (from SQL command line)

SQL> CREATE TABLE dept01
  2  (
  3     deptno NUMBER CONSTRAINT checkdeptno
  4            CHECK (deptno BETWEEN 10 AND 99),
  5     dname  VARCHAR2(9) CONSTRAINT checkdname
  6            CHECK (dname = UPPER(dname)),
  7     loc    VARCHAR2(10) CONSTRAINT checkloc
  8            CHECK (loc IN ('DALLAS','BOSTON',
  9                           'NEW YORK','CHICAGO'))
 10  );

Table created.*\