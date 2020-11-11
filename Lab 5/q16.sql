SELECT cname, amt FROM customers, orders WHERE amt = (SELECT MAX(amt) FROM orders) AND orders.cnum = customers.cnum;
