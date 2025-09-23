--Input (SQL Code)

--Method 1: Default Constraint in CREATE TABLE

CREATE TABLE Sales1 (
    Sale_Id int NOT NULL UNIQUE,
    Sale_Amount int NOT NULL,
    Vendor_Name varchar(255) DEFAULT 'Unknown Vendor',
    Sale_Date date,
    Profit int
);
--Perhaps you need a different "datestyle" setting
--insert values
insert into Sales1 values(1,10.000,'Abc Trader','22-4-2010',1000);
insert into Sales1 values(2,20.000,'XYZ mill','22-1-2096',2000);
insert into Sales1 values(3,30.000,'jeb','23-7-2015',1500);
insert into Sales1 values(4,40.000,'jazz','8-9-2011',800);
insert into Sales1 values(5,50.000,'misa','22-4-2010',3000);
--Method 2: Default Constraint in ALTER TABLE
--ALTER TABLE Sales
--MODIFY Vendor_Name DEFAULT 'Unknown Vendor';
/*Output (from SQL command line)

SQL> CREATE TABLE Sales1 (
  2     Sale_Id int NOT NULL UNIQUE,
  3     Sale_Amount int NOT NULL,
  4     Vendor_Name varchar(255) DEFAULT 'Unknown Vendor',
  5     Sale_Date date,
  6     Profit int
  7  );

Table created.
*/