SELECT * FROM orders WHERE orders.snum IN (SELECT snum FROM salespeople WHERE city = 'London') ORDER BY onum ASC;
