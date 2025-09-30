CREATE TABLE student (
    regno      NUMBER PRIMARY KEY,
    studname   VARCHAR2(50),
    semester   VARCHAR2(10),
    mark1      NUMBER,
    mark2      NUMBER,
    mark3      NUMBER,
    mark4      NUMBER,
    mark5      NUMBER,
    total      NUMBER,
    average    NUMBER
);
CREATE OR REPLACE PROCEDURE insert_student(
    p_regno     NUMBER,
    p_studname  VARCHAR2,
    p_semester  VARCHAR2,
    p_mark1     NUMBER,
    p_mark2     NUMBER,
    p_mark3     NUMBER,
    p_mark4     NUMBER,
    p_mark5     NUMBER
) AS
    v_total NUMBER;
    v_avg   NUMBER;
BEGIN
    v_total := p_mark1 + p_mark2 + p_mark3 + p_mark4 + p_mark5;
    v_avg   := v_total / 5;

    INSERT INTO student (
        regno, studname, semester, mark1, mark2, mark3, mark4, mark5, total, average
    ) VALUES (
        p_regno, p_studname, p_semester, p_mark1, p_mark2, p_mark3, p_mark4, p_mark5, v_total, v_avg
    );

    DBMS_OUTPUT.PUT_LINE('data Inserted Successfully');
END;
/
CREATE OR REPLACE PROCEDURE update_student(
    p_regno     NUMBER,
    p_studname  VARCHAR2,
    p_semester  VARCHAR2,
    p_mark1     NUMBER,
    p_mark2     NUMBER,
    p_mark3     NUMBER,
    p_mark4     NUMBER,
    p_mark5     NUMBER
) AS
    v_total NUMBER;
    v_avg   NUMBER;
BEGIN
    v_total := p_mark1 + p_mark2 + p_mark3 + p_mark4 + p_mark5;
    v_avg   := v_total / 5;

    UPDATE student
    SET studname = p_studname,
        semester = p_semester,
        mark1 = p_mark1,
        mark2 = p_mark2,
        mark3 = p_mark3,
        mark4 = p_mark4,
        mark5 = p_mark5,
        total = v_total,
        average = v_avg
    WHERE regno = p_regno;

    DBMS_OUTPUT.PUT_LINE('data updated Successfully');
END;
/
CREATE OR REPLACE PROCEDURE delete_student(
    p_regno NUMBER
) AS
BEGIN
    DELETE FROM student WHERE regno = p_regno;
    DBMS_OUTPUT.PUT_LINE('data deleted Successfully');
END;
/
CREATE OR REPLACE PROCEDURE display_student(
    p_regno NUMBER
) AS
    v_student student%ROWTYPE;
BEGIN
    SELECT * INTO v_student FROM student WHERE regno = p_regno;

    DBMS_OUTPUT.PUT_LINE('Student Details:');
    DBMS_OUTPUT.PUT_LINE('Name     : ' || v_student.studname);
    DBMS_OUTPUT.PUT_LINE('Semester : ' || v_student.semester);
    DBMS_OUTPUT.PUT_LINE('Marks    : ' || v_student.mark1 || ', ' || v_student.mark2 || ', ' ||
                                        v_student.mark3 || ', ' || v_student.mark4 || ', ' || v_student.mark5);
    DBMS_OUTPUT.PUT_LINE('Total    : ' || v_student.total);
    DBMS_OUTPUT.PUT_LINE('Average  : ' || v_student.average);
END;
/
SET SERVEROUTPUT ON;

-- Insert Student
EXEC insert_student(1002, 'jebickson', 'V', 87, 79, 67, 88, 99);

-- Display Student
EXEC display_student(1002);

-- Update Student
EXEC update_student(1002, 'Lawrence', 'VI', 90, 85, 70, 92, 95);

-- Delete Student
EXEC delete_student(1002);
