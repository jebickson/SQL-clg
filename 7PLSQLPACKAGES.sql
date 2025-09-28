SET SERVEROUTPUT ON;

CREATE TABLE student1 (
    rollno  NUMBER PRIMARY KEY,
    sname   VARCHAR2(50),
    age     NUMBER,
    course  VARCHAR2(50)
);

INSERT INTO student1 (rollno, sname, age, course) VALUES (101, 'Amit', 20, 'Physics');
INSERT INTO student1 (rollno, sname, age, course) VALUES (102, 'Priya', 21, 'Chemistry');
INSERT INTO student1 (rollno, sname, age, course) VALUES (103, 'Rahul', 22, 'Mathematics');
COMMIT;

CREATE OR REPLACE PACKAGE pkg_student IS
   PROCEDURE updateRecord(sno student1.rollno%TYPE);
   FUNCTION deleteRecord(snm student1.sname%TYPE)
      RETURN BOOLEAN;
END pkg_student;
/

CREATE OR REPLACE PACKAGE BODY pkg_student IS

   PROCEDURE updateRecord(sno student1.rollno%TYPE) IS
   BEGIN
      UPDATE student1
      SET age = 23
      WHERE rollno = sno;

      IF SQL%FOUND THEN
         DBMS_OUTPUT.put_line('RECORD UPDATED');
      ELSE
         DBMS_OUTPUT.put_line('RECORD NOT FOUND');
      END IF;
   END updateRecord;

   FUNCTION deleteRecord(snm student1.sname%TYPE)
      RETURN BOOLEAN IS
   BEGIN
      DELETE FROM student1
      WHERE sname = snm;

      RETURN SQL%FOUND;
   END deleteRecord;

END pkg_student;
/

DECLARE
   sno student1.rollno%TYPE := 102; 
   snm student1.sname%TYPE := 'Rahul'; 
BEGIN
   pkg_student.updateRecord(sno);

   IF pkg_student.deleteRecord(snm) THEN
      DBMS_OUTPUT.put_line('RECORD DELETED');
   ELSE
      DBMS_OUTPUT.put_line('RECORD NOT FOUND');
   END IF;
END;
/
