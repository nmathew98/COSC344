// Part 1
GRANT SELECT ON EMP TO nmathew1;

SELECT * FROM nmathew.emp;

// Part 2
GRANT UPDATE(dname), SELECT ON dept TO nmathew1;

UPDATE nmathew.dept SET dname = 'Test' WHERE dnumber = 5;
UPDATE nmathew.dept SET dnumber = 2 WHERE dname='Test';

// Part 3
REVOKE SELECT ON emp FROM nmathew1;
REVOKE UPDATE(dname), SELECT ON dept FROM nmathew1;

SELECT * FROM nmathew1.emp;
SELECT * FROM nmathew.dept;

// Part 4
CREATE ROLE SE;
GRANT SELECT ON emp TO SE;
GRANT SELECT ON dept TO SE;
GRANT SE TO nmathew1;

SELECT * FROM nmathew.emp;
SELECT * FROM nmathew.dept;

// Part 5
CREATE VIEW emp_dept AS SELECT fname, lname, dname FROM emp, dept WHERE emp.dno = dept.dnumber;
GRANT SELECT ON emp_dept TO nmathew1;

SELECT * FROM nmathew.emp_dept;

// Part 6
CREATE VIEW emp_salaries AS SELECT fname, lname, salary FROM emp WHERE salary <= 50000;
GRANT SELECT ON emp_salaries TO nmathew1;

SELECT * FROM nmathew.emp_salaries;
