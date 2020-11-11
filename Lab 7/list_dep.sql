SET serveroutput ON;
CREATE OR REPLACE PROCEDURE list_dep
IS

BEGIN
	FOR dependent IN (SELECT * FROM dependent)
	LOOP
		dbms_output.put_line('Name: ' || dependent.dependent_name || ', Relationship: ' || dependent.relationship);
	END LOOP;
END;
/
