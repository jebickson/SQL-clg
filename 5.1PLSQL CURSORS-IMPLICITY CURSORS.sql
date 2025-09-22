-- 5.1 PLSQL CURSORS - IMPLICIT CURSORS
-- PROCEDURE: (This implies it might be part of a stored procedure,
--              but here it's an anonymous block)

DECLARE
  total_rows NUMBER(2); -- Declares a variable to hold the count of updated rows
BEGIN
  -- Update the salary for all customers in the 'customerinfo' table
  UPDATE customerinfo
  SET salary = salary + 100;

  -- Check if no rows were found/updated by the preceding UPDATE statement
  IF SQL%NOTFOUND THEN
    DBMS_OUTPUT.PUT_LINE('no customers selected');
  -- If rows were found/updated
  ELSIF SQL%FOUND THEN
    -- Get the number of rows affected by the last DML operation
    total_rows := SQL%ROWCOUNT;
    -- Print the number of customers that were updated
    DBMS_OUTPUT.PUT_LINE(total_rows || ' customers selected');
  END IF;

END;
/ -- This slash is used to execute the PL/SQL block in SQL*Plus or SQL Developer