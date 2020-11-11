SELECT DISTINCT fname, lname FROM employee, works_on WHERE hours <= 18 AND essn=ssn ORDER BY fname ASC;
