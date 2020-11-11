DROP TABLE emp cascade constraints;
DROP TABLE dept;

CREATE TABLE dept
  (dname        VARCHAR2(15)  NOT NULL UNIQUE,
   dnumber      INT           PRIMARY KEY);

INSERT INTO dept VALUES ('Research', 5);
INSERT INTO dept VALUES ('Administration', 4);
INSERT INTO dept VALUES ('Headquarters', 1);
INSERT INTO dept VALUES ('Dummies', 0);


CREATE TABLE emp
  (fname    VARCHAR2(10) NOT NULL,
   lname    VARCHAR2(10) NOT NULL,
   ssn      CHAR(9)      PRIMARY KEY,
   salary   NUMBER(6),
   dno      INT          NOT NULL REFERENCES department(dnumber));

INSERT INTO emp VALUES
  ('John','Smith','123456789', 30000,5);
INSERT INTO emp VALUES
  ('Franklin','Wong','333445555',60000,5);
INSERT INTO emp VALUES
  ('Alicia','Zelaya','999887777',25000,4);
INSERT INTO emp VALUES
  ('Jennifer','Wallace','987654321',73000,4);
INSERT INTO emp VALUES
  ('Ramesh','Narayan','666884444',38000,5);
INSERT INTO emp VALUES
  ('Joyce','English','453453453',25000,5);
INSERT INTO emp VALUES
  ('Ahmad','Jabbar','987987987',25000,4);
INSERT INTO emp VALUES
  ('James','Borg','888665555',55000,1);


COMMIT;
