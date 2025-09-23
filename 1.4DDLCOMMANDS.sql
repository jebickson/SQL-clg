--Input (SQL Code):

--Method 1: Composite Primary Key Using CREATE TABLE

CREATE TABLE customer1
(
    cust_id NUMBER(3),
    cust_name VARCHAR(30),
    phone_no NUMBER(10),
    CONSTRAINT cust_pk PRIMARY KEY (cust_id, phone_no)
);
insert into customer1 values();
insert into customer1 values();
--Method 2: Composite Primary Key Using ALTER TABLE

--ALTER TABLE customer
--ADD CONSTRAINT cust_cid_pk PRIMARY KEY (cust_id, phone_no);

--Output (from SQL command line):

--SQL> CREATE TABLE customer1
--    (
--       cust_id NUMBER(3),
--       cust_name VARCHAR(30),
--      phone_no NUMBER(10),
--    CONSTRAINT cust_pk PRIMARY KEY (cust_id, phone_no)
--  );

--Table created.