-- TRIGGERS

USE company_db;

SELECT * FROM employee;
SELECT * FROM client;
SELECT * FROM works_with;
SELECT * FROM branch;
SELECT * FROM branch_supplier;

CREATE TABLE trigger_test (
	message VARCHAR(40)
);

-- no need to populate the trigger table manually 
INSERT INTO trigger_test 
VALUES 
	('hi, how are you?'),
    ('i\'m good')
;
TRUNCATE TABLE trigger_test;
-- that is why deleted all records

-- created trigger on trigger table but required on employee table to prompt about new joinee
DELIMITER $$
CREATE TRIGGER add_message
BEFORE INSERT 
ON trigger_test
FOR EACH ROW 
BEGIN
	INSERT INTO trigger_test VALUES ('new value added.');
END$$
DELIMITER ;
DROP TRIGGER IF EXISTS add_message;
-- that is why dropped this trigger completely 

-- Prompt in trigger table when new employee joins
DELIMITER $$
CREATE TRIGGER new_joinee
BEFORE INSERT ON employee
FOR EACH ROW
	BEGIN
		INSERT INTO trigger_test VALUES ('added new employee.');
	END$$
DELIMITER ;

-- Returning name of the new joinee
DELIMITER $$
CREATE TRIGGER new_joinee_name
BEFORE INSERT ON employee
FOR EACH ROW
	BEGIN
		INSERT INTO trigger_test VALUES (NEW.first_name);
	END$$
DELIMITER ;

-- Triggers paired with condtionals
DELIMITER $$
CREATE TRIGGER specify_sex
BEFORE INSERT ON employee
FOR EACH ROW
	BEGIN
		IF NEW.sex = 'M' THEN
			INSERT INTO trigger_test VALUES ('added new male employee');
		ELSEIF NEW.sex = 'F' THEN
			INSERT INTO trigger_test VALUES ('added new female employee');
		ELSE 
			INSERT INTO trigger_test VALUES ('added new female employee');
		END IF;
	END$$
DELIMITER ;

-- Drop trigger specify_sex and create again because exp with NEW.employee.sex
DROP TRIGGER IF EXISTS specify_sex;

-- testing the trigger
INSERT INTO employee VALUES (109, 'Ritviz', 'Mishra', '2000-09-20', 'M', 70000, 106, 3);
INSERT INTO employee VALUES (110, 'Aditi', 'Singh', '1999-03-01', 'F', 200000, 106, 3);
INSERT INTO employee VALUES (111, 'Paramjeet', 'Singh', '2001-06-28', 'M', 150000, 105, 2);
INSERT INTO employee VALUES (112, 'Lady', 'Gaga', '1966-01-01', 'F', 50000, 105, 2);
SELECT * FROM trigger_test;
SELECT * FROM employee;




