SELECT salespeople.snum, amt FROM salespeople, orders WHERE salespeople.snum = orders.snum AND amt = (SELECT MAX(amt) FROM orders WHERE orders.snum = salespeople.snum);
SELECT salespeople.snum, amt FROM salespeople, orders WHERE salespeople.snum = orders.snum AND amt = (SELECT MAX(amt) FROM orders WHERE orders.snum = salespeople.snum AND amt >= 3000) ORDER BY salespeople.snum;
SELECT fname, lname, salary FROM employee ORDER BY salary, lname;
SELECT orders.onum, customers.cname, customers.cnum, salespeople.snum FROM orders, customers, salespeople WHERE customers.city<>salespeople.city AND orders.cnum = customers.cnum AND orders.snum = salespeople.snum ORDER BY orders.onum ASC;
SELECT cname, amt FROM customers, orders WHERE amt = (SELECT MAX(amt) FROM orders) AND orders.cnum = customers.cnum;
SELECT * FROM orders WHERE amt > (SELECT AVG(amt) FROM orders WHERE odate = date '1990-10-03');
SELECT * FROM orders WHERE orders.snum IN (SELECT snum FROM salespeople WHERE city = 'London') ORDER BY onum ASC;
