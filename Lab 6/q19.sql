SELECT * FROM orders o WHERE amt > (SELECT AVG(amt) FROM orders i WHERE o.cnum = i.cnum);
