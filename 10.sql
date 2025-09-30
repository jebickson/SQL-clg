-- Step 1: Create table
CREATE TABLE library (
    bookid    NUMBER PRIMARY KEY,
    bname     VARCHAR2(50),
    author    VARCHAR2(50),
    publisher VARCHAR2(50),
    price     NUMBER(10,2)
);

-- Step 2: Insert Procedure
CREATE OR REPLACE PROCEDURE insert_book(
    p_bookid library.bookid%TYPE,
    p_bname library.bname%TYPE,
    p_author library.author%TYPE,
    p_publisher library.publisher%TYPE,
    p_price library.price%TYPE
) AS
BEGIN
    INSERT INTO library VALUES(p_bookid, p_bname, p_author, p_publisher, p_price);
    DBMS_OUTPUT.PUT_LINE('Book inserted successfully.');
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('Book ID already exists!');
END;
/

-- Step 3: Update Procedure
CREATE OR REPLACE PROCEDURE update_book(
    p_bookid library.bookid%TYPE,
    p_bname library.bname%TYPE,
    p_author library.author%TYPE,
    p_publisher library.publisher%TYPE,
    p_price library.price%TYPE
) AS
BEGIN
    UPDATE library
    SET bname = p_bname, author = p_author, publisher = p_publisher, price = p_price
    WHERE bookid = p_bookid;
    IF SQL%ROWCOUNT > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Book updated successfully.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Book ID not found.');
    END IF;
END;
/

-- Step 4: Delete Procedure
CREATE OR REPLACE PROCEDURE delete_book(
    p_bookid library.bookid%TYPE
) AS
BEGIN
    DELETE FROM library WHERE bookid = p_bookid;
    IF SQL%ROWCOUNT > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Book deleted successfully.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Book ID not found.');
    END IF;
END;
/

-- Step 5: Display One Book
CREATE OR REPLACE PROCEDURE display_book(
    p_bookid library.bookid%TYPE
) AS
    v_bname library.bname%TYPE;
    v_author library.author%TYPE;
    v_publisher library.publisher%TYPE;
    v_price library.price%TYPE;
BEGIN
    SELECT bname, author, publisher, price
    INTO v_bname, v_author, v_publisher, v_price
    FROM library
    WHERE bookid = p_bookid;

    DBMS_OUTPUT.PUT_LINE('--- BOOK DETAILS ---');
    DBMS_OUTPUT.PUT_LINE('Book Id    : ' || p_bookid);
    DBMS_OUTPUT.PUT_LINE('Book Name  : ' || v_bname);
    DBMS_OUTPUT.PUT_LINE('Author     : ' || v_author);
    DBMS_OUTPUT.PUT_LINE('Publisher  : ' || v_publisher);
    DBMS_OUTPUT.PUT_LINE('Price      : ' || v_price);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Book not found.');
END;
/

-- Step 6: Display All Books
CREATE OR REPLACE PROCEDURE display_all_books AS
BEGIN
    DBMS_OUTPUT.PUT_LINE('--- AVAILABLE BOOKS ---');
    FOR rec IN (SELECT * FROM library) LOOP
        DBMS_OUTPUT.PUT_LINE('Book Id: ' || rec.bookid || 
                             ', Name: ' || rec.bname ||
                             ', Author: ' || rec.author ||
                             ', Publisher: ' || rec.publisher ||
                             ', Price: ' || rec.price);
    END LOOP;
END;
/

SET SERVEROUTPUT ON;

-- Insert book
EXEC insert_book(1, 'DBMS', 'Navathe', 'Pearson', 500);

-- Update book
EXEC update_book(1, 'DBMS Concepts', 'Navathe', 'Pearson', 550);

-- Display one book
EXEC display_book(1);

-- Display all books
EXEC display_all_books;

-- Delete book
EXEC delete_book(1);