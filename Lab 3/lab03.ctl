LOAD DATA
INFILE 'lab03.dat'
INTO TABLE lab2a
FIELDS TERMINATED BY ','
(i, r, txt, when DATE "dd-mon-yyyy")
