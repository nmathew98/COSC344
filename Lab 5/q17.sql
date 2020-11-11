SELECT * FROM orders WHERE amt > (SELECT AVG(amt) FROM orders WHERE odate = date '1990-10-03');
