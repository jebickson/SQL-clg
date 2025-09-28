-- Enable DBMS_OUTPUT to view printed messages
SET SERVEROUTPUT ON;

-- Create the customerinfo table
CREATE TABLE customerinfo (
    ID      NUMBER PRIMARY KEY,
    NAME    VARCHAR2(50),
    AGE     NUMBER,
    ADDRESS VARCHAR2(100),
    SALARY  NUMBER
);

-- Insert sample data
INSERT INTO customerinfo (ID, NAME, AGE, ADDRESS, SALARY) VALUES (1, 'Amit', 30, 'Delhi', 5000);
INSERT INTO customerinfo (ID, NAME, AGE, ADDRESS, SALARY) VALUES (2, 'Priya', 28, 'Mumbai', 6000);
INSERT INTO customerinfo (ID, NAME, AGE, ADDRESS, SALARY) VALUES (3, 'Rahul', 35, 'Chennai', 7000);
COMMIT;

-- PL/SQL block to update salaries and report affected rows
DECLARE
  total_rows NUMBER(2); 
BEGIN
  -- DML must be inside BEGIN...END
  UPDATE customerinfo
  SET salary = salary + 100;

  -- Check if any rows were updated
  IF SQL%NOTFOUND THEN
    DBMS_OUTPUT.PUT_LINE('No customers selected');
  ELSE
    total_rows := SQL%ROWCOUNT; 
    DBMS_OUTPUT.PUT_LINE(total_rows || ' customers selected');
  END IF;
END;
/
