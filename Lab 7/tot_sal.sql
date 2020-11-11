CREATE OR REPLACE TRIGGER tot_sal
AFTER INSERT OR UPDATE OR DELETE OF salary, dno ON e1
FOR EACH ROW
BEGIN
	IF INSERTING THEN
		UPDATE d1
		SET tot_sal = tot_sal + :NEW.salary
		WHERE dnumber = :NEW.dno;
	ELSIF UPDATING('salary') THEN
		UPDATE d1
		SET tot_sal = tot_sal + :NEW.salary - :OLD.salary
		WHERE dnumber = :OLD.dno;
	ELSIF UPDATING('dno') THEN
		UPDATE d1
		SET tot_sal = tot_sal - :OLD.salary
		WHERE dnumber = :OLD.dno;
		UPDATE d1
		SET tot_sal = tot_sal + :NEW.salary
		WHERE dnumber = :NEW.dno;
	ELSE
		UPDATE d1
		SET tot_sal = tot_sal - :OLD.salary
		WHERE dnumber = :OLD.dno;
	END IF;
END;
/
