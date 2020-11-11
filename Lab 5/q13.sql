SELECT salespeople.snum, amt FROM salespeople, orders WHERE salespeople.snum = orders.snum AND amt = (SELECT MAX(amt) FROM orders WHERE orders.snum = salespeople.snum AND amt >= 3000) ORDER BY salespeople.snum
