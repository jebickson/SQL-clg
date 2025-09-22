-- Package Specification
CREATE OR REPLACE PACKAGE pkg_student IS
   PROCEDURE updateRecord(sno student1.rollno%TYPE);
   FUNCTION deleteRecord(snm student1.sname%TYPE)
      RETURN BOOLEAN;
END pkg_student;
/

-- Package Body
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

-- Calling the Package
DECLARE
   sno student1.rollno%TYPE;
   s_age student1.age%TYPE;
   snm student1.sname%TYPE;
BEGIN
   sno := &sno;
   snm := &snm;

   pkg_student.updateRecord(sno);

   IF pkg_student.deleteRecord(snm) THEN
      DBMS_OUTPUT.put_line('RECORD DELETED');
   ELSE
      DBMS_OUTPUT.put_line('RECORD NOT FOUND');
   END IF;
END;
/ 

--Expected output
--Before calling package
---RollNo Sname Age Course
-- 6      Anu   18  cs
-- 4     Chetan 20  BCA
-- 5     Nihal  19  BBA
-- 7     kamal  20  cs
-- 8     arpit  21  cs

--Execution
--Enter value for sno: 6
--Enter value for snm: kamal
--RECORD UPDATED
--RECORD DELETED
--PL/SQL procedure successfully completed.

--After calling package
---RollNo Sname Age Course
-- 4     Chetan 20  BCA
-- 5     Nihal  19  BBA
-- 6     Anu   23  cs
-- 8     arpit  21  cs
