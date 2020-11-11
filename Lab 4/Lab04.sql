/*DESCRIBE employee;*/
SELECT dependent_name FROM dependent WHERE relationship NOT IN ('Son');
/* SELECT * FROM dependent WHERE relationship = 'Daughter' OR relationship = 'Spouse'; */
SELECT pname FROM project WHERE plocation IS NULL;
SELECT fname, lname, dname FROM department, employee WHERE mgrssn=ssn;
SELECT DISTINCT fname, lname FROM employee, works_on WHERE hours <= 18 AND essn=ssn ORDER BY fname ASC;
SELECT fname, lname FROM employee WHERE SUBSTR(lname, 1, 1)='W';
/* SELECT fname, lname FROM employee WHERE lname LIKE 'W%'; */
SELECT sname FROM salespeople WHERE city IN ('San Jose', 'Barcelona');
SELECT cname, amt FROM customers, orders WHERE customers.cnum = orders.cnum AND amt BETWEEN 1500 AND 5000;
SELECT COUNT(*) FROM orders;
SELECT AVG(amt) FROM orders;
