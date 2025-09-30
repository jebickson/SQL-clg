CREATE TABLE emp (
    eno      NUMBER PRIMARY KEY,
    ename    VARCHAR2(50),
    desig    VARCHAR2(50),
    bp       NUMBER,
    da       NUMBER,
    hra      NUMBER,
    pf       NUMBER,
    gp       NUMBER,
    np       NUMBER
);

CREATE OR REPLACE PROCEDURE insert_emp (
    p_eno   IN emp.eno%TYPE,
    p_ename IN emp.ename%TYPE,
    p_desig IN emp.desig%TYPE,
    p_bp    IN emp.bp%TYPE,
    p_da    IN emp.da%TYPE,
    p_hra   IN emp.hra%TYPE,
    p_pf    IN emp.pf%TYPE
) AS
    v_gp NUMBER;
    v_np NUMBER;
BEGIN
    v_gp := p_bp + p_da + p_hra;
    v_np := v_gp - p_pf;

    INSERT INTO emp (eno, ename, desig, bp, da, hra, pf, gp, np)
    VALUES (p_eno, p_ename, p_desig, p_bp, p_da, p_hra, p_pf, v_gp, v_np);

    DBMS_OUTPUT.PUT_LINE('Employee inserted successfully.');
END;
/

CREATE OR REPLACE PROCEDURE update_emp (
    p_eno   IN emp.eno%TYPE,
    p_ename IN emp.ename%TYPE,
    p_desig IN emp.desig%TYPE,
    p_bp    IN emp.bp%TYPE,
    p_da    IN emp.da%TYPE,
    p_hra   IN emp.hra%TYPE,
    p_pf    IN emp.pf%TYPE
) AS
    v_gp NUMBER;
    v_np NUMBER;
BEGIN
    v_gp := p_bp + p_da + p_hra;
    v_np := v_gp - p_pf;

    UPDATE emp
    SET ename = p_ename,
        desig = p_desig,
        bp    = p_bp,
        da    = p_da,
        hra   = p_hra,
        pf    = p_pf,
        gp    = v_gp,
        np    = v_np
    WHERE eno = p_eno;

    DBMS_OUTPUT.PUT_LINE('Employee updated successfully.');
END;
/

CREATE OR REPLACE PROCEDURE delete_emp (
    p_eno IN emp.eno%TYPE
) AS
BEGIN
    DELETE FROM emp WHERE eno = p_eno;
    DBMS_OUTPUT.PUT_LINE('Employee deleted successfully.');
END;
/

CREATE OR REPLACE PROCEDURE display_emp (
    p_eno IN emp.eno%TYPE
) AS
    CURSOR c1 IS SELECT * FROM emp WHERE eno = p_eno;
    r emp%ROWTYPE;
BEGIN
    OPEN c1;
    FETCH c1 INTO r;
    IF c1%FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee No: ' || r.eno);
        DBMS_OUTPUT.PUT_LINE('Name: ' || r.ename);
        DBMS_OUTPUT.PUT_LINE('Designation: ' || r.desig);
        DBMS_OUTPUT.PUT_LINE('Basic Pay: ' || r.bp);
        DBMS_OUTPUT.PUT_LINE('DA: ' || r.da);
        DBMS_OUTPUT.PUT_LINE('HRA: ' || r.hra);
        DBMS_OUTPUT.PUT_LINE('PF: ' || r.pf);
        DBMS_OUTPUT.PUT_LINE('Gross Pay: ' || r.gp);
        DBMS_OUTPUT.PUT_LINE('Net Pay: ' || r.np);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Employee not found.');
    END IF;
    CLOSE c1;
END;
/

CREATE OR REPLACE PROCEDURE display_all_emp AS
    CURSOR c2 IS SELECT * FROM emp;
    r emp%ROWTYPE;
    v_count NUMBER := 0;
BEGIN
    FOR r IN c2 LOOP
        DBMS_OUTPUT.PUT_LINE('------------------------------------');
        DBMS_OUTPUT.PUT_LINE('Emp No: ' || r.eno || ', Name: ' || r.ename || ', Designation: ' || r.desig);
        DBMS_OUTPUT.PUT_LINE('BP: ' || r.bp || ', DA: ' || r.da || ', HRA: ' || r.hra || ', PF: ' || r.pf);
        DBMS_OUTPUT.PUT_LINE('Gross Pay: ' || r.gp || ', Net Pay: ' || r.np);
        v_count := v_count + 1;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('------------------------------------');
    DBMS_OUTPUT.PUT_LINE('Total Employees: ' || v_count);
END;
/

BEGIN
    insert_emp(101, 'John', 'Manager', 50000, 10000, 8000, 5000);
    update_emp(101, 'John Smith', 'Sr. Manager', 60000, 12000, 10000, 6000);
    display_emp(101);
    display_all_emp;
    delete_emp(101);
END;
/