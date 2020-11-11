SET serveroutput ON;
CREATE OR REPLACE PROCEDURE employees_on_project(project_number IN NUMBER)
AS
	work_harder EXCEPTION;
	error_essn NUMBER;
	CURSOR members IS
		SELECT essn, hours FROM works_on WHERE pno = project_number;
BEGIN
	FOR member IN members
	LOOP
		IF (NOT (member.hours < 8.0)) THEN
			dbms_output.put_line('SSN: ' || member.essn || ', Hours: ' || member.hours);
		ELSE
			error_essn := member.essn;
			RAISE work_harder;
		END IF;
	END LOOP;
	EXCEPTION
		WHEN work_harder THEN
			dbms_output.put_line('Somebody needs to work harder! Namely: ' || error_essn);
END;
/
