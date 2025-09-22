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

      DBMS_OUTPUT.put_line(customer_rec.id || ' ' || customer_rec.name);
   END LOOP;

END;

