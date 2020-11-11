SELECT cname, amt FROM customers, orders WHERE customers.cnum = orders.cnum AND amt BETWEEN 1500 AND 5000;
