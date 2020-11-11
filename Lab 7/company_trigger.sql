DROP TABLE e1 cascade constraints;
DROP TABLE d1 cascade constraints;

CREATE TABLE d1
  (dname        VARCHAR2(15)  NOT NULL UNIQUE,
   dnumber      NUMBER(2)     PRIMARY KEY,
   tot_sal      NUMBER(12) DEFAULT 0);

INSERT INTO d1 VALUES
   ('Research', 5, 0);
INSERT INTO d1 VALUES
   ('Administration', 4, 0);
INSERT INTO d1 VALUES
   ('Headquarters', 1, 0);


CREATE TABLE e1
  (fname    VARCHAR2(15) NOT NULL,
   ssn      CHAR(9)      PRIMARY KEY,
   salary   NUMBER(6),
   dno      INT          NOT NULL 
      REFERENCES d1(dnumber));

CREATE OR REPLACE TRIGGER tot_sal
AFTER INSERT OR UPDATE OR DELETE OF salary, dno ON e1
FOR EACH ROW
BEGIN
	IF INSERTING THEN
		UPDATE d1
		SET tot_sal = tot_sal + :NEW.salary
		WHERE dnumber = :NEW.dno;
	ELSIF UPDATING('salary') THEN
		UPDATE d1
		SET tot_sal = tot_sal + :NEW.salary - :OLD.salary
		WHERE dnumber = :OLD.dno;
	ELSIF UPDATING('dno') THEN
		UPDATE d1
		SET tot_sal = tot_sal - :OLD.salary
		WHERE dnumber = :OLD.dno;
		UPDATE d1
		SET tot_sal = tot_sal + :NEW.salary
		WHERE dnumber = :NEW.dno;
	ELSE
		UPDATE d1
		SET tot_sal = tot_sal - :OLD.salary
		WHERE dnumber = :OLD.dno;
	END IF;
END;
/

INSERT INTO e1 VALUES
  ('John','123456789',30000,5);
INSERT INTO e1 VALUES
  ('Franklin','333445555',40000,5);
INSERT INTO e1 VALUES
  ('Alicia','999887777',25000,4);
INSERT INTO e1 VALUES
  ('Jennifer','987654321',43000,4);
INSERT INTO e1 VALUES
  ('Ramesh','666884444',38000,5);
INSERT INTO e1 VALUES
  ('Joyce','453453453',25000,5);
INSERT INTO e1 VALUES
  ('Ahmad','987987987',25000,4);
INSERT INTO e1 VALUES
  ('James','888665555',55000,1);

COMMIT;

SELECT * FROM d1;
INSERT INTO e1 VALUES ('Naveen', '234567890', 1, 1);
SELECT * FROM d1;
SELECT * FROM d1;
DELETE FROM e1 WHERE ssn = 234567890;
SELECT * FROM d1;
SELECT * FROM d1;
UPDATE e1 SET salary = 300 WHERE ssn = 123456789;
SELECT * FROM d1;
SELECT * FROM d1;
UPDATE e1 SET dno = 1 WHERE ssn = 123456789;
SELECT * FROM d1;








