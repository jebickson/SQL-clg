--Input (SQL Code):
--Parent TABLE
--CREATE TABLE dept1
--(
--    deptno NUMBER(2) CONSTRAINT pkdept PRIMARY KEY,
--    dname  VARCHAR2(9),
--    loc    VARCHAR2(10)
--);
--Method 1: Foreign Key Constraint in-line without name

--CREATE TABLE emp1
--(
--    empno    NUMBER(4),
--    ename    VARCHAR2(10),
--    job      VARCHAR2(9),
--    mgr      NUMBER(4),
--    hiredate DATE,
--    sal      NUMBER(7,2),
--    comm     NUMBER(7,2),
--    deptno   NUMBER(2) REFERENCES dept(deptno)
--);
--Method 2: Foreign Key Constraint Out-of-line with name

--CREATE TABLE emp
--(
--    empno    NUMBER(4),
--    ename    VARCHAR2(10),
--    job      VARCHAR2(9),
--    mgr      NUMBER(4),
--    hiredate DATE,
--    sal      NUMBER(7,2),
--    comm     NUMBER(7,2),
--    deptno   NUMBER(2),
--    CONSTRAINT fk_deptno FOREIGN KEY (deptno)
--        REFERENCES dept(deptno)
--);
--Method 3: Foreign Key Constraint in-line with name & ON DELETE CASCADE

--CREATE TABLE emp
--(
--    empno    NUMBER(4),
--    ename    VARCHAR2(10),
--    job      VARCHAR2(9),
--    mgr      NUMBER(4),
--    hiredate DATE,
--    sal      NUMBER(7,2),
--    comm     NUMBER(7,2),
--    deptno   NUMBER(2) CONSTRAINT fk_deptno
--             REFERENCES dept(deptno) ON DELETE CASCADE
--);
--Method 4: Foreign Key Constraint with ALTER TABLE

--ALTER TABLE emp
--ADD CONSTRAINT fk_deptno FOREIGN KEY (deptno)
--REFERENCES dept(deptno) ON DELETE CASCADE;

--Output (from SQL command line):

--SQL> CREATE TABLE dept1
/*  2  (
  3     deptno NUMBER(2) CONSTRAINT pkdept PRIMARY KEY,
  4     dname  VARCHAR2(9),
  5     loc    VARCHAR2(10)
  6  );

Table created.

SQL> CREATE TABLE emp1
  2  (
  3     empno    NUMBER(4),
  4     ename    VARCHAR2(10),
  5     job      VARCHAR2(9),
  6     mgr      NUMBER(4),
  7     hiredate DATE,
  8     sal      NUMBER(7,2),
  9     comm     NUMBER(7,2),
 10     deptno   NUMBER(2) REFERENCES dept(deptno)
 11  );
Table created.*/