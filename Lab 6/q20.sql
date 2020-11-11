SELECT fname, lname FROM employee WHERE NOT EXISTS (SELECT * FROM dependent WHERE essn = ssn);
