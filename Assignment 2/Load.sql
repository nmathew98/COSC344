DROP TABLE product_invoice;
DROP TABLE products;
DROP TABLE invoice;
DROP TABLE rooms;
DROP TABLE appointments;
DROP TABLE patient;
DROP TABLE staff_roles;
DROP TABLE staff;

CREATE TABLE staff
	(staff_id	INTEGER		NOT NULL	UNIQUE,
	first_name	VARCHAR2(15)	NOT NULL,
	middle_name	VARCHAR2(15)	NOT NULL,
	last_name	VARCHAR2(15)	NOT NULL,
	email		VARCHAR2(20)	NOT NULL,
	address		VARCHAR2(30)	NOT NULL,
	phone_number	VARCHAR(10)	NOT NULL,
	gender		CHAR		NOT NULL
	);

INSERT INTO staff (staff_id, first_name, middle_name, last_name, email, address, phone_number, gender)
	SELECT * FROM (
		SELECT 1, 'Julian', 'A', 'Fawcett', 'email@email.com', '10 Leithbank', '0213448907', 'M'	FROM dual UNION ALL
		SELECT 2, 'Elbert', 'B', 'Alcantara', 'test@test.com', '20 Leithbank', '0223212344', 'M'	FROM dual UNION ALL
		SELECT 3, 'Naveen', 'C', 'Mathew', 'email2@email.com', '30 Leithbank', '1212342412', 'M'	FROM dual UNION ALL
		SELECT 4, 'Simon', 'D', 'Zhao', 'test2@test.com', '40 Leithbank', '4325553212', 'M'		FROM dual
	);

CREATE TABLE staff_roles
	(staff_id	INTEGER
		CONSTRAINT staff_roles_staff_id_cnst REFERENCES staff(staff_id) DISABLE,
	staff_level	VARCHAR2(15) 	NOT NULL,
	job_title	VARCHAR2(15) 	NOT NULL,
	hours		NUMBER(4, 2) 	NOT NULL,
	salary 		REAL 		NOT NULL);

ALTER TABLE staff_roles ENABLE CONSTRAINT staff_roles_staff_id_cnst;

INSERT INTO staff_roles (staff_id, staff_level, job_title, hours, salary)
	SELECT * FROM (
		SELECT 1, 'Senior', 'Dentist', 40.4, 100000	FROM dual UNION ALL
		SELECT 2, 'Training', 'Intern', 20, 10000	FROM dual UNION ALL
		SELECT 3, 'Junior', 'Receptionist', 30.2, 50000	FROM dual UNION ALL
		SELECT 4, 'Senior', 'Dentist', 40, 60000	FROM dual
	);

CREATE TABLE patient
	(patient_id	INTEGER		NOT NULL	UNIQUE,
	first_name	VARCHAR2(15)	NOT NULL,
	middle_name	VARCHAR2(15),
	last_name	VARCHAR2(15)	NOT NULL,
	email		VARCHAR2(20)	NOT NULL,
	address		VARCHAR2(30)	NOT NULL,
	phone_number	VARCHAR2(10)	NOT NULL,
	gender		CHAR);

INSERT INTO patient (patient_id, first_name, middle_name, last_name, email, address, phone_number, gender)
	SELECT * FROM (
		SELECT 1, 'Lucy', 'S', 'Deloitte', 'lsd@silkroad.com', '200 Harbour Terrace', '0235443890', 'F'		FROM dual UNION ALL
		SELECT 2, 'Ket', 'A', 'Mine', 'edgy@test.com', '100 Terrace Harbour', '0243228543', 'M'			FROM dual UNION ALL
		SELECT 3, 'Molly', 'R', 'Oolling', 'google@microsoft.com', '19 Saint Claire', '7543228903', 'F'		FROM dual UNION ALL
		SELECT 4, 'Ritt', 'A', 'Lin', 'what@huh.com', '29 Anzac Avenue', '0234332109', 'M' 			FROM dual
	);

CREATE TABLE appointments
	(staff_id 	INTEGER
		CONSTRAINT appointments_staff_id_cnst REFERENCES staff(staff_id) DISABLE,
	patient_id 	INTEGER
		CONSTRAINT appointments_patient_id_cnst REFERENCES patient(patient_id) DISABLE,
	appointment_id 	INTEGER		NOT NULL	UNIQUE,
	date_time	DATE);

ALTER TABLE appointments ENABLE CONSTRAINT appointments_staff_id_cnst;
ALTER TABLE appointments ENABLE CONSTRAINT appointments_patient_id_cnst;

INSERT INTO appointments (staff_id, patient_id, appointment_id, date_time)
	SELECT * FROM (
		SELECT 3, 2, 1, TO_DATE('21/08/2020 02:11', 'DD/MM/YYYY HH24:MI')	FROM dual UNION ALL
		SELECT 1, 4, 2, TO_DATE('22/08/2020 03:11', 'DD/MM/YYYY HH24:MI')	FROM dual UNION ALL
		SELECT 1, 2, 3, TO_DATE('23/08/2020 04:11', 'DD/MM/YYYY HH24:MI')	FROM dual UNION ALL
		SELECT 2, 3, 4, TO_DATE('24/08/2020 05:11', 'DD/MM/YYYY HH24:MI') 	FROM dual
	);

CREATE TABLE rooms
	(appointment_id	INTEGER
		CONSTRAINT rooms_appointment_id_cnst REFERENCES appointments(appointment_id) DISABLE,
	room_id		INTEGER		NOT NULL	UNIQUE,
	room_name	VARCHAR2(20)	NOT NULL,
	room_type	VARCHAR2(20)	NOT NULL);

ALTER TABLE rooms ENABLE CONSTRAINT rooms_appointment_id_cnst;

INSERT INTO rooms (appointment_id, room_id, room_name, room_type)
	SELECT * FROM (
		SELECT 2, 1, 'A1', 'Consultation Room'	FROM dual UNION ALL
		SELECT 1, 2, 'A2', 'Examination Room'	FROM dual UNION ALL
		SELECT 4, 3, 'B1', 'Filing Room'	FROM dual UNION ALL
		SELECT 3, 4, 'B2', 'Nangs Room'		FROM dual
	);

CREATE TABLE invoice
	(invoice_id	INTEGER		NOT NULL	UNIQUE,
	appointment_id	INTEGER
		CONSTRAINT invoice_appointment_id_cnst REFERENCES appointments(appointment_id) DISABLE,
	patient_id	INTEGER
		CONSTRAINT invoice_patient_id_cnst REFERENCES patient(patient_id) DISABLE,
	staff_id 	INTEGER
		CONSTRAINT invoice_staff_id_cnst REFERENCES staff(staff_id) DISABLE,
	description	VARCHAR2(30) 	NOT NULL,
	price		NUMBER(5, 2));

ALTER TABLE invoice ENABLE CONSTRAINT invoice_appointment_id_cnst;
ALTER TABLE invoice ENABLE CONSTRAINT invoice_patient_id_cnst;
ALTER TABLE invoice ENABLE CONSTRAINT invoice_staff_id_cnst;

INSERT INTO invoice (invoice_id, patient_id, staff_id, description, price)
	SELECT * FROM (
		SELECT 1, 2, 3, 'Lorem Ipsum', 300		FROM dual UNION ALL
		SELECT 2, 3, 1, 'Test', 100			FROM dual UNION ALL
		SELECT 3, 4, 2, 'Some description', 200	FROM dual UNION ALL
		SELECT 4, 1, 3, 'Another description', 400	FROM dual
	);

CREATE TABLE products
	(invoice_id 	INTEGER
		CONSTRAINT products_invoice_id_cnst REFERENCES invoice(invoice_id) DISABLE,
	product_id	INTEGER		NOT NULL	UNIQUE,
	product_name	VARCHAR2(15)	NOT NULL,
	stock		INTEGER NOT NULL,
	price		NUMBER(7, 2) 	NOT NULL);

ALTER TABLE products ENABLE CONSTRAINT products_invoice_id_cnst;

INSERT INTO products (invoice_id, product_id, product_name, stock, price)
	SELECT * FROM (
		SELECT 2, 1, 'Flouride', 3000, 10.2	FROM dual UNION ALL
		SELECT 1, 2, 'Colgate', 4000, 5		FROM dual UNION ALL
		SELECT 4, 3, 'Breath Mint', 100, 1	FROM dual UNION ALL
		SELECT 3, 4, 'Mouthwash', 500, 15	FROM dual
	);

CREATE TABLE product_invoice
	(invoice_id 	INTEGER
		CONSTRAINT product_invoice_invoice_id_cnst REFERENCES invoice(invoice_id) DISABLE,
	product_id 	INTEGER
		CONSTRAINT product_invoice_product_id_cnst REFERENCES products(product_id) DISABLE,
	quantity 	INTEGER 	NOT NULL);

ALTER TABLE product_invoice ENABLE CONSTRAINT product_invoice_invoice_id_cnst;
ALTER TABLE product_invoice ENABLE CONSTRAINT product_invoice_product_id_cnst;

INSERT INTO product_invoice (invoice_id, product_id, quantity)
	SELECT * FROM (
		SELECT 1, 4, 3		FROM dual UNION ALL
		SELECT 2, 3, 4		FROM dual UNION ALL
		SELECT 4, 3, 2		FROM dual UNION ALL
		SELECT 3, 1, 10		FROM dual UNION ALL
		SELECT 1, 4, 2		FROM dual
	);

COMMIT;
