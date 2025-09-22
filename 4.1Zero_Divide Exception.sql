DECLARE
a int := 10;
b int := 0;
answer int;
BEGIN
answer := a / b;
dbms_output.put_line('The result after division is ' || answer);
EXCEPTION
WHEN zero_divide THEN
dbms_output.put_line('Dividing by zero, please check the values again');
dbms_output.put_line('The value of a is ' || a);
dbms_output.put_line('The value of b is ' || b);
END;


--Dividing by zero, please check the values again
--The value of a is 10
--The value of b is 0

--PL/SQL procedure successfully completed.