SELECT pnumber FROM project WHERE pnumber IN (SELECT pno FROM works_on WHERE essn = (SELECT ssn FROM employee WHERE lname = 'Smith')) UNION SELECT pnumber FROM project WHERE dnum = (SELECT dnumber FROM department WHERE mgrssn = (SELECT ssn FROM employee WHERE lname = 'Smith'));