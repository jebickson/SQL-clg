DECLARE
    l_name customers.NAME%TYPE;
    l_customer_id customers.customer_id%TYPE := &customer_id;
BEGIN
    SELECT NAME INTO l_name
    FROM customers
    WHERE customer_id = l_customer_id;

    dbms_output.put_line('Customer name is ' || l_name);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        dbms_output.put_line('Customer ' || l_customer_id || ' does not exist');
END;
--Customer 0 does not exist
--PL/SQL procedure successfully completed.
