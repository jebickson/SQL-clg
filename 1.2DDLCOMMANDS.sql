Input (SQL Code):

Method 1: Unique Constraint in-line without name

CREATE TABLE person (
    pno INT,
    pname VARCHAR(20),
    mobile BIGINT UNIQUE
);

Method 2: Unique Constraint in-line with name
CREATE TABLE person1 (
    pno INT,
    pname VARCHAR(20),
    mobile BIGINT,
    CONSTRAINT uq_mobile UNIQUE (mobile)
);

Method 3: Unique Constraint out-of-line with name
CREATE TABLE person2 (
    pno INT,
    pname VARCHAR(20),
    mobile BIGINT,
    CONSTRAINT uq_mobile UNIQUE (mobile)
);

Method 4: Adding a UNIQUE Constraint after Creation
ALTER TABLE person2
ADD CONSTRAINT uq_mobile UNIQUE (mobile);

