USE project2;
DROP FUNCTION IF EXISTS DEPT_DETAILS;
DELIMITER $$
CREATE FUNCTION DEPT_DETAILS(dept_id INT) RETURNS INT DETERMINISTIC
	BEGIN
		DECLARE answer INT;
		SELECT PhysicianID INTO answer
		FROM appointment
		INNER JOIN physician ON physician.PhysicianID=appointment.Physician 
		INNER JOIN affiliated_with ON affiliated_with.Department = dept_id AND affiliated_with.physician = appointment.Physician
		GROUP BY appointment.physician
		ORDER BY SUM(TIMEDIFF(End, Start)) DESC
		LIMIT 1;
		RETURN answer;
	END$$

DELIMITER ;

select PhysicianID, Name, Position from physician where physicianId= DEPT_DETAILS(1);

DROP PROCEDURE IF EXISTS DEPT_STATS;
DELIMITER $$
CREATE PROCEDURE DEPT_STATS()
	BEGIN
		SELECT
			department.DepartmentID AS 'Department',
			physician.NAME AS 'Dept head',
			FLOOR(SUM( TIME_TO_SEC( TIMEDIFF( END, START ) ) / 3600 )) AS 'Total hrs worked',
			COUNT( appointment.AppointmentID ) AS 'Number of appointments' 
		FROM
			department
			INNER JOIN affiliated_with ON affiliated_with.Department = department.departmentID
			INNER JOIN appointment ON appointment.Physician = affiliated_with.Physician
			INNER JOIN physician ON Physician.PhysicianID = department.Head 
		GROUP BY
			department.DepartmentID
		ORDER BY 
			department.Name;
	END$$

DELIMITER ;

call DEPT_STATS();

DROP PROCEDURE IF EXISTS Retire;
DELIMITER $$
CREATE PROCEDURE RETIRE(IN phy_id INT)
BEGIN

/*DECLARE patient_cursor CURSOR FOR 
SELECT appointmentID, Physician, Start, End FROM appointment WHERE Appointment.Physician = phy_id;
DECLARE my_appointmentID INT;
DECLARE my_Physician INT; 	
DECLARE my_Start DATETIME; 
DECLARE my_End DATETIME; 
DECLARE CONTINUE HANDLER FOR NOT FOUND SET noMoreRows = 0;

DECLARE doctor_cursor CURSOR FOR 
SELECT Physician, Start, End FROM appointment WHERE Appointment.Physician = phy_id;
DECLARE his_Physician INT; 	
DECLARE his_Start DATETIME; 
DECLARE his_End DATETIME; 

OPEN patient_cursor;
    ITR:LOOP
        FETCH patient_cursor INTO my_appointmentID,my_Physician,my_Start,my_End;
        IF noMoreRows = 0 THEN
            LEAVE ITR;
        IF my_wage > 2000 THEN
            INSERT INTO temp VALUES (NULL, mywage,my_name);
		END IF $$
    END LOOP ITR $$
    CLOSE patient_cursor $$
*/
UPDATE appointment
SET physician='1001'
WHERE Appointment.Physician = phy_id;

END $$
DELIMITER ;

CALL RETIRE (1005); 

select * from appointment;

