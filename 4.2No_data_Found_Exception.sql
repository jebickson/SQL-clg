SET SERVEROUTPUT ON;

CREATE TABLE customers (
    customer_id NUMBER PRIMARY KEY,
    name        VARCHAR2(50),
    age         NUMBER,
    address     VARCHAR2(100)
);

INSERT INTO customers (customer_id, name, age, address) VALUES (101, 'Amit', 30, 'Delhi');
INSERT INTO customers (customer_id, name, age, address) VALUES (102, 'Priya', 28, 'Mumbai');
INSERT INTO customers (customer_id, name, age, address) VALUES (103, 'Rahul', 35, 'Chennai');
COMMIT;

DECLARE
    l_name         customers.name%TYPE;
    l_customer_id  customers.customer_id%TYPE := 102;
BEGIN
    SELECT name INTO l_name
    FROM customers
    WHERE customer_id = l_customer_id;

    dbms_output.put_line('Customer name is ' || l_name);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        dbms_output.put_line('Customer ' || l_customer_id || ' does not exist');
END;
/