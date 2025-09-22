DECLARE
    l_name customers.name%TYPE;
    l_customer_id customers.customer_id%TYPE := &customer_id;
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

--Expected output
--The database returns more than one customer
--Customer 100 does not exist
--Customer name is John