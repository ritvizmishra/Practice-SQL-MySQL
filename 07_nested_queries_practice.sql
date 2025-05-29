-- NESTED QUERIES

USE company_db;

SELECT * FROM employee;
SELECT * FROM client;
SELECT * FROM works_with;
SELECT * FROM branch;
SELECT * FROM branch_supplier;

-- Find names of all the employees who have sold over 30,000 to a client.
SELECT employee.first_name, employee.last_name
FROM employee
WHERE employee.emp_id IN (
	SELECT works_with.emp_id
	FROM works_with
	WHERE total_sales > 30000
);

-- Find all the clients who are handled by the branch that Michael Scott manages.
-- Answer 1
SELECT client.client_name
FROM client
WHERE client.client_id IN (
	SELECT works_with.client_id
	FROM works_with
	WHERE works_with.emp_id IN (SELECT emp_id FROM employee WHERE first_name = 'Michael' AND last_name = 'Scott')
);

-- Answer 2
SELECT client.client_name
FROM client
WHERE client.client_id IN (
	SELECT works_with.client_id
	FROM works_with
	INNER JOIN employee
	ON employee.emp_id = works_with.emp_id
	WHERE employee.first_name = 'Michael' AND employee.last_name = 'Scott'
);




