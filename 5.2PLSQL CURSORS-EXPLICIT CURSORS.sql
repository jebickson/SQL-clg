SET SERVEROUTPUT ON;

CREATE TABLE customerinfo (
    ID      NUMBER PRIMARY KEY,
    NAME    VARCHAR2(50),
    AGE     NUMBER,
    ADDRESS VARCHAR2(100),
    SALARY  NUMBER
);

INSERT INTO customerinfo (ID, NAME, AGE, ADDRESS, SALARY) VALUES (1, 'Amit', 30, 'Delhi', 5000);
INSERT INTO customerinfo (ID, NAME, AGE, ADDRESS, SALARY) VALUES (2, 'Priya', 28, 'Mumbai', 6000);
INSERT INTO customerinfo (ID, NAME, AGE, ADDRESS, SALARY) VALUES (3, 'Rahul', 35, 'Chennai', 7000);
COMMIT;

DECLARE
   CURSOR customer_cur IS
      SELECT id, name, address
      FROM customerinfo;

   customer_rec customer_cur%ROWTYPE;
BEGIN
   OPEN customer_cur;

   LOOP
      FETCH customer_cur INTO customer_rec;
      EXIT WHEN customer_cur%NOTFOUND;

      DBMS_OUTPUT.put_line('ID: ' || customer_rec.id || 
                           ', Name: ' || customer_rec.name || 
                           ', Address: ' || customer_rec.address);
   END LOOP;

   CLOSE customer_cur;
END;
/
