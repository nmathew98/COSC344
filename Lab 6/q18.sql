SELECT sname, snum FROM salespeople WHERE (SELECT COUNT(*) FROM customers WHERE customers.snum = salespeople.snum) > 1;
