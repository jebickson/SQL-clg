Input (SQL Code):

Method 1: Composite Primary Key Using CREATE TABLE

CREATE TABLE customer1 (
    cust_id INT,
    cust_name VARCHAR(30),
    phone_no BIGINT,
    CONSTRAINT cust_pk PRIMARY KEY (cust_id, phone_no)
);

INSERT INTO customer1 VALUES (101, 'Arun', 9876543210);
INSERT INTO customer1 VALUES (102, 'Bhavya', 9123456780);
INSERT INTO customer1 VALUES (101, 'Arun', 9988776655); -- same cust_id, different phone_no ✔️

select * FROM CUSTROMER1;

Method 2: Composite Primary Key Using ALTER TABLE

CREATE TABLE customer (
    cust_id INT,
    cust_name VARCHAR(30),
    phone_no BIGINT
);

ALTER TABLE customer
ADD CONSTRAINT cust_cid_pk PRIMARY KEY (cust_id, phone_no);

INSERT INTO customer VALUES (201, 'Chitra', 9876543210);
INSERT INTO customer VALUES (202, 'David', 9123456780);
INSERT INTO customer VALUES (201, 'Chitra', 9988776655); -- valid: same ID, different phone

select * FROM CUSTROMER;