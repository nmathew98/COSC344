CREATE TABLE emp_dep AS (SELECT fname, lname, dependent_name, dependent.sex, dependent.bdate FROM employee, dependent WHERE essn = ssn);
SELECT * FROM emp_dep;
