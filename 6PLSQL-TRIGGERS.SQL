SET SERVEROUTPUT ON;

CREATE TABLE customerinfo (
    ID      NUMBER PRIMARY KEY,
    NAME    VARCHAR2(50),
    AGE     NUMBER,
    ADDRESS VARCHAR2(100),
    SALARY  NUMBER
);

CREATE OR REPLACE TRIGGER display_salary_changes
BEFORE DELETE OR INSERT OR UPDATE ON customerinfo
FOR EACH ROW
WHEN (NEW.ID > 0)
DECLARE
    sal_diff NUMBER;
BEGIN
    IF INSERTING THEN
        dbms_output.put_line('New salary: ' || :NEW.salary);
        dbms_output.put_line('Old salary: NULL');
        dbms_output.put_line('Salary difference: NULL');

    ELSIF DELETING THEN
        dbms_output.put_line('Old salary: ' || :OLD.salary);
        dbms_output.put_line('New salary: NULL');
        dbms_output.put_line('Salary difference: NULL');
    
    ELSIF UPDATING THEN
        sal_diff := :NEW.salary - :OLD.salary;
        dbms_output.put_line('Old salary: ' || :OLD.salary);
        dbms_output.put_line('New salary: ' || :NEW.salary);
        dbms_output.put_line('Salary difference: ' || sal_diff);
    END IF;
END;
/

INSERT INTO customerinfo (ID, NAME, AGE, ADDRESS, SALARY)
VALUES (8, 'Kriti', 22, 'HP', 7500.00);

UPDATE customerinfo
SET salary = salary + 500
WHERE id = 7;
