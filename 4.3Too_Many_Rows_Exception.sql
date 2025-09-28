-- Enable DBMS_OUTPUT to view printed messages
SET SERVEROUTPUT ON;

-- Create the customers table
CREATE TABLE customers (
    customer_id NUMBER PRIMARY KEY,
    name        VARCHAR2(50),
    age         NUMBER,
    address     VARCHAR2(100)
);

-- Insert sample data
INSERT INTO customers (customer_id, name, age, address) VALUES (101, 'Amit', 30, 'Delhi');
INSERT INTO customers (customer_id, name, age, address) VALUES (102, 'Priya', 28, 'Mumbai');
INSERT INTO customers (customer_id, name, age, address) VALUES (103, 'Rahul', 35, 'Chennai');
COMMIT;

-- PL/SQL block with hardcoded customer_id
DECLARE
    l_name         customers.name%TYPE;
    l_customer_id  customers.customer_id%TYPE := 101; -- Replace with desired ID
BEGIN
    SELECT name INTO l_name
    FROM customers
    WHERE customer_id > l_customer_id;

    dbms_output.put_line('Customer name is ' || l_name);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        dbms_output.put_line('Customer ' || l_customer_id || ' does not exist');
    WHEN TOO_MANY_ROWS THEN
        dbms_output.put_line('The database returns more than one customer');
END;
/


