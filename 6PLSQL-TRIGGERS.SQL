CREATE OR REPLACE TRIGGER display_salary_changes
BEFORE DELETE OR INSERT OR UPDATE ON customerinfo
FOR EACH ROW
WHEN (NEW.ID > 0)
DECLARE
    sal_diff NUMBER;
BEGIN
    sal_diff := :NEW.salary - :OLD.salary;
    dbms_output.put_line('Old salary: ' || :OLD.salary);
    dbms_output.put_line('New salary: ' || :NEW.salary);
    dbms_output.put_line('Salary difference: ' || sal_diff);
END;
/
INSERT INTO customerinfo(ID, NAME, AGE, ADDRESS, SALARY)
VALUES (8, 'Kriti', 22, 'HP', 7500.00);
UPDATE customerinfo
SET salary = salary + 500
WHERE id = 7;
--Old salary:
--New salary: 7500
--Salary difference:
--1 row created.
--Old salary: 8400
--New salary: 8900
--Salary difference: 500
--1 row updated.
