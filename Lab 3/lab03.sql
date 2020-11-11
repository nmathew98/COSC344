DROP TABLE lab2a;

CREATE TABLE lab2a(i int,r number(6,2),txt varchar2(20),when date);

INSERT INTO lab2a VALUES (1, 1.1, 'Entry 1', TO_DATE('20-July-2020', 'dd-mon-yyy'));
INSERT INTO lab2a VALUES (2, 2.1, 'Entry 2', TO_DATE('21-June-2020', 'dd-mon-yyyy'));
INSERT INTO lab2a VALUES (3, 3.3, 'Entry 3', TO_DATE('15-January-2020', 'dd-mon-yyyy'));
INSERT INTO lab2a VALUES (4, 4.3, 'Entry 4', TO_DATE('15-March-2020', 'dd-mon-yyyy'));
INSERT INTO lab2a VALUES (5, 5.3, 'Entry 5', TO_DATE('15-April-2020', 'dd-mon-yyyy'));
INSERT INTO lab2a VALUES (6, 6.3, 'Entry 6', TO_DATE('15-May-2020', 'dd-mon-yyyy'));
INSERT INTO lab2a VALUES (7, 7.3, 'Entry 7', TO_DATE('15-June-2020', 'dd-mon-yyyy'));
INSERT INTO lab2a VALUES (8, 8.3, 'Entry 8', TO_DATE('15-July-2020', 'dd-mon-yyyy'));
INSERT INTO lab2a VALUES (9, 3.3, 'Entry 9', TO_DATE('15-August-2020', 'dd-mon-yyyy'));
INSERT INTO lab2a VALUES (10, 3.3, 'Entry 10', TO_DATE('15-September-2020', 'dd-mon-yyyy'));
